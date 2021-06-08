DROP VIEW DSS.V_DSS_OPERATING_UNITS;

CREATE OR REPLACE FORCE VIEW DSS.V_DSS_OPERATING_UNITS
(
    OPERATING_UNIT
   ,DESCRIPTION
   ,CREATE_DATE
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
   ,CREATE_BY
   ,MODIFY_BY
   ,MODIFY_DATE
   ,ATTRIBUTE1
   ,ATTRIBUTE2
   ,ATTRIBUTE3
   ,ATTRIBUTE4
   ,ATTRIBUTE5
   ,ATTRIBUTE6
   ,ATTRIBUTE7
   ,ATTRIBUTE8
   ,ATTRIBUTE9
   ,ATTRIBUTE10
)
AS
    SELECT VUNITS.OPERATING_UNIT
          ,VUNITS.DESCRIPTION
          ,VUNITS.CREATE_DATE
          ,VUNITS.DISABLE_DATE
          ,VUNITS.ACTIVE
          ,NVL(DUNITS.STATUS, 'N') STATUS
          ,DUNITS.COUNTRY_NAME
          ,DUNITS.COUNTRY_CODE
          ,DUNITS.TIMEZONE
          ,DUNITS.ITEM_MASTER_ORGANIZATION
          ,NVL(DUNITS.WMS_ENABLED, 'N') WMS_ENABLED
          ,DUNITS.WMS_CONFIG
          ,NVL(DUNITS.VCARE_ENABLED, 'N') VCARE_ENABLED
          ,DUNITS.VCARE_CONFIG
          ,NVL(DUNITS.OPTIMIZA_ENABLED, 'N') OPTIMIZA_ENABLED
          ,DUNITS.OPTIMIZA_CONFIG
          ,DUNITS.CREATE_BY
          ,DUNITS.MODIFY_BY
          ,DUNITS.MODIFY_DATE
          ,DUNITS.ATTRIBUTE1
          ,DUNITS.ATTRIBUTE2
          ,DUNITS.ATTRIBUTE3
          ,DUNITS.ATTRIBUTE4
          ,DUNITS.ATTRIBUTE5
          ,DUNITS.ATTRIBUTE6
          ,DUNITS.ATTRIBUTE7
          ,DUNITS.ATTRIBUTE8
          ,DUNITS.ATTRIBUTE9
          ,DUNITS.ATTRIBUTE10
    FROM V_OPERATING_UNITS VUNITS
         LEFT OUTER JOIN DSS_OPERATING_UNITS DUNITS
             ON VUNITS.OPERATING_UNIT = DUNITS.OPERATING_UNIT;


GRANT SELECT ON DSS.V_DSS_OPERATING_UNITS TO SELDATA;