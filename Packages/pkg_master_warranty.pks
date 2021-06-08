DROP PACKAGE DSS.PKG_MASTER_WARRANTY;

CREATE OR REPLACE PACKAGE DSS.PKG_MASTER_WARRANTY
AS
    PROCEDURE START_ARCH ;
   PROCEDURE START_SYNC;
   CURSOR CR_ARCH_SERIALS
   IS
      SELECT *
        FROM DSS_WARRANTY_MASTER
       WHERE ORDER_DATE < (SYSDATE - 180) AND  STATUS!='P' AND INF_YN = 'Y'  ;
   TYPE RW_ARCH_SERIALS IS TABLE OF CR_ARCH_SERIALS%ROWTYPE;
   
   CURSOR CR_NON_INF_SERIALS
   IS
      SELECT SN.KEY1 IMEI_NUMBER,
             SN.KEY2 IMEI_NUMBER2,
             SN.KEY3 IMEI_NUMBER3,
             SN.KEY4 IMEI_NUMBER4,
             SN.INVENTORY_ITEM_ID,
             SN.PRODUCT_CODE,
             PM.BRAND_CODE PRODUCT_BRAND,
             PM.MODEL_CODE PRODUCT_MODEL,
             BRMP.ITEM_BRD_SEQ BRAND_SEQ,
             SN.WARRANTY_SEQ WARRANTY_SEQ,
             SN.WARRANTY_CODE WARRANTY_CODE,
             SN.WARRANTY_ENDATE WARRANTY_END_DATE,
             SN.JOBID JOB_REF_NO,
             SN.LINEID JOB_REF_LINENO,
             SN.SEQINDEX JOB_REF_SEQNO,
             SN.ORDER_TYPE ORDER_TYPE,
             SN.ORDER_NUMBER ORDER_NUMBER,
             SN.ORDER_REF_NO ORDER_NUMBER2,
             SN.ORDER_REF_NO2 ORDER_NUMBER3,
             SN.ORDER_DATE ORDER_DATE,
             SN.OPREATING_UNIT OPERATION_UNIT,
             OU.COUNTRY_CODE COUNTRY_CODE,
             SN.DEST_ORGANIZATION_ID ORGANIZATIONID,
             SN.CREATE_DATE CREATE_DATE,
             SN.MODIFY_DATE MODIFY_DATE,
             VCB.BRAND_SEQ VBRAND_SEQ,
             VCB.BRAND_CODE VBRAND_CODE,
             BRMP.ITEM_BRD_SEQ BASE_BRAND_SEQ,
             BRMP.ITEM_BRD_CODE BASE_BRAND_CODE,
             VCB.BRAND_CODE VBASE_BRAND_CODE,
             NVL (NO_YEARS, 0) WARRANTY_YEARS,
             NVL (NO_MONTHS, 0) WARRANTY_MONTHS,
             NVL (NO_DAYS, 0) WARRANTY_DAYS,
               (NVL (NO_YEARS, 0) * 12)
             + (NVL (NO_MONTHS, 0))
             + (NVL (NO_DAYS, 0) / 30)
                WARRANTY_PERIOD,
             SN.CREATE_BY
        FROM VW_VCARE_NON_INTERFACED_SN SN
             JOIN DSS_PRODUCTS PM
                ON     SN.INVENTORY_ITEM_ID = PM.INVENTORY_ITEM_ID
                   AND SN.ORGANIZATION_ID = PM.ORGANIZATION_ID
             LEFT JOIN DSS_OPERATING_UNITS OU
                ON SN.OPREATING_UNIT = OU.OPERATING_UNIT
             JOIN TK_CATEGORIES_CONFIG FCAT
                ON PM.CATEGORY_ID = FCAT.CATEGORY_ID
             JOIN DSS_CATEGORY_INFO C1M ON FCAT.CATEGORY_CODE = C1M.CODEVALUE
             JOIN DSS_SUB_CATEGORY_INFO C2M
                ON FCAT.SUB_CATEGORY_CODE = C2M.CODEVALUE
             JOIN DSS_SUB_SUB_CATEGORY_INFO C3M
                ON FCAT.SUB_SUB_CATEGORY_CODE = C3M.CODEVALUE
             JOIN DSS_BRAND_MAPPING BRMP
                ON NVL (PM.ATTRIBUTE1, PM.BRAND_CODE) = BRMP.ITEM_BRD_CODE
             LEFT JOIN DSS_SERVICE_BRANDS VCB
                ON BRMP.ITEM_BRD_SEQ = VCB.MAPPING_ID /*Some items not mapped */
             LEFT JOIN DSS_SERVICE_WARRANTY SWC
                ON SN.WARRANTY_SEQ = SWC.WARRANTY_SEQ
       WHERE 1 = 1   
       ---AND jobid = '799634'
      ORDER BY ORDER_DATE;
   TYPE RW_NON_INF_SERIALS IS TABLE OF CR_NON_INF_SERIALS%ROWTYPE;

   CURSOR CR_UP_WARRANTY
   IS
      SELECT HD.JOBID,
             HD.ORDER_NUMBER,
             HD.ORDER_DATE,
             LN.LINEID,
             NVL(OWR.WARRANTY_SEQ , PWR.WARRANTY_SEQ) AS WARRANTY_SEQ
        FROM DSS_ORDER_SCAN_HEADER HD
             JOIN DSS_ORDER_SCAN_LINES LN ON HD.JOBID = LN.JOBID
             LEFT JOIN TK_ORGANIZATION_WARRANTY OWR ON LN.CAETGORY_ID = OWR.CATEGORY_ID AND LN.ORGANIZATION_ID = OWR.ORGANIZATION_ID
             LEFT JOIN TK_PRODUCT_WARRANTY PWR ON LN.INVENTORY_ITEM_ID = PWR.INVENTORY_ITEM_ID AND LN.ORGANIZATION_ID = PWR.ORGANIZATION_ID
       WHERE     HD.APP_SOURCE = 'DSS'
             AND HD.ORDER_TYPE != 'GRN'
             AND HD.ORDER_TYPE != 'SR'
             AND HD.ORDER_TYPE != 'IOT'
             AND NVL (LN.ORGANIZATION_ID, 0) != 1958
             AND LN.WARRANTY_YN = 'Y'
             AND NVL (LN.WARRANTY_SEQ, 0) = 0
             AND HD.ORDER_DATE > SYSDATE - 120
             AND LN.WARRANTY_CODE IS NULL
             AND (PWR.WARRANTY_SEQ IS NOT NULL OR OWR.WARRANTY_SEQ IS NOT NULL);

   TYPE RW_UP_WARRANTY IS TABLE OF CR_UP_WARRANTY%ROWTYPE;
