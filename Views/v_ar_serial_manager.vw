DROP VIEW DSS.V_AR_SERIAL_MANAGER;

CREATE OR REPLACE FORCE VIEW DSS.V_AR_SERIAL_MANAGER
(
    JOBID
   ,LINEID
   ,SEQINDEX
   ,OPREATING_UNIT
   ,ORGANIZATION_ID
   ,SCR_TYPE
   ,SCR_OPREATING_UNIT
   ,SCR_ORGANIZATION_ID
   ,SCR_LOCATION_CODE
   ,DEST_TYPE
   ,DEST_OPREATING_UNIT
   ,DEST_ORGANIZATION_ID
   ,DEST_LOCATION_CODE
   ,ORDER_TYPE
   ,ORDER_NUMBER
   ,ORDER_REF_NO
   ,ORDER_REF_NO2
   ,ORDER_DATE
   ,KEY1
   ,KEY2
   ,KEY3
   ,KEY4
   ,INVENTORY_ITEM_ID
   ,PRODUCT_CODE
   ,PRODUCT_DESC
   ,BRAND
   ,CAETGORY_ID
   ,CATEGORY_CODE
   ,CATEGORY_DESCRIPTION
   ,SUB_CATEGORY_CODE
   ,SUB_CATEGORY_DESCRIPTION
   ,SUB_SUB_CATEGORY_CODE
   ,SUB_SUB_CATEGORY_DESCRIPTION
   ,SCANTYPE
   ,SCAN_SOURCE
   ,WMS_YN
   ,INTERNAL_YN
   ,WARRANTYPRINT_YN
   ,WARRANTY_YN
   ,WARRANTY_SEQ
   ,WARRANTY_CODE
   ,WARRANTY_STARTDATE
   ,WARRANTY_ENDATE
   ,ACTIVE_YN
   ,INF_YN
   ,INF_DATE
   ,EXPIRY_AFTER
   ,EXPIRY_DATE
   ,STATUS_YN
   ,CREATE_BY
   ,CREATE_DATE
   ,MODIFY_BY
   ,MODIFY_DATE
   ,ORDER_REMARKS
)
AS
    SELECT JOBID
          ,LINEID
          ,SEQINDEX
          ,OPREATING_UNIT
          ,ORGANIZATION_ID
          ,SCR_TYPE
          ,SCR_OPREATING_UNIT
          ,SCR_ORGANIZATION_ID
          ,SCR_LOCATION_CODE
          ,DEST_TYPE
          ,DEST_OPREATING_UNIT
          ,DEST_ORGANIZATION_ID
          ,DEST_LOCATION_CODE
          ,ORDER_TYPE
          ,ORDER_NUMBER
          ,ORDER_REF_NO
          ,ORDER_REF_NO2
          ,ORDER_DATE
          ,KEY1
          ,KEY2
          ,KEY3
          ,KEY4
          ,INVENTORY_ITEM_ID
          ,PRODUCT_CODE
          ,PRODUCT_DESC
          ,BRAND
          ,CAETGORY_ID
          ,CATEGORY_CODE
          ,CATEGORY_DESCRIPTION
          ,SUB_CATEGORY_CODE
          ,SUB_CATEGORY_DESCRIPTION
          ,SUB_SUB_CATEGORY_CODE
          ,SUB_SUB_CATEGORY_DESCRIPTION
          ,SCANTYPE
          ,SCAN_SOURCE
          ,WMS_YN
          ,INTERNAL_YN
          ,WARRANTYPRINT_YN
          ,WARRANTY_YN
          ,WARRANTY_SEQ
          ,WARRANTY_CODE
          ,WARRANTY_STARTDATE
          ,WARRANTY_ENDATE
          ,ACTIVE_YN
          ,INF_YN
          ,INF_DATE
          ,EXPIRY_AFTER
          ,EXPIRY_DATE
          ,STATUS_YN
          ,CREATE_BY
          ,CREATE_DATE
          ,MODIFY_BY
          ,MODIFY_DATE
          ,ORDER_REMARKS
    FROM (SELECT S.JOBID
                ,S.LINEID
                ,S.SEQINDEX
                ,S.COLUMNINDEX
                ,S.OPREATING_UNIT
                ,S.ORGANIZATION_ID
                ,H.SCR_TYPE
                ,H.SCR_OPREATING_UNIT
                ,H.SCR_ORGANIZATION_ID
                ,H.SCR_LOCATION_CODE
                ,H.DEST_TYPE
                ,H.DEST_OPREATING_UNIT
                ,H.DEST_ORGANIZATION_ID
                ,H.DEST_LOCATION_CODE
                ,L.ORDER_TYPE
                ,L.ORDER_NUMBER
                ,H.ORDER_REF_NO
                ,H.ORDER_REF_NO2
                ,H.ORDER_DATE
                ,S.SERIALKEY
                ,S.INVENTORY_ITEM_ID
                ,S.PRODUCT_CODE
                ,P.DESCRIPTION PRODUCT_DESC
                ,C.BRAND
                ,L.CAETGORY_ID
                ,C.CATEGORY_CODE
                ,CI.CODE_DESCRIPTION CATEGORY_DESCRIPTION
                ,C.SUB_CATEGORY_CODE
                ,SCI.CODE_DESCRIPTION SUB_CATEGORY_DESCRIPTION
                ,C.SUB_SUB_CATEGORY_CODE
                ,SSCI.CODE_DESCRIPTION SUB_SUB_CATEGORY_DESCRIPTION
                ,S.SCANTYPE
                ,S.SCAN_SOURCE
                ,H.WMS_YN
                ,H.INTERNAL_YN
                ,S.WARRANTYPRINT_YN
                ,S.WARRANTY_YN
                ,S.WARRANTY_SEQ
                ,S.WARRANTY_CODE
                ,S.WARRANTY_STARTDATE
                ,S.WARRANTY_ENDATE
                ,S.ACTIVE_YN
                ,S.INF_YN
                ,S.INF_DATE
                ,H.EXPIRY_AFTER
                ,H.EXPIRY_DATE
                ,H.STATUS_YN
                ,H.CREATE_BY
                ,H.CREATE_DATE
                ,H.MODIFY_BY
                ,H.MODIFY_DATE
                ,H.ORDER_REMARKS
          FROM AR_ORDER_SCAN_HEADER H
              ,AR_ORDER_SCAN_LINES L
              ,AR_ORDER_SCAN_SERIALS S
              ,DSS_PRODUCTS P
              ,TK_CATEGORIES_CONFIG C
              ,DSS_CATEGORY_INFO CI
              ,DSS_SUB_CATEGORY_INFO SCI
              ,DSS_SUB_SUB_CATEGORY_INFO SSCI
          WHERE H.JOBID = L.JOBID
                AND L.LINEID = S.LINEID
                AND L.INVENTORY_ITEM_ID = P.INVENTORY_ITEM_ID
                AND P.CATEGORY_ID = C.CATEGORY_ID
                AND C.CATEGORY_CODE = CI.CODEVALUE
                AND C.SUB_CATEGORY_CODE = SCI.CODEVALUE
                AND C.SUB_SUB_CATEGORY_CODE = SSCI.CODEVALUE)
         PIVOT (MAX(SERIALKEY)
               FOR COLUMNINDEX
               IN (1 AS KEY1, 2 AS KEY2, 3 AS KEY3, 4 AS KEY4));


GRANT SELECT ON DSS.V_AR_SERIAL_MANAGER TO SELDATA;
