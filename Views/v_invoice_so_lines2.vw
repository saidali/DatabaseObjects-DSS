DROP VIEW DSS.V_INVOICE_SO_LINES2;

CREATE OR REPLACE FORCE VIEW DSS.V_INVOICE_SO_LINES2
(
    SNO
   ,CUSTOMER_TRX_ID
   ,ORG_ID
   ,ORGANIZATION_ID
   ,ORDER_NUMBER
   ,PRODUCT_CODE
   ,DESCRIPTION
   ,INVENTORY_ITEM_ID
   ,CATEGORY_ID
   ,CATEGORY_DESC
   ,UOM
   ,"Quantity"
   ,"Sum_Quantity"
   ,"Unit_Price"
   ,"Gross_Amount"
   ,"Net_Amount"
)
AS
    SELECT ROWNUM
               SNO
          ,RCH.CUSTOMER_TRX_ID
          ,RCH.ORG_ID
          ,MSI.ORGANIZATION_ID
          ,ORDER_NUMBER
          ,MSI.PRODUCT_CODE
               "PRODUCT_CODE"
          ,MSI.DESCRIPTION
               "DESCRIPTION"
          ,RCD.INVENTORY_ITEM_ID
          ,MSI.CATEGORY_CODE
               "Category_Id"
          ,MSI.CATEGORY_NAME
               "Category_Desc"
          ,RCD.UOM_CODE
               UOM
          ,RCD.QUANTITY_INVOICED
               "Quantity"
          ,SUM(RCD.QUANTITY_INVOICED)
               "Sum_Quantity"
          ,ROUND(RCD.UNIT_SELLING_PRICE, 2)
               "Unit_Price"
          ,ROUND((RCD.QUANTITY_INVOICED * RCD.UNIT_SELLING_PRICE))
               "Gross_Amount"
          ,ROUND(RCD.QUANTITY_INVOICED * RCD.UNIT_SELLING_PRICE)
               "Net_Amount"
    FROM SYN_RA_CUSTOMER_TRX_ALL RCH
        ,SYN_RA_CUSTOMER_TRX_LINES_ALL RCD
        ,V_DSS_PRODUCT_CATEGORIES MSI
        ,V_INVOICE_SO_HEADER HEAD
    WHERE RCH.CUSTOMER_TRX_ID = HEAD.CUSTOMER_TRX_ID
          AND RCH.CUSTOMER_TRX_ID = RCD.CUSTOMER_TRX_ID
          AND MSI.INVENTORY_ITEM_ID = RCD.INVENTORY_ITEM_ID
          AND RCH.ORG_ID = RCD.ORG_ID
          AND MSI.ORGANIZATION_ID =
              NVL(RCD.WAREHOUSE_ID, MSI.ORGANIZATION_ID)
          AND RCD.LINE_TYPE = 'LINE'
          AND RCH.ORG_ID = RCD.ORG_ID
          AND RCH.COMPLETE_FLAG = 'Y'
          AND RCH.BATCH_SOURCE_ID IN
                  (SELECT BATCH_SOURCE_ID
                   FROM SYN_RA_BATCH_SOURCES_ALL
                   WHERE UPPER(NAME) = UPPER('Order Management'))
          AND HEAD.ORG_ID = RCH.ORG_ID
    GROUP BY ROWNUM
            ,RCH.CUSTOMER_TRX_ID
            ,RCH.ORG_ID
            ,MSI.ORGANIZATION_ID
            ,ORDER_NUMBER
            ,MSI.PRODUCT_CODE
            ,MSI.DESCRIPTION
            ,RCD.INVENTORY_ITEM_ID
            ,MSI.CATEGORY_CODE
            ,MSI.CATEGORY_NAME
            ,RCD.UOM_CODE
            ,RCD.QUANTITY_INVOICED
            ,RCD.UNIT_SELLING_PRICE
            ,RCH.TRX_NUMBER
    ORDER BY ROWNUM, RCH.TRX_NUMBER;


GRANT SELECT ON DSS.V_INVOICE_SO_LINES2 TO SELDATA;
