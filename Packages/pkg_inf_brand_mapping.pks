DROP PACKAGE DSS.PKG_INF_BRAND_MAPPING;

CREATE OR REPLACE PACKAGE DSS.PKG_INF_BRAND_MAPPING
AS
   PROCEDURE INF_START;
END PKG_INF_BRAND_MAPPING;
/


DROP PACKAGE BODY DSS.PKG_INF_BRAND_MAPPING;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_INF_BRAND_MAPPING
AS
   PROCEDURE DATA_BULK (P_LAST_UPDATE        DATE,
                        P_INTERFACE_ID       NUMBER,
                        P_ROWCOUNT       OUT NUMBER)
   AS
      ERRORMSG       VARCHAR2 (300);
      V_START_DATE   DATE;
   BEGIN
      V_START_DATE := SYSDATE;

      DELETE FROM DSS_BRAND_MAPPING;

      INSERT INTO DSS_BRAND_MAPPING (ITEM_BRD_SEQ,
                                     ITEM_BRD_CODE,
                                     ITEM_BRD_NAME,
                                     ITEM_BRD_DESC,
                                     ITEM_SHRT_DESC,
                                     ITEM_BRD_ACTIVE,
                                     CREATION_DATE,
                                     LAST_UPDATE_DATE)
         SELECT SYN.IIBD_ITEM_BRD_SEQ,
                SYN.IIBD_ITEM_BRD_CODE,
                SYN.IIBD_ITEM_BRD_NAME,
                SYN.IIBD_ITEM_BRD_DESC,
                SYN.IIBD_ITEM_SHRT_DESC,
                SYN.IIBD_ITEM_BRD_ACTIVE,
                SYN.IIBD_CREATION_DATE,
                SYN.IIBD_LAST_UPDATE_DATE
           FROM SYN_INT_ITEM_BRAND SYN;



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

      INSERT INTO DSS_BRAND_MAPPING (ITEM_BRD_SEQ,
                                     ITEM_BRD_CODE,
                                     ITEM_BRD_NAME,
                                     ITEM_BRD_DESC,
                                     ITEM_SHRT_DESC,
                                     ITEM_BRD_ACTIVE,
                                     CREATION_DATE,
                                     LAST_UPDATE_DATE)
         SELECT SYN.IIBD_ITEM_BRD_SEQ,
                SYN.IIBD_ITEM_BRD_CODE,
                SYN.IIBD_ITEM_BRD_NAME,
                SYN.IIBD_ITEM_BRD_DESC,
                SYN.IIBD_ITEM_SHRT_DESC,
                SYN.IIBD_ITEM_BRD_ACTIVE,
                SYN.IIBD_CREATION_DATE,
                SYN.IIBD_LAST_UPDATE_DATE
           FROM    SYN_INT_ITEM_BRAND SYN
                LEFT OUTER JOIN
                   DSS_BRAND_MAPPING LV
                ON SYN.IIBD_ITEM_BRD_SEQ = LV.ITEM_BRD_SEQ
          WHERE     LV.ITEM_BRD_SEQ IS NULL
                AND trunc(SYN.IIBD_LAST_UPDATE_DATE) >= trunc(P_LAST_UPDATE);



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
         IN (SELECT SYN.IIBD_ITEM_BRD_SEQ,
                    SYN.IIBD_ITEM_BRD_CODE,
                    SYN.IIBD_ITEM_BRD_NAME,
                    SYN.IIBD_ITEM_BRD_DESC,
                    SYN.IIBD_ITEM_SHRT_DESC,
                    SYN.IIBD_ITEM_BRD_ACTIVE,
                    SYN.IIBD_CREATION_DATE,
                    SYN.IIBD_LAST_UPDATE_DATE
               FROM    SYN_INT_ITEM_BRAND SYN
                    LEFT OUTER JOIN
                       DSS_BRAND_MAPPING LV
                    ON SYN.IIBD_ITEM_BRD_SEQ = LV.ITEM_BRD_SEQ
              WHERE     LV.ITEM_BRD_SEQ IS NOT NULL
                    AND trunc(SYN.IIBD_LAST_UPDATE_DATE) >= trunc(P_LAST_UPDATE))
      LOOP
         UPDATE DSS_BRAND_MAPPING
            SET ITEM_BRD_CODE = I.IIBD_ITEM_BRD_CODE,
                ITEM_BRD_NAME = I.IIBD_ITEM_BRD_NAME,
                ITEM_BRD_DESC = I.IIBD_ITEM_BRD_DESC,
                ITEM_SHRT_DESC = I.IIBD_ITEM_SHRT_DESC,
                ITEM_BRD_ACTIVE = I.IIBD_ITEM_BRD_ACTIVE,
                CREATION_DATE = I.IIBD_CREATION_DATE,
                LAST_UPDATE_DATE = I.IIBD_LAST_UPDATE_DATE
          WHERE ITEM_BRD_SEQ = I.IIBD_ITEM_BRD_SEQ;

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
       WHERE INTERFACEID = 10;

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
END PKG_INF_BRAND_MAPPING;
/
