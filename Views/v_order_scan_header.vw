DROP VIEW DSS.V_ORDER_SCAN_HEADER;

CREATE OR REPLACE FORCE VIEW DSS.V_ORDER_SCAN_HEADER
(
    JOBID
   ,APP_SOURCE
   ,ORDER_TYPE
   ,ORDER_NUMBER
   ,ORDER_REF_NO
   ,ORDER_REF_NO2
   ,ORDER_DATE
   ,ORDER_REMARKS
   ,WARRANTY_YN
   ,WMS_YN
   ,INTERNAL_YN
   ,SCR_TYPE
   ,SCR_REF_NUMBER
   ,SCR_REF_CODE
   ,SCR_OPREATING_UNIT
   ,SCR_ORGANIZATION_ID
   ,SCR_LOCATION_CODE
   ,DEST_TYPE
   ,DEST_REF_NUMBER
   ,DEST_REF_CODE
   ,DEST_OPREATING_UNIT
   ,DEST_ORGANIZATION_ID
   ,DEST_LOCATION_CODE
   ,CREATE_DATE
   ,MODIFY_DATE
   ,CREATE_BY
   ,MODIFY_BY
   ,EXPIRY_DATE
   ,EXPIRY_AFTER
   ,EDITABLE_YN
   ,ARCHIVED_YN
   ,ACTIVE_YN
   ,STATUS_YN
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
    SELECT h.JOBID
          ,h.APP_SOURCE
          ,h.ORDER_TYPE
          ,h.ORDER_NUMBER
          ,h.ORDER_REF_NO
          ,h.ORDER_REF_NO2
          ,h.ORDER_DATE
          ,h.ORDER_REMARKS
          ,h.WARRANTY_YN
          ,WMS_QTY_SYNC WMS_YN
          ,h.INTERNAL_YN
          ,h.SCR_TYPE
          ,h.SCR_REF_NUMBER
          ,h.SCR_REF_CODE
          ,h.SCR_OPREATING_UNIT
          ,h.SCR_ORGANIZATION_ID
          ,h.SCR_LOCATION_CODE
          ,h.DEST_TYPE
          ,h.DEST_REF_NUMBER
          ,h.DEST_REF_CODE
          ,h.DEST_OPREATING_UNIT
          ,h.DEST_ORGANIZATION_ID
          ,h.DEST_LOCATION_CODE
          ,h.CREATE_DATE
          ,h.MODIFY_DATE
          ,h.CREATE_BY
          ,h.MODIFY_BY
          ,h.EXPIRY_DATE
          ,h.EXPIRY_AFTER
          ,h.EDITABLE_YN
          ,h.ARCHIVED_YN
          ,h.ACTIVE_YN
          ,h.STATUS_YN
          ,h.ATTRIBUTE1
          ,h.ATTRIBUTE2
          ,h.ATTRIBUTE3
          ,h.ATTRIBUTE4
          ,h.ATTRIBUTE5
          ,h.ATTRIBUTE6
          ,h.ATTRIBUTE7
          ,h.ATTRIBUTE8
          ,h.ATTRIBUTE9
          ,h.ATTRIBUTE10
    FROM DSS_ORDER_SCAN_HEADER h
         LEFT OUTER JOIN TK_ORG_ORDER_CONFIG orgco
             ON h.SCR_ORGANIZATION_ID = orgco.ORGANIZATION_ID
                AND h.ORDER_TYPE = orgco.ORDER_SHORT_CODE
    UNION ALL
    SELECT h.JOBID
          ,h.APP_SOURCE
          ,h.ORDER_TYPE
          ,h.ORDER_NUMBER
          ,h.ORDER_REF_NO
          ,h.ORDER_REF_NO2
          ,h.ORDER_DATE
          ,h.ORDER_REMARKS
          ,h.WARRANTY_YN
          ,WMS_QTY_SYNC WMS_YN
          ,h.INTERNAL_YN
          ,h.SCR_TYPE
          ,h.SCR_REF_NUMBER
          ,h.SCR_REF_CODE
          ,h.SCR_OPREATING_UNIT
          ,h.SCR_ORGANIZATION_ID
          ,h.SCR_LOCATION_CODE
          ,h.DEST_TYPE
          ,h.DEST_REF_NUMBER
          ,h.DEST_REF_CODE
          ,h.DEST_OPREATING_UNIT
          ,h.DEST_ORGANIZATION_ID
          ,h.DEST_LOCATION_CODE
          ,h.CREATE_DATE
          ,h.MODIFY_DATE
          ,h.CREATE_BY
          ,h.MODIFY_BY
          ,h.EXPIRY_DATE
          ,h.EXPIRY_AFTER
          ,h.EDITABLE_YN
          ,h.ARCHIVED_YN
          ,h.ACTIVE_YN
          ,h.STATUS_YN
          ,h.ATTRIBUTE1
          ,h.ATTRIBUTE2
          ,h.ATTRIBUTE3
          ,h.ATTRIBUTE4
          ,h.ATTRIBUTE5
          ,h.ATTRIBUTE6
          ,h.ATTRIBUTE7
          ,h.ATTRIBUTE8
          ,h.ATTRIBUTE9
          ,h.ATTRIBUTE10
    FROM ar_ORDER_SCAN_HEADER h
         LEFT OUTER JOIN TK_ORG_ORDER_CONFIG orgco
             ON h.SCR_ORGANIZATION_ID = orgco.ORGANIZATION_ID
                AND h.ORDER_TYPE = orgco.ORDER_SHORT_CODE;


GRANT SELECT ON DSS.V_ORDER_SCAN_HEADER TO SELDATA;
