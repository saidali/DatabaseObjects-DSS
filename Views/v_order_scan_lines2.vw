DROP VIEW DSS.V_ORDER_SCAN_LINES2;

CREATE OR REPLACE FORCE VIEW DSS.V_ORDER_SCAN_LINES2
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
   ,DESCRIPTION
   ,MODEL_CODE
   ,COLOUR_CODE
   ,BRAND
   ,CATEGORY_CODE
   ,CATEGORY_DESC
   ,CATEGORY2_CODE
   ,CATEGORY2_DESC
   ,CATEGORY3_CODE
   ,CATEGORY3_DESC
   ,PURCHASETYPE
   ,NO_YEARS
   ,NO_MONTHS
   ,NO_DAYS
   ,WMS_ENABLED
   ,WARRANTYGROUP
)
AS
    SELECT LIN.JOBID
          ,LIN.LINEID
          ,LIN.MERGED
          ,LIN.LINESEQ
          ,LIN.OPREATING_UNIT
          ,LIN.ORGANIZATION_ID
          ,LIN.ORDER_TYPE
          ,LIN.ORDER_NUMBER
          ,LIN.INVENTORY_ITEM_ID
          ,LIN.PRODUCT_CODE
          ,LIN.CAETGORY_ID
          ,LIN.ORDER_QTY
          ,LIN.DELIVERED_QTY
          ,LIN.PICKED_QTY
          ,SCD.SCANNED
               SCANNED_QTY
          ,LIN.CUSTOM_QTY
          ,COF.WMS_QTY_SYNC
               WMS_SYNC
          ,CASE
               WHEN NVL(LIN.SCAN_YN, SCAT.SCAN_REQUIRED) = 'Y'
               THEN
                   'Y'
               ELSE
                   'N'
           END
               SCAN_YN
          ,---LIN.WARRANTYPRINT_YN,
           CASE
               WHEN NVL(LIN.WARRANTYPRINT_YN, SCAT.ATTRIBUTE10) = 'Y'
               THEN
                   'Y'
               ELSE
                   'N'
           END
               WARRANTYPRINT_YN
          ,--            CASE
           --               WHEN LIN.WARRANTY_YN = 'N' THEN 'N'
           --               ELSE CASE WHEN COF.WARRANTY_ENABLED = 'Y' THEN 'Y' ELSE 'N' END
           --            END
           CASE
               WHEN LIN.WARRANTY_YN = 'Y' AND SCAT.UNIQUE_KEY = 'N'
               THEN
                   'N'
               WHEN LIN.WARRANTY_YN = 'Y' AND SCAT.UNIQUE_KEY = 'Y'
               THEN
                   'Y'
               ELSE
                   'N'
           END
               WARRANTY_YN
          ,CASE
               WHEN LIN.WARRANTY_SEQ IS NOT NULL
               THEN
                   LIN.WARRANTY_SEQ
               ELSE
                   CASE
                       WHEN COF.WARRANTY_ENABLED = 'Y'
                       THEN
                           OWR.WARRANTY_SEQ
                       ELSE
                           NULL
                   END
           END
               WARRANTY_SEQ
          ,WS.WARRANTY_CODE
          ,LIN.CREATE_BY
          ,LIN.MODIFY_BY
          ,LIN.CREATE_DATE
          ,LIN.MODIFY_DATE
          ,LIN.EXPIRY_DATE
          ,LIN.EXPIRY_DAYS
          ,LIN.EDITABLE_YN
          ,LIN.ARCHIVED_YN
          ,LIN.ACTIVE_YN
          ,LIN.STATUS_YN
          ,LIN.HAS_SERIALS
          ,PO.DESCRIPTION
          ,PO.MODEL_CODE
          ,PO.COLOUR_CODE
          ,SCAT.BRAND
          ,SCAT.CATEGORY_CODE
          ,CAT1.CODE_DESCRIPTION
               CATEGORY_DESC
          ,SCAT.SUB_CATEGORY_CODE
               CATEGORY2_CODE
          ,CAT2.CODE_DESCRIPTION
               CATEGORY2_DESC
          ,SCAT.SUB_SUB_CATEGORY_CODE
               CATEGORY3_CODE
          ,CAT3.CODE_DESCRIPTION
               CATEGORY3_DESC
          ,SCAT.PURCHASETYPE
          ,WS.NO_YEARS
          ,WS.NO_MONTHS
          ,WS.NO_DAYS
          ,WS.WMS_ENABLED
          ,WS.WARRANTY_CATG_FLAG
               WARRANTYGROUP
    FROM DSS_ORDER_SCAN_LINES LIN
         LEFT OUTER JOIN DSS_ORDER_SCAN_HEADER HD ON LIN.JOBID = HD.JOBID
         LEFT OUTER JOIN TK_ORG_ORDER_CONFIG COF
             ON LIN.ORDER_TYPE = COF.ORDER_SHORT_CODE
                AND LIN.ORGANIZATION_ID = COF.ORGANIZATION_ID
         LEFT OUTER JOIN TK_ORGANIZATION_WARRANTY OWR
             ON LIN.CAETGORY_ID = OWR.CATEGORY_ID
                AND LIN.ORGANIZATION_ID = OWR.ORGANIZATION_ID
         LEFT OUTER JOIN TK_CATEGORIES_CONFIG SCAT
             ON LIN.CAETGORY_ID = SCAT.CATEGORY_ID
         LEFT OUTER JOIN DSS_CATEGORY_INFO CAT1
             ON SCAT.CATEGORY_CODE = CAT1.CODEVALUE
         LEFT OUTER JOIN DSS_SUB_CATEGORY_INFO CAT2
             ON SCAT.SUB_CATEGORY_CODE = CAT2.CODEVALUE
         LEFT OUTER JOIN DSS_SUB_SUB_CATEGORY_INFO CAT3
             ON SCAT.SUB_SUB_CATEGORY_CODE = CAT3.CODEVALUE
         LEFT OUTER JOIN DSS_PRODUCTS PO
             ON LIN.ORGANIZATION_ID = PO.ORGANIZATION_ID
                AND LIN.INVENTORY_ITEM_ID = PO.INVENTORY_ITEM_ID
         LEFT OUTER JOIN DSS_SERVICE_WARRANTY WS
             ON NVL(LIN.WARRANTY_SEQ, OWR.WARRANTY_SEQ) = WS.WARRANTY_SEQ
         LEFT OUTER JOIN
         (SELECT JOBID
                ,LINEID
                ,PRODUCT_CODE
                ,COUNT(*) SCANNED
                ,SUM(NVL(ATTRIBUTE1, 0)) NOIMEISCAN
          FROM DSS_ORDER_SCAN_SERIALS S
          WHERE S.COLUMNINDEX = 1
          GROUP BY JOBID, LINEID, PRODUCT_CODE) SCD
             ON SCD.JOBID = LIN.JOBID AND SCD.LINEID = LIN.LINEID
    -- WHERE LIN.ORDER_NUMBER = 33586376
    ORDER BY LIN.LINEID;


GRANT SELECT ON DSS.V_ORDER_SCAN_LINES2 TO SELDATA;
