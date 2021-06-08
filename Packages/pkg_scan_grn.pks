DROP PACKAGE DSS.PKG_SCAN_GRN;

CREATE OR REPLACE PACKAGE DSS.PKG_SCAN_GRN
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
      P_DATA_FILTER            NUMBER,
      P_DEST_CHANNEL           VARCHAR2)
   IS
      SELECT SEQ_ORDER_SCAN_JOBNO.NEXTVAL AS JOBID,
             'DSS' AS APP_SOURCE,
             P_ORDER_TYPE AS ORDER_TYPE,
             H.RECEIPT_NUM AS ORDER_NUMBER,
             H.SHIPMENT_HEADER_ID AS ORDER_REF_NO,
             H.ATTRIBUTE10  AS ORDER_REF_NO2,
             H.CREATION_DATE AS ORDER_DATE,
             V.VENDOR_NAME AS ORDER_REMARKS,
             'N' AS WARRANTY_YN,
             'Y' AS WMS_YN,
             'N' AS INTERNAL_YN,
             'VENDOR' AS SCR_TYPE,
             H.VENDOR_ID AS SCR_REF_NUMBER,
             H.VENDOR_SITE_ID AS SCR_REF_CODE,
             P_SCR_OPREATING_UNIT AS SCR_OPREATING_UNIT,
             H.SHIP_TO_ORG_ID AS SCR_ORGANIZATION_ID,
             H.VENDOR_ID AS SCR_LOCATION_CODE,
             'ORGANIZATION' AS DEST_TYPE,
             NULL AS DEST_REF_NUMBER,
             P_DEST_CHANNEL AS DEST_REF_CODE,
             P_SCR_OPREATING_UNIT AS DEST_OPREATING_UNIT,
             H.SHIP_TO_ORG_ID AS DEST_ORGANIZATION_ID,
             NULL AS DEST_LOCATION_CODE,
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
        FROM SYN_RCV_SHIPMENT_HEADERS H
             LEFT OUTER JOIN SYN_PO_VENDORS V ON H.VENDOR_ID = V.VENDOR_ID
       WHERE (    H.SHIP_TO_ORG_ID = P_SCR_ORGANIZATION_ID
              AND H.RECEIPT_NUM = P_ORDER_NUMBER);


   CURSOR CR_LINES (
      RW_HEADER    CR_HEADER%ROWTYPE)
   IS
        SELECT RW_HEADER.JOBID AS JOBID,
               CASE WHEN COUNT (*) > 1 THEN 'Y' ELSE 'N' END AS MERGED,
               RANK () OVER (ORDER BY OLN.ITEM_ID DESC) AS LINESEQ,
               RW_HEADER.SCR_OPREATING_UNIT AS OPREATING_UNIT,
               OLN.TO_ORGANIZATION_ID AS ORGANIZATION_ID,
               RW_HEADER.ORDER_TYPE AS ORDER_TYPE,
               RW_HEADER.ORDER_NUMBER AS ORDER_NUMBER,
               OLN.ITEM_ID AS INVENTORY_ITEM_ID,
               ITM.SEGMENT1 AS PRODUCT_CODE,
               CAT.CATEGORY_ID AS CAETGORY_ID,
               SUM (NVL (OLN.QUANTITY_SHIPPED, 0)) AS ORDER_QTY,
              -- SUM (NVL (OLN.QUANTITY_RECEIVED, 0)) AS DELIVERED_QTY,
               SUM (NVL (OLN.QUANTITY_SHIPPED, 0)) AS DELIVERED_QTY,
               0 AS PICKED_QTY,
               0 AS SCANNED_QTY,
               RW_HEADER.CREATE_BY AS CREATE_BY,
               RW_HEADER.CREATE_BY AS MODIFY_BY
          FROM SYN_RCV_SHIPMENT_LINES OLN
               LEFT OUTER JOIN SYN_MTL_SYSTEM_ITEMS ITM
                  ON     OLN.ITEM_ID = ITM.INVENTORY_ITEM_ID
                     AND OLN.TO_ORGANIZATION_ID = ITM.ORGANIZATION_ID
               LEFT OUTER JOIN SYN_ITEM_CATEGORIES CAT
                  ON     OLN.ITEM_ID = CAT.INVENTORY_ITEM_ID
                     AND OLN.TO_ORGANIZATION_ID = CAT.ORGANIZATION_ID
                     AND CAT.CATEGORY_SET_ID = '1'
         WHERE SHIPMENT_HEADER_ID = RW_HEADER.ORDER_REF_NO
      GROUP BY OLN.TO_ORGANIZATION_ID,
               OLN.SHIPMENT_HEADER_ID,
               OLN.ITEM_ID,
               ITM.SEGMENT1,
               CAT.CATEGORY_ID;

   TYPE RW_LINES IS TABLE OF CR_LINES%ROWTYPE;
