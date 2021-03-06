DROP VIEW DSS.VW_WH_SCAN_DATE_FOR_DEALERAPP;

CREATE OR REPLACE FORCE VIEW DSS.VW_WH_SCAN_DATE_FOR_DEALERAPP
(
    DEST_ORGANIZATION_ID
   ,CREATE_DATE
   ,PRODUCT_CODE
   ,INVENTORY_ITEM_ID
   ,IMEI
   ,IMEI2
   ,WARRANTY_ENDATE
   ,DESCRIPTION
   ,BRAND_CODE
   ,MODEL_CODE
   ,COLOUR_CODE
)
AS
    SELECT h.DEST_ORGANIZATION_ID
          ,MAX(h.ORDER_DATE) CREATE_DATE
          ,p.PRODUCT_CODE
          ,p.INVENTORY_ITEM_ID
          ,SERIALKEY IMEI
          ,SERIALKEY_REF1 IMEI2
          ,MAX(WARRANTY_ENDATE) WARRANTY_ENDATE
          ,DESCRIPTION
          ,BRAND_CODE
          ,MODEL_CODE
          ,COLOUR_CODE
    FROM DSS_ORDER_SCAN_HEADER H
         INNER JOIN DSS_ORDER_SCAN_LINES L ON H.JOBID = L.JOBID
         INNER JOIN DSS_ORDER_SCAN_SERIALS S
             ON L.LINEID = S.LINEID
                AND L.INVENTORY_ITEM_ID = S.INVENTORY_ITEM_ID
                AND h.jobid = s.jobid
         INNER JOIN DSS_PRODUCTS P
             ON L.INVENTORY_ITEM_ID = P.INVENTORY_ITEM_ID
                AND p.ORGANIZATION_ID = h.DEST_ORGANIZATION_ID
    GROUP BY h.DEST_ORGANIZATION_ID
            ,p.PRODUCT_CODE
            ,p.INVENTORY_ITEM_ID
            ,SERIALKEY
            ,SERIALKEY_REF1
            ,DESCRIPTION
            ,BRAND_CODE
            ,MODEL_CODE
            ,COLOUR_CODE
    ORDER BY CREATE_DATE DESC;


GRANT SELECT ON DSS.VW_WH_SCAN_DATE_FOR_DEALERAPP TO SELDATA;
