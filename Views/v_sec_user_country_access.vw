DROP VIEW DSS.V_SEC_USER_COUNTRY_ACCESS;

CREATE OR REPLACE FORCE VIEW DSS.V_SEC_USER_COUNTRY_ACCESS
(
    USER_NAME
   ,DISPLAY_NAME
   ,OPERATING_UNIT
   ,DESCRIPTION
   ,DISABLE_DATE
   ,ACTIVE
   ,STATUS
   ,COUNTRY_NAME
   ,COUNTRY_CODE
   ,TIMEZONE
   ,ITEM_MASTER_ORGANIZATION
   ,WMS_ENABLED
   ,WMS_CONFIG
   ,VCARE_ENABLED
   ,VCARE_CONFIG
   ,OPTIMIZA_ENABLED
   ,OPTIMIZA_CONFIG
   ,MODIFY_DATE
   ,EXPIRY_DATE
   ,CREATE_BY
   ,CREATE_DATE
   ,ENABLED
   ,ATTRIBUTE1
   ,ATTRIBUTE2
   ,ATTRIBUTE3
   ,ATTRIBUTE4
   ,ATTRIBUTE5
   ,ATTRIBUTE6
)
AS
    SELECT UC.USER_NAME
          ,US.DISPLAY_NAME
          ,UT.OPERATING_UNIT
          ,UT.DESCRIPTION
          ,UT.DISABLE_DATE
          ,UT.ACTIVE
          ,UT.STATUS
          ,UT.COUNTRY_NAME
          ,UT.COUNTRY_CODE
          ,UT.TIMEZONE
          ,UT.ITEM_MASTER_ORGANIZATION
          ,UT.WMS_ENABLED
          ,UT.WMS_CONFIG
          ,UT.VCARE_ENABLED
          ,UT.VCARE_CONFIG
          ,UT.OPTIMIZA_ENABLED
          ,UT.OPTIMIZA_CONFIG
          ,UC.MODIFY_DATE
          ,UC.EXPIRY_DATE
          ,UC.CREATE_BY
          ,UC.CREATE_DATE
          ,UC.ENABLED
          ,UT.ATTRIBUTE1
          ,UT.ATTRIBUTE2
          ,UT.ATTRIBUTE3
          ,UT.ATTRIBUTE4
          ,UT.ATTRIBUTE5
          ,UT.ATTRIBUTE6
    FROM SEC_USER_COUNTRY_ACCESS UC
         LEFT OUTER JOIN SEC_USERS US ON UC.USER_NAME = US.USER_NAME
         LEFT OUTER JOIN V_DSS_OPERATING_UNITS UT
             ON UC.OPERATING_UNIT = UT.OPERATING_UNIT;


GRANT SELECT ON DSS.V_SEC_USER_COUNTRY_ACCESS TO SELDATA;
