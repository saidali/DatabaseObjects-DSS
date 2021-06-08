DROP PROCEDURE DSS.SP_MOVE_TO_RULES;

CREATE OR REPLACE PROCEDURE DSS.sp_move_to_rules
AS
BEGIN
   BEGIN
      UPDATE TK_CATEGORIES_CONFIG
         SET ATTRIBUTE8 = NULL, ATTRIBUTE7 = NULL, ATTRIBUTE6 = NULL;

      UPDATE TK_PRODUCTS_CONFIG
         SET ATTRIBUTE8 = NULL, ATTRIBUTE7 = NULL, ATTRIBUTE6 = NULL;



      DELETE FROM INTM_VALIDATION_RULES;



      DELETE FROM INTM_VALIDATION_KEYS;
   END;



   BEGIN
      UPDATE TK_CATEGORIES_CONFIG
         SET ATTRIBUTE8 =
                CONCAT (
                   '1,',
                      UNIQUE_KEY
                   || ','
                   || NUMERIC_KEY
                   || ','
                   || IMEI_KEY
                   || ','
                   || ALLOW_SPECIALCHAR
                   || ','
                   || IMEI_LENGTH_MAX
                   || ','
                   || IMEI_LENGTH_MIN
                   || ','
                   || SCAN_REQUIRED),
             ATTRIBUTE7 =
                   '('
                || IMEI_LENGTH_MIN
                || ' To '
                || IMEI_LENGTH_MAX
                || ')'
                || CASE
                      WHEN NUMERIC_KEY = 'Y' THEN ' Numeric '
                      ELSE ' AlphNumeric '
                   END
                || CASE WHEN UNIQUE_KEY = 'Y' THEN 'Unique ' ELSE ' ' END
                || 'Key With '
                || CASE
                      WHEN NVL (ALLOW_SPECIALCHAR, 'N') = ' NO ' THEN ''
                   END
                || 'Special Characters '
                || CASE
                      WHEN IMEI_KEY = 'Y' THEN 'With Luhan Validation'
                      ELSE ''
                   END;
   --- WHERE SCAN_REQUIRED = 'Y';

   END;
 

   BEGIN
      INSERT INTO INTM_VALIDATION_RULES (RULE_NAME, RULE_PARAMETERS)
           SELECT DISTINCT ATTRIBUTE7, ATTRIBUTE8
             FROM TK_CATEGORIES_CONFIG
            WHERE ATTRIBUTE7 IS NOT NULL
         ORDER BY 1;
   END;



   BEGIN
      UPDATE TK_CATEGORIES_CONFIG
         SET ATTRIBUTE6 =
                (SELECT RULEID
                   FROM INTM_VALIDATION_RULES
                  WHERE RULE_PARAMETERS = ATTRIBUTE8)
       WHERE ATTRIBUTE7 IS NOT NULL;
   END;



   BEGIN
      INSERT INTO INTM_VALIDATION_KEYS (RULEID,
                                        KEYID,
                                        KEYNAME,
                                        UNIQUE_KEY,
                                        NUMERIC_KEY,
                                        MAX_LENGTH,
                                        MIN_length,
                                        LUHN_KEY,
                                        SPECIAL_CHARS,
                                        CAPTURE)
         SELECT RULEID,
                1,
                'Key 1',
                CASE
                   WHEN REGEXP_SUBSTR (RULE_PARAMETERS,
                                       '[^,]+',
                                       1,
                                       2) = 'Y'
                   THEN
                      1
                   ELSE
                      0
                END
                   UNIQUE_KEY,
                CASE
                   WHEN REGEXP_SUBSTR (RULE_PARAMETERS,
                                       '[^,]+',
                                       1,
                                       3) = 'Y'
                   THEN
                      1
                   ELSE
                      0
                END
                   NUMERIC_KEY,
                REGEXP_SUBSTR (RULE_PARAMETERS,
                               '[^,]+',
                               1,
                               6)
                   AS IMEI_LENGTH_MAX,
                REGEXP_SUBSTR (RULE_PARAMETERS,
                               '[^,]+',
                               1,
                               7)
                   AS IMEI_LENGTH_MIN,
                CASE
                   WHEN REGEXP_SUBSTR (RULE_PARAMETERS,
                                       '[^,]+',
                                       1,
                                       4) = 'Y'
                   THEN
                      1
                   ELSE
                      0
                END
                   IMEI_KEY,
                CASE
                   WHEN REGEXP_SUBSTR (RULE_PARAMETERS,
                                       '[^,]+',
                                       1,
                                       5) = 'Y'
                   THEN
                      1
                   ELSE
                      0
                END
                   ALLOW_SPECIALCHAR,
                CASE
                   WHEN REGEXP_SUBSTR (RULE_PARAMETERS,
                                       '[^,]+',
                                       1,
                                       8) = 'Y'
                   THEN
                      1
                   ELSE
                      0
                END
                   AS SCAN_REQUIRED
           FROM INTM_VALIDATION_RULES;
   END;



   BEGIN
      UPDATE TK_PRODUCTS_CONFIG pc
         SET ATTRIBUTE7 =
                (SELECT    ORGANIZATION_ID
                        || ':'
                        || BRAND_CODE
                        || '-'
                        || MODEL_CODE
                   FROM DSS_PRODUCTS pm
                  WHERE     pc.ORGANIZATION_ID = pm.ORGANIZATION_ID
                        AND pc.INVENTORY_ITEM_ID = pm.INVENTORY_ITEM_ID),
             ATTRIBUTE6 =
                (SELECT BRAND_CODE || '-' || MODEL_CODE
                   FROM DSS_PRODUCTS pm
                  WHERE     pc.ORGANIZATION_ID = pm.ORGANIZATION_ID
                        AND pc.INVENTORY_ITEM_ID = pm.INVENTORY_ITEM_ID);



      UPDATE TK_PRODUCTS_CONFIG
         SET ATTRIBUTE6 = NULL, ATTRIBUTE7 = NULL
       WHERE ATTRIBUTE6 IN ('DU1-NM', 'ALC-NM', 'FOUR-NM');
   END;



   BEGIN
      INSERT INTO INTM_VALIDATION_RULES (RULE_NAME, RULE_CODE)
         SELECT DISTINCT ATTRIBUTE7, ATTRIBUTE6
           FROM TK_PRODUCTS_CONFIG
          WHERE ATTRIBUTE7 IS NOT NULL;
   END;
END;
/
