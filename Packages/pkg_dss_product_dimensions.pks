DROP PACKAGE DSS.PKG_DSS_PRODUCT_DIMENSIONS;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_PRODUCT_DIMENSIONS
AS
   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_LINEID    IN     DSS_PRODUCT_DIMENSIONS.LINEID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_LINEID              IN DSS_PRODUCT_DIMENSIONS.LINEID%TYPE,
      p_OPERATING_UNIT      IN DSS_PRODUCT_DIMENSIONS.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID     IN DSS_PRODUCT_DIMENSIONS.ORGANIZATION_ID%TYPE,
      p_INVENTORY_ITEM_ID   IN DSS_PRODUCT_DIMENSIONS.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE        IN DSS_PRODUCT_DIMENSIONS.PRODUCT_CODE%TYPE,
      p_DESCRIPTION         IN DSS_PRODUCT_DIMENSIONS.DESCRIPTION%TYPE,
      p_ITEM_TYPE           IN DSS_PRODUCT_DIMENSIONS.ITEM_TYPE%TYPE,
      p_LENGTH1             IN DSS_PRODUCT_DIMENSIONS.LENGTH1%TYPE,
      p_WIDTH1              IN DSS_PRODUCT_DIMENSIONS.WIDTH1%TYPE,
      p_HEIGHT1             IN DSS_PRODUCT_DIMENSIONS.HEIGHT1%TYPE,
      p_UOM1                IN DSS_PRODUCT_DIMENSIONS.UOM1%TYPE,
      p_LENGTH2             IN DSS_PRODUCT_DIMENSIONS.LENGTH2%TYPE,
      p_WIDTH2              IN DSS_PRODUCT_DIMENSIONS.WIDTH2%TYPE,
      p_HEIGHT2             IN DSS_PRODUCT_DIMENSIONS.HEIGHT2%TYPE,
      p_UOM2                IN DSS_PRODUCT_DIMENSIONS.UOM2%TYPE,
      p_LENGTH3             IN DSS_PRODUCT_DIMENSIONS.LENGTH3%TYPE,
      p_WIDTH3              IN DSS_PRODUCT_DIMENSIONS.WIDTH3%TYPE,
      p_HEIGHT3             IN DSS_PRODUCT_DIMENSIONS.HEIGHT3%TYPE,
      p_UOM3                IN DSS_PRODUCT_DIMENSIONS.UOM3%TYPE,
      p_CATEGORY_ID         IN DSS_PRODUCT_DIMENSIONS.CATEGORY_ID%TYPE,
      p_BRAND               IN DSS_PRODUCT_DIMENSIONS.BRAND%TYPE,
      p_MODEL               IN DSS_PRODUCT_DIMENSIONS.MODEL%TYPE,
      p_COLOR               IN DSS_PRODUCT_DIMENSIONS.COLOR%TYPE,
      p_DENSITY             IN DSS_PRODUCT_DIMENSIONS.DENSITY%TYPE,
      p_HARDNESS            IN DSS_PRODUCT_DIMENSIONS.HARDNESS%TYPE,
      p_THICKNESS           IN DSS_PRODUCT_DIMENSIONS.THICKNESS%TYPE,
      p_TRANSPARANCY        IN DSS_PRODUCT_DIMENSIONS.TRANSPARANCY%TYPE,
      p_MATERIAL            IN DSS_PRODUCT_DIMENSIONS.MATERIAL%TYPE,
      p_TEXTURE             IN DSS_PRODUCT_DIMENSIONS.TEXTURE%TYPE,
      p_LAYER               IN DSS_PRODUCT_DIMENSIONS.LAYER%TYPE,
      p_FEATURES            IN DSS_PRODUCT_DIMENSIONS.FEATURES%TYPE,
      p_STATUS              IN DSS_PRODUCT_DIMENSIONS.STATUS%TYPE,
      p_ACTIVE              IN DSS_PRODUCT_DIMENSIONS.ACTIVE%TYPE,
      p_CREATE_DATE         IN DSS_PRODUCT_DIMENSIONS.CREATE_DATE%TYPE,
      p_CREATE_BY           IN DSS_PRODUCT_DIMENSIONS.CREATE_BY%TYPE,
      p_MODIFY_DATE         IN DSS_PRODUCT_DIMENSIONS.MODIFY_DATE%TYPE,
      p_MODIFY_BY           IN DSS_PRODUCT_DIMENSIONS.MODIFY_BY%TYPE,
      p_ATTRIBUTE1          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10         IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE10%TYPE);

   PROCEDURE P_Insert (
      p_LINEID              IN DSS_PRODUCT_DIMENSIONS.LINEID%TYPE,
      p_OPERATING_UNIT      IN DSS_PRODUCT_DIMENSIONS.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID     IN DSS_PRODUCT_DIMENSIONS.ORGANIZATION_ID%TYPE,
      p_INVENTORY_ITEM_ID   IN DSS_PRODUCT_DIMENSIONS.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE        IN DSS_PRODUCT_DIMENSIONS.PRODUCT_CODE%TYPE,
      p_DESCRIPTION         IN DSS_PRODUCT_DIMENSIONS.DESCRIPTION%TYPE,
      p_ITEM_TYPE           IN DSS_PRODUCT_DIMENSIONS.ITEM_TYPE%TYPE,
      p_LENGTH1             IN DSS_PRODUCT_DIMENSIONS.LENGTH1%TYPE,
      p_WIDTH1              IN DSS_PRODUCT_DIMENSIONS.WIDTH1%TYPE,
      p_HEIGHT1             IN DSS_PRODUCT_DIMENSIONS.HEIGHT1%TYPE,
      p_UOM1                IN DSS_PRODUCT_DIMENSIONS.UOM1%TYPE,
      p_LENGTH2             IN DSS_PRODUCT_DIMENSIONS.LENGTH2%TYPE,
      p_WIDTH2              IN DSS_PRODUCT_DIMENSIONS.WIDTH2%TYPE,
      p_HEIGHT2             IN DSS_PRODUCT_DIMENSIONS.HEIGHT2%TYPE,
      p_UOM2                IN DSS_PRODUCT_DIMENSIONS.UOM2%TYPE,
      p_LENGTH3             IN DSS_PRODUCT_DIMENSIONS.LENGTH3%TYPE,
      p_WIDTH3              IN DSS_PRODUCT_DIMENSIONS.WIDTH3%TYPE,
      p_HEIGHT3             IN DSS_PRODUCT_DIMENSIONS.HEIGHT3%TYPE,
      p_UOM3                IN DSS_PRODUCT_DIMENSIONS.UOM3%TYPE,
      p_CATEGORY_ID         IN DSS_PRODUCT_DIMENSIONS.CATEGORY_ID%TYPE,
      p_BRAND               IN DSS_PRODUCT_DIMENSIONS.BRAND%TYPE,
      p_MODEL               IN DSS_PRODUCT_DIMENSIONS.MODEL%TYPE,
      p_COLOR               IN DSS_PRODUCT_DIMENSIONS.COLOR%TYPE,
      p_DENSITY             IN DSS_PRODUCT_DIMENSIONS.DENSITY%TYPE,
      p_HARDNESS            IN DSS_PRODUCT_DIMENSIONS.HARDNESS%TYPE,
      p_THICKNESS           IN DSS_PRODUCT_DIMENSIONS.THICKNESS%TYPE,
      p_TRANSPARANCY        IN DSS_PRODUCT_DIMENSIONS.TRANSPARANCY%TYPE,
      p_MATERIAL            IN DSS_PRODUCT_DIMENSIONS.MATERIAL%TYPE,
      p_TEXTURE             IN DSS_PRODUCT_DIMENSIONS.TEXTURE%TYPE,
      p_LAYER               IN DSS_PRODUCT_DIMENSIONS.LAYER%TYPE,
      p_FEATURES            IN DSS_PRODUCT_DIMENSIONS.FEATURES%TYPE,
      p_STATUS              IN DSS_PRODUCT_DIMENSIONS.STATUS%TYPE,
      p_ACTIVE              IN DSS_PRODUCT_DIMENSIONS.ACTIVE%TYPE,
      p_CREATE_DATE         IN DSS_PRODUCT_DIMENSIONS.CREATE_DATE%TYPE,
      p_CREATE_BY           IN DSS_PRODUCT_DIMENSIONS.CREATE_BY%TYPE,
      p_MODIFY_DATE         IN DSS_PRODUCT_DIMENSIONS.MODIFY_DATE%TYPE,
      p_MODIFY_BY           IN DSS_PRODUCT_DIMENSIONS.MODIFY_BY%TYPE,
      p_ATTRIBUTE1          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10         IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE10%TYPE);

   PROCEDURE P_Delete (p_LINEID IN DSS_PRODUCT_DIMENSIONS.LINEID%TYPE);

   PROCEDURE P_Insert_ByProductMaster (
      p_INVENTORY_ITEM_ID   IN DSS_PRODUCT_DIMENSIONS.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE        IN DSS_PRODUCT_DIMENSIONS.PRODUCT_CODE%TYPE,
      p_ITEM_TYPE           IN DSS_PRODUCT_DIMENSIONS.ITEM_TYPE%TYPE,
      p_LENGTH1             IN DSS_PRODUCT_DIMENSIONS.LENGTH1%TYPE,
      p_WIDTH1              IN DSS_PRODUCT_DIMENSIONS.WIDTH1%TYPE,
      p_HEIGHT1             IN DSS_PRODUCT_DIMENSIONS.HEIGHT1%TYPE,
      p_UOM1                IN DSS_PRODUCT_DIMENSIONS.UOM1%TYPE,
      p_LENGTH2             IN DSS_PRODUCT_DIMENSIONS.LENGTH2%TYPE,
      p_WIDTH2              IN DSS_PRODUCT_DIMENSIONS.WIDTH2%TYPE,
      p_HEIGHT2             IN DSS_PRODUCT_DIMENSIONS.HEIGHT2%TYPE,
      p_UOM2                IN DSS_PRODUCT_DIMENSIONS.UOM2%TYPE,
      p_LENGTH3             IN DSS_PRODUCT_DIMENSIONS.LENGTH3%TYPE,
      p_WIDTH3              IN DSS_PRODUCT_DIMENSIONS.WIDTH3%TYPE,
      p_HEIGHT3             IN DSS_PRODUCT_DIMENSIONS.HEIGHT3%TYPE,
      p_UOM3                IN DSS_PRODUCT_DIMENSIONS.UOM3%TYPE,
      p_CATEGORY_ID         IN DSS_PRODUCT_DIMENSIONS.CATEGORY_ID%TYPE,
      p_BRAND               IN DSS_PRODUCT_DIMENSIONS.BRAND%TYPE,
      p_MODEL               IN DSS_PRODUCT_DIMENSIONS.MODEL%TYPE,
      p_COLOR               IN DSS_PRODUCT_DIMENSIONS.COLOR%TYPE,
      p_DENSITY             IN DSS_PRODUCT_DIMENSIONS.DENSITY%TYPE,
      p_HARDNESS            IN DSS_PRODUCT_DIMENSIONS.HARDNESS%TYPE,
      p_THICKNESS           IN DSS_PRODUCT_DIMENSIONS.THICKNESS%TYPE,
      p_TRANSPARANCY        IN DSS_PRODUCT_DIMENSIONS.TRANSPARANCY%TYPE,
      p_MATERIAL            IN DSS_PRODUCT_DIMENSIONS.MATERIAL%TYPE,
      p_TEXTURE             IN DSS_PRODUCT_DIMENSIONS.TEXTURE%TYPE,
      p_LAYER               IN DSS_PRODUCT_DIMENSIONS.LAYER%TYPE,
      p_FEATURES            IN DSS_PRODUCT_DIMENSIONS.FEATURES%TYPE,
      p_CREATE_BY           IN DSS_PRODUCT_DIMENSIONS.CREATE_BY%TYPE);

   PROCEDURE P_Update_ByProduct (
      p_INVENTORY_ITEM_ID   IN DSS_PRODUCT_DIMENSIONS.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE        IN DSS_PRODUCT_DIMENSIONS.PRODUCT_CODE%TYPE,
      p_ITEM_TYPE           IN DSS_PRODUCT_DIMENSIONS.ITEM_TYPE%TYPE,
      p_LENGTH1             IN DSS_PRODUCT_DIMENSIONS.LENGTH1%TYPE,
      p_WIDTH1              IN DSS_PRODUCT_DIMENSIONS.WIDTH1%TYPE,
      p_HEIGHT1             IN DSS_PRODUCT_DIMENSIONS.HEIGHT1%TYPE,
      p_UOM1                IN DSS_PRODUCT_DIMENSIONS.UOM1%TYPE,
      p_LENGTH2             IN DSS_PRODUCT_DIMENSIONS.LENGTH2%TYPE,
      p_WIDTH2              IN DSS_PRODUCT_DIMENSIONS.WIDTH2%TYPE,
      p_HEIGHT2             IN DSS_PRODUCT_DIMENSIONS.HEIGHT2%TYPE,
      p_UOM2                IN DSS_PRODUCT_DIMENSIONS.UOM2%TYPE,
      p_LENGTH3             IN DSS_PRODUCT_DIMENSIONS.LENGTH3%TYPE,
      p_WIDTH3              IN DSS_PRODUCT_DIMENSIONS.WIDTH3%TYPE,
      p_HEIGHT3             IN DSS_PRODUCT_DIMENSIONS.HEIGHT3%TYPE,
      p_UOM3                IN DSS_PRODUCT_DIMENSIONS.UOM3%TYPE,
      p_CATEGORY_ID         IN DSS_PRODUCT_DIMENSIONS.CATEGORY_ID%TYPE,
      p_BRAND               IN DSS_PRODUCT_DIMENSIONS.BRAND%TYPE,
      p_MODEL               IN DSS_PRODUCT_DIMENSIONS.MODEL%TYPE,
      p_COLOR               IN DSS_PRODUCT_DIMENSIONS.COLOR%TYPE,
      p_DENSITY             IN DSS_PRODUCT_DIMENSIONS.DENSITY%TYPE,
      p_HARDNESS            IN DSS_PRODUCT_DIMENSIONS.HARDNESS%TYPE,
      p_THICKNESS           IN DSS_PRODUCT_DIMENSIONS.THICKNESS%TYPE,
      p_TRANSPARANCY        IN DSS_PRODUCT_DIMENSIONS.TRANSPARANCY%TYPE,
      p_MATERIAL            IN DSS_PRODUCT_DIMENSIONS.MATERIAL%TYPE,
      p_TEXTURE             IN DSS_PRODUCT_DIMENSIONS.TEXTURE%TYPE,
      p_LAYER               IN DSS_PRODUCT_DIMENSIONS.LAYER%TYPE,
      p_FEATURES            IN DSS_PRODUCT_DIMENSIONS.FEATURES%TYPE,
      p_MODIFY_BY           IN DSS_PRODUCT_DIMENSIONS.MODIFY_BY%TYPE);
