DROP VIEW DSS.VW_DSS_TAX_ITEM_MASTER;

CREATE OR REPLACE FORCE VIEW DSS.VW_DSS_TAX_ITEM_MASTER
(
    PRODUCTCODE
   ,INVENTORY_ITEM_ID
   ,ORGANIZATION_ID
   ,CREATION_DATE
   ,LAST_UPDATE_DATE
   ,ATTRIBUTE21
   ,ATTRIBUTE22
)
AS
    (SELECT "SEGMENT1"
           ,"INVENTORY_ITEM_ID"
           ,"ORGANIZATION_ID"
           ,"CREATION_DATE"
           ,"LAST_UPDATE_DATE"
           ,"ATTRIBUTE21"
           ,"ATTRIBUTE22"
     FROM (SELECT segment1
                 ,inventory_item_id
                 ,organization_id
                 ,SYSDATE creation_date
                 ,SYSDATE last_update_date
                 ,a.attribute21
                 ,a.attribute22
           FROM mtl_system_items@AXMAPPS a
           -- WHERE A.ORGANIZATION_ID = '104'
           WHERE attribute21 IS NOT NULL));


GRANT SELECT ON DSS.VW_DSS_TAX_ITEM_MASTER TO SELDATA;
