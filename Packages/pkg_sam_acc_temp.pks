DROP PACKAGE DSS.PKG_SAM_ACC_TEMP;

CREATE OR REPLACE PACKAGE DSS.PKG_SAM_ACC_TEMP
AS
   PROCEDURE START_VALIDATE;


   CURSOR CR_VAL_SERIALS
   IS
      SELECT COUNT (*) CNT, SERIALNO
        FROM TEMP_SAM_ACC_SERIALS
       WHERE HASERROR IS NULL
      GROUP BY SERIALNO
      HAVING COUNT (*) > 1;

   TYPE RW_VAL_SERIALS IS TABLE OF CR_VAL_SERIALS%ROWTYPE;

   CURSOR CR_PO_LINES
   IS
      SELECT SR.PO_HEADER_ID,
             LN.PO_LINE_ID,
             LN.LINE_NUM,
             ITM.INVENTORY_ITEM_ID,
             SR.AXIOMCODE,
             LN.QUANTITY,
             COUNT (*) CNT_SERIALS,
             CASE
                WHEN PO_LINE_ID IS NULL
                THEN
                   'Y'
                WHEN COUNT (*) > LN.QUANTITY
                THEN
                   'Y'
                ELSE
                   'N'
             END
                HAS_ERROR
        FROM TEMP_SAM_ACC_SERIALS SR
             LEFT OUTER JOIN SYN_MTL_SYSTEM_ITEMS ITM
                ON SR.AXIOMCODE = ITM.SEGMENT1 AND ORGANIZATION_ID = 104
             LEFT OUTER JOIN SYN_PO_LINES_ALL LN
                ON     SR.PO_HEADER_ID = LN.PO_HEADER_ID
                   AND ITM.INVENTORY_ITEM_ID = LN.ITEM_ID
             LEFT OUTER JOIN SYN_PO_HEADERS_ALL HDR
                ON LN.PO_HEADER_ID = HDR.PO_HEADER_ID
       WHERE SR.PO_HEADER_ID IS NOT NULL AND HASERROR IS NULL
      GROUP BY SR.PO_HEADER_ID,
               LN.PO_LINE_ID,
               LN.LINE_NUM,
               ITM.INVENTORY_ITEM_ID,
               SR.AXIOMCODE,
               LN.QUANTITY;

   TYPE RW_PO_LINES IS TABLE OF CR_PO_LINES%ROWTYPE;

   CURSOR CR_LINES_ERROR
   IS
      SELECT PO_HEADER_ID,
             PRODUCT_CODE,
             HASERROR,
             ERRORCODES
        FROM  TEMP_SAM_PO_LINES 
       WHERE HASERROR = 'Y';
       
       
        TYPE RW_LINES_ERROR IS TABLE OF CR_LINES_ERROR%ROWTYPE;
        
        
           PROCEDURE UPD_LINES_ERROR ;
        
END PKG_SAM_ACC_TEMP;
/


