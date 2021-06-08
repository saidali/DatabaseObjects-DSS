DROP PACKAGE DSS.PKG_DATA_VALIDATION;

CREATE OR REPLACE PACKAGE DSS.PKG_DATA_VALIDATION
AS
   TYPE TY_OPERATING_UNIT IS TABLE OF NUMBER
      INDEX BY BINARY_INTEGER;

   TYPE TY_ORGANIZATION_ID IS TABLE OF NUMBER
      INDEX BY BINARY_INTEGER;

   TYPE TY_LOCATION_CODE IS TABLE OF VARCHAR2 (10)
      INDEX BY BINARY_INTEGER;

   TYPE TY_CUSTOMERID IS TABLE OF VARCHAR2 (100)
      INDEX BY BINARY_INTEGER;

   TYPE TY_SIDE_ID IS TABLE OF VARCHAR2 (100)
      INDEX BY BINARY_INTEGER;

   TYPE TY_PRODUCT_CODE IS TABLE OF VARCHAR2 (100)
      INDEX BY BINARY_INTEGER;

   TYPE TY_QTY IS TABLE OF NUMBER
      INDEX BY BINARY_INTEGER;

   TYPE TY_DESCRIPTION IS TABLE OF VARCHAR2 (200)
      INDEX BY BINARY_INTEGER;

   TYPE TY_OLDVALUE1 IS TABLE OF VARCHAR2 (200)
      INDEX BY BINARY_INTEGER;

   TYPE TY_OLDVALUE2 IS TABLE OF VARCHAR2 (200)
      INDEX BY BINARY_INTEGER;

   TYPE TY_STATUS IS TABLE OF CHAR (1)
      INDEX BY BINARY_INTEGER;

   TYPE TY_STATUS_MESSAGE IS TABLE OF VARCHAR2 (100)
      INDEX BY BINARY_INTEGER;

   TYPE TY_RECORDS IS TABLE OF NUMBER
      INDEX BY BINARY_INTEGER;


   TYPE TY_TAX_RATE_ID IS TABLE OF NUMBER
      INDEX BY BINARY_INTEGER;

   TYPE TY_TAX_RATE_NAME IS TABLE OF VARCHAR2 (100)
      INDEX BY BINARY_INTEGER;

   TYPE TY_TAX_COUNTRY_CODE IS TABLE OF VARCHAR2 (10)
      INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE21 IS TABLE OF VARCHAR2 (100)
      INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE22 IS TABLE OF VARCHAR2 (100)
      INDEX BY BINARY_INTEGER;

   TYPE TY_TAX_VALUE IS TABLE OF NUMBER
      INDEX BY BINARY_INTEGER;
      
   TYPE TY_TAX_PERCENTAGE IS TABLE OF NUMBER
      INDEX BY BINARY_INTEGER;

   PROCEDURE PV_LOCATIONS (A_OPERATING_UNIT    IN     TY_OPERATING_UNIT,
                           A_ORGANIZATION_ID   IN     TY_ORGANIZATION_ID,
                           A_LOCATION_CODE     IN     TY_LOCATION_CODE,
                           A_DESCRIPTION       IN     TY_DESCRIPTION,
                           A_OLDVALUE1         IN     TY_OLDVALUE1,
                           A_STATUS            IN     TY_STATUS,
                           A_STATUS_MESSAGE    IN     TY_STATUS_MESSAGE,
                           A_RECORDS           IN     TY_RECORDS,
                           outCursor              OUT DSS.MYGEN.sqlcur);

   PROCEDURE PV_ORGNIZATIONS (A_OPERATING_UNIT    IN     TY_OPERATING_UNIT,
                              A_ORGANIZATION_ID   IN     TY_ORGANIZATION_ID,
                              A_DESCRIPTION       IN     TY_DESCRIPTION,
                              A_OLDVALUE1         IN     TY_OLDVALUE1,
                              A_OLDVALUE2         IN     TY_OLDVALUE2,
                              A_STATUS            IN     TY_STATUS,
                              A_STATUS_MESSAGE    IN     TY_STATUS_MESSAGE,
                              A_RECORDS           IN     TY_RECORDS,
                              outCursor              OUT DSS.MYGEN.sqlcur);

   PROCEDURE PV_PRODUCTS (A_OPERATING_UNIT    IN     TY_OPERATING_UNIT,
                          A_ORGANIZATION_ID   IN     TY_ORGANIZATION_ID,
                          A_PRODUCT_CODE      IN     TY_PRODUCT_CODE,
                          A_DESCRIPTION       IN     TY_DESCRIPTION,
                          A_OLDVALUE1         IN     TY_OLDVALUE1,
                          A_STATUS            IN     TY_STATUS,
                          A_STATUS_MESSAGE    IN     TY_STATUS_MESSAGE,
                          A_RECORDS           IN     TY_RECORDS,
                          outCursor              OUT DSS.MYGEN.sqlcur);

   PROCEDURE PV_ONHANDQTY (A_OPERATING_UNIT    IN     TY_OPERATING_UNIT,
                           A_ORGANIZATION_ID   IN     TY_ORGANIZATION_ID,
                           A_LOCATION_CODE     IN     TY_LOCATION_CODE,
                           A_PRODUCT_CODE      IN     TY_PRODUCT_CODE,
                           A_QTY               IN     TY_QTY,
                           A_DESCRIPTION       IN     TY_DESCRIPTION,
                           A_OLDVALUE1         IN     TY_OLDVALUE1,
                           A_STATUS            IN     TY_STATUS,
                           A_STATUS_MESSAGE    IN     TY_STATUS_MESSAGE,
                           A_RECORDS           IN     TY_RECORDS,
                           outCursor              OUT DSS.MYGEN.sqlcur);

   PROCEDURE PV_CUSTOMERS (A_OPERATING_UNIT    IN     TY_OPERATING_UNIT,
                           A_ORGANIZATION_ID   IN     TY_ORGANIZATION_ID,
                           A_CUSTOMERID        IN     TY_CUSTOMERID,
                           A_SIDE_ID           IN     TY_SIDE_ID,
                           A_DESCRIPTION       IN     TY_DESCRIPTION,
                           A_OLDVALUE1         IN     TY_OLDVALUE1,
                           A_OLDVALUE2         IN     TY_OLDVALUE2,
                           A_STATUS            IN     TY_STATUS,
                           A_STATUS_MESSAGE    IN     TY_STATUS_MESSAGE,
                           A_RECORDS           IN     TY_RECORDS,
                           outCursor              OUT DSS.MYGEN.sqlcur);

   PROCEDURE PV_TAX_VALIDATE (
      A_OPERATING_UNIT     IN     TY_OPERATING_UNIT,
      A_ORGANIZATION_ID    IN     TY_ORGANIZATION_ID,
      A_LOCATION_CODE      IN     TY_LOCATION_CODE,
      A_TAX_RATE_ID        IN     TY_TAX_RATE_ID,
      A_TAX_RATE_NAME      IN     TY_TAX_RATE_NAME,
      A_TAX_COUNTRY_CODE   IN     TY_TAX_COUNTRY_CODE,
      A_PRODUCTCODE        IN     TY_PRODUCT_CODE,
      A_ATTRIBUTE21        IN     TY_ATTRIBUTE21,
      A_ATTRIBUTE22        IN     TY_ATTRIBUTE22,
      A_STATUS             IN     TY_STATUS,
      A_TAX_VALUE          IN     TY_TAX_VALUE,
      A_TAX_PERCENTAGE     IN     TY_TAX_PERCENTAGE,
      outCursor               OUT DSS.MYGEN.sqlcur);
