DROP PACKAGE DSS.PKG_INF_MODEL_INFO;

CREATE OR REPLACE PACKAGE DSS.PKG_INF_MODEL_INFO
AS
   PROCEDURE INF_START;
END PKG_INF_MODEL_INFO;
/


DROP PACKAGE BODY DSS.PKG_INF_MODEL_INFO;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_INF_MODEL_INFO
AS
   PROCEDURE DATA_BULK (P_LAST_UPDATE        DATE,
                        P_INTERFACE_ID       NUMBER,
                        P_ROWCOUNT       OUT NUMBER)
   AS
      ERRORMSG       VARCHAR2 (300);
      V_START_DATE   DATE;
   BEGIN
      V_START_DATE := SYSDATE;

      DELETE FROM DSS_MODEL_INFO;

      INSERT INTO DSS_MODEL_INFO (SETID,
                                  CODEID,
                                  CODEVALUE,
                                  SHOTCODE,
                                  CODE_DESCRIPTION,
                                  CREATE_DATE,
                                  LAST_UPDATE_DATE,
                                  ENABLED)
         SELECT FLEX_VALUE_SET_ID,
                FLEX_VALUE_ID,
                FLEX_VALUE_MEANING,
                NULL,
                DESCRIPTION,
                CREATION_DATE,
                LAST_UPDATE_DATE,
                ENABLED_FLAG
           FROM SYN_FLEX_VALUES
          WHERE FLEX_VALUE_SET_ID = '1009634';



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

      INSERT INTO DSS_MODEL_INFO (SETID,
                                  CODEID,
                                  CODEVALUE,
                                  SHOTCODE,
                                  CODE_DESCRIPTION,
                                  CREATE_DATE,
                                  LAST_UPDATE_DATE,
                                  ENABLED)
         SELECT VMS.FLEX_VALUE_SET_ID,
                VMS.FLEX_VALUE_ID,
                VMS.FLEX_VALUE_MEANING,
                NULL,
                VMS.DESCRIPTION,
                VMS.CREATION_DATE,
                VMS.LAST_UPDATE_DATE,
                VMS.ENABLED_FLAG
           FROM    SYN_FLEX_VALUES VMS
                LEFT OUTER JOIN
                   DSS_MODEL_INFO MS
                ON     VMS.FLEX_VALUE_SET_ID = MS.SETID
                   AND VMS.FLEX_VALUE_ID = MS.CODEID
          WHERE     FLEX_VALUE_SET_ID = '1009634'
                AND MS.CODEID IS NULL
                AND trunc(VMS.LAST_UPDATE_DATE) >= trunc(P_LAST_UPDATE);


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
         IN (SELECT VMS.FLEX_VALUE_SET_ID,
                    VMS.FLEX_VALUE_ID,
                    VMS.FLEX_VALUE_MEANING,
                    VMS.DESCRIPTION,
                    VMS.CREATION_DATE,
                    VMS.LAST_UPDATE_DATE,
                    VMS.ENABLED_FLAG
               FROM    SYN_FLEX_VALUES VMS
                    LEFT OUTER JOIN
                       DSS_MODEL_INFO MS
                    ON     VMS.FLEX_VALUE_SET_ID = MS.SETID
                       AND VMS.FLEX_VALUE_ID = MS.CODEID
              WHERE     FLEX_VALUE_SET_ID = '1009634'
                    AND MS.CODEID IS NOT NULL
                    AND trunc(VMS.LAST_UPDATE_DATE) >= trunc(P_LAST_UPDATE))
      LOOP
         UPDATE DSS_MODEL_INFO
            SET CODEVALUE = I.FLEX_VALUE_MEANING,
                CODE_DESCRIPTION = I.DESCRIPTION,
                LAST_UPDATE_DATE = I.LAST_UPDATE_DATE,
                ENABLED = I.ENABLED_FLAG
          WHERE SETID = I.FLEX_VALUE_SET_ID AND CODEID = I.FLEX_VALUE_ID;

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
       WHERE INTERFACEID = 5;

      IF V_STATUS = 'A'
      THEN
         DATA_DWL (V_LAST_UPDATE, V_INTERFACEID, V_ROWCOUNT);
         PKG_INTERFACE.UP_INTERFACE_HEADER (V_INTERFACEID,
                                            SYSDATE,
                                            V_ROWCOUNT);
      END IF;
   END INF_START;
END PKG_INF_MODEL_INFO;
/