DROP PACKAGE BODY DSS.PKG_SAM_ACC_TEMP;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_SAM_ACC_TEMP
AS
   PROCEDURE VAL_PRODUCT
   AS
   BEGIN
      UPDATE TEMP_SAM_ACC_SERIALS
         SET HASERROR = 'Y', ERRORCODES = ERRORCODES || 'P.EXISTS,'
       WHERE AXIOMCODE NOT IN (SELECT PRODUCT_CODE
                                 FROM DSS_PRODUCTS
                                WHERE ORGANIZATION_ID = '104');
   END;

   PROCEDURE UPD_PO_NUMBER
   AS
   BEGIN
      UPDATE TEMP_SAM_ACC_SERIALS
         SET ACTUAL_DATE = TO_DATE (ACTUALGIDATE, 'YYYYMMDD'),
             ERP_PO_NO =
                TRIM (
                   REGEXP_REPLACE (CUSTOMERPO,
                                   'PO|#|IR|OR|- WK 46|-W10-4|/|:|-',
                                   ''));
   END;

   PROCEDURE VAL_SERIALS
   AS
      TEMP_RW   RW_VAL_SERIALS;
   BEGIN
      IF (CR_VAL_SERIALS%ISOPEN)
      THEN
         CLOSE CR_VAL_SERIALS;
      END IF;

      OPEN CR_VAL_SERIALS;

      LOOP
         FETCH CR_VAL_SERIALS
              BULK COLLECT INTO TEMP_RW
            LIMIT 1000;


         FORALL rw IN 1 .. TEMP_RW.COUNT
            UPDATE TEMP_SAM_ACC_SERIALS
               SET HASERROR = 'Y',
                   ERRORCODES = 'D' || TEMP_RW (RW).CNT || ','
             WHERE SERIALNO = TEMP_RW (RW).SERIALNO;


         EXIT WHEN CR_VAL_SERIALS%NOTFOUND;
      END LOOP;

      CLOSE CR_VAL_SERIALS;
   END VAL_SERIALS;



   PROCEDURE VAL_PO_NO
   AS
   BEGIN
      UPDATE TEMP_SAM_ACC_SERIALS TRG
         SET (PO_HEADER_ID, VENDOR_ID) =
                (SELECT PO_HEADER_ID, VENDOR_ID
                   FROM SYN_PO_HEADERS_ALL SCR
                  WHERE SEGMENT1 = TRG.ERP_PO_NO);

      UPDATE TEMP_SAM_ACC_SERIALS
         SET HASERROR = 'Y', ERRORCODES = ERRORCODES || 'PO.EXISTS,'
       WHERE PO_HEADER_ID IS NULL;
   END VAL_PO_NO;

   PROCEDURE INS_PO_LINES
   AS
      TEMP_RW   RW_PO_LINES;
   BEGIN
      IF (CR_PO_LINES%ISOPEN)
      THEN
         CLOSE CR_PO_LINES;
      END IF;

      OPEN CR_PO_LINES;

      LOOP
         FETCH CR_PO_LINES
              BULK COLLECT INTO TEMP_RW
            LIMIT 1000;


         FORALL rw IN 1 .. TEMP_RW.COUNT
            INSERT INTO TEMP_SAM_PO_LINES (PO_HEADER_ID,
                                           PO_LINE_ID,
                                           LINE_SEQ,
                                           INVENTORY_ITEM_ID,
                                           PRODUCT_CODE,
                                           QUANTITY,
                                           CNT_SERIALS,
                                           HASERROR,
                                           ERRORCODES)
               VALUES (
                         TEMP_RW (RW).PO_HEADER_ID,
                         TEMP_RW (RW).PO_LINE_ID,
                         TEMP_RW (RW).LINE_NUM,
                         TEMP_RW (RW).INVENTORY_ITEM_ID,
                         TEMP_RW (RW).AXIOMCODE,
                         TEMP_RW (RW).QUANTITY,
                         TEMP_RW (RW).CNT_SERIALS,
                         TEMP_RW (RW).HAS_ERROR,
                         CASE
                            WHEN TEMP_RW (RW).PO_LINE_ID IS NULL
                            THEN
                               'POLine.Exists,'
                            WHEN     TEMP_RW (RW).PO_LINE_ID IS NULL
                                 AND TEMP_RW (RW).QUANTITY <
                                        TEMP_RW (RW).CNT_SERIALS
                            THEN
                               'POLine.Exists,Qty.Qreater'
                            WHEN     TEMP_RW (RW).PO_LINE_ID IS NOT NULL
                                 AND TEMP_RW (RW).QUANTITY <
                                        TEMP_RW (RW).CNT_SERIALS
                            THEN
                               'Qty.Qreater,'
                            ELSE
                               NULL
                         END);

         EXIT WHEN CR_PO_LINES%NOTFOUND;
      END LOOP;

      CLOSE CR_PO_LINES;
   END;

   PROCEDURE UPD_LINES_ERROR
   AS
      TEMP_RW   RW_LINES_ERROR;
   BEGIN
      IF (CR_LINES_ERROR%ISOPEN)
      THEN
         CLOSE CR_LINES_ERROR;
      END IF;

      OPEN CR_LINES_ERROR;

      LOOP
         FETCH CR_LINES_ERROR
              BULK COLLECT INTO TEMP_RW
            LIMIT 1000;

         FORALL rw IN 1 .. TEMP_RW.COUNT
            UPDATE TEMP_SAM_ACC_SERIALS
               SET HASERROR = 'Y',
                   ERRORCODES =
                      CASE
                         WHEN ERRORCODES IS NULL
                         THEN
                            TEMP_RW (RW).ERRORCODES
                         ELSE
                            ERRORCODES || TEMP_RW (RW).ERRORCODES
                      END
             WHERE     TEMP_RW (RW).PO_HEADER_ID = PO_HEADER_ID
                   AND AXIOMCODE = TEMP_RW (RW).PRODUCT_CODE;

         EXIT WHEN CR_LINES_ERROR%NOTFOUND;
      END LOOP;

      CLOSE CR_LINES_ERROR;
   END UPD_LINES_ERROR;

   PROCEDURE START_VALIDATE
   AS
   BEGIN
      --VAL_SERIALS;
      --VAL_PRODUCT;
      INS_PO_LINES;
   END;
END PKG_SAM_ACC_TEMP;
/
