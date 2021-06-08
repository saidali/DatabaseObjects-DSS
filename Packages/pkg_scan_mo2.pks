DROP PACKAGE DSS.PKG_SCAN_MO2;

CREATE OR REPLACE PACKAGE DSS.PKG_SCAN_MO2
AS
    PROCEDURE INS_HEADER (P_ORDER_NUMBER              VARCHAR2,
                          P_ORDER_TYPE                VARCHAR2,
                          P_SCR_OPREATING_UNIT        NUMBER,
                          P_SCR_ORGANIZATION_ID       NUMBER,
                          P_EXPIRY_AFTER              NUMBER,
                          P_CREATE_BY                 VARCHAR2,
                          P_DATA_FILTER               NUMBER,
                          P_JOBNO                 OUT NUMBER);



    CURSOR CR_HEADER (P_ORDER_NUMBER          VARCHAR2,
                      P_ORDER_TYPE            VARCHAR2,
                      P_SCR_OPREATING_UNIT    NUMBER,
                      P_SCR_ORGANIZATION_ID   NUMBER,
                      P_EXPIRY_AFTER          NUMBER,
                      P_CREATE_BY             VARCHAR2,
                      P_DATA_FILTER           NUMBER)
    IS
        SELECT SEQ_ORDER_SCAN_JOBNO.NEXTVAL
                   AS JOBID,
               'DSS'
                   AS APP_SOURCE,
               P_ORDER_TYPE
                   AS ORDER_TYPE,
               REQUEST_NUMBER
                   AS ORDER_NUMBER,
               HEADER_ID
                   AS ORDER_REF_NO,
               NULL
                   AS ORDER_REF_NO2,
               NVL (DATE_REQUIRED, STATUS_DATE)
                   AS ORDER_DATE,
               DESCRIPTION
                   AS ORDER_REMARKS,
               CASE
                   WHEN     UPPER (NVL (ATTRIBUTE4, 'N')) = UPPER ('Yes')
                        AND ORGANIZATION_ID != '2338'
                   THEN
                       'Y'
                   ELSE
                       'N'
               END
                   AS WARRANTY_YN,
               NVL (ATTRIBUTE15, 'N')
                   AS WMS_YN,
               'N'
                   AS INTERNAL_YN,
               'LOCATION'
                   AS SCR_TYPE,
               NULL
                   AS SCR_REF_NUMBER,
               NULL
                   AS SCR_REF_CODE,
               P_SCR_OPREATING_UNIT
                   AS SCR_OPREATING_UNIT,
               ORGANIZATION_ID
                   AS SCR_ORGANIZATION_ID,
               FROM_SUBINVENTORY_CODE
                   AS SCR_LOCATION_CODE,
               'LOCATION'
                   AS DEST_TYPE,
               NULL
                   AS DEST_REF_NUMBER,
               NULL
                   AS DEST_REF_CODE,
               P_SCR_OPREATING_UNIT
                   AS DEST_OPREATING_UNIT,
               ORGANIZATION_ID
                   AS DEST_ORGANIZATION_ID,
               TO_SUBINVENTORY_CODE
                   AS DEST_LOCATION_CODE,
               SYSDATE
                   AS CREATE_DATE,
               SYSDATE
                   AS MODIFY_DATE,
               P_CREATE_BY
                   AS CREATE_BY,
               P_CREATE_BY
                   AS MODIFY_BY,
               CASE
                   WHEN ROUND (SYSDATE - NVL (DATE_REQUIRED, STATUS_DATE)) <
                        P_DATA_FILTER
                   THEN
                       (SYSDATE + P_EXPIRY_AFTER / 24)
                   ELSE
                       NVL (DATE_REQUIRED, STATUS_DATE)
               END
                   AS EXPIRY_DATE,
               P_EXPIRY_AFTER
                   AS EXPIRY_AFTER,
               'Y'
                   AS EDITABLE_YN,
               CASE
                   WHEN ROUND (SYSDATE - CREATION_DATE) < P_DATA_FILTER
                   THEN
                       'Y'
                   ELSE
                       'N'
               END
                   AS ARCHIVED_YN,
               'N'
                   AS ACTIVE_YN,
               'P'
                   AS STATUS_YN
        FROM SYN_MTL_TXN_REQUEST_HEADERS
        WHERE     ORGANIZATION_ID = P_SCR_ORGANIZATION_ID
              AND TRANSACTION_TYPE_ID = '64'
              AND HEADER_ID = P_ORDER_NUMBER
              AND ROWNUM = 1;

    CURSOR CR_LINES (RW_HEADER CR_HEADER%ROWTYPE)
    IS
        SELECT RW_HEADER.JOBID
                   AS JOBID,
               CASE WHEN COUNT (*) > 1 THEN 'Y' ELSE 'N' END
                   AS MERGED,
               RANK () OVER (ORDER BY OLN.INVENTORY_ITEM_ID DESC)
                   AS LINESEQ,
               RW_HEADER.SCR_OPREATING_UNIT
                   AS OPREATING_UNIT,
               OLN.ORGANIZATION_ID
                   AS ORGANIZATION_ID,
               RW_HEADER.ORDER_TYPE
                   AS ORDER_TYPE,
               OLN.HEADER_ID
                   AS ORDER_NUMBER,
               OLN.INVENTORY_ITEM_ID
                   AS INVENTORY_ITEM_ID,
               ITM.SEGMENT1
                   AS PRODUCT_CODE,
               CAT.CATEGORY_ID
                   AS CAETGORY_ID,
               SUM (NVL (OLN.QUANTITY, 0))
                   AS ORDER_QTY,
               CASE
                   WHEN RW_HEADER.SCR_OPREATING_UNIT = 103
                   THEN
                       SUM (NVL (OLN.QUANTITY, 0))
                   ELSE
                       SUM (NVL (OLN.QUANTITY_DELIVERED, 0))
               END
                   AS DELIVERED_QTY,
               0
                   AS PICKED_QTY,
               0
                   AS SCANNED_QTY,
               RW_HEADER.CREATE_BY
                   AS CREATE_BY,
               RW_HEADER.CREATE_BY
                   AS MODIFY_BY,
               RW_HEADER.WARRANTY_YN
                   AS WARRANTY_YN , 
               CASE WHEN NVL(ITM.ATTRIBUTE11,0) >0 THEN 'Y' ELSE 'N' END  ERPSERIALIZED 
        FROM SYN_MTL_TXN_REQUEST_LINES OLN
             LEFT OUTER JOIN SYN_MTL_SYSTEM_ITEMS ITM
                 ON     OLN.INVENTORY_ITEM_ID = ITM.INVENTORY_ITEM_ID
                    AND OLN.ORGANIZATION_ID = ITM.ORGANIZATION_ID
             LEFT OUTER JOIN SYN_ITEM_CATEGORIES CAT
                 ON     OLN.INVENTORY_ITEM_ID = CAT.INVENTORY_ITEM_ID
                    AND OLN.ORGANIZATION_ID = CAT.ORGANIZATION_ID
                    AND CAT.CATEGORY_SET_ID = '1'
             LEFT OUTER JOIN UPL_TRANSFER_DTL@SCINTF SCF
                 ON     OLN.LINE_ID = SCF.LINEID
                    AND OLN.HEADER_ID = SCF.HEADERID
                    AND SCF.ORDER_TYPE = 'MO'
        WHERE     OLN.HEADER_ID = RW_HEADER.ORDER_NUMBER
              AND OLN.ORGANIZATION_ID = RW_HEADER.SCR_ORGANIZATION_ID
        GROUP BY OLN.HEADER_ID,
                 OLN.ORGANIZATION_ID,
                 OLN.INVENTORY_ITEM_ID,
                 ITM.SEGMENT1,
                 SCF.HEADERID,
                 ITM.ATTRIBUTE11,
                 CAT.CATEGORY_ID;

    TYPE RW_LINES IS TABLE OF CR_LINES%ROWTYPE;
