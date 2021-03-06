DROP VIEW DSS.VW_RULES_PARAM_TO_KEYS;

CREATE OR REPLACE FORCE VIEW DSS.VW_RULES_PARAM_TO_KEYS
(
    RULEID
   ,KEYID
   ,RULE_PARAMETERS
)
AS
    SELECT RULEID
          ,LINES.COLUMN_VALUE
               KEYID
          ,TRIM(
               REGEXP_SUBSTR(RULE_PARAMETERS, '[^#]+', 1, LINES.COLUMN_VALUE))
               RULE_PARAMETERS
    FROM INTM_VALIDATION_RULES
        ,TABLE(
             CAST(
                 MULTISET(
                     SELECT LEVEL
                     FROM DUAL
                     CONNECT BY INSTR(RULE_PARAMETERS, '#', 1, LEVEL - 1) > 0)
                     AS SYS.ODCINUMBERLIST)) LINES
    ORDER BY RULEID, LINES.COLUMN_VALUE;


GRANT SELECT ON DSS.VW_RULES_PARAM_TO_KEYS TO SELDATA;
