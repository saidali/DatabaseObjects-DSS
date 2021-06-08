DROP PACKAGE DSS.PKG_WMS_TO_DSS;

CREATE OR REPLACE PACKAGE DSS.PKG_WMS_TO_DSS
AS
   PROCEDURE BULK_COPY_WARRANTY_MASTER (FRMDATE DATE, TODATE DATE);

   --   CURSOR CU_LINES
   --   IS
   --      (SELECT *
   --         FROM DSS_ORDER_SCAN_LINES_WT
   --        WHERE     TRUNC (CREATE_DATE) <=
   --                     TRUNC (TO_DATE ('31/03/2013', 'DD/MM/YYYY'))
   --              AND NVL (ATTRIBUTE5, 'P') NOT IN ('C', 'A')); -- completed, Accessories


  PROCEDURE BULK_UPDATE_JOBNO_SERIALS (CRDATE DATE);
   --
  PROCEDURE BULK_COPY_SERIALS (FRMDATE DATE, TODATE DATE);
   --
   --   PROCEDURE UPDATE_JOBNO_FORLINES;
   --
  PROCEDURE BULK_UPDATE_JOBNO(FRMDATE DATE, TODATE DATE);
   --
   PROCEDURE BULK_COPY_LINES_FROM_WMS(FRMDATE DATE, TODATE DATE);
--
--
--
--   --   PROCEDURE IMPORT_FROM_WMS;
--   --
--   --   PROCEDURE IMPORT_LINES_FROM_WMS (P_JOBID NUMBER);
--   --
--
--
--   PROCEDURE IMPORT_SERIALS_FROM_WMS (
--      P_JOBID           NUMBER,
--      P_LINEID          NUMBER,
--      P_ORGID           DSS_ORDER_SCAN_SERIALS_WT.OPREATING_UNIT%TYPE,
--      P_ORDERNUMBER     DSS_ORDER_SCAN_SERIALS_WT.ORDER_NUMBER%TYPE,
--      P_PRODUCT_CODE    DSS_ORDER_SCAN_SERIALS_WT.PRODUCT_CODE%TYPE);
END PKG_WMS_TO_DSS;
/


DROP PACKAGE BODY DSS.PKG_WMS_TO_DSS;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_WMS_TO_DSS
AS
   PROCEDURE BULK_COPY_WARRANTY_MASTER (FRMDATE DATE, TODATE DATE)
   AS
      TYPE TOBJECTTABLE IS TABLE OF DSS_WARRANTY_MASTER%ROWTYPE;

      TEMPTABLE   TOBJECTTABLE;
      SLNO        NUMBER;
   BEGIN
      SELECT NVL (MAX (LOGID), 0) INTO SLNO FROM DSS_ERROR_LOG;

