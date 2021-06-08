DROP PACKAGE DSS.PKG_SCAN_SO;

CREATE OR REPLACE PACKAGE DSS.PKG_SCAN_SO
AS
   PROCEDURE INS_HEADER (P_ORDER_NUMBER              VARCHAR2,
                         P_ORDER_TYPE                VARCHAR2,
                         P_SCR_OPREATING_UNIT        NUMBER,
                         P_SCR_ORGANIZATION_ID       NUMBER,
                         P_EXPIRY_AFTER              NUMBER,
                         P_CREATE_BY                 VARCHAR2,
                         P_DATA_FILTER               NUMBER,
                         P_JOBNO                 OUT NUMBER);



   CURSOR CR_HEADER (
      P_ORDER_NUMBER           VARCHAR2,
      P_ORDER_TYPE             VARCHAR2,
      P_SCR_OPREATING_UNIT     NUMBER,
      P_SCR_ORGANIZATION_ID    NUMBER,
      P_EXPIRY_AFTER           NUMBER,
      P_CREATE_BY              VARCHAR2,
      P_DATA_FILTER            NUMBER)
   IS
      SELECT SEQ_ORDER_SCAN_JOBNO.NEXTVAL AS JOBID,
             'DSS' AS APP_SOURCE,
             P_ORDER_TYPE AS ORDER_TYPE,
             ORDER_NUMBER AS ORDER_NUMBER,
             HEADER_ID AS ORDER_REF_NO,
             NULL AS ORDER_REF_NO2,
             H.CREATION_DATE AS ORDER_DATE,
             NULL AS ORDER_REMARKS,
             NVL (H.ATTRIBUTE10, 'N') AS WARRANTY_YN,
             NVL (H.ATTRIBUTE10, 'N') AS WMS_YN,
             'N' AS INTERNAL_YN,
             'ORGANIZATION' AS SCR_TYPE,
             NULL AS SCR_REF_NUMBER,
             NULL AS SCR_REF_CODE,
             ORG_ID AS SCR_OPREATING_UNIT,
             SHIP_FROM_ORG_ID AS SCR_ORGANIZATION_ID,
             NULL AS SCR_LOCATION_CODE,
             'CUSTOMER' AS DEST_TYPE,
             SOLD_TO_ORG_ID AS DEST_REF_NUMBER,
             CUSTOMER_NAME AS DEST_REF_CODE,
             NULL AS DEST_OPREATING_UNIT,
             NULL AS DEST_ORGANIZATION_ID,
             CUSTOMER_NUMBER AS DEST_LOCATION_CODE,
             SYSDATE AS CREATE_DATE,
             SYSDATE AS MODIFY_DATE,
             P_CREATE_BY AS CREATE_BY,
             P_CREATE_BY AS MODIFY_BY,
             CASE
                WHEN ROUND (SYSDATE - H.CREATION_DATE) < P_DATA_FILTER
                THEN
                   (SYSDATE + P_EXPIRY_AFTER / 24)
                ELSE
                   H.CREATION_DATE
             END
                AS EXPIRY_DATE,
             P_EXPIRY_AFTER AS EXPIRY_AFTER,
             'Y' AS EDITABLE_YN,
             CASE
                WHEN ROUND (SYSDATE - H.CREATION_DATE) < P_DATA_FILTER
                THEN
                   'Y'
                ELSE
                   'N'
             END
                AS ARCHIVED_YN,
             'N' AS ACTIVE_YN,
             'P' AS STATUS_YN
        FROM SYN_OE_ORDER_HEADERS_ALL H
             LEFT OUTER JOIN SYN_AR_CUSTOMERS C
                ON SOLD_TO_ORG_ID = CUSTOMER_ID
       WHERE     SHIP_FROM_ORG_ID = P_SCR_ORGANIZATION_ID
             AND ORDER_NUMBER = P_ORDER_NUMBER
             AND REPLACE (H.ORDER_CATEGORY_CODE, 'MIXED', 'ORDER') =
                    DECODE (P_ORDER_TYPE,  'SR', 'RETURN',  'SO', 'ORDER')
             AND ROWNUM = 1;

   CURSOR CR_LINES (
      RW_HEADER    CR_HEADER%ROWTYPE)
   IS
        SELECT RW_HEADER.JOBID AS JOBID,
               CASE WHEN COUNT (*) > 1 THEN 'Y' ELSE 'N' END AS MERGED,
               RANK () OVER (ORDER BY OLN.INVENTORY_ITEM_ID DESC) AS LINESEQ,
               RW_HEADER.SCR_OPREATING_UNIT AS OPREATING_UNIT,
               OLN.SHIP_FROM_ORG_ID AS ORGANIZATION_ID,
               RW_HEADER.ORDER_TYPE AS ORDER_TYPE,
               RW_HEADER.ORDER_NUMBER AS ORDER_NUMBER,
               OLN.INVENTORY_ITEM_ID AS INVENTORY_ITEM_ID,
               ITM.SEGMENT1 AS PRODUCT_CODE,
               CAT.CATEGORY_ID AS CAETGORY_ID,
               SUM (NVL (OLN.ORDERED_QUANTITY, 0)) AS ORDER_QTY,
               CASE
                  WHEN SUM (NVL (SCF.RECEIVED_QUANTITY, 0)) > 0
                  THEN
                     SUM (NVL (SCF.RECEIVED_QUANTITY, 0))
                  WHEN SUM (NVL (OLN.SHIPPED_QUANTITY, 0)) > 0
                  THEN
                     SUM (NVL (OLN.SHIPPED_QUANTITY, 0))
                  ELSE
                     SUM (NVL (OLN.ORDERED_QUANTITY, 0))
               END
                  AS DELIVERED_QTY,
               0 AS PICKED_QTY,
               0 AS SCANNED_QTY,
               RW_HEADER.CREATE_BY AS CREATE_BY,
               RW_HEADER.CREATE_BY AS MODIFY_BY,
               CASE
                  WHEN OLN.ATTRIBUTE4 = 'Y' THEN 'Y'
                  WHEN OLN.ATTRIBUTE4 = '2A' THEN 'Y'
                  WHEN OLN.ATTRIBUTE4 = '1A' THEN 'Y'
                  WHEN OLN.ATTRIBUTE4 = 'Warranty' THEN 'Y'
                  ELSE 'N'
               END
                  AS WARRANTY_YN
          FROM SYN_OE_ORDER_LINES_ALL OLN
               LEFT OUTER JOIN SYN_MTL_SYSTEM_ITEMS ITM
                  ON     OLN.INVENTORY_ITEM_ID = ITM.INVENTORY_ITEM_ID
                     AND OLN.SHIP_FROM_ORG_ID = ITM.ORGANIZATION_ID
               LEFT OUTER JOIN SYN_ITEM_CATEGORIES CAT
                  ON     OLN.INVENTORY_ITEM_ID = CAT.INVENTORY_ITEM_ID
                     AND OLN.SHIP_FROM_ORG_ID = CAT.ORGANIZATION_ID
                     AND CAT.CATEGORY_SET_ID = '1'
               LEFT OUTER JOIN UPL_SALES_ORDER_DTL@SCINTF SCF
                  ON OLN.HEADER_ID = SCF.HEADERID AND OLN.LINE_ID = SCF.LINEID
         WHERE    NVL (OLN.CANCELLED_FLAG, 'N') = 'N'  
               AND OLN.HEADER_ID = RW_HEADER.ORDER_REF_NO
               AND ORDERED_QUANTITY > 0
               AND REPLACE (OLN.LINE_CATEGORY_CODE, 'MIXED', 'ORDER') =
                      DECODE (RW_HEADER.ORDER_TYPE,
                              'SR', 'RETURN',
                              'SO', 'ORDER')
      GROUP BY OLN.SHIP_FROM_ORG_ID,
               OLN.HEADER_ID,
               OLN.INVENTORY_ITEM_ID,
               ITM.SEGMENT1,
               CAT.CATEGORY_ID,
               OLN.ATTRIBUTE4;


   TYPE RW_LINES IS TABLE OF CR_LINES%ROWTYPE;
