DROP PACKAGE DSS.PKG_TK_PRODUCTS_CONFIG;

CREATE OR REPLACE PACKAGE DSS.PKG_TK_PRODUCTS_CONFIG
AS
   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey2 (
      p_ORGANIZATION_ID     IN     TK_PRODUCTS_CONFIG.ORGANIZATION_ID%TYPE,
      p_INVENTORY_ITEM_ID   IN     TK_PRODUCTS_CONFIG.INVENTORY_ITEM_ID%TYPE,
      outCursor                OUT DSS.MYGEN.sqlcur) ; 
      
   PROCEDURE P_LoadByPrimaryKey (
      p_LINEID    IN     TK_PRODUCTS_CONFIG.LINEID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_LINEID                    IN TK_PRODUCTS_CONFIG.LINEID%TYPE,
      p_CONFIGID                  IN TK_PRODUCTS_CONFIG.CONFIGID%TYPE,
      p_CONFIG_NAME               IN TK_PRODUCTS_CONFIG.CONFIG_NAME%TYPE,
      p_OPERATING_UNIT            IN TK_PRODUCTS_CONFIG.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID           IN TK_PRODUCTS_CONFIG.ORGANIZATION_ID%TYPE,
      p_INVENTORY_ITEM_ID         IN TK_PRODUCTS_CONFIG.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE              IN TK_PRODUCTS_CONFIG.PRODUCT_CODE%TYPE,
      p_ALIAS_PRODUCT_CODE        IN TK_PRODUCTS_CONFIG.ALIAS_PRODUCT_CODE%TYPE,
      p_ALIAS_INVENTORY_ITEM_ID   IN TK_PRODUCTS_CONFIG.ALIAS_INVENTORY_ITEM_ID%TYPE,
      p_UNIQUE_KEY                IN TK_PRODUCTS_CONFIG.UNIQUE_KEY%TYPE,
      p_NUMERIC_KEY               IN TK_PRODUCTS_CONFIG.NUMERIC_KEY%TYPE,
      p_CHECK_BARCODE             IN TK_PRODUCTS_CONFIG.CHECK_BARCODE%TYPE,
      p_IMEI_KEY                  IN TK_PRODUCTS_CONFIG.IMEI_KEY%TYPE,
      p_ALLOW_SPECIALCHAR         IN TK_PRODUCTS_CONFIG.ALLOW_SPECIALCHAR%TYPE,
      p_IMEI_LENGTH_MAX           IN TK_PRODUCTS_CONFIG.IMEI_LENGTH_MAX%TYPE,
      p_IMEI_LENGTH_MIN           IN TK_PRODUCTS_CONFIG.IMEI_LENGTH_MIN%TYPE,
      p_REMOVE_LAST_CHAR          IN TK_PRODUCTS_CONFIG.REMOVE_LAST_CHAR%TYPE,
      p_REMOVE_FIRST_CHAR         IN TK_PRODUCTS_CONFIG.REMOVE_FIRST_CHAR%TYPE,
      p_SCAN_REQUIRED             IN TK_PRODUCTS_CONFIG.SCAN_REQUIRED%TYPE,
      p_ALLOWNULL                 IN TK_PRODUCTS_CONFIG.ALLOWNULL%TYPE,
      p_DATA_SYNC                 IN TK_PRODUCTS_CONFIG.DATA_SYNC%TYPE,
      p_IMEI_FUNC1_NAME           IN TK_PRODUCTS_CONFIG.IMEI_FUNC1_NAME%TYPE,
      p_IMEI_FUNC2_NAME           IN TK_PRODUCTS_CONFIG.IMEI_FUNC2_NAME%TYPE,
      p_STATUS                    IN TK_PRODUCTS_CONFIG.STATUS%TYPE,
      p_ENABLED                   IN TK_PRODUCTS_CONFIG.ENABLED%TYPE,
      p_CREATE_BY                 IN TK_PRODUCTS_CONFIG.CREATE_BY%TYPE,
      p_CREATE_DATE               IN TK_PRODUCTS_CONFIG.CREATE_DATE%TYPE,
      p_ATTRIBUTE1                IN TK_PRODUCTS_CONFIG.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2                IN TK_PRODUCTS_CONFIG.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3                IN TK_PRODUCTS_CONFIG.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4                IN TK_PRODUCTS_CONFIG.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5                IN TK_PRODUCTS_CONFIG.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6                IN TK_PRODUCTS_CONFIG.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7                IN TK_PRODUCTS_CONFIG.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8                IN TK_PRODUCTS_CONFIG.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9                IN TK_PRODUCTS_CONFIG.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10               IN TK_PRODUCTS_CONFIG.ATTRIBUTE10%TYPE);

   PROCEDURE P_Insert (
      p_LINEID                    IN OUT TK_PRODUCTS_CONFIG.LINEID%TYPE,
      p_CONFIGID                  IN OUT TK_PRODUCTS_CONFIG.CONFIGID%TYPE,
      p_CONFIG_NAME               IN TK_PRODUCTS_CONFIG.CONFIG_NAME%TYPE,
      p_OPERATING_UNIT            IN TK_PRODUCTS_CONFIG.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID           IN TK_PRODUCTS_CONFIG.ORGANIZATION_ID%TYPE,
      p_INVENTORY_ITEM_ID         IN TK_PRODUCTS_CONFIG.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE              IN TK_PRODUCTS_CONFIG.PRODUCT_CODE%TYPE,
      p_ALIAS_PRODUCT_CODE        IN TK_PRODUCTS_CONFIG.ALIAS_PRODUCT_CODE%TYPE,
      p_ALIAS_INVENTORY_ITEM_ID   IN TK_PRODUCTS_CONFIG.ALIAS_INVENTORY_ITEM_ID%TYPE,
      p_UNIQUE_KEY                IN TK_PRODUCTS_CONFIG.UNIQUE_KEY%TYPE,
      p_NUMERIC_KEY               IN TK_PRODUCTS_CONFIG.NUMERIC_KEY%TYPE,
      p_CHECK_BARCODE             IN TK_PRODUCTS_CONFIG.CHECK_BARCODE%TYPE,
      p_IMEI_KEY                  IN TK_PRODUCTS_CONFIG.IMEI_KEY%TYPE,
      p_ALLOW_SPECIALCHAR         IN TK_PRODUCTS_CONFIG.ALLOW_SPECIALCHAR%TYPE,
      p_IMEI_LENGTH_MAX           IN TK_PRODUCTS_CONFIG.IMEI_LENGTH_MAX%TYPE,
      p_IMEI_LENGTH_MIN           IN TK_PRODUCTS_CONFIG.IMEI_LENGTH_MIN%TYPE,
      p_REMOVE_LAST_CHAR          IN TK_PRODUCTS_CONFIG.REMOVE_LAST_CHAR%TYPE,
      p_REMOVE_FIRST_CHAR         IN TK_PRODUCTS_CONFIG.REMOVE_FIRST_CHAR%TYPE,
      p_SCAN_REQUIRED             IN TK_PRODUCTS_CONFIG.SCAN_REQUIRED%TYPE,
      p_ALLOWNULL                 IN TK_PRODUCTS_CONFIG.ALLOWNULL%TYPE,
      p_DATA_SYNC                 IN TK_PRODUCTS_CONFIG.DATA_SYNC%TYPE,
      p_IMEI_FUNC1_NAME           IN TK_PRODUCTS_CONFIG.IMEI_FUNC1_NAME%TYPE,
      p_IMEI_FUNC2_NAME           IN TK_PRODUCTS_CONFIG.IMEI_FUNC2_NAME%TYPE,
      p_STATUS                    IN TK_PRODUCTS_CONFIG.STATUS%TYPE,
      p_ENABLED                   IN TK_PRODUCTS_CONFIG.ENABLED%TYPE,
      p_CREATE_BY                 IN TK_PRODUCTS_CONFIG.CREATE_BY%TYPE,
      p_CREATE_DATE               IN TK_PRODUCTS_CONFIG.CREATE_DATE%TYPE,
      p_ATTRIBUTE1                IN TK_PRODUCTS_CONFIG.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2                IN TK_PRODUCTS_CONFIG.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3                IN TK_PRODUCTS_CONFIG.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4                IN TK_PRODUCTS_CONFIG.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5                IN TK_PRODUCTS_CONFIG.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6                IN TK_PRODUCTS_CONFIG.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7                IN TK_PRODUCTS_CONFIG.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8                IN TK_PRODUCTS_CONFIG.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9                IN TK_PRODUCTS_CONFIG.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10               IN TK_PRODUCTS_CONFIG.ATTRIBUTE10%TYPE);

   PROCEDURE P_Delete (p_LINEID IN TK_PRODUCTS_CONFIG.LINEID%TYPE);
