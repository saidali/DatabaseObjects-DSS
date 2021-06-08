DROP PACKAGE DSS.PKG_INF_SERVICE_BRAND;

CREATE OR REPLACE PACKAGE DSS.PKG_INF_SERVICE_BRAND
AS
   PROCEDURE INF_START;
END PKG_INF_SERVICE_BRAND;
/


DROP PACKAGE BODY DSS.PKG_INF_SERVICE_BRAND;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_INF_SERVICE_BRAND
AS
   PROCEDURE DATA_BULK (P_LAST_UPDATE        DATE,
                        P_INTERFACE_ID       NUMBER,
                        P_ROWCOUNT       OUT NUMBER)
   AS
      ERRORMSG       VARCHAR2 (300);
      V_START_DATE   DATE;
   BEGIN
      V_START_DATE := SYSDATE;

      DELETE FROM DSS_SERVICE_BRANDS;

      INSERT INTO DSS_SERVICE_BRANDS (BRAND_SEQ,
                                      BRAND_CODE,
                                      BRAND_DESC,
                                      BRAND_SHORT_DESC,
                                      ACTIVE,
                                      MAPPING_ID,
                                      CREATION_DATE,
                                      LAST_UPDATE_DATE)
         SELECT SYN.VBM_BRAND_SEQ,
                SYN.VBM_BRAND_CODE,
                SYN.VBM_BRAND_DESC,
                SYN.VBM_BRAND_SHORT_DESC,
                SYN.VBM_BRAND_ACTIVE,
                SYN.IIBD_ITEM_BRD_SEQ,
                SYN.VBM_CREATION_DATE,
                SYN.VBM_LAST_UPDATE_DATE
           FROM SYN_VCM_BRAND_MASTER SYN;



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

      INSERT INTO DSS_SERVICE_BRANDS (BRAND_SEQ,
                                      BRAND_CODE,
                                      BRAND_DESC,
                                      BRAND_SHORT_DESC,
                                      ACTIVE,
                                      MAPPING_ID,
                                      CREATION_DATE,
                                      LAST_UPDATE_DATE)
         SELECT SYN.VBM_BRAND_SEQ,
                SYN.VBM_BRAND_CODE,
                SYN.VBM_BRAND_DESC,
                SYN.VBM_BRAND_SHORT_DESC,
                SYN.VBM_BRAND_ACTIVE,
                SYN.IIBD_ITEM_BRD_SEQ,
                SYN.VBM_CREATION_DATE,
                SYN.VBM_LAST_UPDATE_DATE
           FROM    SYN_VCM_BRAND_MASTER SYN
                LEFT OUTER JOIN
                   DSS_SERVICE_BRANDS LV
                ON SYN.VBM_BRAND_SEQ = LV.BRAND_SEQ
          WHERE     LV.BRAND_SEQ IS NULL
                AND TRUNC(SYN.VBM_LAST_UPDATE_DATE) >= TRUNC(P_LAST_UPDATE);



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
         IN (SELECT SYN.VBM_BRAND_SEQ,
                    SYN.VBM_BRAND_CODE,
                    SYN.VBM_BRAND_DESC,
                    SYN.VBM_BRAND_SHORT_DESC,
                    SYN.VBM_BRAND_ACTIVE,
                    SYN.IIBD_ITEM_BRD_SEQ,
                    SYN.VBM_CREATION_DATE,
                    SYN.VBM_LAST_UPDATE_DATE
               FROM    SYN_VCM_BRAND_MASTER SYN
                    LEFT OUTER JOIN
                       DSS_SERVICE_BRANDS LV
                    ON SYN.VBM_BRAND_SEQ = LV.BRAND_SEQ
              WHERE     LV.BRAND_SEQ IS NOT NULL
                    AND TRUNC(SYN.VBM_LAST_UPDATE_DATE) >= TRUNC(P_LAST_UPDATE))
      LOOP
         UPDATE DSS_SERVICE_BRANDS
            SET BRAND_CODE = I.VBM_BRAND_CODE,
                BRAND_DESC = I.VBM_BRAND_DESC,
                BRAND_SHORT_DESC = I.VBM_BRAND_SHORT_DESC,
                ACTIVE = I.VBM_BRAND_ACTIVE,
                MAPPING_ID = I.IIBD_ITEM_BRD_SEQ,
                CREATION_DATE = I.VBM_CREATION_DATE,
                LAST_UPDATE_DATE = I.VBM_LAST_UPDATE_DATE
          WHERE BRAND_SEQ = I.VBM_BRAND_SEQ;

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
       WHERE INTERFACEID = 9;

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
END PKG_INF_SERVICE_BRAND;
/
