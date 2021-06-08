DROP VIEW DSS.VW_INTM_PRODUCT_TO_RULES;

CREATE OR REPLACE FORCE VIEW DSS.VW_INTM_PRODUCT_TO_RULES
(
    KEY_FORMAT
   ,CONFIG_TYPE
)
AS
    SELECT DISTINCT KEY_FORMAT, 'PRODUCT_LEVEL' CONFIG_TYPE
    FROM (SELECT KEYCODE
                ,COUNT(CONFIGID)
                ,LISTAGG(KEY_FORMAT, '#')
                     WITHIN GROUP (ORDER BY KEYCODE, CONFIGID)
                     AS KEY_FORMAT
          FROM (SELECT ORGANIZATION_ID || '-' || INVENTORY_ITEM_ID
                           KEYCODE
                      ,CONFIGID
                      ,CONFIGID || ',' || UNIQUE_KEY || ',' || NUMERIC_KEY ||
                       ',' || IMEI_KEY || ',' || ALLOW_SPECIALCHAR || ',' ||
                       IMEI_LENGTH_MAX || ',' || IMEI_LENGTH_MIN || ',' ||
                       ALLOWNULL
                           KEY_FORMAT
                FROM TK_PRODUCTS_CONFIG
                ORDER BY ORGANIZATION_ID, INVENTORY_ITEM_ID, CONFIGID)
          GROUP BY KEYCODE)
    GROUP BY KEY_FORMAT;


GRANT SELECT ON DSS.VW_INTM_PRODUCT_TO_RULES TO SELDATA;