--      INSERT INTO DSS_ERROR_LOG (LOGID,
--                                 ERROR_ON,
--                                 ERROR_MESSAGE,
--                                 CREATE_DATE)
--           VALUES (SLNO + 1,
--                   'copy wty master - start',
--                   TO_CHAR (FRMDATE) || ' - ' || TO_CHAR (TODATE),
--                   SYSDATE);
--
--      COMMIT;
--
--      SELECT LINEID,                                               --  LINEID,
--             IMEI_NUMBER,                           --            IMEI_NUMBER,
--             IMEI_NUMBER2,                           --          IMEI_NUMBER2,
--             NULL IMEI_NUMBER3,
--             NULL IMEI_NUMBER4,
--             NULL RFID_NUMBER,
--             NULL,                                      --  INVENTORY_ITEM_ID,
--             PRODUCT_CODE,                                    -- PRODUCT_CODE,
--             PRODUCT_BRAND,                                  -- PRODUCT_BRAND,
--             PRODUCT_MODEL,                                 --  PRODUCT_MODEL,
--             NULL VBRAND_SEQ,
--             NULL VMODEL_SEQ,
--             NULL WARRANTY_SEQ,
--             WARRANTY_CODE,                                  -- WARRANTY_CODE,
--             WARRANTY_END_DATE,                        --   WARRANTY_END_DATE,
--             JOB_REF_NO,                                        -- JOB_REF_NO,
--             JOB_REF_LINENO,                                -- JOB_REF_LINENO,
--             NULL,                                           -- JOB_REF_SEQNO,
--             ORDER_TYPE,                                       --  ORDER_TYPE,
--             ORDER_NUMBER,                                  --   ORDER_NUMBER,
--             NULL,                                          --  ORDER_NUMBER2,
--             NULL,                                           -- ORDER_NUMBER3,
--             ORDER_DATE,                                       --  ORDER_DATE,
--             OPERATION_ID,                                 --  OPERATION_UNIT,
--             COUNTRY_ID,                                     --  COUNTRY_CODE,
--             ORGANIZATIONID,                               --  ORGANIZATIONID,
--             CREATE_DATE,                                     --  CREATE_DATE,
--             MODIFY_DATE,                                     --  MODIFY_DATE,
--             PRINTING_DATE,                                 --  PRINTING_DATE,
--             NULL ACTION_TYPE,
--             STATUS,                                              --   STATUS,
--             INF_YN,                                               --  INF_YN,
--             NULL, --TO_DATE (ATT6, 'DD-MM-YYYY'),                --  INF_DATE
--             ATT1,
--             ATT2,
--             ATT3,
--             ATT4,
--             ATT5,
--             ATT6,
--             'XXWMS',
--             NULL,
--             NULL,
--             NULL
--        BULK COLLECT INTO TEMPTABLE
--        FROM WT_IMEI_WARRANTY_MASTER@WMS
--       WHERE     TRUNC (CREATE_DATE) >= TRUNC (FRMDATE)
--             AND TRUNC (CREATE_DATE) <= TRUNC (TODATE);
--
--      FORALL X IN TEMPTABLE.FIRST .. TEMPTABLE.LAST
--         INSERT INTO DSS_WARRANTY_MASTER
--              VALUES TEMPTABLE (X);
--
--      INSERT INTO DSS_ERROR_LOG (LOGID,
--                                 ERROR_ON,
--                                 ERROR_MESSAGE,
--                                 CREATE_DATE)
--           VALUES (SLNO + 2,
--                   'copy wty master - end',
--                   TO_CHAR (FRMDATE) || ' - ' || TO_CHAR (TODATE),
--                   SYSDATE);
--
--      COMMIT;
   EXCEPTION
      WHEN OTHERS
      THEN
         INSERT INTO DSS_ERROR_LOG (LOGID,
                                    ERROR_ON,
                                    ERROR_MESSAGE,
                                    CREATE_DATE)
              VALUES (SLNO + 3,
                      'copy wty master - ERROR',
                      TO_CHAR (FRMDATE) || ' - ' || TO_CHAR (TODATE),
                      SYSDATE);

         COMMIT;
   END BULK_COPY_WARRANTY_MASTER;

   PROCEDURE BULK_UPDATE_JOBNO_SERIALS (CRDATE DATE)
   AS
      SLNO      NUMBER;
      ERR_MSG   VARCHAR2 (1000);
   BEGIN
      SELECT NVL (MAX (LOGID), 0) INTO slno FROM DSS_ERROR_LOG;

      INSERT INTO DSS_ERROR_LOG (LOGID,
                                 ERROR_ON,
                                 ERROR_MESSAGE,
                                 CREATE_DATE)
           VALUES (slno + 1,
                   'update job no for serials - start',
                   TO_CHAR (CRDATE),
                   SYSDATE);

      COMMIT;
/*Said*/
--      MERGE INTO DSS_ORDER_SCAN_SERIALS_WT I
--           USING DSS_ORDER_SCAN_LINES L --DSS_ORDER_SCAN_LINES_WT L
--              ON (    I.ORGANIZATION_ID = L.ORGANIZATION_ID
--                  AND I.ORDER_TYPE = L.ORDER_TYPE
--                  AND I.ORDER_NUMBER = L.ORDER_NUMBER
--                  AND I.INVENTORY_ITEM_ID = L.INVENTORY_ITEM_ID)
--      WHEN MATCHED
--      THEN
--         UPDATE SET
--            I.JOBID = NVL (L.JOBID, -1), I.LINEID = NVL (L.LINEID, -1)
--                 WHERE     TRUNC (I.CREATE_DATE) = TRUNC (CRDATE)
--                       AND I.JOBID = 0
--                       AND I.LINEID = 0
--                       AND I.ORGANIZATION_ID = L.ORGANIZATION_ID
--                       AND I.ORDER_TYPE = L.ORDER_TYPE
--                       AND I.ORDER_NUMBER = L.ORDER_NUMBER
--                       AND I.INVENTORY_ITEM_ID = L.INVENTORY_ITEM_ID;

