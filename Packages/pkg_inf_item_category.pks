DROP PACKAGE DSS.PKG_INF_ITEM_CATEGORY;

CREATE OR REPLACE PACKAGE DSS.PKG_INF_ITEM_CATEGORY
AS
   PROCEDURE INF_START;
END PKG_INF_ITEM_CATEGORY;
/


DROP PACKAGE BODY DSS.PKG_INF_ITEM_CATEGORY;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_INF_ITEM_CATEGORY
AS
   PROCEDURE DATA_BULK (P_LAST_UPDATE        DATE,
                        P_INTERFACE_ID       NUMBER,
                        P_ROWCOUNT       OUT NUMBER)
   AS
      ERRORMSG       VARCHAR2 (300);
      V_START_DATE   DATE;
   BEGIN
      V_START_DATE := SYSDATE;

      DELETE FROM DSS_ITEM_CATEGORIES;

      INSERT INTO DSS_ITEM_CATEGORIES (CATEGORY_ID,
                                       ORGANIZATION_ID,
                                       INVENTORY_ITEM_ID,
                                       CATEGORY_SET_NAME,
                                       CATEGORY_CONCAT_SEGS,
                                       BRAND_CODE,
                                       CATEGORY_CODE,
                                       SUB_CATEGORY_CODE,
                                       SUB_SUB_CATEGORY_CODE,
                                       PURCHASETYPE,
                                       ENABLED,
                                       LAST_UPDATE_DATE,
                                       CREATION_DATE)
         SELECT SYN.CATEGORY_ID,
                SYN.ORGANIZATION_ID,
                SYN.INVENTORY_ITEM_ID,
                SYN.CATEGORY_SET_NAME,
                SYN.CATEGORY_CONCAT_SEGS,
                SYN.SEGMENT1,
                SYN.SEGMENT2,
                SYN.SEGMENT3,
                SYN.SEGMENT4,
                SYN.SEGMENT5,
                SYN.ENABLED_FLAG,
                SYN.LAST_UPDATE_DATE,
                SYN.CREATION_DATE
           FROM SYN_ITEM_CATEGORIES SYN where CATEGORY_SET_NAME = 'Inventory';



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

      INSERT INTO DSS_ITEM_CATEGORIES (CATEGORY_ID,
                                       ORGANIZATION_ID,
                                       INVENTORY_ITEM_ID,
                                       CATEGORY_SET_NAME,
                                       CATEGORY_CONCAT_SEGS,
                                       BRAND_CODE,
                                       CATEGORY_CODE,
                                       SUB_CATEGORY_CODE,
                                       SUB_SUB_CATEGORY_CODE,
                                       PURCHASETYPE,
                                       ENABLED,
                                       LAST_UPDATE_DATE,
                                       CREATION_DATE)
         SELECT SYN.CATEGORY_ID,
                SYN.ORGANIZATION_ID,
                SYN.INVENTORY_ITEM_ID,
                SYN.CATEGORY_SET_NAME,
                SYN.CATEGORY_CONCAT_SEGS,
                SYN.SEGMENT1,
                SYN.SEGMENT2,
                SYN.SEGMENT3,
                SYN.SEGMENT4,
                SYN.SEGMENT5,
                SYN.ENABLED_FLAG,
                SYN.LAST_UPDATE_DATE,
                SYN.CREATION_DATE
           FROM    SYN_ITEM_CATEGORIES SYN
                LEFT OUTER JOIN
                   DSS_ITEM_CATEGORIES LV
                ON     SYN.CATEGORY_ID = LV.CATEGORY_ID
                   AND SYN.ORGANIZATION_ID = LV.ORGANIZATION_ID
                   AND SYN.INVENTORY_ITEM_ID = LV.INVENTORY_ITEM_ID
          WHERE     LV.CATEGORY_ID IS NULL and SYN.CATEGORY_SET_NAME = 'Inventory'
                AND trunc(SYN.LAST_UPDATE_DATE) >= trunc(P_LAST_UPDATE);



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
         IN (SELECT SYN.CATEGORY_ID,
                    SYN.ORGANIZATION_ID,
                    SYN.INVENTORY_ITEM_ID,
                    SYN.CATEGORY_SET_NAME,
                    SYN.CATEGORY_CONCAT_SEGS,
                    SYN.SEGMENT1,
                    SYN.SEGMENT2,
                    SYN.SEGMENT3,
                    SYN.SEGMENT4,
                    SYN.SEGMENT5,
                    SYN.ENABLED_FLAG,
                    SYN.LAST_UPDATE_DATE,
                    SYN.CREATION_DATE
               FROM    SYN_ITEM_CATEGORIES SYN
                    LEFT OUTER JOIN
                       DSS_ITEM_CATEGORIES LV
                    ON     SYN.CATEGORY_ID = LV.CATEGORY_ID
                       AND SYN.ORGANIZATION_ID = LV.ORGANIZATION_ID
                       AND SYN.INVENTORY_ITEM_ID = LV.INVENTORY_ITEM_ID
              WHERE     LV.CATEGORY_ID IS NOT NULL and SYN.CATEGORY_SET_NAME = 'Inventory'
                    AND trunc(SYN.LAST_UPDATE_DATE) >= trunc(P_LAST_UPDATE))
                    --AND trunc(SYN.LAST_UPDATE_DATE) >= TO_DATE('01/01/2016','DD/MM/YYYY'))
      LOOP
         UPDATE DSS_ITEM_CATEGORIES
            SET CATEGORY_SET_NAME = I.CATEGORY_SET_NAME,
                CATEGORY_CONCAT_SEGS = I.CATEGORY_CONCAT_SEGS,
                BRAND_CODE = I.SEGMENT1,
                CATEGORY_CODE = I.SEGMENT2,
                SUB_CATEGORY_CODE = I.SEGMENT3,
                SUB_SUB_CATEGORY_CODE = I.SEGMENT4,
                PURCHASETYPE = I.SEGMENT5,
                ENABLED = I.ENABLED_FLAG,
                LAST_UPDATE_DATE = I.LAST_UPDATE_DATE,
                CREATION_DATE = I.CREATION_DATE
          WHERE     CATEGORY_ID = I.CATEGORY_ID
                AND ORGANIZATION_ID = I.ORGANIZATION_ID
                AND INVENTORY_ITEM_ID = I.INVENTORY_ITEM_ID;


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
       WHERE INTERFACEID = 24;

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
END PKG_INF_ITEM_CATEGORY;
/