END PKG_SCAN_SO;
/


DROP PACKAGE BODY DSS.PKG_SCAN_SO;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_SCAN_SO
AS
   PROCEDURE CHK_HEADER (P_ORDER_NUMBER              VARCHAR2,
                         P_ORDER_TYPE                VARCHAR2,
                         P_SCR_ORGANIZATION_ID       NUMBER,
                         P_EXISTS                OUT CHAR)
   AS
   BEGIN
        SELECT CASE WHEN COUNT (*) > 0 THEN 'Y' ELSE 'N' END
          INTO P_EXISTS
          FROM SYN_OE_ORDER_HEADERS_ALL
         WHERE     SHIP_FROM_ORG_ID = P_SCR_ORGANIZATION_ID
               AND ORDER_NUMBER = P_ORDER_NUMBER
               AND REPLACE (ORDER_CATEGORY_CODE, 'MIXED', 'ORDER') =
                      DECODE (P_ORDER_TYPE,  'SR', 'RETURN',  'SO', 'ORDER')
               AND ROWNUM = 1                             
      ORDER BY CREATION_DATE DESC;
   END;

   PROCEDURE INS_LINES (RW_HEADER CR_HEADER%ROWTYPE, P_LINECNT OUT NUMBER)
   AS
      TEMP_RW   RW_LINES;
   BEGIN
      IF (CR_LINES%ISOPEN)
      THEN
         CLOSE CR_LINES;
      END IF;

      OPEN CR_LINES (RW_HEADER);

      LOOP
         FETCH CR_LINES BULK COLLECT INTO TEMP_RW;

         P_LINECNT := TEMP_RW.COUNT;

         BEGIN
            FORALL RW IN 1 .. TEMP_RW.COUNT
               INSERT INTO DSS_ORDER_SCAN_LINES (JOBID,
                                                 MERGED,
                                                 LINESEQ,
                                                 OPREATING_UNIT,
                                                 ORGANIZATION_ID,
                                                 ORDER_TYPE,
                                                 ORDER_NUMBER,
                                                 INVENTORY_ITEM_ID,
                                                 PRODUCT_CODE,
                                                 CAETGORY_ID,
                                                 ORDER_QTY,
                                                 DELIVERED_QTY,
                                                 PICKED_QTY,
                                                 SCANNED_QTY,
                                                 CREATE_BY,
                                                 MODIFY_BY,
                                                 WARRANTY_YN)
                    VALUES (TEMP_RW (RW).JOBID,
                            TEMP_RW (RW).MERGED,
                            TEMP_RW (RW).LINESEQ,
                            TEMP_RW (RW).OPREATING_UNIT,
                            TEMP_RW (RW).ORGANIZATION_ID,
                            TEMP_RW (RW).ORDER_TYPE,
                            TEMP_RW (RW).ORDER_NUMBER,
                            TEMP_RW (RW).INVENTORY_ITEM_ID,
                            TEMP_RW (RW).PRODUCT_CODE,
                            TEMP_RW (RW).CAETGORY_ID,
                            TEMP_RW (RW).ORDER_QTY,
                            TEMP_RW (RW).DELIVERED_QTY,
                            TEMP_RW (RW).PICKED_QTY,
                            TEMP_RW (RW).SCANNED_QTY,
                            TEMP_RW (RW).CREATE_BY,
                            TEMP_RW (RW).MODIFY_BY,
                            TEMP_RW (RW).WARRANTY_YN);
         END;

         EXIT WHEN CR_LINES%NOTFOUND;
      END LOOP;

      CLOSE CR_LINES;
   END INS_LINES;


   PROCEDURE INS_HEADER (P_ORDER_NUMBER              VARCHAR2,
                         P_ORDER_TYPE                VARCHAR2,
                         P_SCR_OPREATING_UNIT        NUMBER,
                         P_SCR_ORGANIZATION_ID       NUMBER,
                         P_EXPIRY_AFTER              NUMBER,
                         P_CREATE_BY                 VARCHAR2,
                         P_DATA_FILTER               NUMBER,
                         P_JOBNO                 OUT NUMBER)
   AS
      TEMP_RW     CR_HEADER%ROWTYPE;
      P_LINECNT   NUMBER;
      P_EXISTS    CHAR (1);
   BEGIN
      IF (CR_HEADER%ISOPEN)
      THEN
         CLOSE CR_HEADER;
      END IF;

      CHK_HEADER (P_ORDER_NUMBER,
                  P_ORDER_TYPE ,
                  P_SCR_ORGANIZATION_ID,
                  P_EXISTS);

      IF (P_EXISTS = 'Y')
      THEN
         OPEN CR_HEADER (P_ORDER_NUMBER,
                         P_ORDER_TYPE,
                         P_SCR_OPREATING_UNIT,
                         P_SCR_ORGANIZATION_ID,
                         P_EXPIRY_AFTER,
                         P_CREATE_BY,
                         P_DATA_FILTER);
         FETCH CR_HEADER INTO TEMP_RW;
         /*line Table*/
         BEGIN
            INS_LINES (TEMP_RW, P_LINECNT);
         END;
         /*Header Table*/
         IF (P_LINECNT > 0)
         THEN
            BEGIN
               INSERT INTO DSS_ORDER_SCAN_HEADER (JOBID,
                                                  APP_SOURCE,
                                                  ORDER_TYPE,
                                                  ORDER_NUMBER,
                                                  ORDER_REF_NO,
                                                  ORDER_REF_NO2,
                                                  ORDER_DATE,
                                                  ORDER_REMARKS,
                                                  WARRANTY_YN,
                                                  WMS_YN,
                                                  INTERNAL_YN,
                                                  SCR_TYPE,
                                                  SCR_REF_NUMBER,
                                                  SCR_REF_CODE,
                                                  SCR_OPREATING_UNIT,
                                                  SCR_ORGANIZATION_ID,
                                                  SCR_LOCATION_CODE,
                                                  DEST_TYPE,
                                                  DEST_REF_NUMBER,
                                                  DEST_REF_CODE,
                                                  DEST_OPREATING_UNIT,
                                                  DEST_ORGANIZATION_ID,
                                                  DEST_LOCATION_CODE,
                                                  CREATE_DATE,
                                                  MODIFY_DATE,
                                                  CREATE_BY,
                                                  MODIFY_BY,
                                                  EXPIRY_DATE,
                                                  EXPIRY_AFTER,
                                                  EDITABLE_YN,
                                                  ARCHIVED_YN,
                                                  ACTIVE_YN,
                                                  STATUS_YN)
                    VALUES (TEMP_RW.JOBID,
                            TEMP_RW.APP_SOURCE,
                            TEMP_RW.ORDER_TYPE,
                            TEMP_RW.ORDER_NUMBER,
                            TEMP_RW.ORDER_REF_NO,
                            TEMP_RW.ORDER_REF_NO2,
                            TEMP_RW.ORDER_DATE,
                            TEMP_RW.ORDER_REMARKS,
                            TEMP_RW.WARRANTY_YN,
                            TEMP_RW.WMS_YN,
                            TEMP_RW.INTERNAL_YN,
                            TEMP_RW.SCR_TYPE,
                            TEMP_RW.SCR_REF_NUMBER,
                            TEMP_RW.SCR_REF_CODE,
                            TEMP_RW.SCR_OPREATING_UNIT,
                            TEMP_RW.SCR_ORGANIZATION_ID,
                            TEMP_RW.SCR_LOCATION_CODE,
                            TEMP_RW.DEST_TYPE,
                            TEMP_RW.DEST_REF_NUMBER,
                            TEMP_RW.DEST_REF_CODE,
                            TEMP_RW.DEST_OPREATING_UNIT,
                            TEMP_RW.DEST_ORGANIZATION_ID,
                            TEMP_RW.DEST_LOCATION_CODE,
                            TEMP_RW.CREATE_DATE,
                            TEMP_RW.MODIFY_DATE,
                            TEMP_RW.CREATE_BY,
                            TEMP_RW.MODIFY_BY,
                            TEMP_RW.EXPIRY_DATE,
                            TEMP_RW.EXPIRY_AFTER,
                            TEMP_RW.EDITABLE_YN,
                            TEMP_RW.ARCHIVED_YN,
                            TEMP_RW.ACTIVE_YN,
                            TEMP_RW.STATUS_YN);
            END;

            P_JOBNO := TEMP_RW.JOBID;
         ELSE
            P_JOBNO := 0;
         END IF;
         CLOSE CR_HEADER;
      ELSE
         P_JOBNO := 0;
      END IF;
   END INS_HEADER;
END PKG_SCAN_SO;
/