END PKG_DSS_PRODUCT_DIMENSIONS;
/


DROP PACKAGE BODY DSS.PKG_DSS_PRODUCT_DIMENSIONS;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_PRODUCT_DIMENSIONS
AS
   PROCEDURE P_LoadByPrimaryKey (
      p_LINEID    IN     DSS_PRODUCT_DIMENSIONS.LINEID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT LINEID,
                OPERATING_UNIT,
                ORGANIZATION_ID,
                INVENTORY_ITEM_ID,
                PRODUCT_CODE,
                DESCRIPTION,
                ITEM_TYPE,
                LENGTH1,
                WIDTH1,
                HEIGHT1,
                UOM1,
                LENGTH2,
                WIDTH2,
                HEIGHT2,
                UOM2,
                LENGTH3,
                WIDTH3,
                HEIGHT3,
                UOM3,
                CATEGORY_ID,
                BRAND,
                MODEL,
                COLOR,
                DENSITY,
                HARDNESS,
                THICKNESS,
                TRANSPARANCY,
                MATERIAL,
                TEXTURE,
                LAYER,
                FEATURES,
                STATUS,
                ACTIVE,
                CREATE_DATE,
                CREATE_BY,
                MODIFY_DATE,
                MODIFY_BY,
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
           FROM DSS_PRODUCT_DIMENSIONS
          WHERE LINEID = p_LINEID;
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
                ITEM_TYPE,
                LENGTH1,
                WIDTH1,
                HEIGHT1,
                UOM1,
                LENGTH2,
                WIDTH2,
                HEIGHT2,
                UOM2,
                LENGTH3,
                WIDTH3,
                HEIGHT3,
                UOM3,
                CATEGORY_ID,
                BRAND,
                MODEL,
                COLOR,
                DENSITY,
                HARDNESS,
                THICKNESS,
                TRANSPARANCY,
                MATERIAL,
                TEXTURE,
                LAYER,
                FEATURES,
                STATUS,
                ACTIVE,
                CREATE_DATE,
                CREATE_BY,
                MODIFY_DATE,
                MODIFY_BY,
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
           FROM DSS_PRODUCT_DIMENSIONS;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_LINEID              IN DSS_PRODUCT_DIMENSIONS.LINEID%TYPE,
      p_OPERATING_UNIT      IN DSS_PRODUCT_DIMENSIONS.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID     IN DSS_PRODUCT_DIMENSIONS.ORGANIZATION_ID%TYPE,
      p_INVENTORY_ITEM_ID   IN DSS_PRODUCT_DIMENSIONS.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE        IN DSS_PRODUCT_DIMENSIONS.PRODUCT_CODE%TYPE,
      p_DESCRIPTION         IN DSS_PRODUCT_DIMENSIONS.DESCRIPTION%TYPE,
      p_ITEM_TYPE           IN DSS_PRODUCT_DIMENSIONS.ITEM_TYPE%TYPE,
      p_LENGTH1             IN DSS_PRODUCT_DIMENSIONS.LENGTH1%TYPE,
      p_WIDTH1              IN DSS_PRODUCT_DIMENSIONS.WIDTH1%TYPE,
      p_HEIGHT1             IN DSS_PRODUCT_DIMENSIONS.HEIGHT1%TYPE,
      p_UOM1                IN DSS_PRODUCT_DIMENSIONS.UOM1%TYPE,
      p_LENGTH2             IN DSS_PRODUCT_DIMENSIONS.LENGTH2%TYPE,
      p_WIDTH2              IN DSS_PRODUCT_DIMENSIONS.WIDTH2%TYPE,
      p_HEIGHT2             IN DSS_PRODUCT_DIMENSIONS.HEIGHT2%TYPE,
      p_UOM2                IN DSS_PRODUCT_DIMENSIONS.UOM2%TYPE,
      p_LENGTH3             IN DSS_PRODUCT_DIMENSIONS.LENGTH3%TYPE,
      p_WIDTH3              IN DSS_PRODUCT_DIMENSIONS.WIDTH3%TYPE,
      p_HEIGHT3             IN DSS_PRODUCT_DIMENSIONS.HEIGHT3%TYPE,
      p_UOM3                IN DSS_PRODUCT_DIMENSIONS.UOM3%TYPE,
      p_CATEGORY_ID         IN DSS_PRODUCT_DIMENSIONS.CATEGORY_ID%TYPE,
      p_BRAND               IN DSS_PRODUCT_DIMENSIONS.BRAND%TYPE,
      p_MODEL               IN DSS_PRODUCT_DIMENSIONS.MODEL%TYPE,
      p_COLOR               IN DSS_PRODUCT_DIMENSIONS.COLOR%TYPE,
      p_DENSITY             IN DSS_PRODUCT_DIMENSIONS.DENSITY%TYPE,
      p_HARDNESS            IN DSS_PRODUCT_DIMENSIONS.HARDNESS%TYPE,
      p_THICKNESS           IN DSS_PRODUCT_DIMENSIONS.THICKNESS%TYPE,
      p_TRANSPARANCY        IN DSS_PRODUCT_DIMENSIONS.TRANSPARANCY%TYPE,
      p_MATERIAL            IN DSS_PRODUCT_DIMENSIONS.MATERIAL%TYPE,
      p_TEXTURE             IN DSS_PRODUCT_DIMENSIONS.TEXTURE%TYPE,
      p_LAYER               IN DSS_PRODUCT_DIMENSIONS.LAYER%TYPE,
      p_FEATURES            IN DSS_PRODUCT_DIMENSIONS.FEATURES%TYPE,
      p_STATUS              IN DSS_PRODUCT_DIMENSIONS.STATUS%TYPE,
      p_ACTIVE              IN DSS_PRODUCT_DIMENSIONS.ACTIVE%TYPE,
      p_CREATE_DATE         IN DSS_PRODUCT_DIMENSIONS.CREATE_DATE%TYPE,
      p_CREATE_BY           IN DSS_PRODUCT_DIMENSIONS.CREATE_BY%TYPE,
      p_MODIFY_DATE         IN DSS_PRODUCT_DIMENSIONS.MODIFY_DATE%TYPE,
      p_MODIFY_BY           IN DSS_PRODUCT_DIMENSIONS.MODIFY_BY%TYPE,
      p_ATTRIBUTE1          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10         IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      UPDATE DSS_PRODUCT_DIMENSIONS
         SET LINEID = p_LINEID,
             OPERATING_UNIT = p_OPERATING_UNIT,
             ORGANIZATION_ID = p_ORGANIZATION_ID,
             INVENTORY_ITEM_ID = p_INVENTORY_ITEM_ID,
             PRODUCT_CODE = p_PRODUCT_CODE,
             DESCRIPTION = p_DESCRIPTION,
             ITEM_TYPE = p_ITEM_TYPE,
             LENGTH1 = p_LENGTH1,
             WIDTH1 = p_WIDTH1,
             HEIGHT1 = p_HEIGHT1,
             UOM1 = p_UOM1,
             LENGTH2 = p_LENGTH2,
             WIDTH2 = p_WIDTH2,
             HEIGHT2 = p_HEIGHT2,
             UOM2 = p_UOM2,
             LENGTH3 = p_LENGTH3,
             WIDTH3 = p_WIDTH3,
             HEIGHT3 = p_HEIGHT3,
             UOM3 = p_UOM3,
             CATEGORY_ID = p_CATEGORY_ID,
             BRAND = p_BRAND,
             MODEL = p_MODEL,
             COLOR = p_COLOR,
             DENSITY = p_DENSITY,
             HARDNESS = p_HARDNESS,
             THICKNESS = p_THICKNESS,
             TRANSPARANCY = p_TRANSPARANCY,
             MATERIAL = p_MATERIAL,
             TEXTURE = p_TEXTURE,
             LAYER = p_LAYER,
             FEATURES = p_FEATURES,
             STATUS = p_STATUS,
             ACTIVE = p_ACTIVE,
             CREATE_DATE = p_CREATE_DATE,
             CREATE_BY = p_CREATE_BY,
             MODIFY_DATE = SYSDATE,
             MODIFY_BY = p_MODIFY_BY,
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
       WHERE LINEID = p_LINEID;
   END P_Update;


   PROCEDURE P_Insert (
      p_LINEID              IN DSS_PRODUCT_DIMENSIONS.LINEID%TYPE,
      p_OPERATING_UNIT      IN DSS_PRODUCT_DIMENSIONS.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID     IN DSS_PRODUCT_DIMENSIONS.ORGANIZATION_ID%TYPE,
      p_INVENTORY_ITEM_ID   IN DSS_PRODUCT_DIMENSIONS.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE        IN DSS_PRODUCT_DIMENSIONS.PRODUCT_CODE%TYPE,
      p_DESCRIPTION         IN DSS_PRODUCT_DIMENSIONS.DESCRIPTION%TYPE,
      p_ITEM_TYPE           IN DSS_PRODUCT_DIMENSIONS.ITEM_TYPE%TYPE,
      p_LENGTH1             IN DSS_PRODUCT_DIMENSIONS.LENGTH1%TYPE,
      p_WIDTH1              IN DSS_PRODUCT_DIMENSIONS.WIDTH1%TYPE,
      p_HEIGHT1             IN DSS_PRODUCT_DIMENSIONS.HEIGHT1%TYPE,
      p_UOM1                IN DSS_PRODUCT_DIMENSIONS.UOM1%TYPE,
      p_LENGTH2             IN DSS_PRODUCT_DIMENSIONS.LENGTH2%TYPE,
      p_WIDTH2              IN DSS_PRODUCT_DIMENSIONS.WIDTH2%TYPE,
      p_HEIGHT2             IN DSS_PRODUCT_DIMENSIONS.HEIGHT2%TYPE,
      p_UOM2                IN DSS_PRODUCT_DIMENSIONS.UOM2%TYPE,
      p_LENGTH3             IN DSS_PRODUCT_DIMENSIONS.LENGTH3%TYPE,
      p_WIDTH3              IN DSS_PRODUCT_DIMENSIONS.WIDTH3%TYPE,
      p_HEIGHT3             IN DSS_PRODUCT_DIMENSIONS.HEIGHT3%TYPE,
      p_UOM3                IN DSS_PRODUCT_DIMENSIONS.UOM3%TYPE,
      p_CATEGORY_ID         IN DSS_PRODUCT_DIMENSIONS.CATEGORY_ID%TYPE,
      p_BRAND               IN DSS_PRODUCT_DIMENSIONS.BRAND%TYPE,
      p_MODEL               IN DSS_PRODUCT_DIMENSIONS.MODEL%TYPE,
      p_COLOR               IN DSS_PRODUCT_DIMENSIONS.COLOR%TYPE,
      p_DENSITY             IN DSS_PRODUCT_DIMENSIONS.DENSITY%TYPE,
      p_HARDNESS            IN DSS_PRODUCT_DIMENSIONS.HARDNESS%TYPE,
      p_THICKNESS           IN DSS_PRODUCT_DIMENSIONS.THICKNESS%TYPE,
      p_TRANSPARANCY        IN DSS_PRODUCT_DIMENSIONS.TRANSPARANCY%TYPE,
      p_MATERIAL            IN DSS_PRODUCT_DIMENSIONS.MATERIAL%TYPE,
      p_TEXTURE             IN DSS_PRODUCT_DIMENSIONS.TEXTURE%TYPE,
      p_LAYER               IN DSS_PRODUCT_DIMENSIONS.LAYER%TYPE,
      p_FEATURES            IN DSS_PRODUCT_DIMENSIONS.FEATURES%TYPE,
      p_STATUS              IN DSS_PRODUCT_DIMENSIONS.STATUS%TYPE,
      p_ACTIVE              IN DSS_PRODUCT_DIMENSIONS.ACTIVE%TYPE,
      p_CREATE_DATE         IN DSS_PRODUCT_DIMENSIONS.CREATE_DATE%TYPE,
      p_CREATE_BY           IN DSS_PRODUCT_DIMENSIONS.CREATE_BY%TYPE,
      p_MODIFY_DATE         IN DSS_PRODUCT_DIMENSIONS.MODIFY_DATE%TYPE,
      p_MODIFY_BY           IN DSS_PRODUCT_DIMENSIONS.MODIFY_BY%TYPE,
      p_ATTRIBUTE1          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9          IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10         IN DSS_PRODUCT_DIMENSIONS.ATTRIBUTE10%TYPE)
   IS
      v_seq   NUMBER;
   BEGIN
      SELECT NVL (MAX (lineid), 0) + 1 INTO v_seq FROM DSS_PRODUCT_DIMENSIONS;

      INSERT INTO DSS_PRODUCT_DIMENSIONS (LINEID,
                                          OPERATING_UNIT,
                                          ORGANIZATION_ID,
                                          INVENTORY_ITEM_ID,
                                          PRODUCT_CODE,
                                          DESCRIPTION,
                                          ITEM_TYPE,
                                          LENGTH1,
                                          WIDTH1,
                                          HEIGHT1,
                                          UOM1,
                                          LENGTH2,
                                          WIDTH2,
                                          HEIGHT2,
                                          UOM2,
                                          LENGTH3,
                                          WIDTH3,
                                          HEIGHT3,
                                          UOM3,
                                          CATEGORY_ID,
                                          BRAND,
                                          MODEL,
                                          COLOR,
                                          DENSITY,
                                          HARDNESS,
                                          THICKNESS,
                                          TRANSPARANCY,
                                          MATERIAL,
                                          TEXTURE,
                                          LAYER,
                                          FEATURES,
                                          STATUS,
                                          ACTIVE,
                                          CREATE_DATE,
                                          CREATE_BY,
                                          MODIFY_DATE,
                                          MODIFY_BY,
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
           VALUES (v_seq,                                         -- p_LINEID,
                   p_OPERATING_UNIT,
                   p_ORGANIZATION_ID,
                   p_INVENTORY_ITEM_ID,
                   p_PRODUCT_CODE,
                   p_DESCRIPTION,
                   p_ITEM_TYPE,
                   p_LENGTH1,
                   p_WIDTH1,
                   p_HEIGHT1,
                   p_UOM1,
                   p_LENGTH2,
                   p_WIDTH2,
                   p_HEIGHT2,
                   p_UOM2,
                   p_LENGTH3,
                   p_WIDTH3,
                   p_HEIGHT3,
                   p_UOM3,
                   p_CATEGORY_ID,
                   p_BRAND,
                   p_MODEL,
                   p_COLOR,
                   p_DENSITY,
                   p_HARDNESS,
                   p_THICKNESS,
                   p_TRANSPARANCY,
                   p_MATERIAL,
                   p_TEXTURE,
                   p_LAYER,
                   p_FEATURES,
                   p_STATUS,
                   p_ACTIVE,
                   SYSDATE,                                  -- p_CREATE_DATE,
                   p_CREATE_BY,
                   p_MODIFY_DATE,
                   p_MODIFY_BY,
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

   PROCEDURE P_Delete (p_LINEID IN DSS_PRODUCT_DIMENSIONS.LINEID%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_PRODUCT_DIMENSIONS
            WHERE LINEID = p_LINEID;
   END P_Delete;

   PROCEDURE P_Insert_ByProductMaster (
      p_INVENTORY_ITEM_ID   IN DSS_PRODUCT_DIMENSIONS.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE        IN DSS_PRODUCT_DIMENSIONS.PRODUCT_CODE%TYPE,
      p_ITEM_TYPE           IN DSS_PRODUCT_DIMENSIONS.ITEM_TYPE%TYPE,
      p_LENGTH1             IN DSS_PRODUCT_DIMENSIONS.LENGTH1%TYPE,
      p_WIDTH1              IN DSS_PRODUCT_DIMENSIONS.WIDTH1%TYPE,
      p_HEIGHT1             IN DSS_PRODUCT_DIMENSIONS.HEIGHT1%TYPE,
      p_UOM1                IN DSS_PRODUCT_DIMENSIONS.UOM1%TYPE,
      p_LENGTH2             IN DSS_PRODUCT_DIMENSIONS.LENGTH2%TYPE,
      p_WIDTH2              IN DSS_PRODUCT_DIMENSIONS.WIDTH2%TYPE,
      p_HEIGHT2             IN DSS_PRODUCT_DIMENSIONS.HEIGHT2%TYPE,
      p_UOM2                IN DSS_PRODUCT_DIMENSIONS.UOM2%TYPE,
      p_LENGTH3             IN DSS_PRODUCT_DIMENSIONS.LENGTH3%TYPE,
      p_WIDTH3              IN DSS_PRODUCT_DIMENSIONS.WIDTH3%TYPE,
      p_HEIGHT3             IN DSS_PRODUCT_DIMENSIONS.HEIGHT3%TYPE,
      p_UOM3                IN DSS_PRODUCT_DIMENSIONS.UOM3%TYPE,
      p_CATEGORY_ID         IN DSS_PRODUCT_DIMENSIONS.CATEGORY_ID%TYPE,
      p_BRAND               IN DSS_PRODUCT_DIMENSIONS.BRAND%TYPE,
      p_MODEL               IN DSS_PRODUCT_DIMENSIONS.MODEL%TYPE,
      p_COLOR               IN DSS_PRODUCT_DIMENSIONS.COLOR%TYPE,
      p_DENSITY             IN DSS_PRODUCT_DIMENSIONS.DENSITY%TYPE,
      p_HARDNESS            IN DSS_PRODUCT_DIMENSIONS.HARDNESS%TYPE,
      p_THICKNESS           IN DSS_PRODUCT_DIMENSIONS.THICKNESS%TYPE,
      p_TRANSPARANCY        IN DSS_PRODUCT_DIMENSIONS.TRANSPARANCY%TYPE,
      p_MATERIAL            IN DSS_PRODUCT_DIMENSIONS.MATERIAL%TYPE,
      p_TEXTURE             IN DSS_PRODUCT_DIMENSIONS.TEXTURE%TYPE,
      p_LAYER               IN DSS_PRODUCT_DIMENSIONS.LAYER%TYPE,
      p_FEATURES            IN DSS_PRODUCT_DIMENSIONS.FEATURES%TYPE,
      p_CREATE_BY           IN DSS_PRODUCT_DIMENSIONS.CREATE_BY%TYPE)
   AS
      v_seq   NUMBER;
   BEGIN
      SELECT NVL (MAX (lineid), 0) INTO v_seq FROM DSS_PRODUCT_DIMENSIONS;

      INSERT INTO DSS_PRODUCT_DIMENSIONS (LINEID,
                                          OPERATING_UNIT,
                                          ORGANIZATION_ID,
                                          INVENTORY_ITEM_ID,
                                          PRODUCT_CODE,
                                          DESCRIPTION,
                                          ITEM_TYPE,
                                          LENGTH1,
                                          WIDTH1,
                                          HEIGHT1,
                                          UOM1,
                                          LENGTH2,
                                          WIDTH2,
                                          HEIGHT2,
                                          UOM2,
                                          LENGTH3,
                                          WIDTH3,
                                          HEIGHT3,
                                          UOM3,
                                          CATEGORY_ID,
                                          BRAND,
                                          MODEL,
                                          COLOR,
                                          DENSITY,
                                          HARDNESS,
                                          THICKNESS,
                                          TRANSPARANCY,
                                          MATERIAL,
                                          TEXTURE,
                                          LAYER,
                                          FEATURES,
                                          STATUS,
                                          ACTIVE,
                                          CREATE_DATE,
                                          CREATE_BY)
         (SELECT v_seq + ROWNUM,
                 OPERATING_UNIT,
                 ORGANIZATION_ID,
                 INVENTORY_ITEM_ID,
                 PRODUCT_CODE,
                 DESCRIPTION,
                 p_ITEM_TYPE,
                 p_LENGTH1,
                 p_WIDTH1,
                 p_HEIGHT1,
                 p_UOM1,
                 p_LENGTH2,
                 p_WIDTH2,
                 p_HEIGHT2,
                 p_UOM2,
                 p_LENGTH3,
                 p_WIDTH3,
                 p_HEIGHT3,
                 p_UOM3,
                 p_CATEGORY_ID,
                 p_BRAND,
                 p_MODEL,
                 p_COLOR,
                 p_DENSITY,
                 p_HARDNESS,
                 p_THICKNESS,
                 p_TRANSPARANCY,
                 p_MATERIAL,
                 p_TEXTURE,
                 p_LAYER,
                 p_FEATURES,
                 '',
                 'Y',
                 SYSDATE,                                    -- p_CREATE_DATE,
                 p_CREATE_BY
            FROM DSS_PRODUCTS
           WHERE     INVENTORY_ITEM_ID = p_INVENTORY_ITEM_ID
                 AND PRODUCT_CODE = p_PRODUCT_CODE);
   END P_Insert_ByProductMaster;


   PROCEDURE P_Update_ByProduct (
      p_INVENTORY_ITEM_ID   IN DSS_PRODUCT_DIMENSIONS.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE        IN DSS_PRODUCT_DIMENSIONS.PRODUCT_CODE%TYPE,
      p_ITEM_TYPE           IN DSS_PRODUCT_DIMENSIONS.ITEM_TYPE%TYPE,
      p_LENGTH1             IN DSS_PRODUCT_DIMENSIONS.LENGTH1%TYPE,
      p_WIDTH1              IN DSS_PRODUCT_DIMENSIONS.WIDTH1%TYPE,
      p_HEIGHT1             IN DSS_PRODUCT_DIMENSIONS.HEIGHT1%TYPE,
      p_UOM1                IN DSS_PRODUCT_DIMENSIONS.UOM1%TYPE,
      p_LENGTH2             IN DSS_PRODUCT_DIMENSIONS.LENGTH2%TYPE,
      p_WIDTH2              IN DSS_PRODUCT_DIMENSIONS.WIDTH2%TYPE,
      p_HEIGHT2             IN DSS_PRODUCT_DIMENSIONS.HEIGHT2%TYPE,
      p_UOM2                IN DSS_PRODUCT_DIMENSIONS.UOM2%TYPE,
      p_LENGTH3             IN DSS_PRODUCT_DIMENSIONS.LENGTH3%TYPE,
      p_WIDTH3              IN DSS_PRODUCT_DIMENSIONS.WIDTH3%TYPE,
      p_HEIGHT3             IN DSS_PRODUCT_DIMENSIONS.HEIGHT3%TYPE,
      p_UOM3                IN DSS_PRODUCT_DIMENSIONS.UOM3%TYPE,
      p_CATEGORY_ID         IN DSS_PRODUCT_DIMENSIONS.CATEGORY_ID%TYPE,
      p_BRAND               IN DSS_PRODUCT_DIMENSIONS.BRAND%TYPE,
      p_MODEL               IN DSS_PRODUCT_DIMENSIONS.MODEL%TYPE,
      p_COLOR               IN DSS_PRODUCT_DIMENSIONS.COLOR%TYPE,
      p_DENSITY             IN DSS_PRODUCT_DIMENSIONS.DENSITY%TYPE,
      p_HARDNESS            IN DSS_PRODUCT_DIMENSIONS.HARDNESS%TYPE,
      p_THICKNESS           IN DSS_PRODUCT_DIMENSIONS.THICKNESS%TYPE,
      p_TRANSPARANCY        IN DSS_PRODUCT_DIMENSIONS.TRANSPARANCY%TYPE,
      p_MATERIAL            IN DSS_PRODUCT_DIMENSIONS.MATERIAL%TYPE,
      p_TEXTURE             IN DSS_PRODUCT_DIMENSIONS.TEXTURE%TYPE,
      p_LAYER               IN DSS_PRODUCT_DIMENSIONS.LAYER%TYPE,
      p_FEATURES            IN DSS_PRODUCT_DIMENSIONS.FEATURES%TYPE,
      p_MODIFY_BY           IN DSS_PRODUCT_DIMENSIONS.MODIFY_BY%TYPE)
   AS
   BEGIN
      UPDATE DSS_PRODUCT_DIMENSIONS
         SET ITEM_TYPE = p_ITEM_TYPE,
             LENGTH1 = p_LENGTH1,
             WIDTH1 = p_WIDTH1,
             HEIGHT1 = p_HEIGHT1,
             UOM1 = p_UOM1,
             LENGTH2 = p_LENGTH2,
             WIDTH2 = p_WIDTH2,
             HEIGHT2 = p_HEIGHT2,
             UOM2 = p_UOM2,
             LENGTH3 = p_LENGTH3,
             WIDTH3 = p_WIDTH3,
             HEIGHT3 = p_HEIGHT3,
             UOM3 = p_UOM3,
             CATEGORY_ID = p_CATEGORY_ID,
             BRAND = p_BRAND,
             MODEL = p_MODEL,
             COLOR = p_COLOR,
             DENSITY = p_DENSITY,
             HARDNESS = p_HARDNESS,
             THICKNESS = p_THICKNESS,
             TRANSPARANCY = p_TRANSPARANCY,
             MATERIAL = p_MATERIAL,
             TEXTURE = p_TEXTURE,
             LAYER = p_LAYER,
             FEATURES = p_FEATURES,
             MODIFY_DATE = SYSDATE,
             MODIFY_BY = p_MODIFY_BY
       WHERE     INVENTORY_ITEM_ID = p_INVENTORY_ITEM_ID
             AND PRODUCT_CODE = p_PRODUCT_CODE;
   END P_Update_ByProduct;
END PKG_DSS_PRODUCT_DIMENSIONS;
/
