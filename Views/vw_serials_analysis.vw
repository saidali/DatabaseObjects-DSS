DROP VIEW DSS.VW_SERIALS_ANALYSIS;

CREATE OR REPLACE FORCE VIEW DSS.VW_SERIALS_ANALYSIS
(
    ORGANIZATION_ID
   ,INVENTORY_ITEM_ID
   ,PRODUCT_CODE
   ,COLUMNINDEX
   ,ISLUHNKEY
   ,NUMERIC_KEY
   ,ALLOW_SPECIALCHAR
   ,KEYLENGTH
   ,MATCHED_REC
)
AS
    SELECT 'Axiom' ORGANIZATION_ID
          ,INVENTORY_ITEM_ID
          ,PRODUCT_CODE
          ,ColumnIndex
          ,ISLUHNKEY
          ,NUMERIC_KEY
          ,ALLOW_SPECIALCHAR
          ,KEYLENGTH
          ,COUNT(*) MATCHED_REC
    FROM (SELECT ORGANIZATION_ID
                ,INVENTORY_ITEM_ID
                ,PRODUCT_CODE
                ,COLUMNINDEX
                     ColumnIndex
                ,PKG_LUHN.ISLUHNKEY(SERIALKEY)
                     ISLUHNKEY
                ,CASE
                     WHEN REGEXP_REPLACE(SERIALKEY, '^\d*$', 'X') = 'X'
                     THEN
                         1
                     ELSE
                         0
                 END
                     NUMERIC_KEY
                ,CASE
                     WHEN REGEXP_REPLACE(SERIALKEY, '^[a-zA-Z0-9]*$', 'X') =
                          'X'
                     THEN
                         0
                     ELSE
                         1
                 END
                     ALLOW_SPECIALCHAR
                ,LENGTH(SERIALKEY)
                     KEYLENGTH
          FROM DSS_ORDER_SCAN_SERIALS PARTITION(SERIALS_2018_Q1)
          WHERE COLUMNINDEX = 1)
    GROUP BY ---ORGANIZATION_ID,
             INVENTORY_ITEM_ID
            ,PRODUCT_CODE
            ,ColumnIndex
            ,ISLUHNKEY
            ,NUMERIC_KEY
            ,ALLOW_SPECIALCHAR
            ,KEYLENGTH;


GRANT SELECT ON DSS.VW_SERIALS_ANALYSIS TO SELDATA;
