DROP PACKAGE DSS.PKG_VCARE_WARRANTY;

CREATE OR REPLACE PACKAGE DSS.PKG_VCARE_WARRANTY
AS
   CURSOR CR_WARRANTY_SERIALS 
   IS
      SELECT LINEID,
             IMEI_NUMBER,
             IMEI_NUMBER2,
             PRODUCT_CODE,
             PRODUCT_BRAND,
             PRODUCT_MODEL,
             VBRAND_CODE SERVICE_BRAND,
             VMODEL_CODE SERVICE_MODEL,
             WARRANTY_CODE,
             WARRANTY_END_DATE,
               (NVL (WARRANTY_YEARS, 0) * 12)
             + (NVL (WARRANTY_MONTHS, 0))
             + (NVL (WARRANTY_DAYS, 0) / 30)
                WARRANTY_PERIOD,
             JOB_REF_NO,
             JOB_REF_LINENO,
             CASE ORDER_TYPE
                WHEN 'MO'
                THEN
                   'MOVEORDER'
                WHEN 'SO'
                THEN
                   'SALESORDER'
                ELSE
                   ORDER_TYPE
             END
                ORDER_TYPE,
             ORDER_NUMBER,
             NVL (ATTRIBUTE8, ORDER_DATE) ORDER_DATE, ---ATTRIBUTE 8 AS ORDERDATE IF IT IS UPDATED
             JOB_REF_SEQNO ORDER_LINE_NO,
             OPERATION_UNIT OPERATION_ID,
             COUNTRY_CODE COUNTRY_ID,
             ORGANIZATIONID,
             CREATE_DATE,
             MODIFY_DATE,
             PRINTING_DATE,
             ACTION_COUNT PRINTING_COUNT,
             STATUS,
             INF_YN,
             ATTRIBUTE1 ATT1,
             ATTRIBUTE2 ATT2,
             ATTRIBUTE3 ATT3,
             ATTRIBUTE4 ATT4,
             ATTRIBUTE5 ATT5,
             CREATE_BY ATT6,
             IMEI_NUMBER3,
             IMEI_NUMBER4,
             VBRAND_SEQ VBM_BRAND_SEQ,
             VBASE_BRAND_SEQ VBM_BASE_BRAND_SEQ,
             VMODEL_SEQ VMM_MODEL_SEQ,
             WARRANTY_SEQ VWM_WARRANTY_SEQ,
             WARRANTY_YEARS VWM_WARR_NO_YEARS,
             WARRANTY_MONTHS VWM_WARR_NO_MONTHS,
             WARRANTY_DAYS VWM_WARR_NO_DAYS
        FROM DSS_WARRANTY_MASTER
       WHERE    1=1 
             --OPERATION_UNIT = P_OPERATING_UNIT
             AND NVL (ORGANIZATIONID, 0) != '1958'
             AND INF_YN = 'N'
             --and VMODEL_SEQ > 0 
             and (WARRANTY_SEQ is not null
and VBRAND_CODE is not null and VMODEL_CODE is not null )
             ;

   TYPE RW_WARRANTY_SERIALS IS TABLE OF CR_WARRANTY_SERIALS%ROWTYPE;
   PROCEDURE START_SYNC  ; 
END PKG_VCARE_WARRANTY;
/


