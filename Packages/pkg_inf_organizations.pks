DROP PACKAGE DSS.PKG_INF_ORGANIZATIONS;

CREATE OR REPLACE PACKAGE DSS.PKG_INF_ORGANIZATIONS
AS
   PROCEDURE INF_START;
END PKG_INF_ORGANIZATIONS;
/


DROP PACKAGE BODY DSS.PKG_INF_ORGANIZATIONS;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_INF_ORGANIZATIONS
AS
   PROCEDURE DATA_BULK (P_LAST_UPDATE        DATE,
                        P_INTERFACE_ID       NUMBER,
                        P_ROWCOUNT       OUT NUMBER)
   AS
      ERRORMSG       VARCHAR2 (300);
      V_START_DATE   DATE;
   BEGIN
      V_START_DATE := SYSDATE;

      DELETE FROM DSS_ORGANIZATIONS;

      INSERT INTO DSS_ORGANIZATIONS (OPERATING_UNIT,
                                     ORGANIZATION_ID,
                                     ORGANIZATION_CODE,
                                     ORGANIZATION_NAME,
                                     ACTIVE,
                                                             OPTIMIZA_ENABLED , INVENTORY_ENABLED , DISABLE_DATE)
         SELECT ORG.OPERATING_UNIT,
                ORG.ORGANIZATION_ID,
                ORGANIZATION_CODE,
                ORGANIZATION_NAME,
                CASE
                   WHEN NVL (DISABLE_DATE, SYSDATE) >= SYSDATE THEN 'A'
                   ELSE 'I'
                END
                   ACTIVE,
                CASE
                   WHEN NVL (DISABLE_DATE, SYSDATE) >= SYSDATE THEN 'Y'
                   ELSE 'N'
                END
                   OPT_YN , INVENTORY_ENABLED_FLAG , DISABLE_DATE
           FROM SYN_ORGANIZATIONS ORG
          WHERE OPERATING_UNIT IS NOT NULL;



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
         IN (SELECT ORG.OPERATING_UNIT,
                    ORG.ORGANIZATION_ID,
                    ORGANIZATION_CODE,
                    ORGANIZATION_NAME,
                    CASE
                       WHEN NVL (DISABLE_DATE, SYSDATE) >= SYSDATE THEN 'A'
                       ELSE 'I'
                    END
                       ACTIVE , INVENTORY_ENABLED_FLAG ,DISABLE_DATE
               FROM SYN_ORGANIZATIONS ORG
              WHERE OPERATING_UNIT IS NOT NULL)
      LOOP
         UPDATE DSS_ORGANIZATIONS
            SET ORGANIZATION_CODE = I.ORGANIZATION_CODE,
                ORGANIZATION_NAME = I.ORGANIZATION_NAME,
                ACTIVE = I.ACTIVE ,
                INVENTORY_ENABLED= i.INVENTORY_ENABLED_FLAG ,
                DISABLE_DATE = i.DISABLE_DATE
          WHERE     OPERATING_UNIT = I.OPERATING_UNIT
                AND ORGANIZATION_ID = I.ORGANIZATION_ID;

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
       WHERE INTERFACEID = 3;

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
END PKG_INF_ORGANIZATIONS;
/
