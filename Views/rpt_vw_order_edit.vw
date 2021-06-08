DROP VIEW DSS.RPT_VW_ORDER_EDIT;

CREATE OR REPLACE FORCE VIEW DSS.RPT_VW_ORDER_EDIT
(
    LOGID
   ,OPREATING_UNIT
   ,ORGANIZATION_ID
   ,JOBID
   ,LINEID
   ,ORDER_TYPE
   ,ORDER_NUMBER
   ,PRODUCT_CODE
   ,COLUMN_NAME
   ,ROW_ID
   ,OLD_VALUE
   ,NEW_VALUE
   ,STATUS
   ,MODIFY_BY
   ,MODIFY_DATE
)
AS
    SELECT LOGID
          ,OPREATING_UNIT
          ,ORGANIZATION_ID
          ,JOBID
          ,LINEID
          ,ORDER_TYPE
          ,ORDER_NUMBER
          ,PRODUCT_CODE
          ,COLUMN_NAME
          ,ROW_ID
          ,OLD_VALUE
          ,NEW_VALUE
          ,CASE LO.STATUS
               WHEN 'M'
               THEN
                   'Modified'
               WHEN 'D'
               THEN
                   'Deleted'
           END
               AS STATUS
          ,LO.MODIFY_BY
          ,LO.MODIFY_DATE
    FROM DSS_LOG_ORDER_SCAN LO
         LEFT JOIN DSS_ORDER_SCAN_LINES L ON LO.ROW_ID = L.LINEID
    WHERE CHANGE_LEVEL = 'L'                     -- AND OPREATING_UNIT = '103'
                             AND TRUNC(LO.MODIFY_DATE) >= TRUNC(SYSDATE - 1)
    UNION ALL
    SELECT LOGID
          ,SCR_OPREATING_UNIT
               OPREATING_UNIT
          ,DEST_ORGANIZATION_ID
               ORGANIZATION_ID
          ,JOBID
          ,0
               LINEID
          ,ORDER_TYPE
          ,ORDER_NUMBER
          ,''
               PRODUCT_CODE
          ,COLUMN_NAME
          ,ROW_ID
          ,OLD_VALUE
          ,NEW_VALUE
          ,CASE LO.STATUS
               WHEN 'M'
               THEN
                   'Modified'
               WHEN 'D'
               THEN
                   'Deleted'
           END
               AS STATUS
          ,LO.MODIFY_BY
          ,LO.MODIFY_DATE
    FROM DSS_LOG_ORDER_SCAN LO
         LEFT JOIN DSS_ORDER_SCAN_HEADER L ON LO.ROW_ID = L.JOBID
    WHERE CHANGE_LEVEL = 'H'               --   AND SCR_OPREATING_UNIT = '103'
                             AND TRUNC(LO.MODIFY_DATE) >= TRUNC(SYSDATE - 1)
    ORDER BY 1 DESC;


GRANT SELECT ON DSS.RPT_VW_ORDER_EDIT TO SELDATA;
