DROP VIEW DSS.V_DSS_MS_MODELS;

CREATE OR REPLACE FORCE VIEW DSS.V_DSS_MS_MODELS
(
    ID
   ,DESCRIPTION
   ,LAST_UPDATE_DATE
)
AS
    SELECT FLEX_VALUE_MEANING ID, DESCRIPTION, LAST_UPDATE_DATE
    FROM SYN_FLEX_VALUES
    WHERE FLEX_VALUE_SET_ID = 1009634
          AND FLEX_VALUE_MEANING = UPPER(FLEX_VALUE_MEANING);


GRANT SELECT ON DSS.V_DSS_MS_MODELS TO SELDATA;
