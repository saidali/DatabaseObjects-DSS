DROP VIEW DSS.V_DSS_ORDER_SCAN_LINES;

CREATE OR REPLACE FORCE VIEW DSS.V_DSS_ORDER_SCAN_LINES
(
    JOBID
   ,LINEID
   ,MERGED
   ,LINESEQ
   ,OPREATING_UNIT
   ,ORGANIZATION_ID
   ,ORDER_TYPE
   ,ORDER_NUMBER
   ,INVENTORY_ITEM_ID
   ,PRODUCT_CODE
   ,CAETGORY_ID
   ,ORDER_QTY
   ,DELIVERED_QTY
   ,PICKED_QTY
   ,SCANNED_QTY
   ,CUSTOM_QTY
   ,WMS_SYNC
   ,SCAN_YN
   ,WARRANTYPRINT_YN
   ,WARRANTY_YN
   ,WARRANTY_SEQ
   ,WARRANTY_CODE
   ,CREATE_BY
   ,MODIFY_BY
   ,CREATE_DATE
   ,MODIFY_DATE
   ,EXPIRY_DATE
   ,EXPIRY_DAYS
   ,EDITABLE_YN
   ,ARCHIVED_YN
   ,ACTIVE_YN
   ,STATUS_YN
   ,HAS_SERIALS
   ,BARCODES
   ,ATTRIBUTE1
   ,ATTRIBUTE2
   ,ATTRIBUTE3
   ,ATTRIBUTE4
   ,ATTRIBUTE5
   ,ATTRIBUTE6
   ,ATTRIBUTE7
   ,ATTRIBUTE8
   ,ATTRIBUTE9
   ,ATTRIBUTE10
)
AS
    SELECT "JOBID"
          ,"LINEID"
          ,"MERGED"
          ,"LINESEQ"
          ,"OPREATING_UNIT"
          ,"ORGANIZATION_ID"
          ,"ORDER_TYPE"
          ,"ORDER_NUMBER"
          ,"INVENTORY_ITEM_ID"
          ,"PRODUCT_CODE"
          ,"CAETGORY_ID"
          ,"ORDER_QTY"
          ,"DELIVERED_QTY"
          ,"PICKED_QTY"
          ,"SCANNED_QTY"
          ,"CUSTOM_QTY"
          ,"WMS_SYNC"
          ,"SCAN_YN"
          ,"WARRANTYPRINT_YN"
          ,"WARRANTY_YN"
          ,"WARRANTY_SEQ"
          ,"WARRANTY_CODE"
          ,"CREATE_BY"
          ,"MODIFY_BY"
          ,"CREATE_DATE"
          ,"MODIFY_DATE"
          ,"EXPIRY_DATE"
          ,"EXPIRY_DAYS"
          ,"EDITABLE_YN"
          ,"ARCHIVED_YN"
          ,"ACTIVE_YN"
          ,"STATUS_YN"
          ,"HAS_SERIALS"
          ,"BARCODES"
          ,"ATTRIBUTE1"
          ,"ATTRIBUTE2"
          ,"ATTRIBUTE3"
          ,"ATTRIBUTE4"
          ,"ATTRIBUTE5"
          ,"ATTRIBUTE6"
          ,"ATTRIBUTE7"
          ,"ATTRIBUTE8"
          ,"ATTRIBUTE9"
          ,"ATTRIBUTE10"
    FROM DSS_ORDER_SCAN_LINES;


GRANT SELECT ON DSS.V_DSS_ORDER_SCAN_LINES TO SELDATA;