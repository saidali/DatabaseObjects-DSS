DROP PACKAGE DSS.PKG_DSS_PRODUCTS;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_PRODUCTS
AS
   PROCEDURE P_LOADBY_CONDITION (p_CONDITIONS   IN     VARCHAR2,
                                 OUTCURSOR         OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_GetMappedProducts (
      p_OPERATING_UNIT      IN     DSS_PRODUCTS.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID     IN     DSS_PRODUCTS.ORGANIZATION_ID%TYPE,
      p_INVENTORY_ITEM_ID   IN     DSS_PRODUCTS.INVENTORY_ITEM_ID%TYPE,
      outCursor                OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_INVENTORY_ITEM_ID   IN     DSS_PRODUCTS.INVENTORY_ITEM_ID%TYPE,
      p_ORGANIZATION_ID     IN     DSS_PRODUCTS.ORGANIZATION_ID%TYPE,
      outCursor                OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_LINEID                   IN DSS_PRODUCTS.LINEID%TYPE,
      p_OPERATING_UNIT           IN DSS_PRODUCTS.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID          IN DSS_PRODUCTS.ORGANIZATION_ID%TYPE,
      p_INVENTORY_ITEM_ID        IN DSS_PRODUCTS.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE             IN DSS_PRODUCTS.PRODUCT_CODE%TYPE,
      p_DESCRIPTION              IN DSS_PRODUCTS.DESCRIPTION%TYPE,
      p_PRODUCT_CLASSIFICATION   IN DSS_PRODUCTS.PRODUCT_CLASSIFICATION%TYPE,
      p_ITEM_TYPE                IN DSS_PRODUCTS.ITEM_TYPE%TYPE,
      p_CATEGORY_ID              IN DSS_PRODUCTS.CATEGORY_ID%TYPE,
      p_PURCHASE_TYPE            IN DSS_PRODUCTS.PURCHASE_TYPE%TYPE,
      p_BRAND_CODE               IN DSS_PRODUCTS.BRAND_CODE%TYPE,
      p_MODEL_CODE               IN DSS_PRODUCTS.MODEL_CODE%TYPE,
      p_CATEGORY_CODE            IN DSS_PRODUCTS.CATEGORY_CODE%TYPE,
      p_SUB_CATEGORY_CODE        IN DSS_PRODUCTS.SUB_CATEGORY_CODE%TYPE,
      p_SUB_SUB_CATEGORY_CODE    IN DSS_PRODUCTS.SUB_SUB_CATEGORY_CODE%TYPE,
      p_COLOUR_CODE              IN DSS_PRODUCTS.COLOUR_CODE%TYPE,
      p_CAMERA                   IN DSS_PRODUCTS.CAMERA%TYPE,
      p_BLUETOOTH                IN DSS_PRODUCTS.BLUETOOTH%TYPE,
      p_CONGIGNMENT              IN DSS_PRODUCTS.CONGIGNMENT%TYPE,
      p_ENABLED                  IN DSS_PRODUCTS.ENABLED%TYPE,
      p_ACTIVE                   IN DSS_PRODUCTS.ACTIVE%TYPE,
      p_STOCK_ENABLED            IN DSS_PRODUCTS.STOCK_ENABLED%TYPE,
      p_OPTIMIZ_ENABLED          IN DSS_PRODUCTS.OPTIMIZ_ENABLED%TYPE,
      p_LAST_UPDATE_DATE         IN DSS_PRODUCTS.LAST_UPDATE_DATE%TYPE,
      p_CREATION_DATE            IN DSS_PRODUCTS.CREATION_DATE%TYPE,
      p_DWL_DATE                 IN DSS_PRODUCTS.DWL_DATE%TYPE,
      p_ATTRIBUTE1               IN DSS_PRODUCTS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2               IN DSS_PRODUCTS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3               IN DSS_PRODUCTS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4               IN DSS_PRODUCTS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5               IN DSS_PRODUCTS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6               IN DSS_PRODUCTS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7               IN DSS_PRODUCTS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8               IN DSS_PRODUCTS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9               IN DSS_PRODUCTS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10              IN DSS_PRODUCTS.ATTRIBUTE10%TYPE);

   PROCEDURE P_Insert (
      p_LINEID                   IN DSS_PRODUCTS.LINEID%TYPE,
      p_OPERATING_UNIT           IN DSS_PRODUCTS.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID          IN DSS_PRODUCTS.ORGANIZATION_ID%TYPE,
      p_INVENTORY_ITEM_ID        IN DSS_PRODUCTS.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE             IN DSS_PRODUCTS.PRODUCT_CODE%TYPE,
      p_DESCRIPTION              IN DSS_PRODUCTS.DESCRIPTION%TYPE,
      p_PRODUCT_CLASSIFICATION   IN DSS_PRODUCTS.PRODUCT_CLASSIFICATION%TYPE,
      p_ITEM_TYPE                IN DSS_PRODUCTS.ITEM_TYPE%TYPE,
      p_CATEGORY_ID              IN DSS_PRODUCTS.CATEGORY_ID%TYPE,
      p_PURCHASE_TYPE            IN DSS_PRODUCTS.PURCHASE_TYPE%TYPE,
      p_BRAND_CODE               IN DSS_PRODUCTS.BRAND_CODE%TYPE,
      p_MODEL_CODE               IN DSS_PRODUCTS.MODEL_CODE%TYPE,
      p_CATEGORY_CODE            IN DSS_PRODUCTS.CATEGORY_CODE%TYPE,
      p_SUB_CATEGORY_CODE        IN DSS_PRODUCTS.SUB_CATEGORY_CODE%TYPE,
      p_SUB_SUB_CATEGORY_CODE    IN DSS_PRODUCTS.SUB_SUB_CATEGORY_CODE%TYPE,
      p_COLOUR_CODE              IN DSS_PRODUCTS.COLOUR_CODE%TYPE,
      p_CAMERA                   IN DSS_PRODUCTS.CAMERA%TYPE,
      p_BLUETOOTH                IN DSS_PRODUCTS.BLUETOOTH%TYPE,
      p_CONGIGNMENT              IN DSS_PRODUCTS.CONGIGNMENT%TYPE,
      p_ENABLED                  IN DSS_PRODUCTS.ENABLED%TYPE,
      p_ACTIVE                   IN DSS_PRODUCTS.ACTIVE%TYPE,
      p_STOCK_ENABLED            IN DSS_PRODUCTS.STOCK_ENABLED%TYPE,
      p_OPTIMIZ_ENABLED          IN DSS_PRODUCTS.OPTIMIZ_ENABLED%TYPE,
      p_LAST_UPDATE_DATE         IN DSS_PRODUCTS.LAST_UPDATE_DATE%TYPE,
      p_CREATION_DATE            IN DSS_PRODUCTS.CREATION_DATE%TYPE,
      p_DWL_DATE                 IN DSS_PRODUCTS.DWL_DATE%TYPE,
      p_ATTRIBUTE1               IN DSS_PRODUCTS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2               IN DSS_PRODUCTS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3               IN DSS_PRODUCTS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4               IN DSS_PRODUCTS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5               IN DSS_PRODUCTS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6               IN DSS_PRODUCTS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7               IN DSS_PRODUCTS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8               IN DSS_PRODUCTS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9               IN DSS_PRODUCTS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10              IN DSS_PRODUCTS.ATTRIBUTE10%TYPE);

   PROCEDURE P_Delete (
      p_INVENTORY_ITEM_ID   IN DSS_PRODUCTS.INVENTORY_ITEM_ID%TYPE,
      p_ORGANIZATION_ID     IN DSS_PRODUCTS.ORGANIZATION_ID%TYPE);
END PKG_DSS_PRODUCTS;
/


DROP PACKAGE BODY DSS.PKG_DSS_PRODUCTS;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_PRODUCTS
AS
   PROCEDURE P_LOADBY_CONDITION (p_CONDITIONS   IN     VARCHAR2,
                                 OUTCURSOR         OUT DSS.MYGEN.sqlcur)
   AS
      P_SQLQUERY   VARCHAR2 (1000);
   BEGIN
      P_SQLQUERY :=
            'SELECT *  FROM V_DSS_PRODUCT_MASTER PR
                               LEFT OUTER JOIN VW_SYN_ITEM_BARCODES BC
                                  ON PR.INVENTORY_ITEM_ID = BC.INVENTORY_ITEM_ID
                         WHERE 1 = 1 '
         || p_CONDITIONS;

      OPEN outCursor FOR P_SQLQUERY;
   END P_LOADBY_CONDITION;


   PROCEDURE P_GetMappedProducts (
      p_OPERATING_UNIT      IN     DSS_PRODUCTS.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID     IN     DSS_PRODUCTS.ORGANIZATION_ID%TYPE,
      p_INVENTORY_ITEM_ID   IN     DSS_PRODUCTS.INVENTORY_ITEM_ID%TYPE,
      outCursor                OUT DSS.MYGEN.sqlcur)
   AS
   BEGIN
      OPEN outCursor FOR
         SELECT P.*
           FROM DSS_PRODUCTS P
                JOIN DSS_MODEL_MAPPING MM ON P.MODEL_CODE = MM.MODEL_CODE
          WHERE     OPERATING_UNIT = p_OPERATING_UNIT
                AND ORGANIZATION_ID = p_ORGANIZATION_ID
                AND INVENTORY_ITEM_ID = p_INVENTORY_ITEM_ID;
   END P_GetMappedProducts;

   PROCEDURE P_LoadByPrimaryKey (
      p_INVENTORY_ITEM_ID   IN     DSS_PRODUCTS.INVENTORY_ITEM_ID%TYPE,
      p_ORGANIZATION_ID     IN     DSS_PRODUCTS.ORGANIZATION_ID%TYPE,
      outCursor                OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT LINEID,
                OPERATING_UNIT,
                ORGANIZATION_ID,
                INVENTORY_ITEM_ID,
                PRODUCT_CODE,
                DESCRIPTION,
                PRODUCT_CLASSIFICATION,
                ITEM_TYPE,
                CATEGORY_ID,
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
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6,
                ATTRIBUTE7,
                ATTRIBUTE8,
                ATTRIBUTE9,
                ATTRIBUTE10
           FROM DSS_PRODUCTS
          WHERE     INVENTORY_ITEM_ID = p_INVENTORY_ITEM_ID
                AND ORGANIZATION_ID = p_ORGANIZATION_ID;
   END P_LoadByPrimaryKey;

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT LINEID,
                OPERATING_UNIT,
                ORGANIZATION_ID,
                INVENTORY_ITEM_ID,
                PRODUCT_CODE,
                DESCRIPTION,
                PRODUCT_CLASSIFICATION,
                ITEM_TYPE,
                CATEGORY_ID,
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
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6,
                ATTRIBUTE7,
                ATTRIBUTE8,
                ATTRIBUTE9,
                ATTRIBUTE10
           FROM DSS_PRODUCTS;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_LINEID                   IN DSS_PRODUCTS.LINEID%TYPE,
      p_OPERATING_UNIT           IN DSS_PRODUCTS.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID          IN DSS_PRODUCTS.ORGANIZATION_ID%TYPE,
      p_INVENTORY_ITEM_ID        IN DSS_PRODUCTS.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE             IN DSS_PRODUCTS.PRODUCT_CODE%TYPE,
      p_DESCRIPTION              IN DSS_PRODUCTS.DESCRIPTION%TYPE,
      p_PRODUCT_CLASSIFICATION   IN DSS_PRODUCTS.PRODUCT_CLASSIFICATION%TYPE,
      p_ITEM_TYPE                IN DSS_PRODUCTS.ITEM_TYPE%TYPE,
      p_CATEGORY_ID              IN DSS_PRODUCTS.CATEGORY_ID%TYPE,
      p_PURCHASE_TYPE            IN DSS_PRODUCTS.PURCHASE_TYPE%TYPE,
      p_BRAND_CODE               IN DSS_PRODUCTS.BRAND_CODE%TYPE,
      p_MODEL_CODE               IN DSS_PRODUCTS.MODEL_CODE%TYPE,
      p_CATEGORY_CODE            IN DSS_PRODUCTS.CATEGORY_CODE%TYPE,
      p_SUB_CATEGORY_CODE        IN DSS_PRODUCTS.SUB_CATEGORY_CODE%TYPE,
      p_SUB_SUB_CATEGORY_CODE    IN DSS_PRODUCTS.SUB_SUB_CATEGORY_CODE%TYPE,
      p_COLOUR_CODE              IN DSS_PRODUCTS.COLOUR_CODE%TYPE,
      p_CAMERA                   IN DSS_PRODUCTS.CAMERA%TYPE,
      p_BLUETOOTH                IN DSS_PRODUCTS.BLUETOOTH%TYPE,
      p_CONGIGNMENT              IN DSS_PRODUCTS.CONGIGNMENT%TYPE,
      p_ENABLED                  IN DSS_PRODUCTS.ENABLED%TYPE,
      p_ACTIVE                   IN DSS_PRODUCTS.ACTIVE%TYPE,
      p_STOCK_ENABLED            IN DSS_PRODUCTS.STOCK_ENABLED%TYPE,
      p_OPTIMIZ_ENABLED          IN DSS_PRODUCTS.OPTIMIZ_ENABLED%TYPE,
      p_LAST_UPDATE_DATE         IN DSS_PRODUCTS.LAST_UPDATE_DATE%TYPE,
      p_CREATION_DATE            IN DSS_PRODUCTS.CREATION_DATE%TYPE,
      p_DWL_DATE                 IN DSS_PRODUCTS.DWL_DATE%TYPE,
      p_ATTRIBUTE1               IN DSS_PRODUCTS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2               IN DSS_PRODUCTS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3               IN DSS_PRODUCTS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4               IN DSS_PRODUCTS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5               IN DSS_PRODUCTS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6               IN DSS_PRODUCTS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7               IN DSS_PRODUCTS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8               IN DSS_PRODUCTS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9               IN DSS_PRODUCTS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10              IN DSS_PRODUCTS.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      UPDATE DSS_PRODUCTS
         SET LINEID = p_LINEID,
             OPERATING_UNIT = p_OPERATING_UNIT,
             ORGANIZATION_ID = p_ORGANIZATION_ID,
             INVENTORY_ITEM_ID = p_INVENTORY_ITEM_ID,
             PRODUCT_CODE = p_PRODUCT_CODE,
             DESCRIPTION = p_DESCRIPTION,
             PRODUCT_CLASSIFICATION = p_PRODUCT_CLASSIFICATION,
             ITEM_TYPE = p_ITEM_TYPE,
             CATEGORY_ID = p_CATEGORY_ID,
             PURCHASE_TYPE = p_PURCHASE_TYPE,
             BRAND_CODE = p_BRAND_CODE,
             MODEL_CODE = p_MODEL_CODE,
             CATEGORY_CODE = p_CATEGORY_CODE,
             SUB_CATEGORY_CODE = p_SUB_CATEGORY_CODE,
             SUB_SUB_CATEGORY_CODE = p_SUB_SUB_CATEGORY_CODE,
             COLOUR_CODE = p_COLOUR_CODE,
             CAMERA = p_CAMERA,
             BLUETOOTH = p_BLUETOOTH,
             CONGIGNMENT = p_CONGIGNMENT,
             ENABLED = p_ENABLED,
             ACTIVE = p_ACTIVE,
             STOCK_ENABLED = p_STOCK_ENABLED,
             OPTIMIZ_ENABLED = p_OPTIMIZ_ENABLED,
             LAST_UPDATE_DATE = SYSDATE,                -- p_LAST_UPDATE_DATE,
             --        CREATION_DATE    = p_CREATION_DATE,
             DWL_DATE = p_DWL_DATE,
             ATTRIBUTE1 = p_ATTRIBUTE1,
             ATTRIBUTE2 = p_ATTRIBUTE2,
             ATTRIBUTE3 = p_ATTRIBUTE3,
             ATTRIBUTE4 = p_ATTRIBUTE4,
             ATTRIBUTE5 = p_ATTRIBUTE5,
             ATTRIBUTE6 = p_ATTRIBUTE6,
             ATTRIBUTE7 = p_ATTRIBUTE7,
             ATTRIBUTE8 = p_ATTRIBUTE8,
             ATTRIBUTE9 = p_ATTRIBUTE9,
             ATTRIBUTE10 = p_ATTRIBUTE10
       WHERE     INVENTORY_ITEM_ID = p_INVENTORY_ITEM_ID
             AND ORGANIZATION_ID = p_ORGANIZATION_ID;
   END P_Update;


   PROCEDURE P_Insert (
      p_LINEID                   IN DSS_PRODUCTS.LINEID%TYPE,
      p_OPERATING_UNIT           IN DSS_PRODUCTS.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID          IN DSS_PRODUCTS.ORGANIZATION_ID%TYPE,
      p_INVENTORY_ITEM_ID        IN DSS_PRODUCTS.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE             IN DSS_PRODUCTS.PRODUCT_CODE%TYPE,
      p_DESCRIPTION              IN DSS_PRODUCTS.DESCRIPTION%TYPE,
      p_PRODUCT_CLASSIFICATION   IN DSS_PRODUCTS.PRODUCT_CLASSIFICATION%TYPE,
      p_ITEM_TYPE                IN DSS_PRODUCTS.ITEM_TYPE%TYPE,
      p_CATEGORY_ID              IN DSS_PRODUCTS.CATEGORY_ID%TYPE,
      p_PURCHASE_TYPE            IN DSS_PRODUCTS.PURCHASE_TYPE%TYPE,
      p_BRAND_CODE               IN DSS_PRODUCTS.BRAND_CODE%TYPE,
      p_MODEL_CODE               IN DSS_PRODUCTS.MODEL_CODE%TYPE,
      p_CATEGORY_CODE            IN DSS_PRODUCTS.CATEGORY_CODE%TYPE,
      p_SUB_CATEGORY_CODE        IN DSS_PRODUCTS.SUB_CATEGORY_CODE%TYPE,
      p_SUB_SUB_CATEGORY_CODE    IN DSS_PRODUCTS.SUB_SUB_CATEGORY_CODE%TYPE,
      p_COLOUR_CODE              IN DSS_PRODUCTS.COLOUR_CODE%TYPE,
      p_CAMERA                   IN DSS_PRODUCTS.CAMERA%TYPE,
      p_BLUETOOTH                IN DSS_PRODUCTS.BLUETOOTH%TYPE,
      p_CONGIGNMENT              IN DSS_PRODUCTS.CONGIGNMENT%TYPE,
      p_ENABLED                  IN DSS_PRODUCTS.ENABLED%TYPE,
      p_ACTIVE                   IN DSS_PRODUCTS.ACTIVE%TYPE,
      p_STOCK_ENABLED            IN DSS_PRODUCTS.STOCK_ENABLED%TYPE,
      p_OPTIMIZ_ENABLED          IN DSS_PRODUCTS.OPTIMIZ_ENABLED%TYPE,
      p_LAST_UPDATE_DATE         IN DSS_PRODUCTS.LAST_UPDATE_DATE%TYPE,
      p_CREATION_DATE            IN DSS_PRODUCTS.CREATION_DATE%TYPE,
      p_DWL_DATE                 IN DSS_PRODUCTS.DWL_DATE%TYPE,
      p_ATTRIBUTE1               IN DSS_PRODUCTS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2               IN DSS_PRODUCTS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3               IN DSS_PRODUCTS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4               IN DSS_PRODUCTS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5               IN DSS_PRODUCTS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6               IN DSS_PRODUCTS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7               IN DSS_PRODUCTS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8               IN DSS_PRODUCTS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9               IN DSS_PRODUCTS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10              IN DSS_PRODUCTS.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      INSERT INTO DSS_PRODUCTS (LINEID,
                                OPERATING_UNIT,
                                ORGANIZATION_ID,
                                INVENTORY_ITEM_ID,
                                PRODUCT_CODE,
                                DESCRIPTION,
                                PRODUCT_CLASSIFICATION,
                                ITEM_TYPE,
                                CATEGORY_ID,
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
                                ATTRIBUTE1,
                                ATTRIBUTE2,
                                ATTRIBUTE3,
                                ATTRIBUTE4,
                                ATTRIBUTE5,
                                ATTRIBUTE6,
                                ATTRIBUTE7,
                                ATTRIBUTE8,
                                ATTRIBUTE9,
                                ATTRIBUTE10)
           VALUES (p_LINEID,
                   p_OPERATING_UNIT,
                   p_ORGANIZATION_ID,
                   p_INVENTORY_ITEM_ID,
                   p_PRODUCT_CODE,
                   p_DESCRIPTION,
                   p_PRODUCT_CLASSIFICATION,
                   p_ITEM_TYPE,
                   p_CATEGORY_ID,
                   p_PURCHASE_TYPE,
                   p_BRAND_CODE,
                   p_MODEL_CODE,
                   p_CATEGORY_CODE,
                   p_SUB_CATEGORY_CODE,
                   p_SUB_SUB_CATEGORY_CODE,
                   p_COLOUR_CODE,
                   p_CAMERA,
                   p_BLUETOOTH,
                   p_CONGIGNMENT,
                   p_ENABLED,
                   p_ACTIVE,
                   p_STOCK_ENABLED,
                   p_OPTIMIZ_ENABLED,
                   p_LAST_UPDATE_DATE,
                   SYSDATE,                                -- p_CREATION_DATE,
                   p_DWL_DATE,
                   p_ATTRIBUTE1,
                   p_ATTRIBUTE2,
                   p_ATTRIBUTE3,
                   p_ATTRIBUTE4,
                   p_ATTRIBUTE5,
                   p_ATTRIBUTE6,
                   p_ATTRIBUTE7,
                   p_ATTRIBUTE8,
                   p_ATTRIBUTE9,
                   p_ATTRIBUTE10);
   END P_Insert;

   PROCEDURE P_Delete (
      p_INVENTORY_ITEM_ID   IN DSS_PRODUCTS.INVENTORY_ITEM_ID%TYPE,
      p_ORGANIZATION_ID     IN DSS_PRODUCTS.ORGANIZATION_ID%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_PRODUCTS
            WHERE     INVENTORY_ITEM_ID = p_INVENTORY_ITEM_ID
                  AND ORGANIZATION_ID = p_ORGANIZATION_ID;
   END P_Delete;
END PKG_DSS_PRODUCTS;
/
