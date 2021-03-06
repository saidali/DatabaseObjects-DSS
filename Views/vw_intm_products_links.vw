DROP VIEW DSS.VW_INTM_PRODUCTS_LINKS;

CREATE OR REPLACE FORCE VIEW DSS.VW_INTM_PRODUCTS_LINKS
(
    ORGANIZATION_ID
   ,INVENTORY_ITEM_ID
   ,KEY_FORMAT
)
AS
    SELECT ORGANIZATION_ID
          ,INVENTORY_ITEM_ID
          ,LISTAGG(KEY_FORMAT, '#')
           WITHIN GROUP (ORDER BY
                             ORGANIZATION_ID, INVENTORY_ITEM_ID, CONFIGID)
               AS KEY_FORMAT
    FROM (SELECT ORGANIZATION_ID
                ,INVENTORY_ITEM_ID
                ,CONFIGID
                ,CONFIGID || ',' || UNIQUE_KEY || ',' || NUMERIC_KEY || ','
                 || IMEI_KEY || ',' || ALLOW_SPECIALCHAR || ',' ||
                 IMEI_LENGTH_MAX || ',' || IMEI_LENGTH_MIN || ',' ||
                 ALLOWNULL
                     KEY_FORMAT
          FROM TK_PRODUCTS_CONFIG
          ORDER BY ORGANIZATION_ID, INVENTORY_ITEM_ID, CONFIGID)
    GROUP BY ORGANIZATION_ID, INVENTORY_ITEM_ID;


GRANT SELECT ON DSS.VW_INTM_PRODUCTS_LINKS TO SELDATA;