DROP PACKAGE BODY DSS.PKG_VCARE_WARRANTY;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_VCARE_WARRANTY
AS
   PROCEDURE START_SYNC  
   AS
      TEMP_RW   RW_WARRANTY_SERIALS;
   BEGIN
      IF (CR_WARRANTY_SERIALS%ISOPEN)
      THEN
         CLOSE CR_WARRANTY_SERIALS;
      END IF;

      OPEN CR_WARRANTY_SERIALS  ;

      LOOP
         FETCH CR_WARRANTY_SERIALS
              BULK COLLECT INTO TEMP_RW
            LIMIT 100;

         FOR RW IN 1 .. TEMP_RW.COUNT
         LOOP
            INSERT INTO WT_IMEI_WARRANTY_MASTER@VCARE (LINEID,
                                                       IMEI_NUMBER,
                                                       IMEI_NUMBER2,
                                                       PRODUCT_CODE,
                                                       PRODUCT_BRAND,
                                                       PRODUCT_MODEL,
                                                       SERVICE_BRAND,
                                                       SERVICE_MODEL,
                                                       WARRANTY_CODE,
                                                       WARRANTY_END_DATE,
                                                       WARRANTY_PERIOD,
                                                       JOB_REF_NO,
                                                       JOB_REF_LINENO,
                                                       ORDER_TYPE,
                                                       ORDER_NUMBER,
                                                       ORDER_DATE,
                                                       ORDER_LINE_NO,
                                                       OPERATION_ID,
                                                       COUNTRY_ID,
                                                       ORGANIZATIONID,
                                                       CREATE_DATE,
                                                       MODIFY_DATE,
                                                       PRINTING_DATE,
                                                       PRINTING_COUNT,
                                                       STATUS,
                                                       INF_YN,
                                                       ATT1,
                                                       ATT2,
                                                       ATT3,
                                                       ATT4,
                                                       ATT5,
                                                       ATT6,
                                                       IMEI_NUMBER3,
                                                       IMEI_NUMBER4,
                                                       VBM_BRAND_SEQ,
                                                       VBM_BASE_BRAND_SEQ,
                                                       VMM_MODEL_SEQ,
                                                       VWM_WARRANTY_SEQ,
                                                       VWM_WARR_NO_YEARS,
                                                       VWM_WARR_NO_MONTHS,
                                                       VWM_WARR_NO_DAYS)
            VALUES (TEMP_RW (RW).LINEID,
                    TEMP_RW (RW).IMEI_NUMBER,
                    TEMP_RW (RW).IMEI_NUMBER2,
                    TEMP_RW (RW).PRODUCT_CODE,
                    TEMP_RW (RW).PRODUCT_BRAND,
                    TEMP_RW (RW).PRODUCT_MODEL,
                    TEMP_RW (RW).SERVICE_BRAND,
                    TEMP_RW (RW).SERVICE_MODEL,
                    TEMP_RW (RW).WARRANTY_CODE,
                    TEMP_RW (RW).WARRANTY_END_DATE,
                    TEMP_RW (RW).WARRANTY_PERIOD,
                    TEMP_RW (RW).JOB_REF_NO,
                    TEMP_RW (RW).JOB_REF_LINENO,
                    TEMP_RW (RW).ORDER_TYPE,
                    TEMP_RW (RW).ORDER_NUMBER,
                    TEMP_RW (RW).ORDER_DATE,
                    TEMP_RW (RW).ORDER_LINE_NO,
                    TEMP_RW (RW).OPERATION_ID,
                    TEMP_RW (RW).COUNTRY_ID,
                    TEMP_RW (RW).ORGANIZATIONID,
                    TEMP_RW (RW).CREATE_DATE,
                    TEMP_RW (RW).MODIFY_DATE,
                    TEMP_RW (RW).PRINTING_DATE,
                    TEMP_RW (RW).PRINTING_COUNT,
                    TEMP_RW (RW).STATUS,
                    TEMP_RW (RW).INF_YN,
                    TEMP_RW (RW).ATT1,
                    TEMP_RW (RW).ATT2,
                    TEMP_RW (RW).ATT3,
                    TEMP_RW (RW).ATT4,
                    TEMP_RW (RW).ATT5,
                    TEMP_RW (RW).ATT6,
                    TEMP_RW (RW).IMEI_NUMBER3,
                    TEMP_RW (RW).IMEI_NUMBER4,
                    TEMP_RW (RW).VBM_BRAND_SEQ,
                    TEMP_RW (RW).VBM_BASE_BRAND_SEQ,
                    TEMP_RW (RW).VMM_MODEL_SEQ,
                    TEMP_RW (RW).VWM_WARRANTY_SEQ,
                    TEMP_RW (RW).VWM_WARR_NO_YEARS,
                    TEMP_RW (RW).VWM_WARR_NO_MONTHS,
                    TEMP_RW (RW).VWM_WARR_NO_DAYS);

            UPDATE DSS_WARRANTY_MASTER
               SET INF_YN = 'Y', INF_DATE = SYSDATE
             WHERE LINEID = TEMP_RW (RW).LINEID;
         END LOOP;

         EXIT WHEN CR_WARRANTY_SERIALS%NOTFOUND;
      END LOOP;

      CLOSE CR_WARRANTY_SERIALS;
   END START_SYNC;
END PKG_VCARE_WARRANTY;
/
