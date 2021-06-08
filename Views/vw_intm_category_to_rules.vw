DROP VIEW DSS.VW_INTM_CATEGORY_TO_RULES;

CREATE OR REPLACE FORCE VIEW DSS.VW_INTM_CATEGORY_TO_RULES
(
    RULE_PARAMETERS
   ,RULE_NAME
   ,RULE_TYPE
)
AS
    SELECT DISTINCT
           CASE
               WHEN UNIQUE_KEY = 'Y'
               THEN
                   CONCAT('1,'
                         ,UNIQUE_KEY || ',' || NUMERIC_KEY || ',' ||
                          IMEI_KEY || ',' || ALLOW_SPECIALCHAR || ',' ||
                          IMEI_LENGTH_MAX || ',' || IMEI_LENGTH_MIN || ',' ||
                          ALLOWNULL)
               ELSE
                   '1,N,N,N,Y,100,1,0'
           END
               RULE_PARAMETERS
          ,CASE
               WHEN UNIQUE_KEY = 'Y'
               THEN
                   '[' || IMEI_LENGTH_MIN || ' To ' || IMEI_LENGTH_MAX ||
                   ']' || CASE
                       WHEN NUMERIC_KEY = 'Y'
                   THEN
                       ' Numeric '
                       ELSE
                       ' AlphNumeric '
                   END || CASE
                       WHEN NVL(ALLOW_SPECIALCHAR, 'N') = 'N'
                   THEN
                       ' No '
                   END || 'Special Characters ' || CASE
                       WHEN IMEI_KEY = 'Y'
                   THEN
                       'With Luhan Validation'
                       ELSE
                       ''
                   END
               ELSE
                   'Non  Unique Keys'
           END
               RULE_NAME
          ,'CATEGORY_LEVEL'
               RULE_TYPE
    FROM TK_CATEGORIES_CONFIG
    WHERE 1 = 1;


GRANT SELECT ON DSS.VW_INTM_CATEGORY_TO_RULES TO SELDATA;
