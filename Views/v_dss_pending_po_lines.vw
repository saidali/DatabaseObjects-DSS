DROP VIEW DSS.V_DSS_PENDING_PO_LINES;

CREATE OR REPLACE FORCE VIEW DSS.V_DSS_PENDING_PO_LINES
(
    PO_LINE_ID
   ,PO_HEADER_ID
   ,LINE_TYPE_ID
   ,LINE_NUM
   ,ITEM_ID
   ,PRODUCT_CODE
   ,ITEM_REVISION
   ,CATEGORY_ID
   ,ITEM_DESCRIPTION
   ,UNIT_MEAS_LOOKUP_CODE
   ,QUANTITY_COMMITTED
   ,QUANTITY
   ,CANCEL_FLAG
   ,CANCELLED_BY
   ,CANCEL_DATE
   ,CANCEL_REASON
   ,VENDOR_PRODUCT_NUM
   ,TAXABLE_FLAG
   ,TAX_NAME
   ,CAPITAL_EXPENSE_FLAG
   ,NEGOTIATED_BY_PREPARER_FLAG
   ,ATTRIBUTE_CATEGORY
   ,REQUEST_ID
   ,PROGRAM_APPLICATION_ID
   ,PROGRAM_ID
   ,PROGRAM_UPDATE_DATE
   ,CLOSED_DATE
   ,CLOSED_REASON
   ,CLOSED_BY
   ,TRANSACTION_REASON_CODE
   ,ORG_ID
   ,QC_GRADE
   ,BASE_UOM
   ,BASE_QTY
   ,SECONDARY_UOM
   ,SECONDARY_QTY
   ,GLOBAL_ATTRIBUTE_CATEGORY
   ,ORDER_TYPE_LOOKUP_CODE
   ,PURCHASE_BASIS
   ,MATCHING_BASIS
   ,LAST_UPDATE_LOGIN
   ,CREATION_DATE
   ,CREATED_BY
   ,LAST_UPDATE_DATE
   ,LAST_UPDATED_BY
   ,ORGANIZATION_ID
)
AS
    SELECT l.PO_LINE_ID
          ,l.PO_HEADER_ID
          ,l.LINE_TYPE_ID
          ,l.LINE_NUM
          ,l.ITEM_ID
          ,p.PRODUCT_CODE
          ,l.ITEM_REVISION
          ,l.CATEGORY_ID
          ,l.ITEM_DESCRIPTION
          ,l.UNIT_MEAS_LOOKUP_CODE
          ,l.QUANTITY_COMMITTED
          ,l.QUANTITY
          ,l.CANCEL_FLAG
          ,l.CANCELLED_BY
          ,l.CANCEL_DATE
          ,l.CANCEL_REASON
          ,l.VENDOR_PRODUCT_NUM
          ,l.TAXABLE_FLAG
          ,l.TAX_NAME
          ,l.CAPITAL_EXPENSE_FLAG
          ,l.NEGOTIATED_BY_PREPARER_FLAG
          ,l.ATTRIBUTE_CATEGORY
          ,l.REQUEST_ID
          ,l.PROGRAM_APPLICATION_ID
          ,l.PROGRAM_ID
          ,l.PROGRAM_UPDATE_DATE
          ,l.CLOSED_DATE
          ,l.CLOSED_REASON
          ,l.CLOSED_BY
          ,l.TRANSACTION_REASON_CODE
          ,l.ORG_ID
          ,l.QC_GRADE
          ,l.BASE_UOM
          ,l.BASE_QTY
          ,l.SECONDARY_UOM
          ,l.SECONDARY_QTY
          ,l.GLOBAL_ATTRIBUTE_CATEGORY
          ,l.ORDER_TYPE_LOOKUP_CODE
          ,l.PURCHASE_BASIS
          ,l.MATCHING_BASIS
          ,l.LAST_UPDATE_LOGIN
          ,l.CREATION_DATE
          ,l.CREATED_BY
          ,l.LAST_UPDATE_DATE
          ,l.LAST_UPDATED_BY
          ,p.ORGANIZATION_ID
    FROM PO_LINES_ALL@axmapps l
         LEFT JOIN dss_products p ON l.ITEM_ID = p.inventory_item_id;


GRANT SELECT ON DSS.V_DSS_PENDING_PO_LINES TO SELDATA;
