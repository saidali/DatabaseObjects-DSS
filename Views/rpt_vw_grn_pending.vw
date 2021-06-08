DROP VIEW DSS.RPT_VW_GRN_PENDING;

CREATE OR REPLACE FORCE VIEW DSS.RPT_VW_GRN_PENDING
(
    SHIPMENT_HEADER_ID
   ,OPERATING_UNIT
   ,SHIP_TO_ORG_ID
   ,DESTINATION
   ,GRN_NUM
   ,PO_NUM
   ,ITEM_ID
   ,PRODUCT_CODE
   ,DESCRIPTION
   ,BRAND_CODE
   ,MODEL_CODE
   ,CATEGORY_CODE
   ,CODE_DESCRIPTION
   ,QUANTITY_SHIPPED
   ,QUANTITY_RECEIVED
   ,SCANNED
   ,WMS_YN
   ,CREATION_DATE
   ,SCAN_BY
)
AS
    SELECT SHIPMENT_HEADER_ID
          ,OPERATING_UNIT
          ,SHIP_TO_ORG_ID
          ,DESTINATION
          ,GRN_NUM
          ,PO_NUM
          ,ITEM_ID
          ,PRODUCT_CODE
          ,DESCRIPTION
          ,BRAND_CODE
          ,MODEL_CODE
          ,CATEGORY_CODE
          ,CODE_DESCRIPTION
          ,QUANTITY_SHIPPED
          ,QUANTITY_RECEIVED
          ,SCANNED
          ,CASE
               WHEN EXISTS
                        (SELECT 1
                         FROM VBI_TRN_GRN_HEAD@WMS GH
                         WHERE GH.VTGH_PO_SYS_ID = SHIP_TO_ORG_ID
                               AND GH.VTGH_PO_DOC_NO = PO_NUM)
               THEN
                   'Y'
               ELSE
                   'N'
           END
               WMS_YN
          ,CREATION_DATE
          ,CASE WHEN SCANNED = 0 THEN 'N/A' ELSE SCAN_BY END
               SCAN_BY
    FROM (SELECT H.SHIPMENT_HEADER_ID
                ,OPERATING_UNIT
                ,SHIP_TO_ORG_ID
                ,L.TO_SUBINVENTORY
                     DESTINATION
                ,RECEIPT_NUM
                     GRN_NUM
                ,SEGMENT1
                     PO_NUM
                ,ITEM_ID
                ,PRODUCT_CODE
                ,DESCRIPTION
                ,BRAND_CODE
                ,MODEL_CODE
                ,CATEGORY_CODE
                ,cat.CODE_DESCRIPTION
                ,SUM(QUANTITY_SHIPPED)
                     QUANTITY_SHIPPED
                ,SUM(QUANTITY_RECEIVED)
                     QUANTITY_RECEIVED
                ,(SELECT COUNT(*)
                  FROM DSS_ORDER_SCAN_SERIALS
                  WHERE ORGANIZATION_ID = H.SHIP_TO_ORG_ID
                        AND ORDER_NUMBER = H.RECEIPT_NUM
                        AND INVENTORY_ITEM_ID = L.ITEM_ID)
                     SCANNED
                ,TRUNC(H.CREATION_DATE)
                     CREATION_DATE
                ,NVL(OH.CREATE_BY, 'N/A')
                     SCAN_BY
          FROM SYN_RCV_SHIPMENT_HEADERS H
               LEFT JOIN SYN_RCV_SHIPMENT_LINES L
                   ON H.SHIPMENT_HEADER_ID = L.SHIPMENT_HEADER_ID
               LEFT JOIN PO_HEADERS_ALL@AXMAPPS PO
                   ON L.PO_HEADER_ID = PO.PO_HEADER_ID
               LEFT JOIN DSS_PRODUCTS P
                   ON P.ORGANIZATION_ID = H.SHIP_TO_ORG_ID
                      AND P.INVENTORY_ITEM_ID = L.ITEM_ID
               LEFT JOIN DSS_CATEGORY_INFO cat
                   ON p.CATEGORY_CODE = cat.CODEVALUE
               LEFT JOIN DSS_ORDER_SCAN_HEADER OH
                   ON OH.ORDER_TYPE = 'GRN'
                      AND OH.ORDER_NUMBER = H.RECEIPT_NUM
                      AND OH.SCR_ORGANIZATION_ID = H.SHIP_TO_ORG_ID
          WHERE TRUNC(H.CREATION_DATE) >= TRUNC(SYSDATE - 7)
                -- AND OPERATING_UNIT = '103'
                AND P.BRAND_CODE IN ('SAM'
                                    ,'APL'
                                    ,'HUA'
                                    ,'NOK'
                                    ,'LNV'
                                    ,'LEN'
                                    ,'ALC'
                                    ,'HNR')
                AND CATEGORY_CODE IN ('01', '03')
          GROUP BY H.SHIPMENT_HEADER_ID
                  ,OPERATING_UNIT
                  ,L.TO_SUBINVENTORY
                  ,SHIP_TO_ORG_ID
                  ,RECEIPT_NUM
                  ,SEGMENT1
                  ,ITEM_ID
                  ,PRODUCT_CODE
                  ,DESCRIPTION
                  ,BRAND_CODE
                  ,MODEL_CODE
                  ,CATEGORY_CODE
                  ,cat.CODE_DESCRIPTION
                  ,TRUNC(H.CREATION_DATE)
                  ,OH.CREATE_BY)
    WHERE QUANTITY_RECEIVED <> SCANNED
    UNION
    SELECT SHIPMENT_HEADER_ID
          ,OPERATING_UNIT
          ,SHIP_TO_ORG_ID
          ,DESTINATION
          ,GRN_NUM
          ,PO_NUM
          ,ITEM_ID
          ,PRODUCT_CODE
          ,DESCRIPTION
          ,BRAND_CODE
          ,MODEL_CODE
          ,CATEGORY_CODE
          ,CODE_DESCRIPTION
          ,QUANTITY_SHIPPED
          ,QUANTITY_RECEIVED
          ,SCANNED
          ,CASE
               WHEN EXISTS
                        (SELECT 1
                         FROM VBI_TRN_GRN_HEAD@WMS GH
                         WHERE GH.VTGH_PO_SYS_ID = SHIP_TO_ORG_ID
                               AND GH.VTGH_PO_DOC_NO = PO_NUM)
               THEN
                   'Y'
               ELSE
                   'N'
           END
               WMS_YN
          ,CREATION_DATE
          ,CASE WHEN SCANNED = 0 THEN 'N/A' ELSE SCAN_BY END
               SCAN_BY
    FROM (SELECT H.SHIPMENT_HEADER_ID
                ,OPERATING_UNIT
                ,SHIP_TO_ORG_ID
                ,L.TO_SUBINVENTORY
                     DESTINATION
                ,RECEIPT_NUM
                     GRN_NUM
                ,SEGMENT1
                     PO_NUM
                ,ITEM_ID
                ,PRODUCT_CODE
                ,DESCRIPTION
                ,BRAND_CODE
                ,MODEL_CODE
                ,CATEGORY_CODE
                ,cat.CODE_DESCRIPTION
                ,SUM(QUANTITY_SHIPPED)
                     QUANTITY_SHIPPED
                ,SUM(QUANTITY_RECEIVED)
                     QUANTITY_RECEIVED
                ,(SELECT COUNT(*)
                  FROM DSS_ORDER_SCAN_SERIALS
                  WHERE ORGANIZATION_ID = H.SHIP_TO_ORG_ID
                        AND ORDER_NUMBER = H.RECEIPT_NUM
                        AND INVENTORY_ITEM_ID = L.ITEM_ID)
                     SCANNED
                ,TRUNC(H.CREATION_DATE)
                     CREATION_DATE
                ,NVL(OH.CREATE_BY, 'N/A')
                     SCAN_BY
          FROM SYN_RCV_SHIPMENT_HEADERS H
               LEFT JOIN SYN_RCV_SHIPMENT_LINES L
                   ON H.SHIPMENT_HEADER_ID = L.SHIPMENT_HEADER_ID
               LEFT JOIN PO_HEADERS_ALL@AXMAPPS PO
                   ON L.PO_HEADER_ID = PO.PO_HEADER_ID
               LEFT JOIN DSS_PRODUCTS P
                   ON P.ORGANIZATION_ID = H.SHIP_TO_ORG_ID
                      AND P.INVENTORY_ITEM_ID = L.ITEM_ID
               LEFT JOIN DSS_CATEGORY_INFO cat
                   ON p.CATEGORY_CODE = cat.CODEVALUE
               LEFT JOIN DSS_ORDER_SCAN_HEADER OH
                   ON OH.ORDER_TYPE = 'GRN'
                      AND OH.ORDER_NUMBER = H.RECEIPT_NUM
                      AND OH.SCR_ORGANIZATION_ID = H.SHIP_TO_ORG_ID
          WHERE TRUNC(H.CREATION_DATE) >= TRUNC(SYSDATE - 3)
                -- AND OPERATING_UNIT = '103'
                AND P.BRAND_CODE IN ('HUA', 'HNR')
                AND CATEGORY_CODE = '02'
          GROUP BY H.SHIPMENT_HEADER_ID
                  ,OPERATING_UNIT
                  ,L.TO_SUBINVENTORY
                  ,SHIP_TO_ORG_ID
                  ,RECEIPT_NUM
                  ,SEGMENT1
                  ,ITEM_ID
                  ,PRODUCT_CODE
                  ,DESCRIPTION
                  ,BRAND_CODE
                  ,MODEL_CODE
                  ,CATEGORY_CODE
                  ,cat.CODE_DESCRIPTION
                  ,TRUNC(H.CREATION_DATE)
                  ,OH.CREATE_BY)
    WHERE QUANTITY_RECEIVED <> SCANNED
    ORDER BY CREATION_DATE DESC;


GRANT SELECT ON DSS.RPT_VW_GRN_PENDING TO SELDATA;
