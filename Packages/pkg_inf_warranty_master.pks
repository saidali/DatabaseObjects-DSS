DROP PACKAGE DSS.PKG_INF_WARRANTY_MASTER;

CREATE OR REPLACE PACKAGE DSS.PKG_INF_WARRANTY_MASTER
AS
   PROCEDURE INF_START;

END PKG_INF_WARRANTY_MASTER;
/


DROP PACKAGE BODY DSS.PKG_INF_WARRANTY_MASTER;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_INF_WARRANTY_MASTER
AS
   PROCEDURE DATA_BULK (P_LAST_UPDATE        DATE,
                        P_INTERFACE_ID       NUMBER,
                        P_ROWCOUNT       OUT NUMBER)
   AS
      ERRORMSG       VARCHAR2 (300);
      V_START_DATE   DATE;
   BEGIN
      V_START_DATE := SYSDATE;

      DELETE FROM DSS_SERVICE_WARRANTY;

      INSERT INTO DSS_SERVICE_WARRANTY (WARRANTY_SEQ,
                                        BRAND_SEQ,
                                        WARRANTY_CODE,
                                        WARRANTY_DESC,
                                        WARRANTY_SHORT_DESC,
                                        WARRANTY_CATG_FLAG,
                                        WARRANTY_ACTIVE,
                                        WARRANTY_TYPE,
                                        NO_YEARS,
                                        NO_MONTHS,
                                        NO_DAYS,
                                        REF_WARRANTY_CODE,
                                        OFFLINE_ENABLED,
                                        WMS_ENABLED,
                                        CREATION_DATE,
                                        LAST_UPDATE_DATE)
         SELECT SYN.VWM_WARRANTY_SEQ,
                SYN.VBM_BRAND_SEQ,
                SYN.VWM_WARRANTY_CODE,
                SYN.VWM_WARRANTY_DESC,
                SYN.VWM_WARRANTY_SHORT_DESC,
                SYN.VWM_WARRANTY_CATG_FLAG,
                SYN.VWM_WARRANTY_ACTIVE,
                SYN.VWM_WARRANTY_TYPE,
                SYN.VWM_WARR_NO_YEARS,
                SYN.VWM_WARR_NO_MONTHS,
                SYN.VWM_WARR_NO_DAYS,
                SYN.VWM_REF_WARRANTY_CODE,
                NVL (SYN.ATTRIBUTE8, 'N'),
                NVL (SYN.ATTRIBUTE9, 'N'),
                SYN.VWM_CREATION_DATE,
                SYN.VWM_LAST_UPDATE_DATE
           FROM SYN_WARRANTY_MASTER SYN;



      P_ROWCOUNT := SQL%ROWCOUNT;
      PKG_INTERFACE.INS_INTERFACE_LOG2 (P_INTERFACE_ID,
                                        SYSDATE,
                                        P_ROWCOUNT,
                                        'INS',
                                        'C',
                                        NULL,
                                        V_START_DATE);
   EXCEPTION
      WHEN OTHERS
      THEN
         ERRORMSG := SUBSTR (SQLERRM, 1, 100);
         PKG_INTERFACE.INS_INTERFACE_LOG (P_INTERFACE_ID,
                                          SYSDATE,
                                          0,
                                          'INS',
                                          'E',
                                          ERRORMSG);
   END DATA_BULK;


   PROCEDURE DATA_INSERT (P_LAST_UPDATE        DATE,
                          P_INTERFACE_ID       NUMBER,
                          P_ROWCOUNT       OUT NUMBER)
   AS
      ERRORMSG       VARCHAR2 (300);
      V_START_DATE   DATE;
   BEGIN
      V_START_DATE := SYSDATE;

      INSERT INTO DSS_SERVICE_WARRANTY (WARRANTY_SEQ,
                                        BRAND_SEQ,
                                        WARRANTY_CODE,
                                        WARRANTY_DESC,
                                        WARRANTY_SHORT_DESC,
                                        WARRANTY_CATG_FLAG,
                                        WARRANTY_ACTIVE,
                                        WARRANTY_TYPE,
                                        NO_YEARS,
                                        NO_MONTHS,
                                        NO_DAYS,
                                        REF_WARRANTY_CODE,
                                        OFFLINE_ENABLED,
                                        WMS_ENABLED,
                                        CREATION_DATE,
                                        LAST_UPDATE_DATE)
         SELECT SYN.VWM_WARRANTY_SEQ,
                SYN.VBM_BRAND_SEQ,
                SYN.VWM_WARRANTY_CODE,
                SYN.VWM_WARRANTY_DESC,
                SYN.VWM_WARRANTY_SHORT_DESC,
                SYN.VWM_WARRANTY_CATG_FLAG,
                SYN.VWM_WARRANTY_ACTIVE,
                SYN.VWM_WARRANTY_TYPE,
                SYN.VWM_WARR_NO_YEARS,
                SYN.VWM_WARR_NO_MONTHS,
                SYN.VWM_WARR_NO_DAYS,
                SYN.VWM_REF_WARRANTY_CODE,
                NVL (SYN.ATTRIBUTE8, 'N'),
                NVL (SYN.ATTRIBUTE9, 'N'),
                SYN.VWM_CREATION_DATE,
                SYN.VWM_LAST_UPDATE_DATE
           FROM SYN_WARRANTY_MASTER SYN
                LEFT OUTER JOIN DSS_SERVICE_WARRANTY LV
                   ON SYN.VWM_WARRANTY_SEQ = LV.WARRANTY_SEQ
          WHERE     LV.WARRANTY_SEQ IS NULL
                AND trunc(SYN.VWM_LAST_UPDATE_DATE) >= trunc(P_LAST_UPDATE);



      P_ROWCOUNT := SQL%ROWCOUNT;
      PKG_INTERFACE.INS_INTERFACE_LOG2 (P_INTERFACE_ID,
                                        SYSDATE,
                                        P_ROWCOUNT,
                                        'INS',
                                        'C',
                                        NULL,
                                        V_START_DATE);
   EXCEPTION
      WHEN OTHERS
      THEN
         ERRORMSG := SUBSTR (SQLERRM, 1, 100);
         PKG_INTERFACE.INS_INTERFACE_LOG (P_INTERFACE_ID,
                                          SYSDATE,
                                          0,
                                          'INS',
                                          'E',
                                          ERRORMSG);
   END DATA_INSERT;

   PROCEDURE DATA_UPDATE (P_LAST_UPDATE        DATE,
                          P_INTERFACE_ID       NUMBER,
                          P_ROWCOUNT       OUT NUMBER)
   AS
      ERRORMSG       VARCHAR2 (300);
      V_START_DATE   DATE;
   BEGIN
      V_START_DATE := SYSDATE;
      P_ROWCOUNT := 0;

      FOR I
         IN (SELECT SYN.VWM_WARRANTY_SEQ,
                    SYN.VBM_BRAND_SEQ,
                    SYN.VWM_WARRANTY_CODE,
                    SYN.VWM_WARRANTY_DESC,
                    SYN.VWM_WARRANTY_SHORT_DESC,
                    SYN.VWM_WARRANTY_CATG_FLAG,
                    SYN.VWM_WARRANTY_ACTIVE,
                    SYN.VWM_WARRANTY_TYPE,
                    SYN.VWM_WARR_NO_YEARS,
                    SYN.VWM_WARR_NO_MONTHS,
                    SYN.VWM_WARR_NO_DAYS,
                    SYN.VWM_REF_WARRANTY_CODE,
                    NVL (SYN.ATTRIBUTE8, 'N') OFFLLINE_ENABLED,
                    NVL (SYN.ATTRIBUTE9, 'N') WMS_ENABLED,
                    SYN.VWM_CREATION_DATE,
                    SYN.VWM_LAST_UPDATE_DATE
               FROM SYN_WARRANTY_MASTER SYN
                    LEFT OUTER JOIN DSS_SERVICE_WARRANTY LV
                       ON SYN.VWM_WARRANTY_SEQ = LV.WARRANTY_SEQ
              WHERE     LV.WARRANTY_SEQ IS NOT NULL
                    AND trunc(SYN.VWM_LAST_UPDATE_DATE) >= trunc(P_LAST_UPDATE))
      LOOP
         UPDATE DSS_SERVICE_WARRANTY
            SET BRAND_SEQ = I.VBM_BRAND_SEQ,
                WARRANTY_CODE = I.VWM_WARRANTY_CODE,
                WARRANTY_DESC = I.VWM_WARRANTY_DESC,
                WARRANTY_SHORT_DESC = I.VWM_WARRANTY_SHORT_DESC,
                WARRANTY_CATG_FLAG = I.VWM_WARRANTY_CATG_FLAG,
                WARRANTY_ACTIVE = I.VWM_WARRANTY_ACTIVE,
                WARRANTY_TYPE = I.VWM_WARRANTY_TYPE,
                NO_YEARS = I.VWM_WARR_NO_YEARS,
                NO_MONTHS = I.VWM_WARR_NO_MONTHS,
                NO_DAYS = I.VWM_WARR_NO_DAYS,
                REF_WARRANTY_CODE = I.VWM_REF_WARRANTY_CODE,
                OFFLINE_ENABLED = I.OFFLLINE_ENABLED,
                WMS_ENABLED = I.WMS_ENABLED,
                CREATION_DATE = I.VWM_CREATION_DATE,
                LAST_UPDATE_DATE = I.VWM_LAST_UPDATE_DATE
          WHERE WARRANTY_SEQ = I.VWM_WARRANTY_SEQ;

         P_ROWCOUNT := P_ROWCOUNT + 1;
      END LOOP;

      PKG_INTERFACE.INS_INTERFACE_LOG2 (P_INTERFACE_ID,
                                        SYSDATE,
                                        P_ROWCOUNT,
                                        'INS',
                                        'C',
                                        NULL,
                                        V_START_DATE);
   EXCEPTION
      WHEN OTHERS
      THEN
         ERRORMSG := SUBSTR (SQLERRM, 1, 100);
         PKG_INTERFACE.INS_INTERFACE_LOG (P_INTERFACE_ID,
                                          SYSDATE,
                                          0,
                                          'INS',
                                          'E',
                                          ERRORMSG);
   END DATA_UPDATE;


   PROCEDURE DATA_DWL (P_LAST_UPDATE        DATE,
                       P_INTERFACE_ID       NUMBER,
                       P_ROWCOUNT       OUT NUMBER)
   AS
      ERRORMSG       VARCHAR2 (300);
      V_START_DATE   DATE;
      TEMP_COUNT     NUMBER;
   BEGIN
      V_START_DATE := SYSDATE;

      DATA_UPDATE (P_LAST_UPDATE, P_INTERFACE_ID, TEMP_COUNT);
      P_ROWCOUNT := TEMP_COUNT;
      DATA_INSERT (P_LAST_UPDATE, P_INTERFACE_ID, TEMP_COUNT);
      P_ROWCOUNT := P_ROWCOUNT + TEMP_COUNT;


      PKG_INTERFACE.INS_INTERFACE_LOG2 (P_INTERFACE_ID,
                                        SYSDATE,
                                        P_ROWCOUNT,
                                        'INS',
                                        'C',
                                        NULL,
                                        V_START_DATE);
   EXCEPTION
      WHEN OTHERS
      THEN
         ERRORMSG := SUBSTR (SQLERRM, 1, 100);
         PKG_INTERFACE.INS_INTERFACE_LOG (P_INTERFACE_ID,
                                          SYSDATE,
                                          0,
                                          'INS',
                                          'E',
                                          ERRORMSG);
   END DATA_DWL;

   PROCEDURE INF_START
   AS
      ERRORMSG        VARCHAR2 (300);
      V_LAST_UPDATE   DATE;
      V_STATUS        CHAR (1);
      V_INTERFACEID   NUMBER;
      V_ROWCOUNT      NUMBER;
   BEGIN
      SELECT LAST_RUN_DATE, STATUS, INTERFACEID
        INTO V_LAST_UPDATE, V_STATUS, V_INTERFACEID
        FROM DSS_INTERFACE_PROCESS
       WHERE INTERFACEID = 19;

      IF V_STATUS = 'A'
      THEN
         IF V_LAST_UPDATE IS NOT NULL
         THEN
            DATA_DWL (V_LAST_UPDATE, V_INTERFACEID, V_ROWCOUNT);
         ELSE
            DATA_BULK (V_LAST_UPDATE, V_INTERFACEID, V_ROWCOUNT);
         END IF;

         PKG_INTERFACE.UP_INTERFACE_HEADER (V_INTERFACEID,
                                            SYSDATE,
                                            V_ROWCOUNT);
      END IF;
   END INF_START;


 
END PKG_INF_WARRANTY_MASTER;
/
