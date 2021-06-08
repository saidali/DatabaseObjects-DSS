DROP VIEW DSS.VW_RULES_TO_KEYS;

CREATE OR REPLACE FORCE VIEW DSS.VW_RULES_TO_KEYS
(
    RULEID
   ,KEYID
   ,RULE_PARAMETERS
   ,CONFIGID
   ,UNIQUE_KEY
   ,NUMERIC_KEY
   ,IMEI_KEY
   ,ALLOW_SPECIALCHAR
   ,IMEI_LENGTH_MAX
   ,IMEI_LENGTH_MIN
   ,ALLOWNULL
)
AS
    SELECT "RULEID"
          ,"KEYID"
          ,"RULE_PARAMETERS"
          ,"CONFIGID"
          ,"UNIQUE_KEY"
          ,"NUMERIC_KEY"
          ,"IMEI_KEY"
          ,"ALLOW_SPECIALCHAR"
          ,"IMEI_LENGTH_MAX"
          ,"IMEI_LENGTH_MIN"
          ,"ALLOWNULL"
    FROM (SELECT RULEID
                ,KEYID
                ,RULE_PARAMETERS
                ,REGEXP_SUBSTR(RULE_PARAMETERS, '[^,]+', 1, 1)
                     AS CONFIGID
                ,DECODE(REGEXP_SUBSTR(RULE_PARAMETERS, '[^,]+', 1, 2)
                       ,'N', 0
                       ,'Y', 1
                       ,0)
                     AS UNIQUE_KEY
                ,DECODE(REGEXP_SUBSTR(RULE_PARAMETERS, '[^,]+', 1, 3)
                       ,'N', 0
                       ,'Y', 1
                       ,0)
                     AS NUMERIC_KEY
                ,DECODE(REGEXP_SUBSTR(RULE_PARAMETERS, '[^,]+', 1, 4)
                       ,'N', 0
                       ,'Y', 1
                       ,0)
                     AS IMEI_KEY
                ,DECODE(REGEXP_SUBSTR(RULE_PARAMETERS, '[^,]+', 1, 5)
                       ,'N', 0
                       ,'Y', 1
                       ,0)
                     AS ALLOW_SPECIALCHAR
                ,REGEXP_SUBSTR(RULE_PARAMETERS, '[^,]+', 1, 6)
                     AS IMEI_LENGTH_MAX
                ,REGEXP_SUBSTR(RULE_PARAMETERS, '[^,]+', 1, 7)
                     AS IMEI_LENGTH_MIN
                ,DECODE(REGEXP_SUBSTR(RULE_PARAMETERS, '[^,]+', 1, 8)
                       ,'N', 0
                       ,'Y', 1
                       ,0)
                     AS ALLOWNULL
          FROM VW_RULES_PARAM_TO_KEYS
          ORDER BY 1, 2);


GRANT SELECT ON DSS.VW_RULES_TO_KEYS TO SELDATA;