/*Said*/

      --        MERGE INTO DSS_ORDER_SCAN_SERIALS_WT I
      --              USING DSS_ORDER_SCAN_LINES_WT L
      --                 ON (    I.ORGANIZATION_ID = L.ORGANIZATION_ID
      --                     AND I.ORDER_TYPE = L.ORDER_TYPE
      --                     AND I.ORDER_NUMBER = L.ORDER_NUMBER
      --                     AND I.INVENTORY_ITEM_ID = L.INVENTORY_ITEM_ID
      --                     AND TRUNC(L.CREATE_DATE)=TRUNC(CRDATE))
      --                     --AND I.JOBID=0
      --                     --AND I.LINEID=0)
      --                     --AND I.ORDER_NUMBER=13450650)
      --         WHEN MATCHED
      --         THEN
      --            UPDATE SET
      --               I.JOBID = L.JOBID, I.LINEID = L.LINEID
      --                    WHERE TRUNC (I.CREATE_DATE) = TRUNC(CRDATE)
      --                    AND I.JOBID=0
      --                    AND I.LINEID=0
      --                    AND I.ORGANIZATION_ID = L.ORGANIZATION_ID
      --                     AND I.ORDER_TYPE = L.ORDER_TYPE
      --                     AND I.ORDER_NUMBER = L.ORDER_NUMBER
      --                     AND I.INVENTORY_ITEM_ID = L.INVENTORY_ITEM_ID;
      --

      INSERT INTO DSS_ERROR_LOG (LOGID,
                                 ERROR_ON,
                                 ERROR_MESSAGE,
                                 CREATE_DATE)
           VALUES (slno + 2,
                   'update job no for serials - end',
                   TO_CHAR (CRDATE),
                   SYSDATE);

      COMMIT;
   EXCEPTION
      WHEN OTHERS
      THEN
         INSERT INTO DSS_ERROR_LOG (LOGID,
                                    ERROR_ON,
                                    ERROR_MESSAGE,
                                    CREATE_DATE)
              VALUES (slno + 3,
                      'update job no for serials - ERROR',
                      TO_CHAR (CRDATE),
                      SYSDATE);

         COMMIT;
   END BULK_UPDATE_JOBNO_SERIALS;

   --
   --
   PROCEDURE BULK_COPY_SERIALS (FRMDATE DATE, TODATE DATE)
   AS
      TYPE TOBJECTTABLE IS TABLE OF DSS_ORDER_SCAN_SERIALS%ROWTYPE;

      TEMPTABLE   TOBJECTTABLE;
      SLNO        NUMBER;
   BEGIN
      SELECT NVL (MAX (LOGID), 0) INTO SLNO FROM DSS_ERROR_LOG;

      INSERT INTO DSS_ERROR_LOG (LOGID,
                                 ERROR_ON,
                                 ERROR_MESSAGE,
                                 CREATE_DATE)
           VALUES (SLNO + 1,
                   'copy serials - start',
                   TO_CHAR (FRMDATE) || ' - ' || TO_CHAR (TODATE),
                   SYSDATE);

      SELECT 0 SCANID,                                        --auto increment
             0 JOBID,                                            -- from lines
             0 LINEID,                                           -- from lines
             --ROW_NUMBER () OVER (PARTITION BY PRODUCT_CODE ORDER BY 1)
             SEQ_NO SEQINDEX,
             COLUMNINDEX,
             NULL CONFIGID,
             NULL CONFIGTYPE,
             'Normal Scan' SCANTYPE,
             'WT' SCAN_SOURCE,
             FRM_ORG_ID OPREATING_UNIT,
             FRM_ORGANIZATIONID ORGANIZATION_ID,
             CASE ORDER_TYPE
                WHEN 'MOVEORDER' THEN 'MO'
                WHEN 'SALESORDER' THEN 'SO'
                ELSE ORDER_TYPE
             END
                ORDER_TYPE,
             ORDERNUMBER ORDER_NUMBER,
             INVENTORY_ITEM_ID,
             PRODUCT_CODE,
             NULL SERVICE_BRANDID,
             SERIALKEY,
             NULL SERIALKEY_REF1,
             NULL SERIALKEY_REF2,
             PRINTING_YN WARRANTYPRINT_YN,
             WARRANTY_YN WARRANTY_YN,
             0 WARRANTY_SEQ,
             SERVICE_WARRANTY WARRANTY_CODE,
             NULL WARRANTY_STARTDATE,
             WARRANTY_END_DATE WARRANTY_ENDATE,
             NULL ACTIVE_YN,
             INF_YN,
             NULL INF_DATE,
             CREATE_BY,
             CREATE_DATE,
             CREATE_BY UPDATE_BY,
             CREATE_DATE UPDATE_DATE,
             NULL ALLOW_EDIT,
             SYSDATE ATTRIBUTE1,
             NULL ATTRIBUTE2,
             NULL ATTRIBUTE3,
             NULL ATTRIBUTE4,
             NULL ATTRIBUTE5,
             NULL ATTRIBUTE6,
             NULL ATTRIBUTE7,
             NULL ATTRIBUTE8,
             NULL ATTRIBUTE9,
             NULL ATTRIBUTE10
        BULK COLLECT INTO TEMPTABLE
        FROM WT_IMEI_TRACK_IMEI@WMS UNPIVOT (SERIALKEY
                                    FOR COLUMNINDEX
                                    IN  (IMEI_NUMBER AS '1',
                                        IMEI_NUMBER2 AS '2'))
       WHERE     TRUNC (CREATE_DATE) >= TRUNC (FRMDATE)
             AND TRUNC (CREATE_DATE) <= TRUNC (TODATE)
             AND CATEGORYID <> '02';

      --       WHERE     TRUNC (CREATE_DATE) >=
      --                    TRUNC (TO_DATE ('01/08/2014', 'DD/MM/YYYY'))
      --             AND TRUNC (CREATE_DATE) <=
      --                    TRUNC (TO_DATE ('31/08/2014', 'DD/MM/YYYY'))
      --             AND CATEGORYID <> '02';
