DROP VIEW DSS.V_DSS_BOMS;

CREATE OR REPLACE FORCE VIEW DSS.V_DSS_BOMS
(
    OPERATING_UNIT
   ,ORGANIZATION_ID
   ,BILL_SEQUENCE_ID
   ,ASSEMBLY_ITEM_ID
   ,ASSEMBLY_PRODUCT_CODE
   ,ASSEMBLY_DESCRIPTION
   ,ASSEMBLY_ITEM_TYPE
   ,HAS_COMPONENTS
)
AS
    SELECT ORG.OPERATING_UNIT
          ,BOM.ORGANIZATION_ID
          ,BOM.BILL_SEQUENCE_ID
          ,BOM.ASSEMBLY_ITEM_ID
          ,ITM.SEGMENT1 PRODUCT_CODE
          ,ITM.DESCRIPTION
          ,ITM.ITEM_TYPE
          ,COT.HAS_COMPONENTS
    FROM SYN_BOM_BILL_OF_MATERIALS BOM
         LEFT OUTER JOIN
         (SELECT CASE WHEN COUNT(*) > 0 THEN 'Y' ELSE 'N' END HAS_COMPONENTS
                ,BILL_SEQUENCE_ID
          FROM SYN_BOM_COMPONENTS
          WHERE TRUNC(
                    TO_DATE(NVL(ATTRIBUTE13, TO_CHAR(SYSDATE, 'DD-mon-YYYY'))
                           ,'DD-mon-YYYY')) >=
                TRUNC(SYSDATE)
                AND NVL(DISABLE_DATE, SYSDATE) >= SYSDATE
          GROUP BY BILL_SEQUENCE_ID) COT
             ON BOM.BILL_SEQUENCE_ID = COT.BILL_SEQUENCE_ID
         LEFT OUTER JOIN SYN_MTL_SYSTEM_ITEMS ITM
             ON BOM.ASSEMBLY_ITEM_ID = ITM.INVENTORY_ITEM_ID
                AND BOM.ORGANIZATION_ID = ITM.ORGANIZATION_ID
         LEFT OUTER JOIN SYN_ORGANIZATIONS ORG
             ON BOM.ORGANIZATION_ID = ORG.ORGANIZATION_ID
         LEFT OUTER JOIN DSS_DUPLICATED_BOMS DBOMS
             ON BOM.BILL_SEQUENCE_ID = DBOMS.BILL_SEQUENCE_ID
    WHERE HAS_COMPONENTS = 'Y'
          AND ITM.INVENTORY_ITEM_STATUS_CODE != 'Inactive'
          AND ITM.ENABLED_FLAG = 'Y'
          AND NVL(ORG.DISABLE_DATE, SYSDATE) >= SYSDATE
          AND DBOMS.BILL_SEQUENCE_ID IS NULL;


GRANT SELECT ON DSS.V_DSS_BOMS TO SELDATA;
