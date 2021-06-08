DROP PACKAGE DSS.PKG_DSS_SALES_UPLD_TEMP;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_SALES_UPLD_TEMP
AS
 TYPE TY_SALES_UPLD_TEMP IS TABLE OF DSS_SALES_UPLD_TEMP%ROWTYPE ; 

   TYPE TY_UPLOADID IS TABLE OF DSS_SALES_UPLD_TEMP.UPLOADID%TYPE
                          INDEX BY BINARY_INTEGER;

   TYPE TY_LINEID IS TABLE OF DSS_SALES_UPLD_TEMP.LINEID%TYPE
                        INDEX BY BINARY_INTEGER;

   TYPE TY_LINENUM IS TABLE OF DSS_SALES_UPLD_TEMP.LINENUM%TYPE
                         INDEX BY BINARY_INTEGER;

   TYPE TY_OPERATING_UNIT IS TABLE OF DSS_SALES_UPLD_TEMP.OPERATING_UNIT%TYPE
                                INDEX BY BINARY_INTEGER;

   TYPE TY_ORGANIZATION_ID
      IS TABLE OF DSS_SALES_UPLD_TEMP.ORGANIZATION_ID%TYPE
            INDEX BY BINARY_INTEGER;

   TYPE TY_LOCATION_CODE IS TABLE OF DSS_SALES_UPLD_TEMP.LOCATION_CODE%TYPE
                               INDEX BY BINARY_INTEGER;

   TYPE TY_TRANSACTION_NO IS TABLE OF DSS_SALES_UPLD_TEMP.TRANSACTION_NO%TYPE
                                INDEX BY BINARY_INTEGER;

   TYPE TY_TRANSACTION_DATE
      IS TABLE OF DSS_SALES_UPLD_TEMP.TRANSACTION_DATE%TYPE
            INDEX BY BINARY_INTEGER;

   TYPE TY_TRANSACTION_TYPE
      IS TABLE OF DSS_SALES_UPLD_TEMP.TRANSACTION_TYPE%TYPE
            INDEX BY BINARY_INTEGER;

   TYPE TY_PARTY_CODE IS TABLE OF DSS_SALES_UPLD_TEMP.PARTY_CODE%TYPE
                            INDEX BY BINARY_INTEGER;

   TYPE TY_PARTY_SITE_NUMBER
      IS TABLE OF DSS_SALES_UPLD_TEMP.PARTY_SITE_NUMBER%TYPE
            INDEX BY BINARY_INTEGER;

   TYPE TY_REF_NO1 IS TABLE OF DSS_SALES_UPLD_TEMP.REF_NO1%TYPE
                         INDEX BY BINARY_INTEGER;

   TYPE TY_REF_NO2 IS TABLE OF DSS_SALES_UPLD_TEMP.REF_NO2%TYPE
                         INDEX BY BINARY_INTEGER;

   TYPE TY_INVENTORY_ITEM_ID
      IS TABLE OF DSS_SALES_UPLD_TEMP.INVENTORY_ITEM_ID%TYPE
            INDEX BY BINARY_INTEGER;

   TYPE TY_PRODUCT_CODE IS TABLE OF DSS_SALES_UPLD_TEMP.PRODUCT_CODE%TYPE
                              INDEX BY BINARY_INTEGER;

   TYPE TY_PRODUCT_UOM IS TABLE OF DSS_SALES_UPLD_TEMP.PRODUCT_UOM%TYPE
                             INDEX BY BINARY_INTEGER;

   TYPE TY_QTY IS TABLE OF DSS_SALES_UPLD_TEMP.QTY%TYPE
                     INDEX BY BINARY_INTEGER;

   TYPE TY_LC_PRICE IS TABLE OF DSS_SALES_UPLD_TEMP.LC_PRICE%TYPE
                          INDEX BY BINARY_INTEGER;
   
         TYPE TY_ONHAND_QTY IS TABLE OF DSS_SALES_UPLD_TEMP.ONHAND_QTY%TYPE
                            INDEX BY BINARY_INTEGER;

   TYPE TY_ITEM_TYPE IS TABLE OF DSS_SALES_UPLD_TEMP.ITEM_TYPE%TYPE
                           INDEX BY BINARY_INTEGER;

   TYPE TY_STATUS IS TABLE OF DSS_SALES_UPLD_TEMP.STATUS%TYPE
                        INDEX BY BINARY_INTEGER;

   TYPE TY_STATUS_MESSGAE IS TABLE OF DSS_SALES_UPLD_TEMP.STATUS_MESSGAE%TYPE
                                INDEX BY BINARY_INTEGER;

   TYPE TY_CREATE_DATE IS TABLE OF DSS_SALES_UPLD_TEMP.CREATE_DATE%TYPE
                             INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE1 IS TABLE OF DSS_SALES_UPLD_TEMP.ATTRIBUTE1%TYPE
                            INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE2 IS TABLE OF DSS_SALES_UPLD_TEMP.ATTRIBUTE2%TYPE
                            INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE3 IS TABLE OF DSS_SALES_UPLD_TEMP.ATTRIBUTE3%TYPE
                            INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE4 IS TABLE OF DSS_SALES_UPLD_TEMP.ATTRIBUTE4%TYPE
                            INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE5 IS TABLE OF DSS_SALES_UPLD_TEMP.ATTRIBUTE5%TYPE
                            INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE6 IS TABLE OF DSS_SALES_UPLD_TEMP.ATTRIBUTE6%TYPE
                            INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE7 IS TABLE OF DSS_SALES_UPLD_TEMP.ATTRIBUTE7%TYPE
                            INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE8 IS TABLE OF DSS_SALES_UPLD_TEMP.ATTRIBUTE8%TYPE
                            INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE9 IS TABLE OF DSS_SALES_UPLD_TEMP.ATTRIBUTE9%TYPE
                            INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE10 IS TABLE OF DSS_SALES_UPLD_TEMP.ATTRIBUTE10%TYPE
                             INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE11 IS TABLE OF DSS_SALES_UPLD_TEMP.ATTRIBUTE11%TYPE
                             INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE12 IS TABLE OF DSS_SALES_UPLD_TEMP.ATTRIBUTE12%TYPE
                             INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE13 IS TABLE OF DSS_SALES_UPLD_TEMP.ATTRIBUTE13%TYPE
                             INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE14 IS TABLE OF DSS_SALES_UPLD_TEMP.ATTRIBUTE14%TYPE
                             INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE15 IS TABLE OF DSS_SALES_UPLD_TEMP.ATTRIBUTE15%TYPE
                             INDEX BY BINARY_INTEGER;

   TYPE TY_RESATTRIBUTE1 IS TABLE OF DSS_SALES_UPLD_TEMP.RESATTRIBUTE1%TYPE
                               INDEX BY BINARY_INTEGER;

   TYPE TY_RESATTRIBUTE2 IS TABLE OF DSS_SALES_UPLD_TEMP.RESATTRIBUTE2%TYPE
                               INDEX BY BINARY_INTEGER;

   TYPE TY_RESATTRIBUTE3 IS TABLE OF DSS_SALES_UPLD_TEMP.RESATTRIBUTE3%TYPE
                               INDEX BY BINARY_INTEGER;
                               
    TYPE TY_TAXSTATUS IS TABLE OF DSS_SALES_UPLD_TEMP.TAXSTATUS%TYPE
                               INDEX BY BINARY_INTEGER;
                               
    TYPE TY_TAX_VALUE IS TABLE OF DSS_SALES_UPLD_TEMP.TAX_VALUE%TYPE
                               INDEX BY BINARY_INTEGER;
                               
    TYPE TY_TAX_RATE_ID IS TABLE OF DSS_SALES_UPLD_TEMP.TAX_RATE_ID%TYPE
                               INDEX BY BINARY_INTEGER;
                               
    TYPE TY_TAX_PERCENTAGE IS TABLE OF DSS_SALES_UPLD_TEMP.TAX_PERCENTAGE%TYPE
                               INDEX BY BINARY_INTEGER;
                               
    TYPE TY_TOTAL_PRICE IS TABLE OF DSS_SALES_UPLD_TEMP.TOTAL_PRICE%TYPE
                               INDEX BY BINARY_INTEGER;


   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_LINEID    IN     DSS_SALES_UPLD_TEMP.LINEID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_UPLOADID            IN DSS_SALES_UPLD_TEMP.UPLOADID%TYPE,
      p_LINEID              IN DSS_SALES_UPLD_TEMP.LINEID%TYPE,
      p_LINENUM             IN DSS_SALES_UPLD_TEMP.LINENUM%TYPE,
      p_OPERATING_UNIT      IN DSS_SALES_UPLD_TEMP.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID     IN DSS_SALES_UPLD_TEMP.ORGANIZATION_ID%TYPE,
      p_LOCATION_CODE       IN DSS_SALES_UPLD_TEMP.LOCATION_CODE%TYPE,
      p_TRANSACTION_NO      IN DSS_SALES_UPLD_TEMP.TRANSACTION_NO%TYPE,
      p_TRANSACTION_DATE    IN DSS_SALES_UPLD_TEMP.TRANSACTION_DATE%TYPE,
      p_TRANSACTION_TYPE    IN DSS_SALES_UPLD_TEMP.TRANSACTION_TYPE%TYPE,
      p_PARTY_CODE          IN DSS_SALES_UPLD_TEMP.PARTY_CODE%TYPE,
      p_PARTY_SITE_NUMBER   IN DSS_SALES_UPLD_TEMP.PARTY_SITE_NUMBER%TYPE,
      p_REF_NO1             IN DSS_SALES_UPLD_TEMP.REF_NO1%TYPE,
      p_REF_NO2             IN DSS_SALES_UPLD_TEMP.REF_NO2%TYPE,
      p_INVENTORY_ITEM_ID   IN DSS_SALES_UPLD_TEMP.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE        IN DSS_SALES_UPLD_TEMP.PRODUCT_CODE%TYPE,
      p_PRODUCT_UOM         IN DSS_SALES_UPLD_TEMP.PRODUCT_UOM%TYPE,
      p_QTY                 IN DSS_SALES_UPLD_TEMP.QTY%TYPE,
      p_LC_PRICE            IN DSS_SALES_UPLD_TEMP.LC_PRICE%TYPE,
      p_ONHAND_QTY          IN DSS_SALES_UPLD_TEMP.ONHAND_QTY%TYPE,
      p_ITEM_TYPE           IN DSS_SALES_UPLD_TEMP.ITEM_TYPE%TYPE,
      p_STATUS              IN DSS_SALES_UPLD_TEMP.STATUS%TYPE,
      p_STATUS_MESSGAE      IN DSS_SALES_UPLD_TEMP.STATUS_MESSGAE%TYPE,
      p_CREATE_DATE         IN DSS_SALES_UPLD_TEMP.CREATE_DATE%TYPE,
      p_ATTRIBUTE1          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE10%TYPE,
      p_ATTRIBUTE11         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE11%TYPE,
      p_ATTRIBUTE12         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE12%TYPE,
      p_ATTRIBUTE13         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE13%TYPE,
      p_ATTRIBUTE14         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE14%TYPE,
      p_ATTRIBUTE15         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE15%TYPE,
      p_RESATTRIBUTE1       IN DSS_SALES_UPLD_TEMP.RESATTRIBUTE1%TYPE,
      p_RESATTRIBUTE2       IN DSS_SALES_UPLD_TEMP.RESATTRIBUTE2%TYPE,
      p_RESATTRIBUTE3       IN DSS_SALES_UPLD_TEMP.RESATTRIBUTE3%TYPE,
      p_TAXSTATUS           IN DSS_SALES_UPLD_TEMP.TAXSTATUS%TYPE,
      p_TAX_VALUE           IN DSS_SALES_UPLD_TEMP.TAX_VALUE%TYPE,
      p_TAX_RATE_ID         IN DSS_SALES_UPLD_TEMP.TAX_RATE_ID%TYPE,
      p_TAX_PERCENTAGE      IN DSS_SALES_UPLD_TEMP.TAX_PERCENTAGE%TYPE,
      p_TOTAL_PRICE         IN DSS_SALES_UPLD_TEMP.TOTAL_PRICE%TYPE 
      );
   PROCEDURE P_Insert (
      p_UPLOADID            IN DSS_SALES_UPLD_TEMP.UPLOADID%TYPE,
      p_LINEID              IN DSS_SALES_UPLD_TEMP.LINEID%TYPE,
      p_LINENUM             IN DSS_SALES_UPLD_TEMP.LINENUM%TYPE,
      p_OPERATING_UNIT      IN DSS_SALES_UPLD_TEMP.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID     IN DSS_SALES_UPLD_TEMP.ORGANIZATION_ID%TYPE,
      p_LOCATION_CODE       IN DSS_SALES_UPLD_TEMP.LOCATION_CODE%TYPE,
      p_TRANSACTION_NO      IN DSS_SALES_UPLD_TEMP.TRANSACTION_NO%TYPE,
      p_TRANSACTION_DATE    IN DSS_SALES_UPLD_TEMP.TRANSACTION_DATE%TYPE,
      p_TRANSACTION_TYPE    IN DSS_SALES_UPLD_TEMP.TRANSACTION_TYPE%TYPE,
      p_PARTY_CODE          IN DSS_SALES_UPLD_TEMP.PARTY_CODE%TYPE,
      p_PARTY_SITE_NUMBER   IN DSS_SALES_UPLD_TEMP.PARTY_SITE_NUMBER%TYPE,
      p_REF_NO1             IN DSS_SALES_UPLD_TEMP.REF_NO1%TYPE,
      p_REF_NO2             IN DSS_SALES_UPLD_TEMP.REF_NO2%TYPE,
      p_INVENTORY_ITEM_ID   IN DSS_SALES_UPLD_TEMP.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE        IN DSS_SALES_UPLD_TEMP.PRODUCT_CODE%TYPE,
      p_PRODUCT_UOM         IN DSS_SALES_UPLD_TEMP.PRODUCT_UOM%TYPE,
      p_QTY                 IN DSS_SALES_UPLD_TEMP.QTY%TYPE,
      p_LC_PRICE            IN DSS_SALES_UPLD_TEMP.LC_PRICE%TYPE,
      p_ONHAND_QTY          IN DSS_SALES_UPLD_TEMP.ONHAND_QTY%TYPE,
      p_ITEM_TYPE           IN DSS_SALES_UPLD_TEMP.ITEM_TYPE%TYPE,
      p_STATUS              IN DSS_SALES_UPLD_TEMP.STATUS%TYPE,
      p_STATUS_MESSGAE      IN DSS_SALES_UPLD_TEMP.STATUS_MESSGAE%TYPE,
      p_CREATE_DATE         IN DSS_SALES_UPLD_TEMP.CREATE_DATE%TYPE,
      p_ATTRIBUTE1          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE10%TYPE,
      p_ATTRIBUTE11         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE11%TYPE,
      p_ATTRIBUTE12         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE12%TYPE,
      p_ATTRIBUTE13         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE13%TYPE,
      p_ATTRIBUTE14         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE14%TYPE,
      p_ATTRIBUTE15         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE15%TYPE,
      p_RESATTRIBUTE1       IN DSS_SALES_UPLD_TEMP.RESATTRIBUTE1%TYPE,
      p_RESATTRIBUTE2       IN DSS_SALES_UPLD_TEMP.RESATTRIBUTE2%TYPE,
      p_RESATTRIBUTE3       IN DSS_SALES_UPLD_TEMP.RESATTRIBUTE3%TYPE,
      p_TAXSTATUS           IN DSS_SALES_UPLD_TEMP.TAXSTATUS%TYPE,
      p_TAX_VALUE        IN    DSS_SALES_UPLD_TEMP.TAX_VALUE%TYPE,
      p_TAX_RATE_ID        IN    DSS_SALES_UPLD_TEMP.TAX_RATE_ID%TYPE,
      p_TAX_PERCENTAGE        IN    DSS_SALES_UPLD_TEMP.TAX_PERCENTAGE%TYPE,
      p_TOTAL_PRICE        IN    DSS_SALES_UPLD_TEMP.TOTAL_PRICE%TYPE
      );
   PROCEDURE P_Delete (p_LINEID IN DSS_SALES_UPLD_TEMP.LINEID%TYPE);
   
      PROCEDURE P_BULK_Insert (A_UPLOADID            IN TY_UPLOADID,
                            A_LINEID              IN TY_LINEID,
                            A_LINENUM             IN TY_LINENUM,
                            A_OPERATING_UNIT      IN TY_OPERATING_UNIT,
                            A_ORGANIZATION_ID     IN TY_ORGANIZATION_ID,
                            A_LOCATION_CODE       IN TY_LOCATION_CODE,
                            A_TRANSACTION_NO      IN TY_TRANSACTION_NO,
                            A_TRANSACTION_DATE    IN TY_TRANSACTION_DATE,
                            A_TRANSACTION_TYPE    IN TY_TRANSACTION_TYPE,
                            A_PARTY_CODE          IN TY_PARTY_CODE,
                            A_PARTY_SITE_NUMBER   IN TY_PARTY_SITE_NUMBER,
                            A_REF_NO1             IN TY_REF_NO1,
                            A_REF_NO2             IN TY_REF_NO2,
                            A_INVENTORY_ITEM_ID   IN TY_INVENTORY_ITEM_ID,
                            A_PRODUCT_CODE        IN TY_PRODUCT_CODE,
                            A_PRODUCT_UOM         IN TY_PRODUCT_UOM,
                            A_QTY                 IN TY_QTY,
                            A_LC_PRICE            IN TY_LC_PRICE,
                            A_ONHAND_QTY          IN TY_ONHAND_QTY,
                            A_ITEM_TYPE           IN TY_ITEM_TYPE,
                            A_STATUS              IN TY_STATUS,
                            A_STATUS_MESSGAE      IN TY_STATUS_MESSGAE,
                            A_CREATE_DATE         IN TY_CREATE_DATE,
                            A_ATTRIBUTE1          IN TY_ATTRIBUTE1,
                            A_ATTRIBUTE2          IN TY_ATTRIBUTE2,
                            A_ATTRIBUTE3          IN TY_ATTRIBUTE3,
                            A_ATTRIBUTE4          IN TY_ATTRIBUTE4,
                            A_ATTRIBUTE5          IN TY_ATTRIBUTE5,
                            A_ATTRIBUTE6          IN TY_ATTRIBUTE6,
                            A_ATTRIBUTE7          IN TY_ATTRIBUTE7,
                            A_ATTRIBUTE8          IN TY_ATTRIBUTE8,
                            A_ATTRIBUTE9          IN TY_ATTRIBUTE9,
                            A_ATTRIBUTE10         IN TY_ATTRIBUTE10,
                            A_ATTRIBUTE11         IN TY_ATTRIBUTE11,
                            A_ATTRIBUTE12         IN TY_ATTRIBUTE12,
                            A_ATTRIBUTE13         IN TY_ATTRIBUTE13,
                            A_ATTRIBUTE14         IN TY_ATTRIBUTE14,
                            A_ATTRIBUTE15         IN TY_ATTRIBUTE15,
                            A_RESATTRIBUTE1       IN TY_RESATTRIBUTE1,
                            A_RESATTRIBUTE2       IN TY_RESATTRIBUTE2,
                            A_RESATTRIBUTE3       IN TY_RESATTRIBUTE3,
                            A_TAXSTATUS           IN TY_TAXSTATUS,
                            A_TAX_VALUE           IN TY_TAX_VALUE,
                            A_TAX_RATE_ID           IN TY_TAX_RATE_ID,
                            A_TAX_PERCENTAGE          IN TY_TAX_PERCENTAGE,
                            A_TOTAL_PRICE          IN TY_TOTAL_PRICE
                            );
   PROCEDURE P_POST (p_UPLOADID     IN DSS_SALES_UPLD_TEMP.UPLOADID%TYPE,
                     p_ATTRIBUTE1   IN DSS_SALES_UPLD_TEMP.ATTRIBUTE1%TYPE) ;
                     
 PROCEDURE P_Delete2 (p_UPLOADID            IN DSS_SALES_UPLD_TEMP.UPLOADID%TYPE) ;                      
                                                 