END PKG_SCAN_MO2;
/


DROP PACKAGE BODY DSS.PKG_SCAN_MO2;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_SCAN_MO2
AS
    PROCEDURE CHK_HEADER (P_ORDER_NUMBER              VARCHAR2,
                          P_ORDER_TYPE                VARCHAR2,
                          P_SCR_ORGANIZATION_ID       NUMBER,
                          P_EXISTS                OUT CHAR)
    AS
    BEGIN
        SELECT CASE WHEN COUNT (*) > 0 THEN 'Y' ELSE 'N' END
        INTO P_EXISTS
        FROM SYN_MTL_TXN_REQUEST_HEADERS
        WHERE     ORGANIZATION_ID = P_SCR_ORGANIZATION_ID
              AND TRANSACTION_TYPE_ID = '64'
              AND HEADER_ID = P_ORDER_NUMBER;
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
            FETCH CR_LINES
                  BULK COLLECT INTO TEMP_RW;

            P_LINECNT := TEMP_RW.COUNT;
            BEGIN
                IF RW_HEADER.SCR_ORGANIZATION_ID = '2338'
                THEN
                    FOR RW IN 1 .. TEMP_RW.COUNT
                    LOOP
                        IF TEMP_RW (RW).ERPSERIALIZED = 'Y'
                        THEN
                            PKG_SCAN_CONFIG.SET_SCANNABLE (
                                TEMP_RW (RW).INVENTORY_ITEM_ID,
                                TEMP_RW (RW).CAETGORY_ID,
                                TEMP_RW (RW).ORGANIZATION_ID,
                                TEMP_RW (RW).PRODUCT_CODE,
                                TEMP_RW (RW).OPREATING_UNIT);
                        END IF;
                    END LOOP;
                END IF;
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
                    P_ORDER_TYPE,
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


            FETCH CR_HEADER
                  INTO TEMP_RW;

            /*line Table*/
            BEGIN
                INS_LINES (TEMP_RW, P_LINECNT);
            END;

 
            CLOSE CR_HEADER;
        ELSE
            P_JOBNO := 0;
        END IF;
    END INS_HEADER;
END PKG_SCAN_MO2;
/