/*Said*/
--      FORALL X IN TEMPTABLE.FIRST .. TEMPTABLE.LAST
--         INSERT INTO DSS_ORDER_SCAN_SERIALS
--              VALUES TEMPTABLE (X);
/*Said*/
      INSERT INTO DSS_ERROR_LOG (LOGID,
                                 ERROR_ON,
                                 ERROR_MESSAGE,
                                 CREATE_DATE)
           VALUES (SLNO + 2,
                   'copy serials - end',
                   TO_CHAR (FRMDATE) || ' - ' || TO_CHAR (TODATE),
                   SYSDATE);

      COMMIT;
   EXCEPTION
      WHEN OTHERS
      THEN
         INSERT INTO DSS_ERROR_LOG (LOGID,
                                    ERROR_ON,
                                    ERROR_MESSAGE,
                                    CREATE_DATE)
              VALUES (slno + 3,
                      'copy serials - error',
                      TO_CHAR (FRMDATE) || ' - ' || TO_CHAR (TODATE),
                      SYSDATE);

         COMMIT;
   END BULK_COPY_SERIALS;

   --
   --
   --   PROCEDURE UPDATE_JOBNO_FORLINES
   --   AS
   --   BEGIN
   --      FOR I
   --         IN (SELECT *
   --               FROM DSS_ORDER_SCAN_HEADER_WT
   --              WHERE     TRUNC (CREATE_DATE) <=
   --                           TRUNC (TO_DATE ('31/03/2013', 'DD/MM/YYYY'))
   --                    AND NVL (ATTRIBUTE2, 'P') NOT IN ('C'))
   --      LOOP
   --         UPDATE DSS_ORDER_SCAN_LINES_WT
   --            SET JOBID = I.JOBID
   --          WHERE ORDER_NUMBER = I.ORDER_NUMBER;
   --
   --         UPDATE DSS_ORDER_SCAN_HEADER_WT
   --            SET ATTRIBUTE2 = 'C'
   --          WHERE JOBID = I.JOBID;
   --      END LOOP;
   --   END UPDATE_JOBNO_FORLINES;
   --
   --   --PKG_WMS_TO_DSS
   PROCEDURE BULK_UPDATE_JOBNO (FRMDATE DATE, TODATE DATE)
   AS
      SLNO   NUMBER;
   BEGIN
      SELECT NVL (MAX (LOGID), 0) INTO SLNO FROM DSS_ERROR_LOG;

      INSERT INTO DSS_ERROR_LOG (LOGID,
                                 ERROR_ON,
                                 ERROR_MESSAGE,
                                 CREATE_DATE)
           VALUES (SLNO + 1,
                   'LINES UPDATE JOBNO - START',
                   TO_CHAR (FRMDATE) || ' - ' || TO_CHAR (TODATE),
                   SYSDATE);

