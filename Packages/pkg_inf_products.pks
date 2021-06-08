DROP PACKAGE DSS.PKG_INF_PRODUCTS;

CREATE OR REPLACE PACKAGE DSS.PKG_INF_PRODUCTS
AS
   P_INTERFACE_ID   NUMBER DEFAULT 1;

   PROCEDURE INF_START;


   CURSOR CR_HOST (V_LAST_UPDATE DATE)
   IS
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
             NVL (VMS.LAST_UPDATE_DATE, SYSDATE) LAST_UPDATE_DATE,
             VMS.CREATION_DATE,
             SYSDATE,
             BASE_BRAND
        FROM V_INTERFACE_PRODUCTS VMS
       WHERE 1 = 1 
      AND TRUNC(VMS.LAST_UPDATE_DATE) >= TRUNC(V_LAST_UPDATE)-30;



   TYPE RW_HOST IS TABLE OF CR_HOST%ROWTYPE;
END PKG_INF_PRODUCTS;
/


DROP PACKAGE BODY DSS.PKG_INF_PRODUCTS;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_INF_PRODUCTS
AS
   PROCEDURE INF_START
   AS
      TEMP_RW         RW_HOST;
      ERRORMSG        VARCHAR2 (300);
      TEMP_COUNT      NUMBER;
      V_START_DATE    DATE;
      V_LAST_UPDATE   DATE;
      V_STATUS        CHAR (1);
   BEGIN
      V_START_DATE := SYSDATE;
      TEMP_COUNT := 0;

      SELECT LAST_RUN_DATE, STATUS
        INTO V_LAST_UPDATE, V_STATUS
        FROM DSS_INTERFACE_PROCESS
       WHERE INTERFACEID = 1;

      IF V_STATUS = 'A'
      THEN
         IF (CR_HOST%ISOPEN)
         THEN
            CLOSE CR_HOST;
         END IF;

         OPEN CR_HOST (V_LAST_UPDATE);

         LOOP
            FETCH CR_HOST
                 BULK COLLECT INTO TEMP_RW
               LIMIT 1000;

            TEMP_COUNT := NVL (TEMP_COUNT, 0) + TEMP_RW.COUNT;

            FORALL RW IN 1 .. TEMP_RW.COUNT
               MERGE INTO DSS_PRODUCTS TRG
                USING (SELECT TEMP_RW (RW).ORGANIZATION_ID AS ORGANIZATION_ID,
                              TEMP_RW (RW).INVENTORY_ITEM_ID
                                 AS INVENTORY_ITEM_ID
                         FROM DUAL) MTCH
                   ON (    MTCH.ORGANIZATION_ID = TRG.ORGANIZATION_ID
                       AND MTCH.INVENTORY_ITEM_ID = TRG.INVENTORY_ITEM_ID)
               WHEN MATCHED
               THEN
                  UPDATE SET
                     PRODUCT_CODE = TEMP_RW (RW).PRODUCT_CODE,
                     DESCRIPTION = TEMP_RW (RW).DESCRIPTION,
                     PRODUCT_CLASSIFICATION =
                        TEMP_RW (RW).PRODUCT_CLASSIFICATION,
                     ITEM_TYPE = TEMP_RW (RW).ITEM_TYPE,
                     PURCHASE_TYPE = TEMP_RW (RW).PURCHASE_TYPE,
                     CATEGORY_ID = TEMP_RW (RW).CATEGORY_ID,
                     BRAND_CODE = TEMP_RW (RW).BRAND_CODE,
                     MODEL_CODE = TEMP_RW (RW).MODEL_CODE,
                     CATEGORY_CODE = TEMP_RW (RW).CATEGORY_CODE,
                     SUB_CATEGORY_CODE = TEMP_RW (RW).SUB_CATEGORY_CODE,
                     SUB_SUB_CATEGORY_CODE =
                        TEMP_RW (RW).SUB_SUB_CATEGORY_CODE,
                     COLOUR_CODE = TEMP_RW (RW).COLOUR_CODE,
                     CAMERA = TEMP_RW (RW).CAMERA,
                     BLUETOOTH = TEMP_RW (RW).BLUETOOTH,
                     CONGIGNMENT = TEMP_RW (RW).CONGIGNMENT,
                     ENABLED = TEMP_RW (RW).ENABLED,
                     ACTIVE = TEMP_RW (RW).ACTIVE,
                     STOCK_ENABLED = TEMP_RW (RW).STOCK_ENABLED,
                     OPTIMIZ_ENABLED = TEMP_RW (RW).OPTIMIZ_ENABLED,
                     LAST_UPDATE_DATE = TEMP_RW (RW).LAST_UPDATE_DATE,
                     CREATION_DATE = TEMP_RW (RW).CREATION_DATE,
                     ATTRIBUTE1 = TEMP_RW (RW).BASE_BRAND,
                     DWL_DATE = SYSDATE
               WHEN NOT MATCHED
               THEN
                  INSERT (OPERATING_UNIT,
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
                  VALUES (TEMP_RW (RW).OPERATING_UNIT,
                          TEMP_RW (RW).ORGANIZATION_ID,
                          TEMP_RW (RW).INVENTORY_ITEM_ID,
                          TEMP_RW (RW).PRODUCT_CODE,
                          TEMP_RW (RW).DESCRIPTION,
                          TEMP_RW (RW).PRODUCT_CLASSIFICATION,
                          TEMP_RW (RW).CATEGORY_ID,
                          TEMP_RW (RW).ITEM_TYPE,
                          TEMP_RW (RW).PURCHASE_TYPE,
                          TEMP_RW (RW).BRAND_CODE,
                          TEMP_RW (RW).MODEL_CODE,
                          TEMP_RW (RW).CATEGORY_CODE,
                          TEMP_RW (RW).SUB_CATEGORY_CODE,
                          TEMP_RW (RW).SUB_SUB_CATEGORY_CODE,
                          TEMP_RW (RW).COLOUR_CODE,
                          TEMP_RW (RW).CAMERA,
                          TEMP_RW (RW).BLUETOOTH,
                          TEMP_RW (RW).CONGIGNMENT,
                          TEMP_RW (RW).ENABLED,
                          TEMP_RW (RW).ACTIVE,
                          TEMP_RW (RW).STOCK_ENABLED,
                          TEMP_RW (RW).OPTIMIZ_ENABLED,
                          TEMP_RW (RW).LAST_UPDATE_DATE,
                          TEMP_RW (RW).CREATION_DATE,
                          SYSDATE,
                          TEMP_RW (RW).BASE_BRAND);

            PKG_INTERFACE.INS_INTERFACE_LOG2 (P_INTERFACE_ID,
                                              SYSDATE,
                                              TEMP_RW.COUNT,
                                              'INS/UP',
                                              'C',
                                              NULL,
                                              V_START_DATE);

            EXIT WHEN CR_HOST%NOTFOUND;
         END LOOP;

         CLOSE CR_HOST;


         PKG_INTERFACE.UP_INTERFACE_HEADER (P_INTERFACE_ID,
                                            SYSDATE,
                                            TEMP_COUNT);
      END IF;
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
   END INF_START;
END PKG_INF_PRODUCTS;
/
