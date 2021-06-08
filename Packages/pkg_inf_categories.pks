DROP PACKAGE DSS.PKG_INF_CATEGORIES;

CREATE OR REPLACE PACKAGE DSS.PKG_INF_CATEGORIES
AS
   PROCEDURE INF_START;
END PKG_INF_CATEGORIES;
/


DROP PACKAGE BODY DSS.PKG_INF_CATEGORIES;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_INF_CATEGORIES
AS
   PROCEDURE DATA_BULK (P_LAST_UPDATE        DATE,
                        P_INTERFACE_ID       NUMBER,
                        P_ROWCOUNT       OUT NUMBER)
   AS
      ERRORMSG       VARCHAR2 (300);
      V_START_DATE   DATE;
   BEGIN
      V_START_DATE := SYSDATE;

      DELETE FROM TK_CATEGORIES_CONFIG;

      INSERT INTO TK_CATEGORIES_CONFIG (CATEGORY_ID,
                                        BRAND,
                                        CATEGORY_CODE,
                                        SUB_CATEGORY_CODE,
                                        SUB_SUB_CATEGORY_CODE,
                                        PURCHASETYPE,
                                        CATEGORY_CONCAT_SEGS,
                                        ENABLED,
                                        LAST_UPDATE_DATE,
                                        CREATION_DATE)
         SELECT CATEGORY_ID,
                SEGMENT1,
                SEGMENT2,
                SEGMENT3,
                SEGMENT4,
                SEGMENT5,
                CATEGORY_CONCAT_SEGS,
                ENABLED_FLAG,
                LAST_UPDATE_DATE,
                CREATION_DATE
           FROM SYN_CATEGORIES
          WHERE STRUCTURE_NAME = 'Item Categories' AND SEGMENT1 != 'HNR';


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

      INSERT INTO TK_CATEGORIES_CONFIG (CATEGORY_ID,
                                        BRAND,
                                        CATEGORY_CODE,
                                        SUB_CATEGORY_CODE,
                                        SUB_SUB_CATEGORY_CODE,
                                        PURCHASETYPE,
                                        CATEGORY_CONCAT_SEGS,
                                        ENABLED,
                                        LAST_UPDATE_DATE,
                                        CREATION_DATE)
         SELECT VMS.CATEGORY_ID,
                VMS.SEGMENT1,
                VMS.SEGMENT2,
                VMS.SEGMENT3,
                VMS.SEGMENT4,
                VMS.SEGMENT5,
                VMS.CATEGORY_CONCAT_SEGS,
                VMS.ENABLED_FLAG,
                VMS.LAST_UPDATE_DATE,
                VMS.CREATION_DATE
           FROM SYN_CATEGORIES VMS
                LEFT OUTER JOIN TK_CATEGORIES_CONFIG MS
                   ON VMS.CATEGORY_ID = MS.CATEGORY_ID
          WHERE     MS.CATEGORY_ID IS NULL
                ---AND trunc(VMS.LAST_UPDATE_DATE) >= trunc(P_LAST_UPDATE)
                AND STRUCTURE_NAME = 'Item Categories';
             --   AND VMS.SEGMENT1 != 'HNR';


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
         IN (SELECT VMS.*
               FROM SYN_CATEGORIES VMS
                    LEFT OUTER JOIN TK_CATEGORIES_CONFIG MS
                       ON VMS.CATEGORY_ID = MS.CATEGORY_ID
              WHERE     MS.CATEGORY_ID IS NULL
                    AND STRUCTURE_NAME = 'Item Categories'
                    AND VMS.SEGMENT1 != 'HNR'
                    AND TRUNC (VMS.LAST_UPDATE_DATE) >= TRUNC (P_LAST_UPDATE))
      LOOP
         UPDATE TK_CATEGORIES_CONFIG
            SET BRAND = I.SEGMENT1,
                CATEGORY_CODE = I.SEGMENT2,
                SUB_CATEGORY_CODE = I.SEGMENT3,
                SUB_SUB_CATEGORY_CODE = I.SEGMENT4,
                PURCHASETYPE = I.SEGMENT5,
                CATEGORY_CONCAT_SEGS = I.CATEGORY_CONCAT_SEGS,
                ENABLED = I.ENABLED_FLAG,
                LAST_UPDATE_DATE = I.LAST_UPDATE_DATE,
                CREATION_DATE = I.CREATION_DATE
          WHERE CATEGORY_ID = I.CATEGORY_ID;

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
       WHERE INTERFACEID = 2;

      IF V_STATUS = 'A'
      THEN
         DATA_DWL (V_LAST_UPDATE, V_INTERFACEID, V_ROWCOUNT);
         PKG_INTERFACE.UP_INTERFACE_HEADER (V_INTERFACEID,
                                            SYSDATE,
                                            V_ROWCOUNT);
      END IF;
   END INF_START;
END PKG_INF_CATEGORIES;
/