--      MERGE INTO DSS_ORDER_SCAN_LINES L
--           USING DSS_ORDER_SCAN_HEADER H
--              ON (    L.OPREATING_UNIT = H.SCR_OPREATING_UNIT
--                  AND L.ORGANIZATION_ID = H.SCR_ORGANIZATION_ID
--                  AND L.ORDER_NUMBER = H.ORDER_NUMBER)
--      WHEN MATCHED
--      THEN
--         UPDATE SET
--            L.JOBID = NVL (H.JOBID, -1)
--                 WHERE     TRUNC (L.CREATE_DATE) >= TRUNC (FRMDATE)
--                       AND TRUNC (L.CREATE_DATE) <= TRUNC (TODATE);


      INSERT INTO DSS_ERROR_LOG (LOGID,
                                 ERROR_ON,
                                 ERROR_MESSAGE,
                                 CREATE_DATE)
           VALUES (SLNO + 2,
                   'LINES UPDATE JOBNO - END',
                   TO_CHAR (FRMDATE) || ' - ' || TO_CHAR (TODATE),
                   SYSDATE);
   EXCEPTION
      WHEN OTHERS
      THEN
         INSERT INTO DSS_ERROR_LOG (LOGID,
                                    ERROR_ON,
                                    ERROR_MESSAGE,
                                    CREATE_DATE)
              VALUES (SLNO + 3,
                      'LINES UPDATE JOBNO - ERROR',
                      TO_CHAR (FRMDATE) || ' - ' || TO_CHAR (TODATE),
                      SYSDATE);
   --AND NVL (ATTRIBUTE2, 'P') NOT IN ('C');

   --         UPDATE DSS_ORDER_SCAN_HEADER_WT
   --            SET ATTRIBUTE2 = 'C'
   --          WHERE     TRUNC (CREATE_DATE) >=
   --                       TRUNC (TO_DATE ('01/01/2014', 'DD/MM/YYYY'))
   --                AND TRUNC (CREATE_DATE) <=
   --                       TRUNC (TO_DATE ('31/12/2014', 'DD/MM/YYYY'));
   END BULK_UPDATE_JOBNO;


   --PKG_WMS_TO_DSS
   PROCEDURE BULK_COPY_LINES_FROM_WMS (FRMDATE DATE, TODATE DATE)
   AS
      TYPE TOBJECTTABLE IS TABLE OF DSS_ORDER_SCAN_LINES%ROWTYPE;

      TEMPTABLE   TOBJECTTABLE;
      SLNO        NUMBER;
   BEGIN
      ----      --SELECT * BULK COLLECT INTO TempTable
      --      --FROM LOG_UPLOAD_TEMP;

      SELECT NVL (MAX (LOGID), 0) INTO SLNO FROM DSS_ERROR_LOG;

      INSERT INTO DSS_ERROR_LOG (LOGID,
                                 ERROR_ON,
                                 ERROR_MESSAGE,
                                 CREATE_DATE)
           VALUES (SLNO + 1,
                   'copy LINES - start',
                   TO_CHAR (FRMDATE) || ' - ' || TO_CHAR (TODATE),
                   SYSDATE);


      SELECT 0 JOBID,
             0 LINEID,                       -- AUTO INCREMENT THROUGH TRIGGER
             CASE WHEN CNT > 1 THEN 'Y' ELSE 'N' END MERGED,
             ROW_NUMBER () OVER (PARTITION BY ORDERNUMBER ORDER BY 1)
                AS LINESEQ,
             FRM_ORG_ID OPREATING_UNIT,
             FRM_ORGANIZATIONID ORGANIZATION_ID,
             ORDER_TYPE ORDER_TYPE,
             ORDERNUMBER ORDER_NUMBER,
             INVENTORY_ITEM_ID INVENTORY_ITEM_ID,
             PRODUCT_CODE PRODUCT_CODE,
             NULL CAETGORY_ID,
             ORDER_QTY ORDER_QTY,
             DELIVERED_QTY DELIVERED_QTY,
             PICKED_QTY PICKED_QTY,
             0 SCANNED_QTY,
             CUSTOM_QTY CUSTOM_QTY,
             NULL WMS_SYNC,
             SCAN_YN SCAN_YN,
             PRINTING_YN WARRANTYPRINT_YN,
             WARRANTY_YN WARRANTY_YN,
             NULL WARRANTY_SEQ,
             SERVICE_WARRANTY WARRANTY_CODE,
             CREATE_BY CREATE_BY,
             CREATE_BY MODIFY_BY,
             CREATE_DATE CREATE_DATE,
             CREATE_DATE MODIFY_DATE,
             NULL EXPIRY_DATE,
             NULL EXPIRY_DAYS,
             NULL EDITABLE_YN,
             NULL ARCHIVED_YN,
             NULL ACTIVE_YN,
             STATUS STATUS_YN,
             '' HAS_SERIALS,
             NULL BARCODES,
             NULL ATTRIBUTE1,
             NULL ATTRIBUTE2,
             NULL ATTRIBUTE3,
             NULL ATTRIBUTE4,
             NULL ATTRIBUTE5,
             NULL ATTRIBUTE6,
             NULL ATTRIBUTE7,
             NULL ATTRIBUTE8,
             NULL ATTRIBUTE9,
             NULL ATTRIBUTE10
        BULK COLLECT INTO TEMPTABLE
        FROM (SELECT *
                FROM V_WMS_TRACK_LINES_TEMP
               WHERE     TRUNC (CREATE_DATE) >= TRUNC (FRMDATE)
                     AND TRUNC (CREATE_DATE) <= TRUNC (TODATE));