END PKG_DATA_VALIDATION;
/


DROP PACKAGE BODY DSS.PKG_DATA_VALIDATION;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DATA_VALIDATION
AS
   /* Formatted on 12/17/2017 3:28:54 PM (QP5 v5.227.12220.39754) */
PROCEDURE PV_TAX_VALIDATE (
                    
A_OPERATING_UNIT    IN     TY_OPERATING_UNIT,
A_ORGANIZATION_ID   IN     TY_ORGANIZATION_ID,
A_LOCATION_CODE     IN     TY_LOCATION_CODE,
A_TAX_RATE_ID        IN     TY_TAX_RATE_ID,
A_TAX_RATE_NAME      IN     TY_TAX_RATE_NAME,
A_TAX_COUNTRY_CODE   IN     TY_TAX_COUNTRY_CODE,
A_PRODUCTCODE        IN     TY_PRODUCT_CODE,
A_ATTRIBUTE21        IN     TY_ATTRIBUTE21,
A_ATTRIBUTE22        IN     TY_ATTRIBUTE22,
A_STATUS             IN     TY_STATUS,
A_TAX_VALUE          IN     TY_TAX_VALUE,
A_TAX_PERCENTAGE     IN     TY_TAX_PERCENTAGE,
                  OUTCURSOR               OUT DSS.MYGEN.SQLCUR)
