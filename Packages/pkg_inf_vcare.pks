DROP PACKAGE DSS.PKG_INF_VCARE;

CREATE OR REPLACE PACKAGE DSS.PKG_INF_VCARE
AS
   CURSOR CR_SERIALS
   IS
      SELECT *
        FROM V_DSS_SERIAL_INTERFACE
       WHERE     1 = 1
             AND NVL (ORGANIZATIONID, 0) != '1958'        --EXCLUDE YALLA SHOP
             AND WARRANTY_SEQ > 0
             AND INF_YN = 'N'
             AND ORDER_TYPE != 'GRN'
             AND ORDER_TYPE != 'IOT'
             AND ORDER_TYPE != 'SR'
             AND VMODEL_SEQ IS NOT NULL;

   CURSOR CR_SERIALS_SEQ
   IS
      SELECT h.JOBID,
             h.ORDER_NUMBER,
             h.ORDER_DATE,
             l.LINEID
        FROM dss_order_scan_header h
             JOIN dss_order_scan_lines l ON h.JOBID = l.JOBID
       WHERE     h.APP_SOURCE = 'DSS'
             AND h.ORDER_TYPE != 'GRN'
             AND h.ORDER_TYPE != 'SR'
             AND NVL (ORGANIZATION_ID, 0) != 1958
             AND l.WARRANTY_YN = 'Y'
             AND NVL (WARRANTY_SEQ, 0) = 0
             AND L.WARRANTY_CODE IS NULL;

   TYPE RW_SERIALS IS TABLE OF CR_SERIALS%ROWTYPE;

   TYPE RW_SERIALS_SEQ IS TABLE OF CR_SERIALS_SEQ%ROWTYPE;
END PKG_INF_VCARE;
/


