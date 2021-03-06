DROP VIEW DSS.V_DSS_PRODUCT_WARRANTY;

CREATE OR REPLACE FORCE VIEW DSS.V_DSS_PRODUCT_WARRANTY
(
    LINEID
   ,OPERATING_UNIT
   ,ORGANIZATION_ID
   ,ORGANIZATION_CODE
   ,ORGANIZATION_NAME
   ,INVENTORY_ITEM_ID
   ,PRODUCT_CODE
   ,DESCRIPTION
   ,PRODUCT_CLASSIFICATION
   ,ITEM_TYPE
   ,CATEGORY_ID
   ,PURCHASE_TYPE
   ,BRAND_CODE
   ,BASE_BRAND
   ,MODEL_CODE
   ,CATEGORY_CODE
   ,CATEGORY_DESCRIPTION
   ,SUB_CATEGORY_CODE
   ,SUB_CATEGORY_DESCRIPTION
   ,SUB_SUB_CATEGORY_CODE
   ,SUB_SUB_CATEGORY_DESCRIPTION
   ,WARRANTY_SEQ
   ,WARRANTY_CODE
   ,WARRANTY_DESC
   ,WARRANTY_ACTIVE
   ,NO_YEARS
   ,NO_MONTHS
   ,NO_DAYS
   ,CONFIGURED
   ,ACTIVE
   ,CREATE_DATE
   ,CREATE_BY
)
AS
    SELECT PW.LINEID
          ,PM.OPERATING_UNIT
          ,PM.ORGANIZATION_ID
          ,PM.ORGANIZATION_CODE
          ,PM.ORGANIZATION_NAME
          ,PM.INVENTORY_ITEM_ID
          ,PM.PRODUCT_CODE
          ,PM.DESCRIPTION
          ,PM.PRODUCT_CLASSIFICATION
          ,PM.ITEM_TYPE
          ,PM.CATEGORY_ID
          ,PM.PURCHASE_TYPE
          ,PM.BRAND_CODE
          ,PM.BASE_BRAND
          ,PM.MODEL_CODE
          ,PM.CATEGORY_CODE
          ,PM.CATEGORY_DESCRIPTION
          ,PM.SUB_CATEGORY_CODE
          ,PM.SUB_CATEGORY_DESCRIPTION
          ,PM.SUB_SUB_CATEGORY_CODE
          ,PM.SUB_SUB_CATEGORY_DESCRIPTION
          ,WT.WARRANTY_SEQ
          ,WT.WARRANTY_CODE
          ,WT.WARRANTY_DESC
          ,WT.WARRANTY_ACTIVE
          ,WT.NO_YEARS
          ,WT.NO_MONTHS
          ,WT.NO_DAYS
          ,CASE WHEN PW.LINEID IS NULL THEN 'N' ELSE 'Y' END Configured
          ,CASE WHEN PW.LINEID IS NULL THEN 'N' ELSE PW.active END Active
          ,PW.CREATE_DATE
          ,PW.CREATE_BY
    FROM V_DSS_PRODUCT_MASTER PM
         LEFT OUTER JOIN TK_PRODUCT_WARRANTY PW
             ON PM.ORGANIZATION_ID = PW.ORGANIZATION_ID
                AND PM.ORGANIZATION_ID = PW.ORGANIZATION_ID
                AND PM.INVENTORY_ITEM_ID = PW.INVENTORY_ITEM_ID
         LEFT OUTER JOIN DSS_SERVICE_WARRANTY WT
             ON PW.WARRANTY_SEQ = WT.WARRANTY_SEQ
    WHERE PM.ACTIVE = 'Y';


GRANT SELECT ON DSS.V_DSS_PRODUCT_WARRANTY TO SELDATA;