AS
   TLB_VAL_TAX   COLL_DATA_TAX_VALIDATION := COLL_DATA_TAX_VALIDATION ();
BEGIN
   FOR I IN A_OPERATING_UNIT.FIRST .. A_OPERATING_UNIT.LAST
   LOOP
      TLB_VAL_TAX.EXTEND;
      TLB_VAL_TAX (TLB_VAL_TAX.COUNT) :=
         (REC_DATA_TAX_VALIDATION (
                               A_OPERATING_UNIT (I),
                               A_ORGANIZATION_ID (I),
                               A_LOCATION_CODE (I),
                               NULL,
                               NULL,
                               NULL,
                               A_PRODUCTCODE(I),
                               NULL,
                               NULL,
                               A_STATUS(I),
                               NULL,
                               NULL,
                               NULL,
                               NULL
                               ));
   END LOOP;
   
   
   /*
   INSERT INTO TEMP(COLUMN1,COLUMN2)     
  
SELECT
 TM.ORGANIZATION_ID, 
       TM.PRODUCT_CODE PRODUCTCODE
  FROM TABLE (TLB_VAL_TAX) TM  -- TM.OPERATING_UNIT, TM.ORGANIZATION_ID, TM.LOCATION_CODE 
       LEFT JOIN VW_DSS_TAX_ITEM_MASTER ITM
          ON ITM.PRODUCTCODE = TM.PRODUCT_CODE
       LEFT JOIN VW_DSS_TAX_MASTER TMM ON TMM.TAX_RATE_NAME = ITM.ATTRIBUTE21
 WHERE 1=1 --TM.STATUS in ('Y') ;
   ;
   */

   OPEN OUTCURSOR FOR
     
  --select sysdate from dual;
   
 -- CREATE TABLE TBL1 AS 
   /* Formatted on 12/18/2017 11:46:41 AM (QP5 v5.227.12220.39754) */
SELECT
/*+DRIVING_SITE(ITM,TMM)*/ 
 TM.OPERATING_UNIT, 
 TM.ORGANIZATION_ID, 
 TM.LOCATION_CODE ,
