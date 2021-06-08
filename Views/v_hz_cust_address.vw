DROP VIEW DSS.V_HZ_CUST_ADDRESS;

CREATE OR REPLACE FORCE VIEW DSS.V_HZ_CUST_ADDRESS
(
    CUST_ACCOUNT_ID
   ,CUSTOMER_NUMBER
   ,CUSTOMER_NAME
   ,ACTUALNAME
   ,CUSTOMER_TIN
   ,SITE_USE_ID
   ,ADDRESS1
   ,ADDRESS2
   ,ADDRESS3
   ,ADDRESS4
   ,CITY
   ,STATE
   ,COUNTRY
   ,POSTAL_CODE
   ,PO_BOX_NUMBER
)
AS
    SELECT CUST_ACCOUNT_ID
          ,CUST.CUSTOMER_NUMBER
          ,CUST.CUSTOMER_NAME
          ,ACTUALNAME
          ,CUST.TAX_REFERENCE
          ,HZC.SITE_USE_ID
          ,ADDRESS1
          ,ADDRESS2
          ,ADDRESS3
          ,ADDRESS4
          ,CITY
          ,STATE
          ,COUNTRY
          ,POSTAL_CODE
          ,PO_BOX_NUMBER
    FROM SYN_AR_CUSTOMERS CUST
         LEFT JOIN SYN_HZ_CUST_ACCT_SITES_ALL CAS
             ON CUST.CUSTOMER_ID = CAS.CUST_ACCOUNT_ID
         LEFT JOIN SYN_HZ_PARTY_SITES PS
             ON PS.PARTY_SITE_ID = CAS.PARTY_SITE_ID
         LEFT JOIN SYN_HZ_LOCATIONS LOC ON LOC.LOCATION_ID = PS.LOCATION_ID
         LEFT JOIN SYN_HZ_CUST_SITE_USES_ALL HZC
             ON CAS.CUST_ACCT_SITE_ID = HZC.CUST_ACCT_SITE_ID;


GRANT SELECT ON DSS.V_HZ_CUST_ADDRESS TO SELDATA;