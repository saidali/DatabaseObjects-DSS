DROP VIEW DSS.V_DSS_ORDER_SCAN_SERIALS;

CREATE OR REPLACE FORCE VIEW DSS.V_DSS_ORDER_SCAN_SERIALS
(
    SCANID
   ,JOBID
   ,LINEID
   ,SEQINDEX
   ,COLUMNINDEX
   ,CONFIGID
   ,CONFIGTYPE
   ,SCANTYPE
   ,SCAN_SOURCE
   ,OPREATING_UNIT
   ,ORGANIZATION_ID
   ,ORDER_TYPE
   ,ORDER_NUMBER
   ,INVENTORY_ITEM_ID
   ,PRODUCT_CODE
   ,SERVICE_BRANDID
   ,SERIALKEY
   ,SERIALKEY_REF1
   ,SERIALKEY_REF2
   ,WARRANTYPRINT_YN
   ,WARRANTY_YN
   ,WARRANTY_SEQ
   ,WARRANTY_CODE
   ,WARRANTY_STARTDATE
   ,WARRANTY_ENDATE
   ,ACTIVE_YN
   ,INF_YN
   ,INF_DATE
   ,CREATE_BY
   ,CREATE_DATE
   ,UPDATE_BY
   ,UPDATE_DATE
   ,ALLOW_EDIT
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
    SELECT "SCANID"
          ,"JOBID"
          ,"LINEID"
          ,"SEQINDEX"
          ,"COLUMNINDEX"
          ,"CONFIGID"
          ,"CONFIGTYPE"
          ,"SCANTYPE"
          ,"SCAN_SOURCE"
          ,"OPREATING_UNIT"
          ,"ORGANIZATION_ID"
          ,"ORDER_TYPE"
          ,"ORDER_NUMBER"
          ,"INVENTORY_ITEM_ID"
          ,"PRODUCT_CODE"
          ,"SERVICE_BRANDID"
          ,"SERIALKEY"
          ,"SERIALKEY_REF1"
          ,"SERIALKEY_REF2"
          ,"WARRANTYPRINT_YN"
          ,"WARRANTY_YN"
          ,"WARRANTY_SEQ"
          ,"WARRANTY_CODE"
          ,"WARRANTY_STARTDATE"
          ,"WARRANTY_ENDATE"
          ,"ACTIVE_YN"
          ,"INF_YN"
          ,"INF_DATE"
          ,"CREATE_BY"
          ,"CREATE_DATE"
          ,"UPDATE_BY"
          ,"UPDATE_DATE"
          ,"ALLOW_EDIT"
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
    FROM DSS_ORDER_SCAN_SERIALS
--   UNION ALL
--   SELECT "SCANID",
--          "JOBID",
--          "LINEID",
--          "SEQINDEX",
--          "COLUMNINDEX",
--          "CONFIGID",
--          "CONFIGTYPE",
--          "SCANTYPE",
--          "SCAN_SOURCE",
--          "OPREATING_UNIT",
--          "ORGANIZATION_ID",
--          "ORDER_TYPE",
--          "ORDER_NUMBER",
--          "INVENTORY_ITEM_ID",
--          "PRODUCT_CODE",
--          "SERVICE_BRANDID",
--          "SERIALKEY",
--          "SERIALKEY_REF1",
--          "SERIALKEY_REF2",
--          "WARRANTYPRINT_YN",
--          "WARRANTY_YN",
--          "WARRANTY_SEQ",
--          "WARRANTY_CODE",
--          "WARRANTY_STARTDATE",
--          "WARRANTY_ENDATE",
--          "ACTIVE_YN",
--          "INF_YN",
--          "INF_DATE",
--          "CREATE_BY",
--          "CREATE_DATE",
--          "UPDATE_BY",
--          "UPDATE_DATE",
--          "ALLOW_EDIT",
--          "ATTRIBUTE1",
--          "ATTRIBUTE2",
--          "ATTRIBUTE3",
--          "ATTRIBUTE4",
--          "ATTRIBUTE5",
--          "ATTRIBUTE6",
--          "ATTRIBUTE7",
--          "ATTRIBUTE8",
--          "ATTRIBUTE9",
--          "ATTRIBUTE10"
--     FROM DSS_ORDER_SCAN_SERIALS_WT
;


GRANT SELECT ON DSS.V_DSS_ORDER_SCAN_SERIALS TO SELDATA;