TMM.ITDM_TAX_ID TAX_RATE_ID,
      TM.PRODUCT_CODE PRODUCTCODE,
       PM.ATTRIBUTE21,
       PM.ATTRIBUTE22,
       'N' TAX_COUNTRY_CODE ,
       TMM.ITDM_TAX_PERCENT TAX_RATE,
       TM.STATUS,
         CASE 
             WHEN upper(TM.STATUS)='Y' AND TMM.ITDM_TAX_ID IS NULL THEN 'E'
             WHEN upper(TM.STATUS)='N' AND  (TMM.ITDM_TAX_CODE<>0 and TMM.ITDM_TAX_ID IS NOT NULL) THEN 'E'
             WHEN upper(TM.STATUS)='N' AND  TMM.ITDM_TAX_CODE=0 THEN 'Y'           
             ELSE 'Y'
               END STATUS 
  FROM TABLE (TLB_VAL_TAX) TM   
  LEFT JOIN ITM_TAX_DETAIL_DSS TMM  ON TMM.ORGANIZATION_ID=TM.ORGANIZATION_ID AND TM.PRODUCT_CODE=TMM.ITMR_ITEM_CODE
  LEFT JOIN VW_DSS_TAX_ITEM_MASTER PM ON PM.PRODUCTCODE=TM.PRODUCT_CODE
  AND PM.ATTRIBUTE21=TMM.ITDM_TAX_CODE AND PM.ORGANIZATION_ID=TMM.ORGANIZATION_ID
    AND PM.INVENTORY_ITEM_ID=TMM.ERP_INVENTORY_ITEM_ID
;     
  
