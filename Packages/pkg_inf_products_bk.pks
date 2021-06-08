DROP PACKAGE DSS.PKG_INF_PRODUCTS_BK;

CREATE OR REPLACE PACKAGE DSS.PKG_INF_PRODUCTS_BK
AS
   PROCEDURE INF_START;
END PKG_INF_PRODUCTS_BK;
/


DROP PACKAGE BODY DSS.PKG_INF_PRODUCTS_BK;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_INF_PRODUCTS_BK
AS
   PROCEDURE DATA_BULK (P_LAST_UPDATE        DATE,
                        P_INTERFACE_ID       NUMBER,
                        P_ROWCOUNT       OUT NUMBER)
   AS
      ERRORMSG       VARCHAR2 (300);
      V_START_DATE   DATE;
   BEGIN
      V_START_DATE := SYSDATE;

      DELETE FROM DSS_PRODUCTS;

      INSERT INTO DSS_PRODUCTS (OPERATING_UNIT,
                                ORGANIZATION_ID,
                                INVENTORY_ITEM_ID,
                                PRODUCT_CODE,
                                DESCRIPTION,
                                PRODUCT_CLASSIFICATION,
                                CATEGORY_ID,
                                ITEM_TYPE,
                                PURCHASE_TYPE,
                                BRAND_CODE,
                                MODEL_CODE,
                                CATEGORY_CODE,
                                SUB_CATEGORY_CODE,
                                SUB_SUB_CATEGORY_CODE,
                                COLOUR_CODE,
                                CAMERA,
                                BLUETOOTH,
                                CONGIGNMENT,
                                ENABLED,
                                ACTIVE,
                                STOCK_ENABLED,
                                OPTIMIZ_ENABLED,
                                LAST_UPDATE_DATE,
                                CREATION_DATE,
                                DWL_DATE,
                                ATTRIBUTE1)
         SELECT OPERATING_UNIT,
                ORGANIZATION_ID,
                INVENTORY_ITEM_ID,
                PRODUCT_CODE,
                DESCRIPTION,
                PRODUCT_CLASSIFICATION,
                CATEGORY_ID,
                ITEM_TYPE,
                PURCHASE_TYPE,
                BRAND_CODE,
                MODEL_CODE,
                CATEGORY_CODE,
                SUB_CATEGORY_CODE,
                SUB_SUB_CATEGORY_CODE,
                COLOUR_CODE,
                CAMERA,
                BLUETOOTH,
                CONGIGNMENT,
                ENABLED,
                ACTIVE,
                STOCK_ENABLED,
                OPTIMIZ_ENABLED,
                LAST_UPDATE_DATE,
                CREATION_DATE,
                SYSDATE,
                BASE_BRAND
           FROM V_INTERFACE_PRODUCTS;

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

      INSERT INTO DSS_PRODUCTS (OPERATING_UNIT,
                                ORGANIZATION_ID,
                                INVENTORY_ITEM_ID,
                                PRODUCT_CODE,
                                DESCRIPTION,
                                PRODUCT_CLASSIFICATION,
                                CATEGORY_ID,
                                ITEM_TYPE,
                                PURCHASE_TYPE,
                                BRAND_CODE,
                                MODEL_CODE,
                                CATEGORY_CODE,
                                SUB_CATEGORY_CODE,
                                SUB_SUB_CATEGORY_CODE,
                                COLOUR_CODE,
                                CAMERA,
                                BLUETOOTH,
                                CONGIGNMENT,
                                ENABLED,
                                ACTIVE,
                                STOCK_ENABLED,
                                OPTIMIZ_ENABLED,
                                LAST_UPDATE_DATE,
                                CREATION_DATE,
                                DWL_DATE,
                                ATTRIBUTE1)
         SELECT VMS.OPERATING_UNIT,
                VMS.ORGANIZATION_ID,
                VMS.INVENTORY_ITEM_ID,
                VMS.PRODUCT_CODE,
                VMS.DESCRIPTION,
                VMS.PRODUCT_CLASSIFICATION,
                VMS.CATEGORY_ID,
                VMS.ITEM_TYPE,
                VMS.PURCHASE_TYPE,
                VMS.BRAND_CODE,
                VMS.MODEL_CODE,
                VMS.CATEGORY_CODE,
                VMS.SUB_CATEGORY_CODE,
                VMS.SUB_SUB_CATEGORY_CODE,
                VMS.COLOUR_CODE,
                VMS.CAMERA,
                VMS.BLUETOOTH,
                VMS.CONGIGNMENT,
                VMS.ENABLED,
                VMS.ACTIVE,
                VMS.STOCK_ENABLED,
                VMS.OPTIMIZ_ENABLED,
                VMS.LAST_UPDATE_DATE,
                VMS.CREATION_DATE,
                SYSDATE,
                BASE_BRAND
           FROM V_INTERFACE_PRODUCTS VMS
                LEFT OUTER JOIN DSS_PRODUCTS MS
                   ON     VMS.ORGANIZATION_ID = MS.ORGANIZATION_ID
                      AND VMS.INVENTORY_ITEM_ID = MS.INVENTORY_ITEM_ID
          WHERE     MS.INVENTORY_ITEM_ID IS NULL
                AND TRUNC (VMS.LAST_UPDATE_DATE) >= TRUNC (P_LAST_UPDATE);


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
             FROM V_INTERFACE_PRODUCTS VMS
                  LEFT OUTER JOIN DSS_PRODUCTS MS
                     ON     VMS.ORGANIZATION_ID = MS.ORGANIZATION_ID
                        AND VMS.INVENTORY_ITEM_ID = MS.INVENTORY_ITEM_ID
             WHERE     MS.INVENTORY_ITEM_ID IS NOT NULL
                   AND TRUNC (VMS.LAST_UPDATE_DATE) >= TRUNC (P_LAST_UPDATE))
      LOOP
         UPDATE DSS_PRODUCTS
            SET INVENTORY_ITEM_ID = I.INVENTORY_ITEM_ID,
                DESCRIPTION = I.DESCRIPTION,
                PRODUCT_CLASSIFICATION = I.PRODUCT_CLASSIFICATION,
                ITEM_TYPE = I.ITEM_TYPE,
                PURCHASE_TYPE = I.PURCHASE_TYPE,
                CATEGORY_ID = I.CATEGORY_ID,
                BRAND_CODE = I.BRAND_CODE,
                MODEL_CODE = I.MODEL_CODE,
                CATEGORY_CODE = I.CATEGORY_CODE,
                SUB_CATEGORY_CODE = I.SUB_CATEGORY_CODE,
                SUB_SUB_CATEGORY_CODE = I.SUB_SUB_CATEGORY_CODE,
                COLOUR_CODE = I.COLOUR_CODE,
                CAMERA = I.CAMERA,
                BLUETOOTH = I.BLUETOOTH,
                CONGIGNMENT = I.CONGIGNMENT,
                ENABLED = I.ENABLED,
                ACTIVE = I.ACTIVE,
                STOCK_ENABLED = I.STOCK_ENABLED,
                OPTIMIZ_ENABLED = I.OPTIMIZ_ENABLED,
                LAST_UPDATE_DATE = I.LAST_UPDATE_DATE,
                CREATION_DATE = I.CREATION_DATE,
                ATTRIBUTE1 = I.BASE_BRAND
          WHERE     ORGANIZATION_ID = I.ORGANIZATION_ID
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
       WHERE INTERFACEID = 1;

      IF V_STATUS = 'A'
      THEN
         DATA_DWL (V_LAST_UPDATE, V_INTERFACEID, V_ROWCOUNT);
         PKG_INTERFACE.UP_INTERFACE_HEADER (V_INTERFACEID,
                                            SYSDATE,
                                            V_ROWCOUNT);
      END IF;
   END INF_START;
END PKG_INF_PRODUCTS_BK;
/