END PKG_MASTER_WARRANTY;
/


DROP PACKAGE BODY DSS.PKG_MASTER_WARRANTY;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_MASTER_WARRANTY
AS
   PROCEDURE INS_MASTER
   AS
      TEMP_RW   RW_NON_INF_SERIALS;
   BEGIN
      IF (CR_NON_INF_SERIALS%ISOPEN)
      THEN
         CLOSE CR_NON_INF_SERIALS;
      END IF;

      OPEN CR_NON_INF_SERIALS;

      LOOP
         FETCH CR_NON_INF_SERIALS
              BULK COLLECT INTO TEMP_RW
            LIMIT 1000;

         FORALL RW IN 1 .. TEMP_RW.COUNT
            MERGE INTO DSS_WARRANTY_MASTER TRG
             USING (SELECT TEMP_RW (RW).IMEI_NUMBER AS IMEI_NUMBER
                      FROM DUAL) MTCH
                ON (MTCH.IMEI_NUMBER = TRG.IMEI_NUMBER)
            WHEN MATCHED
            THEN
               UPDATE SET MODIFY_DATE = SYSDATE,
                          PRINTING_DATE = SYSDATE,
                          ACTION_TYPE = 'U',
                          STATUS = 'C',
                          INF_YN = 'N',
                          INF_DATE = NULL,
                          BRAND_SEQ = TEMP_RW (RW).BRAND_SEQ,
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
                          ATTRIBUTE8 = TEMP_RW (RW).ORDER_DATE,
                          VBRAND_SEQ = TEMP_RW (RW).VBRAND_SEQ,
                          VBRAND_CODE = TEMP_RW (RW).VBRAND_CODE,
                          BASE_BRAND_SEQ = TEMP_RW (RW).BASE_BRAND_SEQ,
                          BASE_BRAND_CODE = TEMP_RW (RW).BASE_BRAND_CODE,
                          VBASE_BRAND_CODE = TEMP_RW (RW).VBASE_BRAND_CODE,
                          WARRANTY_YEARS = TEMP_RW (RW).WARRANTY_YEARS,
                          WARRANTY_MONTHS = TEMP_RW (RW).WARRANTY_MONTHS,
                          WARRANTY_DAYS = TEMP_RW (RW).WARRANTY_DAYS,
                          ACTION_COUNT = ACTION_COUNT + 1,
                          MODIFY_BY = TEMP_RW (RW).CREATE_BY
            WHEN NOT MATCHED
            THEN
               INSERT (IMEI_NUMBER,
                       IMEI_NUMBER2,
                       INVENTORY_ITEM_ID,
                       PRODUCT_CODE,
                       PRODUCT_BRAND,
                       PRODUCT_MODEL,
                       BRAND_SEQ,
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
                       ATTRIBUTE7,
                       VBRAND_SEQ,
                       VBRAND_CODE,
                       BASE_BRAND_SEQ,
                       BASE_BRAND_CODE,
                       VBASE_BRAND_CODE,
                       WARRANTY_YEARS,
                       WARRANTY_MONTHS,
                       WARRANTY_DAYS,
                       ACTION_COUNT,
                       CREATE_BY)
               VALUES (TEMP_RW (RW).IMEI_NUMBER,
                       TEMP_RW (RW).IMEI_NUMBER2,
                       TEMP_RW (RW).INVENTORY_ITEM_ID,
                       TEMP_RW (RW).PRODUCT_CODE,
                       TEMP_RW (RW).PRODUCT_BRAND,
                       TEMP_RW (RW).PRODUCT_MODEL,
                       TEMP_RW (RW).BRAND_SEQ,
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
                       TEMP_RW (RW).MODIFY_DATE,
                       SYSDATE,
                       'I',
                       'C',
                       'N',
                       'DSS',
                       TEMP_RW (RW).VBRAND_SEQ,
                       TEMP_RW (RW).VBRAND_CODE,
                       TEMP_RW (RW).BASE_BRAND_SEQ,
                       TEMP_RW (RW).BASE_BRAND_CODE,
                       TEMP_RW (RW).VBASE_BRAND_CODE,
                       TEMP_RW (RW).WARRANTY_YEARS,
                       TEMP_RW (RW).WARRANTY_MONTHS,
                       TEMP_RW (RW).WARRANTY_DAYS,
                       TEMP_RW (RW).WARRANTY_PERIOD,
                       TEMP_RW (RW).CREATE_BY);

         FORALL RW IN 1 .. TEMP_RW.COUNT
            UPDATE DSS_ORDER_SCAN_SERIALS
               SET INF_YN = 'Y', INF_DATE = SYSDATE
             WHERE     JOBID = TEMP_RW (RW).JOB_REF_NO
                   AND LINEID = TEMP_RW (RW).JOB_REF_LINENO
                   AND SEQINDEX = TEMP_RW (RW).JOB_REF_SEQNO;

         EXIT WHEN CR_NON_INF_SERIALS%NOTFOUND;
      END LOOP;

      CLOSE CR_NON_INF_SERIALS;

      UPDATE DSS_WARRANTY_MASTER MS
         SET (MODEL_SEQ,
              VMODEL_SEQ,
              VMODEL_CODE,
              VBASE_BRAND_SEQ,
              VBASE_MODEL_CODE) =
                (SELECT MO_MAP.MODEL_SEQ,
                        MO_MAP.VMODEL_SEQ,
                        MO_MAP.VMODEL_CODE,
                        MO_MAP.VBASE_BRAND_SEQ,
                        MO_MAP.VBASE_MODEL_CODE
                   FROM DSS_MODEL_MAPPING MO_MAP
                  WHERE MS.PRODUCT_MODEL = MO_MAP.MODEL_CODE AND ROWNUM = 1)
       WHERE MODEL_SEQ IS NULL AND INF_YN = 'N';
   END INS_MASTER;


   PROCEDURE UP_WARRANTY_SEQ
   AS
      TEMP_RW   RW_UP_WARRANTY;
   BEGIN
      IF (CR_UP_WARRANTY%ISOPEN)
      THEN
         CLOSE CR_UP_WARRANTY;
      END IF;

      OPEN CR_UP_WARRANTY;

      LOOP
         FETCH CR_UP_WARRANTY
              BULK COLLECT INTO TEMP_RW
            LIMIT 100;

         FORALL RW IN 1 .. TEMP_RW.COUNT
            UPDATE DSS_ORDER_SCAN_SERIALS
               SET WARRANTY_SEQ = TEMP_RW (RW).WARRANTY_SEQ,
                   WARRANTY_ENDATE =
                      (SELECT   ADD_MONTHS (
                                   ADD_MONTHS (TEMP_RW (RW).ORDER_DATE,
                                               (W.NO_YEARS * 12)),
                                   W.NO_MONTHS)
                              + W.NO_DAYS
                         FROM DSS_SERVICE_WARRANTY W
                        WHERE W.WARRANTY_SEQ = TEMP_RW (RW).WARRANTY_SEQ)
             WHERE     LINEID = TEMP_RW (RW).LINEID
                   AND JOBID = TEMP_RW (RW).JOBID;

         FORALL RW IN 1 .. TEMP_RW.COUNT
            UPDATE DSS_ORDER_SCAN_LINES
               SET ATTRIBUTE9 = 'Manually updated wty seq through job'
             WHERE     LINEID = TEMP_RW (RW).LINEID
                   AND JOBID = TEMP_RW (RW).JOBID;

         EXIT WHEN CR_UP_WARRANTY%NOTFOUND;
      END LOOP;

      CLOSE CR_UP_WARRANTY;
   END UP_WARRANTY_SEQ;

   --
   --   WARRANTY_ENDATE =
   --                     ADD_MONTHS (ADD_MONTHS (I.ORDER_DATE, (NO_YEARS * 12)),
   --                                 NO_MONTHS)
   --                   + NO_DAYS

   PROCEDURE START_SYNC
   AS
     ERRORMSG       VARCHAR2 (300);
   BEGIN
      UP_WARRANTY_SEQ;
      INS_MASTER;

   EXCEPTION
      WHEN OTHERS
      THEN
         ERRORMSG := SUBSTR (SQLERRM, 1, 100);
         PKG_INTERFACE.INS_INTERFACE_LOG (100,
                                          SYSDATE,
                                          0,
                                          'INS',
                                          'E',
                                          ERRORMSG);
   END;
   
      PROCEDURE START_ARCH
   AS
      TEMP_RW   RW_ARCH_SERIALS;
   BEGIN
      IF (CR_ARCH_SERIALS%ISOPEN)
      THEN
         CLOSE CR_ARCH_SERIALS;
      END IF;

      OPEN CR_ARCH_SERIALS;

      LOOP
         FETCH CR_ARCH_SERIALS BULK COLLECT INTO TEMP_RW LIMIT 1000;

         FORALL RW IN 1 .. TEMP_RW.COUNT
            INSERT INTO ARCH_WARRANTY_MASTER
                 VALUES (TEMP_RW (RW).LINEID,
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
                         TEMP_RW (RW).MODIFY_DATE,
                         TEMP_RW (RW).PRINTING_DATE,
                         TEMP_RW (RW).ACTION_TYPE,
                         TEMP_RW (RW).STATUS,
                         TEMP_RW (RW).INF_YN,
                         TEMP_RW (RW).INF_DATE,
                         TEMP_RW (RW).ATTRIBUTE1,
                         TEMP_RW (RW).ATTRIBUTE2,
                         TEMP_RW (RW).ATTRIBUTE3,
                         TEMP_RW (RW).ATTRIBUTE4,
                         TEMP_RW (RW).ATTRIBUTE5,
                         TEMP_RW (RW).ATTRIBUTE6,
                         TEMP_RW (RW).ATTRIBUTE7,
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
                         TEMP_RW (RW).ACTION_COUNT,
                         TEMP_RW (RW).CREATE_BY,
                         TEMP_RW (RW).MODIFY_BY);

--         FORALL RW IN 1 .. TEMP_RW.COUNT
--            UPDATE DSS_WARRANTY_MASTER
--               SET ATTRIBUTE3 = 'Y'
--             WHERE LINEID = TEMP_RW (RW).LINEID;

         FORALL RW IN 1 .. TEMP_RW.COUNT
            DELETE FROM  DSS_WARRANTY_MASTER
             WHERE LINEID = TEMP_RW (RW).LINEID;


         EXIT WHEN CR_ARCH_SERIALS%NOTFOUND;
      END LOOP;

      CLOSE CR_ARCH_SERIALS;
   END START_ARCH;
   
END PKG_MASTER_WARRANTY;
/