END;    


   PROCEDURE PV_CUSTOMERS (A_OPERATING_UNIT    IN     TY_OPERATING_UNIT,
                           A_ORGANIZATION_ID   IN     TY_ORGANIZATION_ID,
                           A_CUSTOMERID        IN     TY_CUSTOMERID,
                           A_SIDE_ID           IN     TY_SIDE_ID,
                           A_DESCRIPTION       IN     TY_DESCRIPTION,
                           A_OLDVALUE1         IN     TY_OLDVALUE1,
                           A_OLDVALUE2         IN     TY_OLDVALUE2,
                           A_STATUS            IN     TY_STATUS,
                           A_STATUS_MESSAGE    IN     TY_STATUS_MESSAGE,
                           A_RECORDS           IN     TY_RECORDS,
                           OUTCURSOR              OUT DSS.MYGEN.SQLCUR)
   AS
      TLB_VAL_LOCATIONS   COLL_DATA_VALIDATION := COLL_DATA_VALIDATION ();
   BEGIN
      FOR I IN A_OPERATING_UNIT.FIRST .. A_OPERATING_UNIT.LAST
      LOOP
         TLB_VAL_LOCATIONS.EXTEND;
         TLB_VAL_LOCATIONS (TLB_VAL_LOCATIONS.COUNT) :=
            (REC_DATA_VALIDATION (A_OPERATING_UNIT (I),
                                  A_ORGANIZATION_ID (I),
                                  NULL,
                                  NULL,
                                  A_CUSTOMERID (I),
                                  A_SIDE_ID (I),
                                  NULL,
                                  A_DESCRIPTION (I),
                                  A_OLDVALUE1 (I),
                                  A_OLDVALUE2 (I),
                                  A_STATUS (I),
                                  A_STATUS_MESSAGE (I),
                                  A_RECORDS (I)));
      END LOOP;
      OPEN OUTCURSOR FOR
         SELECT TA.OPERATING_UNIT,
                TA.ORGANIZATION_ID,
                TA.LOCATION_CODE,
                TA.PRODUCT_CODE,
                TA.CUSTOMER_ID,
                TA.CUSTOMER_SIDEID,
                TA.QTY,
                CASE
                   WHEN TL.CUSTOMER_NAME IS NULL THEN 'NOT EXISTS'
                   ELSE TL.CUSTOMER_NAME
                END
                   DESCRIPTION,
                TA.OLDVALUE1,
                TA.OLDVALUE2,
                CASE WHEN TL.CUSTOMER_NAME IS NULL THEN 'E' ELSE 'Y' END
                   STATUS,
                TA.STATUS_MESSAGE,
                TA.RECORDS
           FROM TABLE (TLB_VAL_LOCATIONS) TA
                LEFT OUTER JOIN VW_DSS_CUSTOMERS TL
                   ON TA.CUSTOMER_ID = TL.CUSTOMER_NUMBER -- AND TA.CUSTOMER_SIDEID = TL.PARTY_SITE_ID
                      AND TA.CUSTOMER_SIDEID = TL.PARTY_SITE_NUMBER --changed on 31may2016
                                                                   ----AND TA.OPERATING_UNIT = tl.ORG_ID
      ;
   END;
   
   
   PROCEDURE PV_LOCATIONS (A_OPERATING_UNIT    IN     TY_OPERATING_UNIT,
                           A_ORGANIZATION_ID   IN     TY_ORGANIZATION_ID,
                           A_LOCATION_CODE     IN     TY_LOCATION_CODE,
                           A_DESCRIPTION       IN     TY_DESCRIPTION,
                           A_OLDVALUE1         IN     TY_OLDVALUE1,
                           A_STATUS            IN     TY_STATUS,
                           A_STATUS_MESSAGE    IN     TY_STATUS_MESSAGE,
                           A_RECORDS           IN     TY_RECORDS,
                           OUTCURSOR              OUT DSS.MYGEN.SQLCUR)
   AS
      TLB_VAL_LOCATIONS   COLL_DATA_VALIDATION := COLL_DATA_VALIDATION ();
   BEGIN
      FOR I IN A_OPERATING_UNIT.FIRST .. A_OPERATING_UNIT.LAST
      LOOP
         TLB_VAL_LOCATIONS.EXTEND;
         TLB_VAL_LOCATIONS (TLB_VAL_LOCATIONS.COUNT) :=
            (REC_DATA_VALIDATION (A_OPERATING_UNIT (I),
                                  A_ORGANIZATION_ID (I),
                                  A_LOCATION_CODE (I),
                                  NULL,
                                  NULL,
                                  NULL,
                                  NULL,
                                  A_DESCRIPTION (I),
                                  A_OLDVALUE1 (I),
                                  NULL,
                                  A_STATUS (I),
                                  A_STATUS_MESSAGE (I),
                                  A_RECORDS (I)));
      END LOOP;
      OPEN OUTCURSOR FOR
         SELECT TA.OPERATING_UNIT,
                TA.ORGANIZATION_ID,
                TA.LOCATION_CODE,
                TA.PRODUCT_CODE,
                TA.CUSTOMER_ID,
                TA.CUSTOMER_SIDEID,
                TA.QTY,
                CASE
                   WHEN TL.LOCATION_CODE IS NULL THEN 'NOT EXISTS'
                   ELSE TL.DESCRIPTION
                END
                   DESCRIPTION,
                TA.OLDVALUE1,
                TA.OLDVALUE2,
                CASE WHEN TL.LOCATION_CODE IS NULL THEN 'E' ELSE 'Y' END
                   STATUS,
                TA.STATUS_MESSAGE,
                TA.RECORDS
           FROM TABLE (TLB_VAL_LOCATIONS) TA
                LEFT OUTER JOIN
                V_DSS_LOCATIONS TL
                   ON     TA.ORGANIZATION_ID = TL.ORGANIZATION_ID
                      AND TA.LOCATION_CODE = TL.LOCATION_CODE;
   END;
   PROCEDURE PV_ORGNIZATIONS (A_OPERATING_UNIT    IN     TY_OPERATING_UNIT,
                              A_ORGANIZATION_ID   IN     TY_ORGANIZATION_ID,
                              A_DESCRIPTION       IN     TY_DESCRIPTION,
                              A_OLDVALUE1         IN     TY_OLDVALUE1,
                              A_OLDVALUE2         IN     TY_OLDVALUE2,
                              A_STATUS            IN     TY_STATUS,
                              A_STATUS_MESSAGE    IN     TY_STATUS_MESSAGE,
                              A_RECORDS           IN     TY_RECORDS,
                              OUTCURSOR              OUT DSS.MYGEN.SQLCUR)
   AS
      TLB_VAL_LOCATIONS   COLL_DATA_VALIDATION := COLL_DATA_VALIDATION ();
   BEGIN
      FOR I IN A_OPERATING_UNIT.FIRST .. A_OPERATING_UNIT.LAST
      LOOP
         TLB_VAL_LOCATIONS.EXTEND;
         TLB_VAL_LOCATIONS (TLB_VAL_LOCATIONS.COUNT) :=
            (REC_DATA_VALIDATION (A_OPERATING_UNIT (I),
                                  A_ORGANIZATION_ID (I),
                                  NULL,
                                  NULL,
                                  NULL,
                                  NULL,
                                  NULL,
                                  A_DESCRIPTION (I),
                                  A_OLDVALUE1 (I),
                                  A_OLDVALUE2 (I),
                                  A_STATUS (I),
                                  A_STATUS_MESSAGE (I),
                                  A_RECORDS (I)));
      END LOOP;
      OPEN OUTCURSOR FOR
         SELECT TA.OPERATING_UNIT,
                TA.ORGANIZATION_ID,
                TA.LOCATION_CODE,
                TA.PRODUCT_CODE,
                TA.CUSTOMER_ID,
                TA.CUSTOMER_SIDEID,
                TA.QTY,
                CASE
                   WHEN TL.ORGANIZATION_ID IS NULL THEN 'NOT EXISTS'
                   ELSE TL.ORGANIZATION_NAME
                END
                   DESCRIPTION,
                TA.OLDVALUE1,
                TA.OLDVALUE2,
                CASE WHEN TL.ORGANIZATION_ID IS NULL THEN 'E' ELSE 'Y' END
                   STATUS,
                TA.STATUS_MESSAGE,
                TA.RECORDS
           FROM TABLE (TLB_VAL_LOCATIONS) TA
                LEFT OUTER JOIN V_DSS_ORGANIZATIONS TL
                   ON TA.ORGANIZATION_ID = TL.ORGANIZATION_ID;
   END;
   PROCEDURE PV_PRODUCTS (A_OPERATING_UNIT    IN     TY_OPERATING_UNIT,
                          A_ORGANIZATION_ID   IN     TY_ORGANIZATION_ID,
                          A_PRODUCT_CODE      IN     TY_PRODUCT_CODE,
                          A_DESCRIPTION       IN     TY_DESCRIPTION,
                          A_OLDVALUE1         IN     TY_OLDVALUE1,
                          A_STATUS            IN     TY_STATUS,
                          A_STATUS_MESSAGE    IN     TY_STATUS_MESSAGE,
                          A_RECORDS           IN     TY_RECORDS,
                          OUTCURSOR              OUT DSS.MYGEN.SQLCUR)
   AS
      TLB_VAL_LOCATIONS   COLL_DATA_VALIDATION := COLL_DATA_VALIDATION ();
   BEGIN
      FOR I IN A_OPERATING_UNIT.FIRST .. A_OPERATING_UNIT.LAST
      LOOP
         TLB_VAL_LOCATIONS.EXTEND;
         TLB_VAL_LOCATIONS (TLB_VAL_LOCATIONS.COUNT) :=
            (REC_DATA_VALIDATION (A_OPERATING_UNIT (I),
                                  A_ORGANIZATION_ID (I),
                                  NULL,
                                  A_PRODUCT_CODE (I),
                                  NULL,
                                  NULL,
                                  NULL,
                                  A_DESCRIPTION (I),
                                  A_OLDVALUE1 (I),
                                  NULL,
                                  A_STATUS (I),
                                  A_STATUS_MESSAGE (I),
                                  A_RECORDS (I)));
      END LOOP;
      OPEN OUTCURSOR FOR
         SELECT TA.OPERATING_UNIT,
                TA.ORGANIZATION_ID,
                TA.LOCATION_CODE,
                TA.PRODUCT_CODE,
                TA.CUSTOMER_ID,
                TA.CUSTOMER_SIDEID,
                TA.QTY,
                CASE
                   WHEN TL.SEGMENT1 IS NULL THEN 'NOT EXISTS'
                   ELSE TL.DESCRIPTION
                END
                   DESCRIPTION,
                TA.OLDVALUE1,
                TA.OLDVALUE2,
                CASE WHEN TL.SEGMENT1 IS NULL THEN 'E' ELSE 'Y' END STATUS,
                TA.STATUS_MESSAGE,
                TA.RECORDS
           FROM TABLE (TLB_VAL_LOCATIONS) TA
                LEFT OUTER JOIN
                SYN_MTL_SYSTEM_ITEMS TL
                   ON     TA.ORGANIZATION_ID = TL.ORGANIZATION_ID
                      AND UPPER (TA.PRODUCT_CODE) = UPPER (TL.SEGMENT1);
   END PV_PRODUCTS;
   PROCEDURE PV_ONHANDQTY (A_OPERATING_UNIT    IN     TY_OPERATING_UNIT,
                           A_ORGANIZATION_ID   IN     TY_ORGANIZATION_ID,
                           A_LOCATION_CODE     IN     TY_LOCATION_CODE,
                           A_PRODUCT_CODE      IN     TY_PRODUCT_CODE,
                           A_QTY               IN     TY_QTY,
                           A_DESCRIPTION       IN     TY_DESCRIPTION,
                           A_OLDVALUE1         IN     TY_OLDVALUE1,
                           A_STATUS            IN     TY_STATUS,
                           A_STATUS_MESSAGE    IN     TY_STATUS_MESSAGE,
                           A_RECORDS           IN     TY_RECORDS,
                           OUTCURSOR              OUT DSS.MYGEN.SQLCUR)
   AS
      TLB_VAL_LOCATIONS   COLL_DATA_VALIDATION := COLL_DATA_VALIDATION ();
   BEGIN
      FOR I IN A_OPERATING_UNIT.FIRST .. A_OPERATING_UNIT.LAST
      LOOP
         TLB_VAL_LOCATIONS.EXTEND;
         TLB_VAL_LOCATIONS (TLB_VAL_LOCATIONS.COUNT) :=
            (REC_DATA_VALIDATION (A_OPERATING_UNIT (I),
                                  A_ORGANIZATION_ID (I),
                                  A_LOCATION_CODE (I),
                                  A_PRODUCT_CODE (I),
                                  NULL,
                                  NULL,
                                  A_QTY (I),
                                  A_DESCRIPTION (I),
                                  A_OLDVALUE1 (I),
                                  NULL,
                                  A_STATUS (I),
                                  A_STATUS_MESSAGE (I),
                                  A_RECORDS (I)));
      END LOOP;
      OPEN OUTCURSOR FOR
         SELECT TA.OPERATING_UNIT,
                TA.ORGANIZATION_ID,
                TA.LOCATION_CODE,
                TA.PRODUCT_CODE,
                TA.CUSTOMER_ID,
                TA.CUSTOMER_SIDEID,
                TA.QTY,
                CASE
                   WHEN TL.ON_HAND_QUANTITY IS NULL THEN '0'
                   ELSE TO_CHAR (TL.ON_HAND_QUANTITY)
                END
                   DESCRIPTION,
                TA.OLDVALUE1,
                TA.OLDVALUE2,
                CASE
                   WHEN TL.ON_HAND_QUANTITY IS NULL
                   THEN
                      'E'
                   ELSE
                      CASE
                         WHEN TL.ON_HAND_QUANTITY < TA.QTY THEN 'E'
                         ELSE 'Y'
                      END
                END
                   STATUS,
                TA.STATUS_MESSAGE,
                TA.RECORDS
           FROM TABLE (TLB_VAL_LOCATIONS) TA
                LEFT OUTER JOIN
                V_DSS_ONHAND_QUANTITIES TL
                   ON     TA.ORGANIZATION_ID = TL.ORGANIZATION_ID
                      AND UPPER (TA.PRODUCT_CODE) = UPPER (TL.PRODUCT_CODE)
                      AND UPPER (TA.LOCATION_CODE) =
                             UPPER (TL.SUBINVENTORY_CODE);
   END PV_ONHANDQTY;
END PKG_DATA_VALIDATION;
/
