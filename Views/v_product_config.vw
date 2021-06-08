DROP VIEW DSS.V_PRODUCT_CONFIG;

CREATE OR REPLACE FORCE VIEW DSS.V_PRODUCT_CONFIG
(
    OPERATING_UNIT
   ,ORGANIZATION_ID
   ,INVENTORY_ITEM_ID
   ,PRODUCT_CODE
   ,CONFIGID
   ,CONFIG_NAME
   ,CONFIGURATION_TYPE
   ,CATEGORY_ID
   ,BRAND
   ,CATEGORY_CODE
   ,SUB_CATEGORY_CODE
   ,SUB_SUB_CATEGORY_CODE
   ,PURCHASETYPE
   ,CATEGORY_CONCAT_SEGS
   ,UNIQUE_KEY
   ,NUMERIC_KEY
   ,CHECK_BARCODE
   ,IMEI_KEY
   ,ALLOW_SPECIALCHAR
   ,IMEI_LENGTH_MAX
   ,IMEI_LENGTH_MIN
   ,SCAN_REQUIRED
   ,ENABLED
   ,ALLOWNULL
   ,REMOVE_LAST_CHAR
   ,REMOVE_FIRST_CHAR
   ,IMEI_FUNC1_NAME
   ,IMEI_FUNC2_NAME
   ,PRINTREQUIRED
)
AS
    SELECT PO.OPERATING_UNIT
          ,PO.ORGANIZATION_ID
          ,PO.INVENTORY_ITEM_ID
          ,PO.PRODUCT_CODE
          ,CASE
               WHEN CONFIGPO.LINEID IS NULL
               THEN
                   1
               ELSE
                   ConfigPo.CONFIGID
           END
               CONFIGID
          ,CASE
               WHEN CONFIGPO.LINEID IS NULL
               THEN
                   'Key(1)'
               ELSE
                   ConfigPo.CONFIG_NAME
           END
               CONFIG_NAME
          ,CASE
               WHEN CONFIGPO.LINEID IS NULL
               THEN
                   'Category - Configuration'
               ELSE
                   'Product - Configuration'
           END
               CONFIGURATION_TYPE
          ,ConfigCat.CATEGORY_ID
          ,ConfigCat.BRAND
          ,ConfigCat.CATEGORY_CODE
          ,ConfigCat.SUB_CATEGORY_CODE
          ,ConfigCat.SUB_SUB_CATEGORY_CODE
          ,ConfigCat.PURCHASETYPE
          ,ConfigCat.CATEGORY_CONCAT_SEGS
          ,CASE
               WHEN CONFIGPO.LINEID IS NULL
               THEN
                   ConfigCat.UNIQUE_KEY
               ELSE
                   CONFIGPO.UNIQUE_KEY
           END
               UNIQUE_KEY
          ,CASE
               WHEN CONFIGPO.LINEID IS NULL
               THEN
                   ConfigCat.NUMERIC_KEY
               ELSE
                   CONFIGPO.NUMERIC_KEY
           END
               NUMERIC_KEY
          ,CASE
               WHEN CONFIGPO.LINEID IS NULL
               THEN
                   ConfigCat.CHECK_BARCODE
               ELSE
                   CONFIGPO.CHECK_BARCODE
           END
               CHECK_BARCODE
          ,CASE
               WHEN CONFIGPO.LINEID IS NULL
               THEN
                   ConfigCat.IMEI_KEY
               ELSE
                   CONFIGPO.IMEI_KEY
           END
               IMEI_KEY
          ,CASE
               WHEN CONFIGPO.LINEID IS NULL
               THEN
                   ConfigCat.ALLOW_SPECIALCHAR
               ELSE
                   CONFIGPO.ALLOW_SPECIALCHAR
           END
               ALLOW_SPECIALCHAR
          ,CASE
               WHEN CONFIGPO.LINEID IS NULL
               THEN
                   ConfigCat.IMEI_LENGTH_MAX
               ELSE
                   CONFIGPO.IMEI_LENGTH_MAX
           END
               IMEI_LENGTH_MAX
          ,CASE
               WHEN CONFIGPO.LINEID IS NULL
               THEN
                   ConfigCat.IMEI_LENGTH_MIN
               ELSE
                   CONFIGPO.IMEI_LENGTH_MIN
           END
               IMEI_LENGTH_MIN
          ,CASE
               WHEN CONFIGPO.LINEID IS NULL
               THEN
                   ConfigCat.SCAN_REQUIRED
               ELSE
                   CONFIGPO.SCAN_REQUIRED
           END
               SCAN_REQUIRED
          ,CASE
               WHEN CONFIGPO.LINEID IS NULL
               THEN
                   ConfigCat.ENABLED
               ELSE
                   CONFIGPO.ENABLED
           END
               ENABLED
          ,CASE
               WHEN CONFIGPO.LINEID IS NULL
               THEN
                   ConfigCat.ALLOWNULL
               ELSE
                   CONFIGPO.ALLOWNULL
           END
               ALLOWNULL
          ,ConfigPo.REMOVE_LAST_CHAR
          ,ConfigPo.REMOVE_FIRST_CHAR
          ,ConfigPo.IMEI_FUNC1_NAME
          ,ConfigPo.IMEI_FUNC2_NAME
          ,CASE
               WHEN CONFIGPO.LINEID IS NULL
               THEN
                   ConfigCat.ATTRIBUTE10
               ELSE
                   CONFIGPO.ATTRIBUTE10
           END
               PRINTREQUIRED
    FROM DSS_PRODUCTS PO
         LEFT OUTER JOIN TK_PRODUCTS_CONFIG ConfigPo
             ON PO.INVENTORY_ITEM_ID = ConfigPo.INVENTORY_ITEM_ID
                AND PO.ORGANIZATION_ID = ConfigPo.ORGANIZATION_ID
         LEFT OUTER JOIN TK_CATEGORIES_CONFIG ConfigCat
             ON PO.CATEGORY_ID = ConfigCat.CATEGORY_ID;


GRANT SELECT ON DSS.V_PRODUCT_CONFIG TO SELDATA;
