DROP VIEW DSS.V_SYN_OER_LOCATION_CONFIG;

CREATE OR REPLACE FORCE VIEW DSS.V_SYN_OER_LOCATION_CONFIG
(
    RULEID
   ,OPERATING_UNIT
   ,OPERATING_UNIT_DESC
   ,ORGANIZATION_ID
   ,ORGANIZATION_CODE
   ,ORGANIZATION_NAME
   ,SUBINVENTORY_CODE
   ,OPT_LOCATION_CODE
   ,LOCATION_DESC
   ,LOCATION_TYPE
   ,REGION
   ,OPTIMIZA_ENDABLED
   ,OPT_YN
   ,WH_SUBINVENTORY_CODE
   ,AGING_METHOD
   ,ACTIVE
   ,CREATE_DATE
   ,CREATE_BY
   ,ATTRIBUTE1
   ,ATTRIBUTE2
   ,ATTRIBUTE3
   ,ATTRIBUTE4
   ,ATTRIBUTE5
)
AS
    SELECT RULEID
          ,L.OPERATING_UNIT
          ,OPR.DESCRIPTION OPERATING_UNIT_DESC
          ,L.ORGANIZATION_ID
          ,ORGANIZATION_CODE
          ,ORGANIZATION_NAME
          ,SUBINVENTORY_CODE
          ,OPT_LOCATION_CODE
          ,LOC.DESCRIPTION LOCATION_DESC
          ,LOC.LOCATION_TYPE
          ,LOC.REGION
          ,LOC.OPTIMIZA_ENDABLED
          ,OPT_YN
          ,L.WH_SUBINVENTORY_CODE
          ,L.AGING_METHOD
          ,L.ACTIVE
          ,L.CREATE_DATE
          ,L.CREATE_BY
          ,L.ATTRIBUTE1
          ,L.ATTRIBUTE2
          ,L.ATTRIBUTE3
          ,L.ATTRIBUTE4
          ,L.ATTRIBUTE5
    FROM SYN_OER_LOCATION_CONFIG L
         LEFT JOIN V_DSS_OPERATING_UNITS OPR
             ON L.OPERATING_UNIT = OPR.OPERATING_UNIT
         LEFT JOIN V_DSS_ORGANIZATIONS ORG
             ON L.ORGANIZATION_ID = ORG.ORGANIZATION_ID
         LEFT JOIN V_DSS_LOCATIONS LOC
             ON L.ORGANIZATION_ID = LOC.ORGANIZATION_ID
                AND L.SUBINVENTORY_CODE = LOC.LOCATION_CODE
    WHERE LOC.ACTIVE = 'Y';


GRANT SELECT ON DSS.V_SYN_OER_LOCATION_CONFIG TO SELDATA;
