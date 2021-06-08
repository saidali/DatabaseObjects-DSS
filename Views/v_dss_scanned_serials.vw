DROP VIEW DSS.V_DSS_SCANNED_SERIALS;

CREATE OR REPLACE FORCE VIEW DSS.V_DSS_SCANNED_SERIALS
(
    JOBID
   ,LINEID
   ,OPREATING_UNIT
   ,ORGANIZATION_ID
   ,ORDER_TYPE
   ,ORDER_NUMBER
   ,INVENTORY_ITEM_ID
   ,PRODUCT_CODE
   ,SEQINDEX
   ,KEY1
   ,KEY2
   ,KEY3
   ,KEY4
)
AS
    SELECT JOBID
          ,LINEID
          ,OPREATING_UNIT
          ,ORGANIZATION_ID
          ,ORDER_TYPE
          ,ORDER_NUMBER
          ,INVENTORY_ITEM_ID
          ,PRODUCT_CODE
          ,SEQINDEX
          ,KEY1
          ,KEY2
          ,KEY3
          ,KEY4
    FROM (SELECT JOBID
                ,LINEID
                ,OPREATING_UNIT
                ,ORGANIZATION_ID
                ,ORDER_TYPE
                ,ORDER_NUMBER
                ,INVENTORY_ITEM_ID
                ,PRODUCT_CODE
                ,SERIALKEY
                ,SEQINDEX
                ,COLUMNINDEX
          --SCANID
          FROM DSS_ORDER_SCAN_SERIALS)
         PIVOT (MAX(SERIALKEY)
               FOR COLUMNINDEX
               IN (1 AS KEY1, 2 AS KEY2, 3 AS KEY3, 4 AS KEY4));


GRANT SELECT ON DSS.V_DSS_SCANNED_SERIALS TO SELDATA;
