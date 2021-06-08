DROP VIEW DSS.DSS_PRICE_LIST_HEADER;

CREATE OR REPLACE FORCE VIEW DSS.DSS_PRICE_LIST_HEADER
(
    LIST_HEADER_ID
   ,NAME
   ,DESCRIPTION
   ,VERSION_NO
   ,ACTIVE
   ,CREATION_DATE
)
AS
    SELECT LIST_HEADER_ID
          ,NAME
          ,DESCRIPTION
          ,VERSION_NO
          ,'Y' ACTIVE
          ,CREATION_DATE
    FROM SYN_PRICE_LIST_HEADER
    ORDER BY 2;


GRANT SELECT ON DSS.DSS_PRICE_LIST_HEADER TO SELDATA;