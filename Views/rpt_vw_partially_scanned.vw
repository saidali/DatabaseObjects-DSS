DROP VIEW DSS.RPT_VW_PARTIALLY_SCANNED;

CREATE OR REPLACE FORCE VIEW DSS.RPT_VW_PARTIALLY_SCANNED
(
    JOBID
   ,OPREATING_UNIT
   ,ORGANIZATION_ID
   ,ORDER_TYPE
   ,ORDER_NUMBER
   ,PRODUCT_CODE
   ,ORDER_QTY
   ,ACTUAL_QTY
   ,SCANNED_QTY
   ,MODEL_CODE
   ,BRAND
   ,WARRANTY_YN
   ,CREATE_DATE
   ,CREATE_BY
)
AS
    SELECT V.JOBID
          ,V.OPREATING_UNIT
          ,V.ORGANIZATION_ID
          ,V.ORDER_TYPE
          ,V.ORDER_NUMBER
          ,V.PRODUCT_CODE
          ,V.ORDER_QTY
          ,CASE WHEN PICKED_QTY = 0 THEN DELIVERED_QTY ELSE PICKED_QTY END
               ACTUAL_QTY
          ,V.SCANNED_QTY
          ,V.MODEL_CODE
          ,V.BRAND
          ,V.WARRANTY_YN
          ,V.CREATE_DATE
          ,V.CREATE_BY
    FROM V_ORDER_SCAN_LINES V
         LEFT JOIN DSS_ORDER_SCAN_HEADER H ON V.JOBID = H.JOBID
    WHERE 1 = 1
          AND H.APP_SOURCE = 'DSS'
          AND TRUNC(ORDER_DATE) >= TRUNC(SYSDATE - 30)
          AND (   PICKED_QTY <> 0
               OR DELIVERED_QTY <> 0)
          AND CASE WHEN PICKED_QTY = 0 THEN DELIVERED_QTY ELSE PICKED_QTY END >
              SCANNED_QTY
    ORDER BY ORDER_DATE DESC;


GRANT SELECT ON DSS.RPT_VW_PARTIALLY_SCANNED TO SELDATA;