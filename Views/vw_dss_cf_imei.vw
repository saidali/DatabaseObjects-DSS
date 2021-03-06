DROP VIEW DSS.VW_DSS_CF_IMEI;

CREATE OR REPLACE FORCE VIEW DSS.VW_DSS_CF_IMEI
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
         LEFT OUTER JOIN VW_SYN_ITEM_BARCODES PB
             ON P.INVENTORY_ITEM_ID = PB.INVENTORY_ITEM_ID
    WHERE 1 = 1
          AND SERIALKEY != NVL(PB.BARCODES, '#NA#') /*
                                                       Get only Last 365 Days of Data
                                                       7-11-2019
                                                      */
          --    AND S.CREATE_DATE >= SYSDATE - 365
          AND S.CREATE_DATE >= SYSDATE - 720
    --AND  SERIALKEY = :SERKY
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


CREATE OR REPLACE SYNONYM CFROTEST.VW_DSS_CF_IMEI FOR DSS.VW_DSS_CF_IMEI;


GRANT SELECT ON DSS.VW_DSS_CF_IMEI TO CFROTEST;

GRANT SELECT ON DSS.VW_DSS_CF_IMEI TO SELDATA;
