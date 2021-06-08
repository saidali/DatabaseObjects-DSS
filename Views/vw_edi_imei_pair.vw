DROP VIEW DSS.VW_EDI_IMEI_PAIR;

CREATE OR REPLACE FORCE VIEW DSS.VW_EDI_IMEI_PAIR
(
    FILE_SEQ
   ,COUNTRY_CODE
   ,BRAND
   ,PRODUCT_CODE
   ,IMEI1
   ,KEYID
   ,IMEI2
   ,READ_FLAG
   ,PART_CODE1
   ,MODEL_CODE1
   ,SERIAL_NO
)
AS
    WITH
        IMEI2
        AS
            (SELECT FILE_SEQ
                   ,COUNTRY_CODE
                   ,BRAND
                   ,PRODUCT_CODE
                   ,PARENTKEY
                   ,KEYID
                   ,SERIALKEY AS IMEI2
                   ,NVL(STATUS, 'N') AS READ_FLAG
                   ,PART_CODE1
                   ,MODEL_CODE1
             FROM DSS_FILE_SERIALS
             WHERE KEYID = 2),
        SNNO
        AS
            (SELECT FILE_SEQ
                   ,COUNTRY_CODE
                   ,BRAND
                   ,PRODUCT_CODE
                   ,PARENTKEY
                   ,KEYID
                   ,SERIALKEY AS SERIAL_NO
                   ,NVL(STATUS, 'N') AS READ_FLAG
             FROM DSS_FILE_SERIALS
             WHERE KEYID = 3)
    SELECT IMEI2.FILE_SEQ
          ,IMEI2.COUNTRY_CODE
          ,IMEI2.BRAND
          ,IMEI2.PRODUCT_CODE
          ,IMEI2.PARENTKEY AS IMEI1
          ,IMEI2.KEYID
          ,IMEI2.IMEI2
          ,IMEI2.READ_FLAG
          ,IMEI2.PART_CODE1
          ,IMEI2.MODEL_CODE1
          ,SNNO.SERIAL_NO
    FROM IMEI2 LEFT JOIN SNNO ON SNNO.PARENTKEY = IMEI2.PARENTKEY;


GRANT SELECT ON DSS.VW_EDI_IMEI_PAIR TO SELDATA;
