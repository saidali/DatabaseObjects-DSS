DROP VIEW DSS.V_DSS_EXCESS_PULL_BACK;

CREATE OR REPLACE FORCE VIEW DSS.V_DSS_EXCESS_PULL_BACK
(
    "lineid"
   ,"OperatingUnit"
   ,"OrganizationId"
   ,"SubinventoryCode"
   ,"SubinventoryName"
   ,"Country"
   ,"OptimizaLocation"
   ,"WarehouseLOcation"
   ,"AgingMethod "
   ,"ProductCode"
   ,"ProductDescription"
   ,"CategoryCode"
   ,"CategoryDescription"
   ,"PurchaseType"
   ,"CategoryKey"
   ,"BrandCode"
   ,"ModelCode"
   ,"Automated"
   ,"SoldQuantity"
   ,"SalePeriodRang"
   ,"NoSales"
   ,"NoSalesDaysRange"
   ,"MaxDays"
   ,"AgingLimit"
   ,"SOHQuantity"
   ,"IntransitQuantity"
   ,"BaseQuantity"
   ,"AgeingByMoveOrder"
   ,"AgeingByGRN"
   ,"AgeingByBridge"
   ,"Ageing"
   ,"MaxValue"
   ,"ExcessQuantity"
   ,"Status"
   ,"IsIgnored"
   ,"IgnoreReason"
   ,"BatchDate"
   ,"Batch_ID"
)
AS
    SELECT DISTINCT
           EPL.LINEID
               "lineid"
          ,EPL.OPERATING_UNIT
               "OperatingUnit"
          ,EPL.ORGANIZATION_ID
               "OrganizationId"
          ,EPL.SUBINVENTORY_CODE
               "SubinventoryCode"
          ,l.DESCRIPTION
               "SubinventoryName"
          ,l.ATTRIBUTE3
               "Country"
          ,EPL.OPT_YN
               "OptimizaLocation"
          ,EPL.WH_SUBINVENTORY_CODE
               "WarehouseLOcation"
          ,EPL.AGING_METHOD
               "AgingMethod "
          ,EPL.PRODUCT_CODE
               "ProductCode"
          ,EPL.PRODUCT_DESCRIPTION
               "ProductDescription"
          ,EPL.CATEGORYCODE
               "CategoryCode"
          ,cat.CODE_DESCRIPTION
               "CategoryDescription"
          ,EPL.PURCHASETYPE
               "PurchaseType"
          ,EPL.CATEGORYCODE || '.' || EPL.CATEGORYCODE2 || '.' || EPL.
           PURCHASETYPE
               "CategoryKey"
          ,EPL.BRAND_CODE
               "BrandCode"
          ,EPL.MODEL_CODE
               "ModelCode"
          ,EPL.AUTOMATED
               "Automated"
          ,EPL.SOLD_QTY
               "SoldQuantity"
          ,EPL.SALE_PERIOD_RANG
               "SalePeriodRang"
          ,EPL.NO_SALES_IGNORE
               "NoSales"
          ,EPL.NOSALESDAYSFILTER
               "NoSalesDaysRange"
          ,EPL.MAX_DAYS
               "MaxDays"
          ,EPL.AGEING_LIMIT
               "AgingLimit"
          ,EPL.SOH_QUANTITY
               "SOHQuantity"
          ,EPL.INTRANSIT_QTY
               "IntransitQuantity"
          ,EPL.BASE_QTY
               "BaseQuantity"
          ,EPL.AGEING_BY_MOV
               "AgeingByMoveOrder"
          ,EPL.AGEING_BY_GRN
               "AgeingByGRN"
          ,EPL.AGEING_BY_BRG
               "AgeingByBridge"
          ,EPL.AGEING
               "Ageing"
          ,EPL.MAX_VALUE
               "MaxValue"
          ,EPL.EXCESS_QTY
               "ExcessQuantity"
          ,EPL.STATUS
               "Status"
          ,EPL.ISIGNORED
               "IsIgnored"
          ,EPL.IGNORE_REASON
               "IgnoreReason"
          ,epl.batch_date
               "BatchDate"
          ,epl.batchid
               "Batch_ID"
    FROM OER_EXCESS_PULL_BACK@ERPBRIDGE EPL
         LEFT OUTER JOIN SYN_SUBINVENTORIES L
             ON EPL.ORGANIZATION_ID = L.ORGANIZATION_ID
                AND EPL.SUBINVENTORY_CODE = L.SECONDARY_INVENTORY_NAME
         LEFT OUTER JOIN DSS_CATEGORY_INFO cat
             ON EPL.CATEGORYCODE = cat.CODEVALUE
    WHERE batchid = (SELECT MAX(batch_id)
                     FROM oer_batch_master@ERPBRIDGE);


GRANT SELECT ON DSS.V_DSS_EXCESS_PULL_BACK TO SELDATA;
