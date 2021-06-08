DROP VIEW DSS.V_DSS_SERIAL_MANAGER;

CREATE OR REPLACE FORCE VIEW DSS.V_DSS_SERIAL_MANAGER
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
   ,WARRANTY_NO_YEARS
   ,WARRANTY_NO_MONTHS
   ,WARRANTY_NO_DAYS
   ,WARRANTY_PERIOD
   ,WARRANTY_DESC
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
          ,NO_YEARS
          ,NO_MONTHS
          ,NO_DAYS
          ,WARRANTY_PERIOD
          ,WARRANTY_DESC
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
                ,CASE
                     WHEN (H.ORDER_TYPE = 'GRN'
                           AND H.DEST_REF_CODE IS NOT NULL)
                     THEN
                         H.DEST_LOCATION_CODE || ' (' || H.DEST_REF_CODE ||
                         ')'
                     ELSE
                         H.DEST_LOCATION_CODE
                 END
                     DEST_LOCATION_CODE
                ,L.ORDER_TYPE
                ,L.ORDER_NUMBER
                ,H.ORDER_REF_NO
                ,H.ORDER_REF_NO2
                ,H.ORDER_DATE
                ,--                  CASE
                 --                     WHEN S.SERIALKEY LIKE '>_______-_-_<'
                 --                     THEN
                 --                        SERIALKEY_REF1
                 --                     ELSE
                 --                        S.SERIALKEY
                 --                  END
                 --                     SERIALKEY,
                 S.SERIALKEY
                ,S.INVENTORY_ITEM_ID
                ,S.PRODUCT_CODE
                ,P.DESCRIPTION
                     PRODUCT_DESC
                ,C.BRAND
                ,L.CAETGORY_ID
                ,C.CATEGORY_CODE
                ,CI.CODE_DESCRIPTION
                     CATEGORY_DESCRIPTION
                ,C.SUB_CATEGORY_CODE
                ,SCI.CODE_DESCRIPTION
                     SUB_CATEGORY_DESCRIPTION
                ,C.SUB_SUB_CATEGORY_CODE
                ,SSCI.CODE_DESCRIPTION
                     SUB_SUB_CATEGORY_DESCRIPTION
                ,S.SCANTYPE
                ,S.SCAN_SOURCE
                ,H.WMS_YN
                ,H.INTERNAL_YN
                ,L.WARRANTYPRINT_YN
                ,L.WARRANTY_YN
                ,L.WARRANTY_SEQ
                ,W.WARRANTY_CODE
                ,NVL(S.WARRANTY_STARTDATE, H.ORDER_DATE)
                     WARRANTY_STARTDATE
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
                ,NVL(W.NO_YEARS, 0)
                     NO_YEARS
                ,NVL(W.NO_MONTHS, 0)
                     NO_MONTHS
                ,NVL(W.NO_DAYS, 0)
                     NO_DAYS
                ,  (NVL(W.NO_YEARS, 0) * 12)
                 + (NVL(W.NO_MONTHS, 0))
                 + (NVL(W.NO_DAYS, 0) / 30)
                     WARRANTY_PERIOD
                ,WARRANTY_DESC
          FROM DSS_ORDER_SCAN_HEADER H
              ,DSS_ORDER_SCAN_LINES L
               LEFT OUTER JOIN DSS_SERVICE_WARRANTY W
                   ON L.WARRANTY_SEQ = W.WARRANTY_SEQ,
               DSS_ORDER_SCAN_SERIALS S
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


GRANT SELECT ON DSS.V_DSS_SERIAL_MANAGER TO SELDATA;