DROP PACKAGE BODY DSS.PKG_INF_VCARE;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_INF_VCARE
AS
   PROCEDURE LOG_ERROR (P_OPERATING_UNIT    VARCHAR2,
                        P_ERROR_ON          VARCHAR2,
                        P_ERROR_CODE        VARCHAR2,
                        P_ERROR_MESSAGE     VARCHAR2,
                        P_STATUS            VARCHAR2)
   AS
      V_LOGID    NUMBER;
      V_EMAILS   VARCHAR2 (1000);
      ERR_MSG    VARCHAR2 (1000);
   BEGIN
      SELECT NVL (MAX (LOGID), 0) + 1 INTO V_LOGID FROM DSS_LOG_INF_PHONECARE;

      INSERT INTO DSS_LOG_INF_PHONECARE (LOGID,
                                         OPERATING_UNIT,
                                         ERROR_ON,
                                         ERROR_CODE,
                                         ERROR_MESSAGE,
                                         STATUS,
                                         RUN_DATE)
           VALUES (V_LOGID,
                   P_OPERATING_UNIT,
                   P_ERROR_ON,
                   P_ERROR_CODE,
                   P_ERROR_MESSAGE,
                   P_STATUS,
                   SYSDATE);

      --SEND SMS
      PKG_NOTIFICATION.SEND_SMS_BY_TYPE (
         'ALL',
            'DSS Failure: inf2vcare:'
         || P_OPERATING_UNIT
         || ':'
         || P_ERROR_CODE
         || '-'
         || SUBSTR (P_ERROR_MESSAGE, 1, 100));

      --SEND EMAIL
      SELECT LISTAGG (RECIPIENT, ';') WITHIN GROUP (ORDER BY id) AS list
        INTO V_EMAILS
        FROM DSS_USER_NOTIFICATIONS
       WHERE notify_type = 'E' AND notify_for = 'ALL' AND active = 'Y';

      ERR_MSG :=
         TRIM (
            SUBSTR (P_ERROR_MESSAGE,
                    INSTR (P_ERROR_MESSAGE, ':') + 1,
                    LENGTH (P_ERROR_MESSAGE)));

      PKG_NOTIFICATION.SEND_EMAIL (
         V_EMAILS,
         'DSS Job Failures',
            'Procedure Name: PKG_INF_PHONECARE.'
         || P_ERROR_ON
         || CHR (13)
         || CHR (10)
         || CHR (13)
         || CHR (10)
         || 'Procedure Input:  '
         || P_OPERATING_UNIT
         || CHR (13)
         || CHR (10)
         || CHR (13)
         || CHR (10)
         || 'Error Date:   '
         || TO_CHAR (SYSDATE)
         || CHR (13)
         || CHR (10)
         || CHR (13)
         || CHR (10)
         || 'Error Message:'
         || P_ERROR_CODE
         || ':'
         || ERR_MSG);
   END LOG_ERROR;
   
   PROCEDURE UPD_SCAN_SERIALS
   AS
      TEMP_RW   RW_SERIALS_SEQ;
   BEGIN
      IF (CR_SERIALS_SEQ%ISOPEN)
      THEN
         CLOSE CR_SERIALS_SEQ;
      END IF;

      OPEN CR_SERIALS_SEQ;

      LOOP
         FETCH CR_SERIALS_SEQ
              BULK COLLECT INTO TEMP_RW
            LIMIT 1000;

         FORALL rw IN 1 .. TEMP_RW.COUNT
            UPDATE (SELECT LIN.WARRANTY_SEQ,
                           LIN.WARRANTY_CODE,
                           OWR.WARRANTY_SEQ OR_WARRANTY_SEQ,
                           PWR.WARRANTY_SEQ PR_WARRANTY_SEQ,
                           LIN.ATTRIBUTE9
                      FROM DSS_ORDER_SCAN_LINES LIN
                           LEFT OUTER JOIN TK_ORGANIZATION_WARRANTY OWR
                              ON     LIN.CAETGORY_ID = OWR.CATEGORY_ID
                                 AND LIN.ORGANIZATION_ID =
                                        OWR.ORGANIZATION_ID
                           LEFT OUTER JOIN TK_PRODUCT_WARRANTY PWR
                              ON     LIN.INVENTORY_ITEM_ID =
                                        PWR.INVENTORY_ITEM_ID
                                 AND LIN.ORGANIZATION_ID =
                                        PWR.ORGANIZATION_ID
                     WHERE     LIN.WARRANTY_YN = 'Y'
                           AND LIN.JOBID = TEMP_RW (RW).JOBID)
               SET WARRANTY_SEQ =
                      NVL (WARRANTY_SEQ,
                           NVL (OR_WARRANTY_SEQ, PR_WARRANTY_SEQ)),
                   ATTRIBUTE9 = 'Manually updated wty seq through job';

         EXIT WHEN CR_SERIALS_SEQ%NOTFOUND;
      END LOOP;

      CLOSE CR_SERIALS_SEQ;
   END UPD_SCAN_SERIALS;

   PROCEDURE UPD_SCAN_LINES
   AS
   BEGIN
      MERGE INTO DSS_ORDER_SCAN_LINES L
       USING DSS_SERVICE_WARRANTY W
          ON (L.WARRANTY_SEQ = W.WARRANTY_SEQ)
      WHEN MATCHED
      THEN
         UPDATE SET
            L.WARRANTY_CODE = W.WARRANTY_CODE, L.CREATE_DATE = SYSDATE
             WHERE     L.WARRANTY_YN = 'Y'
                   AND NVL (L.WARRANTY_SEQ, 0) > 0
                   AND L.WARRANTY_CODE IS NULL;

      --update wty seq
      MERGE INTO DSS_ORDER_SCAN_LINES L
       USING DSS_SERVICE_WARRANTY W
          ON (L.WARRANTY_CODE = W.WARRANTY_CODE)
      WHEN MATCHED
      THEN
         UPDATE SET
            L.WARRANTY_SEQ = W.WARRANTY_SEQ, L.CREATE_DATE = SYSDATE
             WHERE     L.WARRANTY_YN = 'Y'
                   AND L.WARRANTY_CODE IS NOT NULL
                   AND NVL (L.WARRANTY_SEQ, 0) = 0;
   END UPD_SCAN_LINES;



   PROCEDURE MASTER_SYNC
   AS
      TEMP_RW   RW_SERIALS;
   BEGIN
      UPD_SCAN_SERIALS;
      UPD_SCAN_LINES;

      IF (CR_SERIALS%ISOPEN)
      THEN
         CLOSE CR_SERIALS;
      END IF;

      OPEN CR_SERIALS;

      LOOP
         FETCH CR_SERIALS
              BULK COLLECT INTO TEMP_RW
            LIMIT 1000;

         FORALL RW IN 1 .. TEMP_RW.COUNT
            MERGE INTO DSS_WARRANTY_MASTER TRG
             USING (SELECT TEMP_RW (RW).IMEI_NUMBER AS IMEI_NUMBER
                      FROM DUAL) MTCH
                ON (MTCH.IMEI_NUMBER = TRG.IMEI_NUMBER)
            WHEN MATCHED
            THEN
               UPDATE SET IMEI_NUMBER2 = TEMP_RW (RW).IMEI_NUMBER2,
                          IMEI_NUMBER3 = TEMP_RW (RW).IMEI_NUMBER3,
                          IMEI_NUMBER4 = TEMP_RW (RW).IMEI_NUMBER4,
                          RFID_NUMBER = TEMP_RW (RW).RFID_NUMBER,
                          INVENTORY_ITEM_ID = TEMP_RW (RW).INVENTORY_ITEM_ID,
                          PRODUCT_CODE = TEMP_RW (RW).PRODUCT_CODE,
                          PRODUCT_BRAND = TEMP_RW (RW).PRODUCT_BRAND,
                          PRODUCT_MODEL = TEMP_RW (RW).PRODUCT_MODEL,
                          BRAND_SEQ = TEMP_RW (RW).BRAND_SEQ,
                          MODEL_SEQ = TEMP_RW (RW).MODEL_SEQ,
                          WARRANTY_SEQ = TEMP_RW (RW).WARRANTY_SEQ,
                          WARRANTY_CODE = TEMP_RW (RW).WARRANTY_CODE,
                          WARRANTY_END_DATE = TEMP_RW (RW).WARRANTY_END_DATE,
                          JOB_REF_NO = TEMP_RW (RW).JOB_REF_NO,
                          JOB_REF_LINENO = TEMP_RW (RW).JOB_REF_LINENO,
                          JOB_REF_SEQNO = TEMP_RW (RW).JOB_REF_SEQNO,
                          ORDER_TYPE = TEMP_RW (RW).ORDER_TYPE,
                          ORDER_NUMBER = TEMP_RW (RW).ORDER_NUMBER,
                          ORDER_NUMBER2 = TEMP_RW (RW).ORDER_NUMBER2,
                          ORDER_NUMBER3 = TEMP_RW (RW).ORDER_NUMBER3,
                          OPERATION_UNIT = TEMP_RW (RW).OPERATION_UNIT,
                          COUNTRY_CODE = TEMP_RW (RW).COUNTRY_CODE,
                          ORGANIZATIONID = TEMP_RW (RW).ORGANIZATIONID,
                          CREATE_DATE = TEMP_RW (RW).CREATE_DATE,
                          MODIFY_DATE = SYSDATE,
                          PRINTING_DATE = SYSDATE,
                          ACTION_TYPE = 'U',                        -- UPDATED
                          STATUS = 'C',
                          INF_YN = 'N',
                          INF_DATE = NULL,
                          ATTRIBUTE1 = TEMP_RW (RW).ATTRIBUTE1,
                          ATTRIBUTE2 = TEMP_RW (RW).ATTRIBUTE2,
                          ATTRIBUTE3 = TEMP_RW (RW).ATTRIBUTE3,
                          ATTRIBUTE4 = TEMP_RW (RW).ATTRIBUTE4,
                          ATTRIBUTE5 = TEMP_RW (RW).ATTRIBUTE5,
                          ATTRIBUTE6 = TEMP_RW (RW).ATTRIBUTE6,
                          ATTRIBUTE7 = 'DSS',      -- TEMP_RW (RW).ATTRIBUTE7,
                          ATTRIBUTE8 = TEMP_RW (RW).ORDER_DATE, --  TEMP_RW (RW).ATTRIBUTE8,
                          ATTRIBUTE9 = TEMP_RW (RW).ATTRIBUTE9,
                          ATTRIBUTE10 = TEMP_RW (RW).ATTRIBUTE10,
                          VBRAND_SEQ = TEMP_RW (RW).VBRAND_SEQ,
                          VBRAND_CODE = TEMP_RW (RW).VBRAND_CODE,
                          VMODEL_SEQ = TEMP_RW (RW).VMODEL_SEQ,
                          VMODEL_CODE = TEMP_RW (RW).VMODEL_CODE,
                          BASE_BRAND_SEQ = TEMP_RW (RW).BASE_BRAND_SEQ,
                          BASE_BRAND_CODE = TEMP_RW (RW).BASE_BRAND_CODE,
                          VBASE_BRAND_SEQ = TEMP_RW (RW).VBASE_BRAND_SEQ,
                          VBASE_BRAND_CODE = TEMP_RW (RW).VBASE_BRAND_CODE,
                          BASE_MODEL_SEQ = TEMP_RW (RW).BASE_MODEL_SEQ,
                          BASE_MODEL_CODE = TEMP_RW (RW).BASE_MODEL_CODE,
                          VBASE_MODEL_SEQ = TEMP_RW (RW).VBASE_MODEL_SEQ,
                          VBASE_MODEL_CODE = TEMP_RW (RW).VBASE_MODEL_CODE,
                          WARRANTY_YEARS = TEMP_RW (RW).WARRANTY_YEARS,
                          WARRANTY_MONTHS = TEMP_RW (RW).WARRANTY_MONTHS,
                          WARRANTY_DAYS = TEMP_RW (RW).WARRANTY_DAYS,
                          ACTION_COUNT = ACTION_COUNT + 1,
                          MODIFY_BY = TEMP_RW (RW).CREATE_BY
            WHEN NOT MATCHED
            THEN
               INSERT (LINEID,
                       IMEI_NUMBER,
                       IMEI_NUMBER2,
                       IMEI_NUMBER3,
                       IMEI_NUMBER4,
                       RFID_NUMBER,
                       INVENTORY_ITEM_ID,
                       PRODUCT_CODE,
                       PRODUCT_BRAND,
                       PRODUCT_MODEL,
                       BRAND_SEQ,
                       MODEL_SEQ,
                       WARRANTY_SEQ,
                       WARRANTY_CODE,
                       WARRANTY_END_DATE,
                       JOB_REF_NO,
                       JOB_REF_LINENO,
                       JOB_REF_SEQNO,
                       ORDER_TYPE,
                       ORDER_NUMBER,
                       ORDER_NUMBER2,
                       ORDER_NUMBER3,
                       ORDER_DATE,
                       OPERATION_UNIT,
                       COUNTRY_CODE,
                       ORGANIZATIONID,
                       CREATE_DATE,
                       MODIFY_DATE,
                       PRINTING_DATE,
                       ACTION_TYPE,
                       STATUS,
                       INF_YN,
                       INF_DATE,
                       ATTRIBUTE1,
                       ATTRIBUTE2,
                       ATTRIBUTE3,
                       ATTRIBUTE4,
                       ATTRIBUTE5,
                       ATTRIBUTE6,
                       ATTRIBUTE7,
                       ATTRIBUTE8,
                       ATTRIBUTE9,
                       ATTRIBUTE10,
                       VBRAND_SEQ,
                       VBRAND_CODE,
                       VMODEL_SEQ,
                       VMODEL_CODE,
                       BASE_BRAND_SEQ,
                       BASE_BRAND_CODE,
                       VBASE_BRAND_SEQ,
                       VBASE_BRAND_CODE,
                       BASE_MODEL_SEQ,
                       BASE_MODEL_CODE,
                       VBASE_MODEL_SEQ,
                       VBASE_MODEL_CODE,
                       WARRANTY_YEARS,
                       WARRANTY_MONTHS,
                       WARRANTY_DAYS,
                       ACTION_COUNT,
                       CREATE_BY)
               VALUES (0,                    -- AUTO INCREMENT THROUGH TRIGGER
                       TEMP_RW (RW).IMEI_NUMBER,
                       TEMP_RW (RW).IMEI_NUMBER2,
                       TEMP_RW (RW).IMEI_NUMBER3,
                       TEMP_RW (RW).IMEI_NUMBER4,
                       TEMP_RW (RW).RFID_NUMBER,
                       TEMP_RW (RW).INVENTORY_ITEM_ID,
                       TEMP_RW (RW).PRODUCT_CODE,
                       TEMP_RW (RW).PRODUCT_BRAND,
                       TEMP_RW (RW).PRODUCT_MODEL,
                       TEMP_RW (RW).BRAND_SEQ,
                       TEMP_RW (RW).MODEL_SEQ,
                       TEMP_RW (RW).WARRANTY_SEQ,
                       TEMP_RW (RW).WARRANTY_CODE,
                       TEMP_RW (RW).WARRANTY_END_DATE,
                       TEMP_RW (RW).JOB_REF_NO,
                       TEMP_RW (RW).JOB_REF_LINENO,
                       TEMP_RW (RW).JOB_REF_SEQNO,
                       TEMP_RW (RW).ORDER_TYPE,
                       TEMP_RW (RW).ORDER_NUMBER,
                       TEMP_RW (RW).ORDER_NUMBER2,
                       TEMP_RW (RW).ORDER_NUMBER3,
                       TEMP_RW (RW).ORDER_DATE,
                       TEMP_RW (RW).OPERATION_UNIT,
                       TEMP_RW (RW).COUNTRY_CODE,
                       TEMP_RW (RW).ORGANIZATIONID,
                       TEMP_RW (RW).CREATE_DATE,
                       SYSDATE,                                 --MODIFY_DATE,
                       SYSDATE,                 -- TEMP_RW (RW).PRINTING_DATE,
                       'I',                           --ACTION_TYPE, -- INSERT
                       'C',                                         -- STATUS,
                       'N',                                          --INF_YN,
                       NULL,                                       --INF_DATE,
                       TEMP_RW (RW).ATTRIBUTE1,
                       TEMP_RW (RW).ATTRIBUTE2,
                       TEMP_RW (RW).ATTRIBUTE3,
                       TEMP_RW (RW).ATTRIBUTE4,
                       TEMP_RW (RW).ATTRIBUTE5,
                       TEMP_RW (RW).ATTRIBUTE6,
                       'DSS',                      -- TEMP_RW (RW).ATTRIBUTE7,
                       TEMP_RW (RW).ATTRIBUTE8,
                       TEMP_RW (RW).ATTRIBUTE9,
                       TEMP_RW (RW).ATTRIBUTE10,
                       TEMP_RW (RW).VBRAND_SEQ,
                       TEMP_RW (RW).VBRAND_CODE,
                       TEMP_RW (RW).VMODEL_SEQ,
                       TEMP_RW (RW).VMODEL_CODE,
                       TEMP_RW (RW).BASE_BRAND_SEQ,
                       TEMP_RW (RW).BASE_BRAND_CODE,
                       TEMP_RW (RW).VBASE_BRAND_SEQ,
                       TEMP_RW (RW).VBASE_BRAND_CODE,
                       TEMP_RW (RW).BASE_MODEL_SEQ,
                       TEMP_RW (RW).BASE_MODEL_CODE,
                       TEMP_RW (RW).VBASE_MODEL_SEQ,
                       TEMP_RW (RW).VBASE_MODEL_CODE,
                       TEMP_RW (RW).WARRANTY_YEARS,
                       TEMP_RW (RW).WARRANTY_MONTHS,
                       TEMP_RW (RW).WARRANTY_DAYS,
                       1,                                       --ACTION COUNT
                       TEMP_RW (RW).CREATE_BY);


         FORALL RW IN 1 .. TEMP_RW.COUNT
            UPDATE DSS_ORDER_SCAN_SERIALS
               SET INF_YN = 'Y', INF_DATE = SYSDATE
             WHERE     JOBID = TEMP_RW (RW).JOB_REF_NO
                   AND LINEID = TEMP_RW (RW).JOB_REF_LINENO
                   AND SEQINDEX = TEMP_RW (RW).JOB_REF_SEQNO;

         EXIT WHEN CR_SERIALS%NOTFOUND;
      END LOOP;

      CLOSE CR_SERIALS;
            EXCEPTION
         WHEN OTHERS
         THEN
            LOG_ERROR ('',
                       'POPULATE_WARRANTY_MASTER',
                       SQLCODE,
                       SUBSTR (SQLERRM, 1, 200),
                       '');
   END MASTER_SYNC;
END PKG_INF_VCARE;
/