END PKG_DSS_SALES_UPLD_TEMP;
/


DROP PACKAGE BODY DSS.PKG_DSS_SALES_UPLD_TEMP;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_SALES_UPLD_TEMP
AS
   PROCEDURE P_LOADBYPRIMARYKEY (
      P_LINEID    IN     DSS_SALES_UPLD_TEMP.LINEID%TYPE,
      OUTCURSOR      OUT DSS.MYGEN.SQLCUR)
   IS
   BEGIN
      OPEN OUTCURSOR FOR
         SELECT UPLOADID,
                LINEID,
                LINENUM,
                OPERATING_UNIT,
                ORGANIZATION_ID,
                LOCATION_CODE,
                TRANSACTION_NO,
                TRANSACTION_DATE,
                TRANSACTION_TYPE,
                PARTY_CODE,
                PARTY_SITE_NUMBER,
                REF_NO1,
                REF_NO2,
                INVENTORY_ITEM_ID,
                PRODUCT_CODE,
                PRODUCT_UOM,
                QTY,
                LC_PRICE,
                ONHAND_QTY,
                ITEM_TYPE,
                STATUS,
                STATUS_MESSGAE,
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
                ATTRIBUTE10,
                ATTRIBUTE11,
                ATTRIBUTE12,
                ATTRIBUTE13,
                ATTRIBUTE14,
                ATTRIBUTE15,
                RESATTRIBUTE1,
                RESATTRIBUTE2,
                RESATTRIBUTE3,
                TAXSTATUS,
                TAX_VALUE,
                TAX_RATE_ID,
                TAX_PERCENTAGE,
                TOTAL_PRICE
           FROM DSS_SALES_UPLD_TEMP
          WHERE LINEID = P_LINEID;
   END P_LOADBYPRIMARYKEY;

   PROCEDURE P_LOADALL (OUTCURSOR OUT DSS.MYGEN.SQLCUR)
   IS
   BEGIN
      OPEN OUTCURSOR FOR
         SELECT UPLOADID,
                LINEID,
                LINENUM,
                OPERATING_UNIT,
                ORGANIZATION_ID,
                LOCATION_CODE,
                TRANSACTION_NO,
                TRANSACTION_DATE,
                TRANSACTION_TYPE,
                PARTY_CODE,
                PARTY_SITE_NUMBER,
                REF_NO1,
                REF_NO2,
                INVENTORY_ITEM_ID,
                PRODUCT_CODE,
                PRODUCT_UOM,
                QTY,
                LC_PRICE,
                ONHAND_QTY,
                ITEM_TYPE,
                STATUS,
                STATUS_MESSGAE,
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
                ATTRIBUTE10,
                ATTRIBUTE11,
                ATTRIBUTE12,
                ATTRIBUTE13,
                ATTRIBUTE14,
                ATTRIBUTE15,
                RESATTRIBUTE1,
                RESATTRIBUTE2,
                RESATTRIBUTE3,
                TAXSTATUS,
                TAX_VALUE,
                TAX_RATE_ID,
                TAX_PERCENTAGE,
                TOTAL_PRICE
           FROM DSS_SALES_UPLD_TEMP;
   END P_LOADALL;


   PROCEDURE P_UPDATE (
      P_UPLOADID            IN DSS_SALES_UPLD_TEMP.UPLOADID%TYPE,
      P_LINEID              IN DSS_SALES_UPLD_TEMP.LINEID%TYPE,
      P_LINENUM             IN DSS_SALES_UPLD_TEMP.LINENUM%TYPE,
      P_OPERATING_UNIT      IN DSS_SALES_UPLD_TEMP.OPERATING_UNIT%TYPE,
      P_ORGANIZATION_ID     IN DSS_SALES_UPLD_TEMP.ORGANIZATION_ID%TYPE,
      P_LOCATION_CODE       IN DSS_SALES_UPLD_TEMP.LOCATION_CODE%TYPE,
      P_TRANSACTION_NO      IN DSS_SALES_UPLD_TEMP.TRANSACTION_NO%TYPE,
      P_TRANSACTION_DATE    IN DSS_SALES_UPLD_TEMP.TRANSACTION_DATE%TYPE,
      P_TRANSACTION_TYPE    IN DSS_SALES_UPLD_TEMP.TRANSACTION_TYPE%TYPE,
      P_PARTY_CODE          IN DSS_SALES_UPLD_TEMP.PARTY_CODE%TYPE,
      P_PARTY_SITE_NUMBER   IN DSS_SALES_UPLD_TEMP.PARTY_SITE_NUMBER%TYPE,
      P_REF_NO1             IN DSS_SALES_UPLD_TEMP.REF_NO1%TYPE,
      P_REF_NO2             IN DSS_SALES_UPLD_TEMP.REF_NO2%TYPE,
      P_INVENTORY_ITEM_ID   IN DSS_SALES_UPLD_TEMP.INVENTORY_ITEM_ID%TYPE,
      P_PRODUCT_CODE        IN DSS_SALES_UPLD_TEMP.PRODUCT_CODE%TYPE,
      P_PRODUCT_UOM         IN DSS_SALES_UPLD_TEMP.PRODUCT_UOM%TYPE,
      P_QTY                 IN DSS_SALES_UPLD_TEMP.QTY%TYPE,
      P_LC_PRICE            IN DSS_SALES_UPLD_TEMP.LC_PRICE%TYPE,
      P_ONHAND_QTY          IN DSS_SALES_UPLD_TEMP.ONHAND_QTY%TYPE,
      P_ITEM_TYPE           IN DSS_SALES_UPLD_TEMP.ITEM_TYPE%TYPE,
      P_STATUS              IN DSS_SALES_UPLD_TEMP.STATUS%TYPE,
      P_STATUS_MESSGAE      IN DSS_SALES_UPLD_TEMP.STATUS_MESSGAE%TYPE,
      P_CREATE_DATE         IN DSS_SALES_UPLD_TEMP.CREATE_DATE%TYPE,
      P_ATTRIBUTE1          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE1%TYPE,
      P_ATTRIBUTE2          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE2%TYPE,
      P_ATTRIBUTE3          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE3%TYPE,
      P_ATTRIBUTE4          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE4%TYPE,
      P_ATTRIBUTE5          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE5%TYPE,
      P_ATTRIBUTE6          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE6%TYPE,
      P_ATTRIBUTE7          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE7%TYPE,
      P_ATTRIBUTE8          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE8%TYPE,
      P_ATTRIBUTE9          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE9%TYPE,
      P_ATTRIBUTE10         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE10%TYPE,
      P_ATTRIBUTE11         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE11%TYPE,
      P_ATTRIBUTE12         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE12%TYPE,
      P_ATTRIBUTE13         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE13%TYPE,
      P_ATTRIBUTE14         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE14%TYPE,
      P_ATTRIBUTE15         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE15%TYPE,
      P_RESATTRIBUTE1       IN DSS_SALES_UPLD_TEMP.RESATTRIBUTE1%TYPE,
      P_RESATTRIBUTE2       IN DSS_SALES_UPLD_TEMP.RESATTRIBUTE2%TYPE,
      P_RESATTRIBUTE3       IN DSS_SALES_UPLD_TEMP.RESATTRIBUTE3%TYPE,
      P_TAXSTATUS           IN DSS_SALES_UPLD_TEMP.TAXSTATUS%TYPE,
      P_TAX_VALUE           IN DSS_SALES_UPLD_TEMP.TAX_VALUE%TYPE,
      P_TAX_RATE_ID         IN DSS_SALES_UPLD_TEMP.TAX_RATE_ID%TYPE,
      P_TAX_PERCENTAGE      IN DSS_SALES_UPLD_TEMP.TAX_PERCENTAGE%TYPE,
      P_TOTAL_PRICE         IN DSS_SALES_UPLD_TEMP.TOTAL_PRICE%TYPE)
   IS
   BEGIN
      UPDATE DSS_SALES_UPLD_TEMP
         SET UPLOADID = P_UPLOADID,
             LINEID = P_LINEID,
             LINENUM = P_LINENUM,
             OPERATING_UNIT = P_OPERATING_UNIT,
             ORGANIZATION_ID = P_ORGANIZATION_ID,
             LOCATION_CODE = P_LOCATION_CODE,
             TRANSACTION_NO = P_TRANSACTION_NO,
             TRANSACTION_DATE = P_TRANSACTION_DATE,
             TRANSACTION_TYPE = P_TRANSACTION_TYPE,
             PARTY_CODE = P_PARTY_CODE,
             PARTY_SITE_NUMBER = P_PARTY_SITE_NUMBER,
             REF_NO1 = P_REF_NO1,
             REF_NO2 = P_REF_NO2,
             INVENTORY_ITEM_ID = P_INVENTORY_ITEM_ID,
             PRODUCT_CODE = P_PRODUCT_CODE,
             PRODUCT_UOM = P_PRODUCT_UOM,
             QTY = P_QTY,
             LC_PRICE = P_LC_PRICE,
             ONHAND_QTY = P_ONHAND_QTY,
             ITEM_TYPE = P_ITEM_TYPE,
             STATUS = P_STATUS,
             STATUS_MESSGAE = P_STATUS_MESSGAE,
             CREATE_DATE = P_CREATE_DATE,
             ATTRIBUTE1 = P_ATTRIBUTE1,
             ATTRIBUTE2 = P_ATTRIBUTE2,
             ATTRIBUTE3 = P_ATTRIBUTE3,
             ATTRIBUTE4 = P_ATTRIBUTE4,
             ATTRIBUTE5 = P_ATTRIBUTE5,
             ATTRIBUTE6 = P_ATTRIBUTE6,
             ATTRIBUTE7 = P_ATTRIBUTE7,
             ATTRIBUTE8 = P_ATTRIBUTE8,
             ATTRIBUTE9 = P_ATTRIBUTE9,
             ATTRIBUTE10 = P_ATTRIBUTE10,
             ATTRIBUTE11 = P_ATTRIBUTE11,
             ATTRIBUTE12 = P_ATTRIBUTE12,
             ATTRIBUTE13 = P_ATTRIBUTE13,
             ATTRIBUTE14 = P_ATTRIBUTE14,
             ATTRIBUTE15 = P_ATTRIBUTE15,
             RESATTRIBUTE1 = P_RESATTRIBUTE1,
             RESATTRIBUTE2 = P_RESATTRIBUTE2,
             RESATTRIBUTE3 = P_RESATTRIBUTE3,
             TAXSTATUS = P_TAXSTATUS,
             TAX_VALUE = P_TAX_VALUE,
             TAX_RATE_ID = P_TAX_RATE_ID,
             TAX_PERCENTAGE = P_TAX_PERCENTAGE,
             TOTAL_PRICE = P_TOTAL_PRICE
       WHERE LINEID = P_LINEID;
   END P_UPDATE;


   PROCEDURE P_INSERT (
      P_UPLOADID            IN DSS_SALES_UPLD_TEMP.UPLOADID%TYPE,
      P_LINEID              IN DSS_SALES_UPLD_TEMP.LINEID%TYPE,
      P_LINENUM             IN DSS_SALES_UPLD_TEMP.LINENUM%TYPE,
      P_OPERATING_UNIT      IN DSS_SALES_UPLD_TEMP.OPERATING_UNIT%TYPE,
      P_ORGANIZATION_ID     IN DSS_SALES_UPLD_TEMP.ORGANIZATION_ID%TYPE,
      P_LOCATION_CODE       IN DSS_SALES_UPLD_TEMP.LOCATION_CODE%TYPE,
      P_TRANSACTION_NO      IN DSS_SALES_UPLD_TEMP.TRANSACTION_NO%TYPE,
      P_TRANSACTION_DATE    IN DSS_SALES_UPLD_TEMP.TRANSACTION_DATE%TYPE,
      P_TRANSACTION_TYPE    IN DSS_SALES_UPLD_TEMP.TRANSACTION_TYPE%TYPE,
      P_PARTY_CODE          IN DSS_SALES_UPLD_TEMP.PARTY_CODE%TYPE,
      P_PARTY_SITE_NUMBER   IN DSS_SALES_UPLD_TEMP.PARTY_SITE_NUMBER%TYPE,
      P_REF_NO1             IN DSS_SALES_UPLD_TEMP.REF_NO1%TYPE,
      P_REF_NO2             IN DSS_SALES_UPLD_TEMP.REF_NO2%TYPE,
      P_INVENTORY_ITEM_ID   IN DSS_SALES_UPLD_TEMP.INVENTORY_ITEM_ID%TYPE,
      P_PRODUCT_CODE        IN DSS_SALES_UPLD_TEMP.PRODUCT_CODE%TYPE,
      P_PRODUCT_UOM         IN DSS_SALES_UPLD_TEMP.PRODUCT_UOM%TYPE,
      P_QTY                 IN DSS_SALES_UPLD_TEMP.QTY%TYPE,
      P_LC_PRICE            IN DSS_SALES_UPLD_TEMP.LC_PRICE%TYPE,
      P_ONHAND_QTY          IN DSS_SALES_UPLD_TEMP.ONHAND_QTY%TYPE,
      P_ITEM_TYPE           IN DSS_SALES_UPLD_TEMP.ITEM_TYPE%TYPE,
      P_STATUS              IN DSS_SALES_UPLD_TEMP.STATUS%TYPE,
      P_STATUS_MESSGAE      IN DSS_SALES_UPLD_TEMP.STATUS_MESSGAE%TYPE,
      P_CREATE_DATE         IN DSS_SALES_UPLD_TEMP.CREATE_DATE%TYPE,
      P_ATTRIBUTE1          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE1%TYPE,
      P_ATTRIBUTE2          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE2%TYPE,
      P_ATTRIBUTE3          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE3%TYPE,
      P_ATTRIBUTE4          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE4%TYPE,
      P_ATTRIBUTE5          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE5%TYPE,
      P_ATTRIBUTE6          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE6%TYPE,
      P_ATTRIBUTE7          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE7%TYPE,
      P_ATTRIBUTE8          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE8%TYPE,
      P_ATTRIBUTE9          IN DSS_SALES_UPLD_TEMP.ATTRIBUTE9%TYPE,
      P_ATTRIBUTE10         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE10%TYPE,
      P_ATTRIBUTE11         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE11%TYPE,
      P_ATTRIBUTE12         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE12%TYPE,
      P_ATTRIBUTE13         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE13%TYPE,
      P_ATTRIBUTE14         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE14%TYPE,
      P_ATTRIBUTE15         IN DSS_SALES_UPLD_TEMP.ATTRIBUTE15%TYPE,
      P_RESATTRIBUTE1       IN DSS_SALES_UPLD_TEMP.RESATTRIBUTE1%TYPE,
      P_RESATTRIBUTE2       IN DSS_SALES_UPLD_TEMP.RESATTRIBUTE2%TYPE,
      P_RESATTRIBUTE3       IN DSS_SALES_UPLD_TEMP.RESATTRIBUTE3%TYPE,
      P_TAXSTATUS           IN DSS_SALES_UPLD_TEMP.TAXSTATUS%TYPE,
      P_TAX_VALUE           IN DSS_SALES_UPLD_TEMP.TAX_VALUE%TYPE,
      P_TAX_RATE_ID         IN DSS_SALES_UPLD_TEMP.TAX_RATE_ID%TYPE,
      P_TAX_PERCENTAGE      IN DSS_SALES_UPLD_TEMP.TAX_PERCENTAGE%TYPE,
      P_TOTAL_PRICE         IN DSS_SALES_UPLD_TEMP.TOTAL_PRICE%TYPE)
   IS
   BEGIN
      INSERT INTO DSS_SALES_UPLD_TEMP (UPLOADID,
                                       LINEID,
                                       LINENUM,
                                       OPERATING_UNIT,
                                       ORGANIZATION_ID,
                                       LOCATION_CODE,
                                       TRANSACTION_NO,
                                       TRANSACTION_DATE,
                                       TRANSACTION_TYPE,
                                       PARTY_CODE,
                                       PARTY_SITE_NUMBER,
                                       REF_NO1,
                                       REF_NO2,
                                       INVENTORY_ITEM_ID,
                                       PRODUCT_CODE,
                                       PRODUCT_UOM,
                                       QTY,
                                       LC_PRICE,
                                       ONHAND_QTY,
                                       ITEM_TYPE,
                                       STATUS,
                                       STATUS_MESSGAE,
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
                                       ATTRIBUTE10,
                                       ATTRIBUTE11,
                                       ATTRIBUTE12,
                                       ATTRIBUTE13,
                                       ATTRIBUTE14,
                                       ATTRIBUTE15,
                                       RESATTRIBUTE1,
                                       RESATTRIBUTE2,
                                       RESATTRIBUTE3,
                                       TAXSTATUS,
                                       TAX_VALUE,
                                       TAX_RATE_ID,
                                       TAX_PERCENTAGE,
                                       TOTAL_PRICE)
           VALUES (P_UPLOADID,
                   P_LINEID,
                   P_LINENUM,
                   P_OPERATING_UNIT,
                   P_ORGANIZATION_ID,
                   P_LOCATION_CODE,
                   P_TRANSACTION_NO,
                   P_TRANSACTION_DATE,
                   P_TRANSACTION_TYPE,
                   P_PARTY_CODE,
                   P_PARTY_SITE_NUMBER,
                   P_REF_NO1,
                   P_REF_NO2,
                   P_INVENTORY_ITEM_ID,
                   P_PRODUCT_CODE,
                   P_PRODUCT_UOM,
                   P_QTY,
                   P_LC_PRICE,
                   P_ONHAND_QTY,
                   P_ITEM_TYPE,
                   P_STATUS,
                   P_STATUS_MESSGAE,
                   P_CREATE_DATE,
                   P_ATTRIBUTE1,
                   P_ATTRIBUTE2,
                   P_ATTRIBUTE3,
                   P_ATTRIBUTE4,
                   P_ATTRIBUTE5,
                   P_ATTRIBUTE6,
                   P_ATTRIBUTE7,
                   P_ATTRIBUTE8,
                   P_ATTRIBUTE9,
                   P_ATTRIBUTE10,
                   P_ATTRIBUTE11,
                   P_ATTRIBUTE12,
                   P_ATTRIBUTE13,
                   P_ATTRIBUTE14,
                   P_ATTRIBUTE15,
                   P_RESATTRIBUTE1,
                   P_RESATTRIBUTE2,
                   P_RESATTRIBUTE3,
                   P_TAXSTATUS,
                   P_TAX_VALUE,
                   P_TAX_RATE_ID,
                   P_TAX_PERCENTAGE,
                   P_TOTAL_PRICE);
   END P_INSERT;

   PROCEDURE P_DELETE (P_LINEID IN DSS_SALES_UPLD_TEMP.LINEID%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_SALES_UPLD_TEMP
            WHERE LINEID = P_LINEID;
   END P_DELETE;

   PROCEDURE P_DELETE2 (P_UPLOADID IN DSS_SALES_UPLD_TEMP.UPLOADID%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_SALES_UPLD_TEMP
            WHERE UPLOADID = P_UPLOADID;
   END P_DELETE2;

   PROCEDURE P_BULK_INSERT (A_UPLOADID            IN TY_UPLOADID,
                            A_LINEID              IN TY_LINEID,
                            A_LINENUM             IN TY_LINENUM,
                            A_OPERATING_UNIT      IN TY_OPERATING_UNIT,
                            A_ORGANIZATION_ID     IN TY_ORGANIZATION_ID,
                            A_LOCATION_CODE       IN TY_LOCATION_CODE,
                            A_TRANSACTION_NO      IN TY_TRANSACTION_NO,
                            A_TRANSACTION_DATE    IN TY_TRANSACTION_DATE,
                            A_TRANSACTION_TYPE    IN TY_TRANSACTION_TYPE,
                            A_PARTY_CODE          IN TY_PARTY_CODE,
                            A_PARTY_SITE_NUMBER   IN TY_PARTY_SITE_NUMBER,
                            A_REF_NO1             IN TY_REF_NO1,
                            A_REF_NO2             IN TY_REF_NO2,
                            A_INVENTORY_ITEM_ID   IN TY_INVENTORY_ITEM_ID,
                            A_PRODUCT_CODE        IN TY_PRODUCT_CODE,
                            A_PRODUCT_UOM         IN TY_PRODUCT_UOM,
                            A_QTY                 IN TY_QTY,
                            A_LC_PRICE            IN TY_LC_PRICE,
                            A_ONHAND_QTY          IN TY_ONHAND_QTY,
                            A_ITEM_TYPE           IN TY_ITEM_TYPE,
                            A_STATUS              IN TY_STATUS,
                            A_STATUS_MESSGAE      IN TY_STATUS_MESSGAE,
                            A_CREATE_DATE         IN TY_CREATE_DATE,
                            A_ATTRIBUTE1          IN TY_ATTRIBUTE1,
                            A_ATTRIBUTE2          IN TY_ATTRIBUTE2,
                            A_ATTRIBUTE3          IN TY_ATTRIBUTE3,
                            A_ATTRIBUTE4          IN TY_ATTRIBUTE4,
                            A_ATTRIBUTE5          IN TY_ATTRIBUTE5,
                            A_ATTRIBUTE6          IN TY_ATTRIBUTE6,
                            A_ATTRIBUTE7          IN TY_ATTRIBUTE7,
                            A_ATTRIBUTE8          IN TY_ATTRIBUTE8,
                            A_ATTRIBUTE9          IN TY_ATTRIBUTE9,
                            A_ATTRIBUTE10         IN TY_ATTRIBUTE10,
                            A_ATTRIBUTE11         IN TY_ATTRIBUTE11,
                            A_ATTRIBUTE12         IN TY_ATTRIBUTE12,
                            A_ATTRIBUTE13         IN TY_ATTRIBUTE13,
                            A_ATTRIBUTE14         IN TY_ATTRIBUTE14,
                            A_ATTRIBUTE15         IN TY_ATTRIBUTE15,
                            A_RESATTRIBUTE1       IN TY_RESATTRIBUTE1,
                            A_RESATTRIBUTE2       IN TY_RESATTRIBUTE2,
                            A_RESATTRIBUTE3       IN TY_RESATTRIBUTE3,
                            A_TAXSTATUS           IN TY_TAXSTATUS,
                            A_TAX_VALUE           IN TY_TAX_VALUE,
                            A_TAX_RATE_ID         IN TY_TAX_RATE_ID,
                            A_TAX_PERCENTAGE      IN TY_TAX_PERCENTAGE,
                            A_TOTAL_PRICE         IN TY_TOTAL_PRICE)
   IS
      VUPLOAD_ID   NUMBER;
   BEGIN
      ---VUPLOAD_ID := SEC_SALES_UPLD_TEMP_HD.NEXTVAL;

FOR indx IN 1 .. A_TRANSACTION_DATE.COUNT
                   -- FOR indx IN A_TRANSACTION_DATE.FIRST .. A_TRANSACTION_DATE.LAST
                    LOOP                        
                        
                        if( trunc(A_TRANSACTION_DATE(indx)) <= trunc(sysdate-14)) then
                            --raise error
                                   Raise_Application_Error (-20343, 'Transcation date is lesser than 2 weeks. ');
                                   --Raise_Application_Error (-20343, 'Transcation date is lesser than 2 weeks. Date - ' + trunc(A_TRANSACTION_DATE(indx)) + ' ( PRODUCT_CODE : ' +  A_PRODUCT_CODE(indx) + ')');
                        end if;
                        
                    END LOOP;

      FORALL I IN A_UPLOADID.FIRST .. A_UPLOADID.LAST
         INSERT INTO DSS_SALES_UPLD_TEMP (UPLOADID,
                                          LINEID,
                                          LINENUM,
                                          OPERATING_UNIT,
                                          ORGANIZATION_ID,
                                          LOCATION_CODE,
                                          TRANSACTION_NO,
                                          TRANSACTION_DATE,
                                          TRANSACTION_TYPE,
                                          PARTY_CODE,
                                          PARTY_SITE_NUMBER,
                                          REF_NO1,
                                          REF_NO2,
                                          INVENTORY_ITEM_ID,
                                          PRODUCT_CODE,
                                          PRODUCT_UOM,
                                          QTY,
                                          LC_PRICE,
                                          ONHAND_QTY,
                                          ITEM_TYPE,
                                          STATUS,
                                          STATUS_MESSGAE,
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
                                          ATTRIBUTE10,
                                          ATTRIBUTE11,
                                          ATTRIBUTE12,
                                          ATTRIBUTE13,
                                          ATTRIBUTE14,
                                          ATTRIBUTE15,
                                          RESATTRIBUTE1,
                                          RESATTRIBUTE2,
                                          RESATTRIBUTE3,
                                          TAXSTATUS,
                                          TAX_VALUE,
                                          TAX_RATE_ID,
                                          TAX_PERCENTAGE,
                                          TOTAL_PRICE)
              VALUES (A_UPLOADID (I),
                      SEQ_SALES_UPLD_TEMP.NEXTVAL,
                      A_LINENUM (I),
                      A_OPERATING_UNIT (I),
                      A_ORGANIZATION_ID (I),
                      A_LOCATION_CODE (I),
                      A_TRANSACTION_NO (I),
                      A_TRANSACTION_DATE (I),
                      A_TRANSACTION_TYPE (I),
                      A_PARTY_CODE (I),
                      A_PARTY_SITE_NUMBER (I),
                      A_REF_NO1 (I),
                      A_REF_NO2 (I),
                      A_INVENTORY_ITEM_ID (I),
                      A_PRODUCT_CODE (I),
                      A_PRODUCT_UOM (I),
                      A_QTY (I),
                      A_LC_PRICE (I),
                      A_ONHAND_QTY (I),
                      A_ITEM_TYPE (I),
                      A_STATUS (I),
                      A_STATUS_MESSGAE (I),
                      A_CREATE_DATE (I),
                      A_ATTRIBUTE1 (I),
                      A_ATTRIBUTE2 (I),
                      A_ATTRIBUTE3 (I),
                      A_ATTRIBUTE4 (I),
                      A_ATTRIBUTE5 (I),
                      A_ATTRIBUTE6 (I),
                      A_ATTRIBUTE7 (I),
                      A_ATTRIBUTE8 (I),
                      A_ATTRIBUTE9 (I),
                      A_ATTRIBUTE10 (I),
                      A_ATTRIBUTE11 (I),
                      A_ATTRIBUTE12 (I),
                      A_ATTRIBUTE13 (I),
                      A_ATTRIBUTE14 (I),
                      A_ATTRIBUTE15 (I),
                      A_RESATTRIBUTE1 (I),
                      A_RESATTRIBUTE2 (I),
                      A_RESATTRIBUTE3 (I),
                      A_TAXSTATUS (I),
                      A_TAX_VALUE (I),
                      A_TAX_RATE_ID (I),
                      A_TAX_PERCENTAGE (I),
                      A_TOTAL_PRICE (I));
   END P_BULK_INSERT;



   PROCEDURE P_POST (P_UPLOADID     IN DSS_SALES_UPLD_TEMP.UPLOADID%TYPE,
                     P_ATTRIBUTE1   IN DSS_SALES_UPLD_TEMP.ATTRIBUTE1%TYPE)
   AS
      P_HEADERID         NUMBER;
      P_TRANSACTION_NO   VARCHAR2 (100);
   BEGIN
      FOR HD
         IN (  SELECT OPERATING_UNIT,
                      ORGANIZATION_ID,
                      LOCATION_CODE,
                      TO_CHAR (TRANSACTION_DATE, 'DD-MON-YYYY')
                         TRANSACTION_DATE,
                      TRANSACTION_TYPE,
                      PARTY_CODE,
                      PARTY_SITE_NUMBER,
                      ('DSS DATA UPLOAD' || UPLOADID) REMARKS,
                      UPLOADID REF_NO1,
                      SUM (QTY * LC_PRICE) NET_AMOUNT,
                      'N' STATUS,
                      'N' INTF_YN,
                      SYSDATE CREATE_DATE,
                      SYSDATE MODIFY_DATE,
                      COUNT (*) NO_OF_LINE
                 --                      TAX_VALUE,
                 --                      TAX_RATE_ID,
                 --                      TAX_PERCENTAGE,
                 --                      TOTAL_PRICE
                 FROM DSS_SALES_UPLD_TEMP
                WHERE UPLOADID = P_UPLOADID
             GROUP BY UPLOADID,
                      OPERATING_UNIT,
                      ORGANIZATION_ID,
                      LOCATION_CODE,
                      TO_CHAR (TRANSACTION_DATE, 'DD-MON-YYYY'),
                      TRANSACTION_TYPE,
                      PARTY_CODE,
                      PARTY_SITE_NUMBER     --                      TAX_VALUE,
                                       --                      TAX_RATE_ID,
                                       --                      TAX_PERCENTAGE,
                                       --                      TOTAL_PRICE
            )
      LOOP
         P_HEADERID := SEQ_SALES_UPLD_HEAD.NEXTVAL;
         P_TRANSACTION_NO :=
               HD.LOCATION_CODE
            || 'U'
            || TRIM (
                  TO_CHAR ( (SEQ_SALES_UPLD_HEADER_TXN.NEXTVAL), '000000000'));

         INSERT INTO DSS_SALES_UPLD_HEAD (HEADERSEQ,
                                          OPERATING_UNIT,
                                          ORGANIZATION_ID,
                                          LOCATION_CODE,
                                          TRANSACTION_NO,
                                          TRANSACTION_DATE,
                                          TRANSACTION_TYPE,
                                          PARTY_CODE,
                                          PARTY_SITE_NUMBER,
                                          REMARKS,
                                          REF_NO1,
                                          NET_AMOUNT,
                                          STATUS,
                                          INTF_YN,
                                          CREATE_DATE,
                                          CREATE_BY,
                                          MODIFY_DATE,
                                          MODIFY_BY,
                                          ATTRIBUTE15)
              VALUES (P_HEADERID,
                      HD.OPERATING_UNIT,
                      HD.ORGANIZATION_ID,
                      HD.LOCATION_CODE,
                      P_TRANSACTION_NO,
                      HD.TRANSACTION_DATE,
                      HD.TRANSACTION_TYPE,
                      HD.PARTY_CODE,
                      HD.PARTY_SITE_NUMBER,
                      HD.REMARKS,
                      HD.REF_NO1,
                      HD.NET_AMOUNT,
                      HD.STATUS,
                      HD.INTF_YN,
                      HD.CREATE_DATE,
                      P_ATTRIBUTE1,
                      HD.MODIFY_DATE,
                      P_ATTRIBUTE1,
                      HD.NO_OF_LINE);

         CASE
            WHEN (HD.TRANSACTION_TYPE = 'MI' OR HD.TRANSACTION_TYPE = 'MR')
            THEN
               INSERT INTO DSS_SALES_UPLD_DTL (HEADERSEQ,
                                               OPERATING_UNIT,
                                               ORGANIZATION_ID,
                                               LOCATION_CODE,
                                               TRANSACTION_NO,
                                               TRANSACTION_DATE,
                                               TRANSACTION_TYPE,
                                               LINE_NUM,
                                               INVENTORY_ITEM_ID,
                                               PRODUCT_CODE,
                                               PRODUCT_UOM,
                                               QTY,
                                               LC_PRICE,
                                               STATUS,
                                               INTF_YN,
                                               CREATE_DATE,
                                               CREATE_BY,
                                               MODIFY_DATE,
                                               MODIFY_BY,
                                               ATTRIBUTE15,
                                               ATTRIBUTE2,
                                               ATTRIBUTE3,
                                               TAX_VALUE,
                                               TAX_RATE_ID,
                                               TAX_PERCENTAGE,
                                               TOTAL_PRICE)
                    SELECT P_HEADERID,
                           OPERATING_UNIT,
                           ORGANIZATION_ID,
                           LOCATION_CODE,
                           P_TRANSACTION_NO,
                           TO_CHAR (TRANSACTION_DATE, 'DD-MON-YYYY'),
                           TRANSACTION_TYPE,
                           ROW_NUMBER ()
                           OVER (
                              PARTITION BY UPLOADID,
                                           OPERATING_UNIT,
                                           ORGANIZATION_ID,
                                           LOCATION_CODE,
                                           TRANSACTION_TYPE,
                                           TO_CHAR (TRANSACTION_DATE,
                                                    'DD-MON-YYYY')
                              ORDER BY PRODUCT_CODE DESC)
                              LINE_NUM,
                           NULL,
                           PRODUCT_CODE,
                           PRODUCT_UOM,
                           SUM (QTY),
                           LC_PRICE,
                           'N' STATUS,
                           'N' INTF_YN,
                           SYSDATE CREATE_DATE,
                           P_ATTRIBUTE1,
                           SYSDATE MODIFY_DATE,
                           P_ATTRIBUTE1,
                           COUNT (*) CNT,
                           ATTRIBUTE2,
                           ATTRIBUTE3,
                           0 TAX_VALUE,
                           0 TAX_RATE_ID,
                           0 TAX_PERCENTAGE,
                           0 TOTAL_PRICE
                      FROM DSS_SALES_UPLD_TEMP
                     WHERE     UPLOADID = P_UPLOADID
                           AND OPERATING_UNIT = HD.OPERATING_UNIT
                           AND ORGANIZATION_ID = HD.ORGANIZATION_ID
                           AND LOCATION_CODE = HD.LOCATION_CODE
                           AND TO_CHAR (TRANSACTION_DATE, 'DD-MON-YYYY') =
                                  HD.TRANSACTION_DATE
                           AND TRANSACTION_TYPE = HD.TRANSACTION_TYPE
                  --                           AND PARTY_CODE = HD.PARTY_CODE
                  --                           AND PARTY_SITE_NUMBER = HD.PARTY_SITE_NUMBER
                  GROUP BY UPLOADID,
                           OPERATING_UNIT,
                           ORGANIZATION_ID,
                           LOCATION_CODE,
                           TO_CHAR (TRANSACTION_DATE, 'DD-MON-YYYY'),
                           TRANSACTION_TYPE,
                           --                           PARTY_CODE,
                           --                           PARTY_SITE_NUMBER,
                           PRODUCT_CODE,
                           LC_PRICE,
                           PRODUCT_UOM,
                           ATTRIBUTE2,
                           ATTRIBUTE3;
            --                           TAX_VALUE,
            --                           TAX_RATE_ID,
            --                           TAX_PERCENTAGE,
            --                           TOTAL_PRICE;
            ELSE
               INSERT INTO DSS_SALES_UPLD_DTL (HEADERSEQ,
                                               OPERATING_UNIT,
                                               ORGANIZATION_ID,
                                               LOCATION_CODE,
                                               TRANSACTION_NO,
                                               TRANSACTION_DATE,
                                               TRANSACTION_TYPE,
                                               LINE_NUM,
                                               INVENTORY_ITEM_ID,
                                               PRODUCT_CODE,
                                               PRODUCT_UOM,
                                               QTY,
                                               LC_PRICE,
                                               STATUS,
                                               INTF_YN,
                                               CREATE_DATE,
                                               CREATE_BY,
                                               MODIFY_DATE,
                                               MODIFY_BY,
                                               ATTRIBUTE15,
                                               TAX_VALUE,
                                               TAX_RATE_ID,
                                               TAX_PERCENTAGE,
                                               TOTAL_PRICE)
                    SELECT DISTINCT
                           P_HEADERID,
                           OPERATING_UNIT,
                           ORGANIZATION_ID,
                           LOCATION_CODE,
                           P_TRANSACTION_NO,
                           TO_CHAR (TRANSACTION_DATE, 'DD-MON-YYYY'),
                           TRANSACTION_TYPE,
                           ROW_NUMBER ()
                           OVER (
                              PARTITION BY UPLOADID,
                                           OPERATING_UNIT,
                                           ORGANIZATION_ID,
                                           LOCATION_CODE,
                                           TRANSACTION_TYPE,
                                           TO_CHAR (TRANSACTION_DATE,
                                                    'DD-MON-YYYY')
                              ORDER BY PRODUCT_CODE DESC)
                              LINE_NUM,
                           NULL,
                           PRODUCT_CODE,
                           PRODUCT_UOM,
                           SUM (QTY),
                           LC_PRICE,
                           'N' STATUS,
                           'N' INTF_YN,
                           SYSDATE CREATE_DATE,
                           P_ATTRIBUTE1,
                           SYSDATE MODIFY_DATE,
                           P_ATTRIBUTE1,
                           COUNT (*) CNT,
                           SUM (TAX_VALUE),
                           TAX_RATE_ID,
                           MAX (TAX_PERCENTAGE), ---CHECK  IF THE SAME RATE HAVING DIFF tAX %
                           SUM (TOTAL_PRICE)
                      FROM DSS_SALES_UPLD_TEMP
                     WHERE     UPLOADID = P_UPLOADID
                           AND OPERATING_UNIT = HD.OPERATING_UNIT
                           AND ORGANIZATION_ID = HD.ORGANIZATION_ID
                           AND LOCATION_CODE = HD.LOCATION_CODE
                           AND TO_CHAR (TRANSACTION_DATE, 'DD-MON-YYYY') =
                                  HD.TRANSACTION_DATE
                           AND TRANSACTION_TYPE = HD.TRANSACTION_TYPE
                           AND PARTY_CODE = HD.PARTY_CODE
                           AND PARTY_SITE_NUMBER = HD.PARTY_SITE_NUMBER
                  GROUP BY UPLOADID,
                           OPERATING_UNIT,
                           ORGANIZATION_ID,
                           LOCATION_CODE,
                           TO_CHAR (TRANSACTION_DATE, 'DD-MON-YYYY'),
                           TRANSACTION_TYPE,
                           PARTY_CODE,
                           PARTY_SITE_NUMBER,
                           PRODUCT_CODE,
                           LC_PRICE,
                           PRODUCT_UOM,
                           --                           TAX_VALUE,
                           TAX_RATE_ID--                           TAX_PERCENTAGE,
                                      --TOTAL_PRICE
               ;
         END CASE;
      END LOOP;

      DELETE FROM DSS_SALES_UPLD_TEMP
            WHERE UPLOADID = P_UPLOADID;

      UPDATE DSS_UPLOAD_HEADER
         SET STATUS = 'C'
       WHERE HEADERID = P_UPLOADID;
   END P_POST;
END PKG_DSS_SALES_UPLD_TEMP;
/