END PKG_SCAN_GRN;
/


DROP PACKAGE BODY DSS.PKG_SCAN_GRN;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_SCAN_GRN
AS
   PROCEDURE GET_DEST_CODE (P_ORDER_NUMBER              VARCHAR2,
                            P_ORDER_TYPE                VARCHAR2,
                            P_SCR_ORGANIZATION_ID       NUMBER,
                            P_DEST_CHANNEL          OUT VARCHAR2)
   AS
   BEGIN
      SELECT PO.ATTRIBUTE3
        INTO P_DEST_CHANNEL
        FROM SYN_RCV_SHIPMENT_HEADERS H
             LEFT JOIN SYN_RCV_SHIPMENT_LINES L
                ON H.SHIPMENT_HEADER_ID = L.SHIPMENT_HEADER_ID
             LEFT JOIN SYN_PO_HEADERS_ALL PO
                ON L.PO_HEADER_ID = PO.PO_HEADER_ID
       WHERE     (    H.SHIP_TO_ORG_ID = P_SCR_ORGANIZATION_ID
                  AND H.RECEIPT_NUM = P_ORDER_NUMBER)
             AND ROWNUM = 1;
   END GET_DEST_CODE;

   PROCEDURE CHK_HEADER (P_ORDER_NUMBER              VARCHAR2,
                         P_ORDER_TYPE                VARCHAR2,
                         P_SCR_ORGANIZATION_ID       NUMBER,
                         P_EXISTS                OUT CHAR)
   AS
   BEGIN
      SELECT CASE WHEN COUNT (*) > 0 THEN 'Y' ELSE 'N' END
        INTO P_EXISTS
        FROM SYN_RCV_SHIPMENT_HEADERS
       WHERE     SHIP_TO_ORG_ID = P_SCR_ORGANIZATION_ID
             AND RECEIPT_NUM = P_ORDER_NUMBER
             AND ROWNUM = 1;
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
                                                 MODIFY_BY)
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
                            TEMP_RW (RW).MODIFY_BY);
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
      TEMP_RW          CR_HEADER%ROWTYPE;
      P_LINECNT        NUMBER;
      P_EXISTS         CHAR (1);
      P_DEST_CHANNEL   VARCHAR2 (100);
   BEGIN
      IF (CR_HEADER%ISOPEN)
      THEN
         CLOSE CR_HEADER;
      END IF;

      CHK_HEADER (P_ORDER_NUMBER,
                  P_ORDER_TYPE,
                  P_SCR_ORGANIZATION_ID,
                  P_EXISTS);
 
      IF (P_EXISTS = 'Y')
      THEN
         GET_DEST_CODE (P_ORDER_NUMBER,
                        P_ORDER_TYPE,
                        P_SCR_ORGANIZATION_ID,
                        P_DEST_CHANNEL);

         OPEN CR_HEADER (P_ORDER_NUMBER,
                         P_ORDER_TYPE,
                         P_SCR_OPREATING_UNIT,
                         P_SCR_ORGANIZATION_ID,
                         P_EXPIRY_AFTER,
                         P_CREATE_BY,
                         P_DATA_FILTER,
                         P_DEST_CHANNEL);


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
END PKG_SCAN_GRN;
/