END PKG_TK_PRODUCTS_CONFIG;
/


DROP PACKAGE BODY DSS.PKG_TK_PRODUCTS_CONFIG;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_TK_PRODUCTS_CONFIG
AS
   PROCEDURE P_LoadByPrimaryKey2 (
      p_ORGANIZATION_ID     IN     TK_PRODUCTS_CONFIG.ORGANIZATION_ID%TYPE,
      p_INVENTORY_ITEM_ID   IN     TK_PRODUCTS_CONFIG.INVENTORY_ITEM_ID%TYPE,
      outCursor                OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT LINEID,
                CONFIGID,
                CONFIG_NAME,
                OPERATING_UNIT,
                ORGANIZATION_ID,
                INVENTORY_ITEM_ID,
                PRODUCT_CODE,
                ALIAS_PRODUCT_CODE,
                ALIAS_INVENTORY_ITEM_ID,
                UNIQUE_KEY,
                NUMERIC_KEY,
                CHECK_BARCODE,
                IMEI_KEY,
                ALLOW_SPECIALCHAR,
                IMEI_LENGTH_MAX,
                IMEI_LENGTH_MIN,
                REMOVE_LAST_CHAR,
                REMOVE_FIRST_CHAR,
                SCAN_REQUIRED,
                ALLOWNULL,
                DATA_SYNC,
                IMEI_FUNC1_NAME,
                IMEI_FUNC2_NAME,
                STATUS,
                ENABLED,
                CREATE_BY,
                CREATE_DATE,
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
           FROM TK_PRODUCTS_CONFIG
          WHERE ORGANIZATION_ID = p_ORGANIZATION_ID 
          and INVENTORY_ITEM_ID = p_INVENTORY_ITEM_ID 
          order by CONFIGID ; 
          
   END P_LoadByPrimaryKey2;



   PROCEDURE P_LoadByPrimaryKey (
      p_LINEID    IN     TK_PRODUCTS_CONFIG.LINEID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT LINEID,
                CONFIGID,
                CONFIG_NAME,
                OPERATING_UNIT,
                ORGANIZATION_ID,
                INVENTORY_ITEM_ID,
                PRODUCT_CODE,
                ALIAS_PRODUCT_CODE,
                ALIAS_INVENTORY_ITEM_ID,
                UNIQUE_KEY,
                NUMERIC_KEY,
                CHECK_BARCODE,
                IMEI_KEY,
                ALLOW_SPECIALCHAR,
                IMEI_LENGTH_MAX,
                IMEI_LENGTH_MIN,
                REMOVE_LAST_CHAR,
                REMOVE_FIRST_CHAR,
                SCAN_REQUIRED,
                ALLOWNULL,
                DATA_SYNC,
                IMEI_FUNC1_NAME,
                IMEI_FUNC2_NAME,
                STATUS,
                ENABLED,
                CREATE_BY,
                CREATE_DATE,
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
           FROM TK_PRODUCTS_CONFIG
          WHERE LINEID = p_LINEID;
   END P_LoadByPrimaryKey;

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT LINEID,
                CONFIGID,
                CONFIG_NAME,
                OPERATING_UNIT,
                ORGANIZATION_ID,
                INVENTORY_ITEM_ID,
                PRODUCT_CODE,
                ALIAS_PRODUCT_CODE,
                ALIAS_INVENTORY_ITEM_ID,
                UNIQUE_KEY,
                NUMERIC_KEY,
                CHECK_BARCODE,
                IMEI_KEY,
                ALLOW_SPECIALCHAR,
                IMEI_LENGTH_MAX,
                IMEI_LENGTH_MIN,
                REMOVE_LAST_CHAR,
                REMOVE_FIRST_CHAR,
                SCAN_REQUIRED,
                ALLOWNULL,
                DATA_SYNC,
                IMEI_FUNC1_NAME,
                IMEI_FUNC2_NAME,
                STATUS,
                ENABLED,
                CREATE_BY,
                CREATE_DATE,
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
           FROM TK_PRODUCTS_CONFIG;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_LINEID                    IN TK_PRODUCTS_CONFIG.LINEID%TYPE,
      p_CONFIGID                  IN TK_PRODUCTS_CONFIG.CONFIGID%TYPE,
      p_CONFIG_NAME               IN TK_PRODUCTS_CONFIG.CONFIG_NAME%TYPE,
      p_OPERATING_UNIT            IN TK_PRODUCTS_CONFIG.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID           IN TK_PRODUCTS_CONFIG.ORGANIZATION_ID%TYPE,
      p_INVENTORY_ITEM_ID         IN TK_PRODUCTS_CONFIG.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE              IN TK_PRODUCTS_CONFIG.PRODUCT_CODE%TYPE,
      p_ALIAS_PRODUCT_CODE        IN TK_PRODUCTS_CONFIG.ALIAS_PRODUCT_CODE%TYPE,
      p_ALIAS_INVENTORY_ITEM_ID   IN TK_PRODUCTS_CONFIG.ALIAS_INVENTORY_ITEM_ID%TYPE,
      p_UNIQUE_KEY                IN TK_PRODUCTS_CONFIG.UNIQUE_KEY%TYPE,
      p_NUMERIC_KEY               IN TK_PRODUCTS_CONFIG.NUMERIC_KEY%TYPE,
      p_CHECK_BARCODE             IN TK_PRODUCTS_CONFIG.CHECK_BARCODE%TYPE,
      p_IMEI_KEY                  IN TK_PRODUCTS_CONFIG.IMEI_KEY%TYPE,
      p_ALLOW_SPECIALCHAR         IN TK_PRODUCTS_CONFIG.ALLOW_SPECIALCHAR%TYPE,
      p_IMEI_LENGTH_MAX           IN TK_PRODUCTS_CONFIG.IMEI_LENGTH_MAX%TYPE,
      p_IMEI_LENGTH_MIN           IN TK_PRODUCTS_CONFIG.IMEI_LENGTH_MIN%TYPE,
      p_REMOVE_LAST_CHAR          IN TK_PRODUCTS_CONFIG.REMOVE_LAST_CHAR%TYPE,
      p_REMOVE_FIRST_CHAR         IN TK_PRODUCTS_CONFIG.REMOVE_FIRST_CHAR%TYPE,
      p_SCAN_REQUIRED             IN TK_PRODUCTS_CONFIG.SCAN_REQUIRED%TYPE,
      p_ALLOWNULL                 IN TK_PRODUCTS_CONFIG.ALLOWNULL%TYPE,
      p_DATA_SYNC                 IN TK_PRODUCTS_CONFIG.DATA_SYNC%TYPE,
      p_IMEI_FUNC1_NAME           IN TK_PRODUCTS_CONFIG.IMEI_FUNC1_NAME%TYPE,
      p_IMEI_FUNC2_NAME           IN TK_PRODUCTS_CONFIG.IMEI_FUNC2_NAME%TYPE,
      p_STATUS                    IN TK_PRODUCTS_CONFIG.STATUS%TYPE,
      p_ENABLED                   IN TK_PRODUCTS_CONFIG.ENABLED%TYPE,
      p_CREATE_BY                 IN TK_PRODUCTS_CONFIG.CREATE_BY%TYPE,
      p_CREATE_DATE               IN TK_PRODUCTS_CONFIG.CREATE_DATE%TYPE,
      p_ATTRIBUTE1                IN TK_PRODUCTS_CONFIG.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2                IN TK_PRODUCTS_CONFIG.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3                IN TK_PRODUCTS_CONFIG.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4                IN TK_PRODUCTS_CONFIG.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5                IN TK_PRODUCTS_CONFIG.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6                IN TK_PRODUCTS_CONFIG.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7                IN TK_PRODUCTS_CONFIG.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8                IN TK_PRODUCTS_CONFIG.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9                IN TK_PRODUCTS_CONFIG.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10               IN TK_PRODUCTS_CONFIG.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      UPDATE TK_PRODUCTS_CONFIG
         SET LINEID = p_LINEID,
             CONFIGID = p_CONFIGID,
             CONFIG_NAME = p_CONFIG_NAME,
             OPERATING_UNIT = p_OPERATING_UNIT,
             ORGANIZATION_ID = p_ORGANIZATION_ID,
             INVENTORY_ITEM_ID = p_INVENTORY_ITEM_ID,
             PRODUCT_CODE = p_PRODUCT_CODE,
             ALIAS_PRODUCT_CODE = p_ALIAS_PRODUCT_CODE,
             ALIAS_INVENTORY_ITEM_ID = p_ALIAS_INVENTORY_ITEM_ID,
             UNIQUE_KEY = p_UNIQUE_KEY,
             NUMERIC_KEY = p_NUMERIC_KEY,
             CHECK_BARCODE = p_CHECK_BARCODE,
             IMEI_KEY = p_IMEI_KEY,
             ALLOW_SPECIALCHAR = p_ALLOW_SPECIALCHAR,
             IMEI_LENGTH_MAX = p_IMEI_LENGTH_MAX,
             IMEI_LENGTH_MIN = p_IMEI_LENGTH_MIN,
             REMOVE_LAST_CHAR = p_REMOVE_LAST_CHAR,
             REMOVE_FIRST_CHAR = p_REMOVE_FIRST_CHAR,
             SCAN_REQUIRED = p_SCAN_REQUIRED,
             ALLOWNULL = p_ALLOWNULL,
             DATA_SYNC = p_DATA_SYNC,
             IMEI_FUNC1_NAME = p_IMEI_FUNC1_NAME,
             IMEI_FUNC2_NAME = p_IMEI_FUNC2_NAME,
             STATUS = p_STATUS,
             ENABLED = p_ENABLED,
             CREATE_BY = p_CREATE_BY,
             CREATE_DATE = SYSDATE,
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
      p_LINEID                    IN OUT TK_PRODUCTS_CONFIG.LINEID%TYPE,
      p_CONFIGID                  IN OUT TK_PRODUCTS_CONFIG.CONFIGID%TYPE,
      p_CONFIG_NAME               IN     TK_PRODUCTS_CONFIG.CONFIG_NAME%TYPE,
      p_OPERATING_UNIT            IN     TK_PRODUCTS_CONFIG.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID           IN     TK_PRODUCTS_CONFIG.ORGANIZATION_ID%TYPE,
      p_INVENTORY_ITEM_ID         IN     TK_PRODUCTS_CONFIG.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE              IN     TK_PRODUCTS_CONFIG.PRODUCT_CODE%TYPE,
      p_ALIAS_PRODUCT_CODE        IN     TK_PRODUCTS_CONFIG.ALIAS_PRODUCT_CODE%TYPE,
      p_ALIAS_INVENTORY_ITEM_ID   IN     TK_PRODUCTS_CONFIG.ALIAS_INVENTORY_ITEM_ID%TYPE,
      p_UNIQUE_KEY                IN     TK_PRODUCTS_CONFIG.UNIQUE_KEY%TYPE,
      p_NUMERIC_KEY               IN     TK_PRODUCTS_CONFIG.NUMERIC_KEY%TYPE,
      p_CHECK_BARCODE             IN     TK_PRODUCTS_CONFIG.CHECK_BARCODE%TYPE,
      p_IMEI_KEY                  IN     TK_PRODUCTS_CONFIG.IMEI_KEY%TYPE,
      p_ALLOW_SPECIALCHAR         IN     TK_PRODUCTS_CONFIG.ALLOW_SPECIALCHAR%TYPE,
      p_IMEI_LENGTH_MAX           IN     TK_PRODUCTS_CONFIG.IMEI_LENGTH_MAX%TYPE,
      p_IMEI_LENGTH_MIN           IN     TK_PRODUCTS_CONFIG.IMEI_LENGTH_MIN%TYPE,
      p_REMOVE_LAST_CHAR          IN     TK_PRODUCTS_CONFIG.REMOVE_LAST_CHAR%TYPE,
      p_REMOVE_FIRST_CHAR         IN     TK_PRODUCTS_CONFIG.REMOVE_FIRST_CHAR%TYPE,
      p_SCAN_REQUIRED             IN     TK_PRODUCTS_CONFIG.SCAN_REQUIRED%TYPE,
      p_ALLOWNULL                 IN     TK_PRODUCTS_CONFIG.ALLOWNULL%TYPE,
      p_DATA_SYNC                 IN     TK_PRODUCTS_CONFIG.DATA_SYNC%TYPE,
      p_IMEI_FUNC1_NAME           IN     TK_PRODUCTS_CONFIG.IMEI_FUNC1_NAME%TYPE,
      p_IMEI_FUNC2_NAME           IN     TK_PRODUCTS_CONFIG.IMEI_FUNC2_NAME%TYPE,
      p_STATUS                    IN     TK_PRODUCTS_CONFIG.STATUS%TYPE,
      p_ENABLED                   IN     TK_PRODUCTS_CONFIG.ENABLED%TYPE,
      p_CREATE_BY                 IN     TK_PRODUCTS_CONFIG.CREATE_BY%TYPE,
      p_CREATE_DATE               IN     TK_PRODUCTS_CONFIG.CREATE_DATE%TYPE,
      p_ATTRIBUTE1                IN     TK_PRODUCTS_CONFIG.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2                IN     TK_PRODUCTS_CONFIG.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3                IN     TK_PRODUCTS_CONFIG.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4                IN     TK_PRODUCTS_CONFIG.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5                IN     TK_PRODUCTS_CONFIG.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6                IN     TK_PRODUCTS_CONFIG.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7                IN     TK_PRODUCTS_CONFIG.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8                IN     TK_PRODUCTS_CONFIG.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9                IN     TK_PRODUCTS_CONFIG.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10               IN     TK_PRODUCTS_CONFIG.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      p_LINEID := SEQ_PRODUCTS_CONFIG.NEXTVAL;

      SELECT NVL (MAX (CONFIGID), 0) + 1
        INTO p_CONFIGID
        FROM TK_PRODUCTS_CONFIG
       WHERE     ORGANIZATION_ID = P_ORGANIZATION_ID
             AND INVENTORY_ITEM_ID = P_INVENTORY_ITEM_ID;

      INSERT INTO TK_PRODUCTS_CONFIG (LINEID,
                                      CONFIGID,
                                      CONFIG_NAME,
                                      OPERATING_UNIT,
                                      ORGANIZATION_ID,
                                      INVENTORY_ITEM_ID,
                                      PRODUCT_CODE,
                                      ALIAS_PRODUCT_CODE,
                                      ALIAS_INVENTORY_ITEM_ID,
                                      UNIQUE_KEY,
                                      NUMERIC_KEY,
                                      CHECK_BARCODE,
                                      IMEI_KEY,
                                      ALLOW_SPECIALCHAR,
                                      IMEI_LENGTH_MAX,
                                      IMEI_LENGTH_MIN,
                                      REMOVE_LAST_CHAR,
                                      REMOVE_FIRST_CHAR,
                                      SCAN_REQUIRED,
                                      ALLOWNULL,
                                      DATA_SYNC,
                                      IMEI_FUNC1_NAME,
                                      IMEI_FUNC2_NAME,
                                      STATUS,
                                      ENABLED,
                                      CREATE_BY,
                                      CREATE_DATE,
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
                   p_CONFIGID,
                   p_CONFIG_NAME,
                   p_OPERATING_UNIT,
                   p_ORGANIZATION_ID,
                   p_INVENTORY_ITEM_ID,
                   p_PRODUCT_CODE,
                   p_ALIAS_PRODUCT_CODE,
                   p_ALIAS_INVENTORY_ITEM_ID,
                   p_UNIQUE_KEY,
                   p_NUMERIC_KEY,
                   p_CHECK_BARCODE,
                   p_IMEI_KEY,
                   p_ALLOW_SPECIALCHAR,
                   p_IMEI_LENGTH_MAX,
                   p_IMEI_LENGTH_MIN,
                   p_REMOVE_LAST_CHAR,
                   p_REMOVE_FIRST_CHAR,
                   p_SCAN_REQUIRED,
                   p_ALLOWNULL,
                   p_DATA_SYNC,
                   p_IMEI_FUNC1_NAME,
                   p_IMEI_FUNC2_NAME,
                   p_STATUS,
                   p_ENABLED,
                   p_CREATE_BY,
                   SYSDATE,
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

   PROCEDURE P_Delete (p_LINEID IN TK_PRODUCTS_CONFIG.LINEID%TYPE)
   IS
   BEGIN
      DELETE FROM TK_PRODUCTS_CONFIG
            WHERE LINEID = p_LINEID;
   END P_Delete;
END PKG_TK_PRODUCTS_CONFIG;
/
