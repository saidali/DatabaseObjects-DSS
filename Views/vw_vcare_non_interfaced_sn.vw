DROP VIEW DSS.VW_VCARE_NON_INTERFACED_SN;

CREATE OR REPLACE FORCE VIEW DSS.VW_VCARE_NON_INTERFACED_SN
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
   ,INVENTORY_ITEM_ID
   ,PRODUCT_CODE
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
   ,CAETGORY_ID
   ,KEY1
   ,KEY2
   ,KEY3
   ,KEY4
)
AS
    SELECT "JOBID"
          ,"LINEID"
          ,"SEQINDEX"
          ,"OPREATING_UNIT"
          ,"ORGANIZATION_ID"
          ,"SCR_TYPE"
          ,"SCR_OPREATING_UNIT"
          ,"SCR_ORGANIZATION_ID"
          ,"SCR_LOCATION_CODE"
          ,"DEST_TYPE"
          ,"DEST_OPREATING_UNIT"
          ,"DEST_ORGANIZATION_ID"
          ,"DEST_LOCATION_CODE"
          ,"ORDER_TYPE"
          ,"ORDER_NUMBER"
          ,"ORDER_REF_NO"
          ,"ORDER_REF_NO2"
          ,"ORDER_DATE"
          ,"INVENTORY_ITEM_ID"
          ,"PRODUCT_CODE"
          ,"SCANTYPE"
          ,"SCAN_SOURCE"
          ,"WMS_YN"
          ,"INTERNAL_YN"
          ,"WARRANTYPRINT_YN"
          ,"WARRANTY_YN"
          ,"WARRANTY_SEQ"
          ,"WARRANTY_CODE"
          ,"WARRANTY_STARTDATE"
          ,"WARRANTY_ENDATE"
          ,"ACTIVE_YN"
          ,"INF_YN"
          ,"INF_DATE"
          ,"EXPIRY_AFTER"
          ,"EXPIRY_DATE"
          ,"STATUS_YN"
          ,"CREATE_BY"
          ,"CREATE_DATE"
          ,"MODIFY_BY"
          ,"MODIFY_DATE"
          ,"ORDER_REMARKS"
          ,"CAETGORY_ID"
          ,"KEY1"
          ,"KEY2"
          ,"KEY3"
          ,"KEY4"
    FROM (SELECT SCS.JOBID
                ,SCS.LINEID
                ,SCS.SEQINDEX
                ,SCS.COLUMNINDEX
                ,SCS.OPREATING_UNIT
                ,SCS.ORGANIZATION_ID
                ,SCH.SCR_TYPE
                ,SCH.SCR_OPREATING_UNIT
                ,SCH.SCR_ORGANIZATION_ID
                ,SCH.SCR_LOCATION_CODE
                ,SCH.DEST_TYPE
                ,SCH.DEST_OPREATING_UNIT
                ,SCH.DEST_ORGANIZATION_ID
                ,SCH.DEST_LOCATION_CODE
                ,SCL.ORDER_TYPE
                ,SCL.ORDER_NUMBER
                ,SCH.ORDER_REF_NO
                ,SCH.ORDER_REF_NO2
                ,SCH.ORDER_DATE
                ,SCS.INVENTORY_ITEM_ID
                ,SCS.PRODUCT_CODE
                ,SCS.SERIALKEY
                ,SCS.SCANTYPE
                ,SCS.SCAN_SOURCE
                ,SCH.WMS_YN
                ,SCH.INTERNAL_YN
                ,SCS.WARRANTYPRINT_YN
                ,SCS.WARRANTY_YN
                ,SCL.WARRANTY_SEQ
                ,SCL.WARRANTY_CODE
                ,SCS.WARRANTY_STARTDATE
                ,SCS.WARRANTY_ENDATE
                ,SCS.ACTIVE_YN
                ,SCS.INF_YN
                ,SCS.INF_DATE
                ,SCH.EXPIRY_AFTER
                ,SCH.EXPIRY_DATE
                ,SCH.STATUS_YN
                ,SCH.CREATE_BY
                ,SCH.CREATE_DATE
                ,SCH.MODIFY_BY
                ,SCH.MODIFY_DATE
                ,SCH.ORDER_REMARKS
                ,SCL.CAETGORY_ID
          FROM DSS_ORDER_SCAN_SERIALS SCS
               JOIN DSS_ORDER_SCAN_LINES SCL
                   ON SCL.JOBID = SCS.JOBID AND SCL.LINEID = SCS.LINEID
               JOIN DSS_ORDER_SCAN_HEADER SCH ON SCH.JOBID = SCL.JOBID
          WHERE 1 = 1
                AND NVL(SCS.INF_YN, 'N') = 'N'
                AND NVL(SCS.ATTRIBUTE2, 'Y') = 'Y'
                AND SCS.ORDER_TYPE != 'GRN'
                AND SCS.ORDER_TYPE != 'IOT'
                AND SCS.ORDER_TYPE != 'SR'
                AND SCS.WARRANTY_SEQ > 0
                AND SCS.CREATE_DATE > SYSDATE - 120)
         PIVOT (MAX(SERIALKEY)
               FOR COLUMNINDEX
               IN (1 AS KEY1, 2 AS KEY2, 3 AS KEY3, 4 AS KEY4));