/*Said*/
--      FORALL X IN TEMPTABLE.FIRST .. TEMPTABLE.LAST
--         INSERT INTO DSS_ORDER_SCAN_LINES
--              VALUES TEMPTABLE (X);
/*Said*/
      INSERT INTO DSS_ERROR_LOG (LOGID,
                                 ERROR_ON,
                                 ERROR_MESSAGE,
                                 CREATE_DATE)
           VALUES (SLNO + 2,
                   'copy LINES - end',
                   TO_CHAR (FRMDATE) || ' - ' || TO_CHAR (TODATE),
                   SYSDATE);
   --   EXCEPTION
   --      WHEN OTHERS
   --      THEN
   --         INSERT INTO DSS_ERROR_LOG (LOGID,
   --                                    ERROR_ON,
   --                                    ERROR_MESSAGE,
   --                                    CREATE_DATE)
   --              VALUES (slno + 3,
   --                      'copy LINES - ERROR',
   --                      TO_CHAR (FRMDATE) || ' - ' || TO_CHAR (TODATE),
   --                      SYSDATE);
   END BULK_COPY_LINES_FROM_WMS;
--
--   PROCEDURE IMPORT_SERIALS_FROM_WMS (
--      P_JOBID           NUMBER,
--      P_LINEID          NUMBER,
--      P_ORGID           DSS_ORDER_SCAN_SERIALS_WT.OPREATING_UNIT%TYPE,
--      P_ORDERNUMBER     DSS_ORDER_SCAN_SERIALS_WT.ORDER_NUMBER%TYPE,
--      P_PRODUCT_CODE    DSS_ORDER_SCAN_SERIALS_WT.PRODUCT_CODE%TYPE)
--   AS
--      V_STATUS     VARCHAR2 (10);
--      V_CATEGORY   VARCHAR2 (10);
--      V_LOGID      NUMBER;
--   BEGIN
--      SELECT CATEGORYID
--        INTO V_CATEGORY
--        FROM WT_IMEI_TRACK_LINES_MOLD@WMS
--       WHERE ORDERNUMBER = P_ORDERNUMBER AND PRODUCT_CODE = P_PRODUCT_CODE;
--
--      IF (V_CATEGORY <> '02')
--      THEN
--         BEGIN
--            INSERT INTO DSS_ORDER_SCAN_SERIALS_WT
--               (SELECT 0 SCANID,                              --auto increment
--                       P_JOBID JOBID,                            -- from lines
--                       P_LINEID LINEID,                          -- from lines
--                       ROW_NUMBER ()
--                          OVER (PARTITION BY PRODUCT_CODE ORDER BY 1)
--                          SEQINDEX,
--                       COLUMNINDEX,
--                       NULL CONFIGID,
--                       NULL CONFIGTYPE,
--                       'Normal Scan' SCANTYPE,
--                       'WT' SCAN_SOURCE,
--                       FRM_ORG_ID OPREATING_UNIT,
--                       FRM_ORGANIZATIONID ORGANIZATION_ID,
--                       CASE ORDER_TYPE
--                          WHEN 'MOVEORDER' THEN 'MO'
--                          WHEN 'SALESORDER' THEN 'SO'
--                          ELSE ORDER_TYPE
--                       END
--                          ORDER_TYPE,
--                       ORDERNUMBER ORDER_NUMBER,
--                       INVENTORY_ITEM_ID,
--                       PRODUCT_CODE,
--                       NULL SERVICE_BRANDID,
--                       SERIALKEY,
--                       NULL SERIALKEY_REF1,
--                       NULL SERIALKEY_REF2,
--                       PRINTING_YN WARRANTYPRINT_YN,
--                       WARRANTY_YN WARRANTY_YN,
--                       0 WARRANTY_SEQ,
--                       SERVICE_WARRANTY WARRANTY_CODE,
--                       NULL WARRANTY_STARTDATE,
--                       WARRANTY_END_DATE WARRANTY_ENDATE,
--                       NULL ACTIVE_YN,
--                       INF_YN,
--                       NULL INF_DATE,
--                       CREATE_BY,
--                       CREATE_DATE,
--                       CREATE_BY UPDATE_BY,
--                       CREATE_DATE UPDATE_DATE,
--                       NULL ALLOW_EDIT,
--                       SYSDATE ATTRIBUTE1,
--                       NULL ATTRIBUTE2,
--                       NULL ATTRIBUTE3,
--                       NULL ATTRIBUTE4,
--                       NULL ATTRIBUTE5,
--                       NULL ATTRIBUTE6,
--                       NULL ATTRIBUTE7,
--                       NULL ATTRIBUTE8,
--                       NULL ATTRIBUTE9,
--                       NULL ATTRIBUTE10
--                  FROM WT_IMEI_TRACK_IMEI@WMS UNPIVOT (SERIALKEY
--                                              FOR COLUMNINDEX
--                                              IN  (IMEI_NUMBER AS '1',
--                                                  IMEI_NUMBER2 AS '2',
--                                                  IMEI_NUMBER3 AS '3'))
--                 WHERE     FRM_ORG_ID = P_ORGID
--                       AND ORDERNUMBER = P_ORDERNUMBER
--                       AND PRODUCT_CODE = P_PRODUCT_CODE);
--
--            V_STATUS := 'C';
--         END;
--      ELSE
--         V_STATUS := 'A';                                       -- ACCESSORIES
--      END IF;
--
--      UPDATE DSS_ORDER_SCAN_LINES_WT
--         SET ATTRIBUTE5 = V_STATUS
--       WHERE     OPREATING_UNIT = P_ORGID
--             AND JOBID = P_JOBID
--             AND LINEID = P_LINEID;
--   EXCEPTION
--      WHEN OTHERS
--      THEN
--         SELECT NVL (LOGID, 0) INTO V_LOGID FROM DSS_ERROR_LOG;
--
--         PKG_DSS_ERROR_LOG.LOG_ERROR (V_LOGID,
--                                      NULL,
--                                      'SERIALS LEVEL',
--                                      NULL,
--                                      SQLERRM,
--                                      SQLCODE,
--                                      NULL,
--                                      NULL,
--                                      NULL,
--                                      P_LINEID,
--                                      P_PRODUCT_CODE,
--                                      NULL,
--                                      SYSDATE,
--                                      'E');
--   END IMPORT_SERIALS_FROM_WMS;
END PKG_WMS_TO_DSS;
/
