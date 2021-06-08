DROP PACKAGE DSS.PKG_OER_LOCATION_CONFIG;

CREATE OR REPLACE PACKAGE DSS.PKG_OER_LOCATION_CONFIG
AS
   PROCEDURE p_Update (P_RULEID                  NUMBER,
                       P_OPERATING_UNIT          NUMBER,
                       P_ORGANIZATION_ID         VARCHAR,
                       P_SUBINVENTORY_CODE       VARCHAR,
                       P_OPT_LOCATION_CODE       VARCHAR,
                       P_OPT_YN                  VARCHAR,
                       P_WH_SUBINVENTORY_CODE    VARCHAR,
                       P_AGING_METHOD            VARCHAR,
                       P_ATTRIBUTE1              VARCHAR);

   PROCEDURE p_Delete (P_RULEID                  NUMBER,
                       P_OPERATING_UNIT          NUMBER,
                       P_ORGANIZATION_ID         VARCHAR,
                       P_SUBINVENTORY_CODE       VARCHAR,
                       P_OPT_LOCATION_CODE       VARCHAR,
                       P_OPT_YN                  VARCHAR,
                       P_WH_SUBINVENTORY_CODE    VARCHAR,
                       P_AGING_METHOD            VARCHAR,
                       P_ATTRIBUTE1              VARCHAR);

   PROCEDURE p_Add (P_ORGANIZATION_ID      VARCHAR,
                    P_SUBINVENTORY_CODE    VARCHAR,
                    P_CREATE_BY            VARCHAR);
END PKG_OER_LOCATION_CONFIG;
/


DROP PACKAGE BODY DSS.PKG_OER_LOCATION_CONFIG;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_OER_LOCATION_CONFIG
AS
   PROCEDURE p_Update (P_RULEID                  NUMBER,
                       P_OPERATING_UNIT          NUMBER,
                       P_ORGANIZATION_ID         VARCHAR,
                       P_SUBINVENTORY_CODE       VARCHAR,
                       P_OPT_LOCATION_CODE       VARCHAR,
                       P_OPT_YN                  VARCHAR,
                       P_WH_SUBINVENTORY_CODE    VARCHAR,
                       P_AGING_METHOD            VARCHAR,
                       P_ATTRIBUTE1              VARCHAR)
   AS
   BEGIN
      UPDATE OER_LOCATION_CONFIG@ERPBRIDGE
         SET OPT_LOCATION_CODE = P_OPT_LOCATION_CODE,
             WH_SUBINVENTORY_CODE = P_WH_SUBINVENTORY_CODE,
             AGING_METHOD = P_AGING_METHOD,
             ACTIVE = 'Y',
             ATTRIBUTE1 = P_ATTRIBUTE1,                           -- MODIFY BY
             ATTRIBUTE2 = SYSDATE                               -- MODIFY DATE
       WHERE RULEID = P_RULEID;

      INSERT
        INTO OER_LOCATION_CONFIG_HISTORY@ERPBRIDGE (OPERATING_UNIT,
                                                    ORGANIZATION_ID,
                                                    SUBINVENTORY_CODE,
                                                    OPT_LOCATION_CODE,
                                                    OPT_YN,
                                                    WH_SUBINVENTORY_CODE,
                                                    AGING_METHOD,
                                                    CREATE_DATE,
                                                    CREATE_BY,
                                                    ATTRIBUTE1,
                                                    ATTRIBUTE2)
      VALUES (P_OPERATING_UNIT,
              P_OPERATING_UNIT,
              P_SUBINVENTORY_CODE,
              P_OPT_LOCATION_CODE,                         --OPT_LOCATION_CODE
              P_OPT_YN,                                               --OPT_YN
              P_WH_SUBINVENTORY_CODE,                   --WH_SUBINVENTORY_CODE
              P_AGING_METHOD,                                   --AGING_METHOD
              SYSDATE,
              P_ATTRIBUTE1,
              'Updated',
              P_RULEID);
   END p_Update;

   PROCEDURE p_Delete (P_RULEID                  NUMBER,
                       P_OPERATING_UNIT          NUMBER,
                       P_ORGANIZATION_ID         VARCHAR,
                       P_SUBINVENTORY_CODE       VARCHAR,
                       P_OPT_LOCATION_CODE       VARCHAR,
                       P_OPT_YN                  VARCHAR,
                       P_WH_SUBINVENTORY_CODE    VARCHAR,
                       P_AGING_METHOD            VARCHAR,
                       P_ATTRIBUTE1              VARCHAR)
   AS
   BEGIN
      DELETE FROM OER_LOCATION_CONFIG@ERPBRIDGE
            WHERE RULEID = P_RULEID;

      INSERT
        INTO OER_LOCATION_CONFIG_HISTORY@ERPBRIDGE (OPERATING_UNIT,
                                                    ORGANIZATION_ID,
                                                    SUBINVENTORY_CODE,
                                                    OPT_LOCATION_CODE,
                                                    OPT_YN,
                                                    WH_SUBINVENTORY_CODE,
                                                    AGING_METHOD,
                                                    CREATE_DATE,
                                                    CREATE_BY,
                                                    ATTRIBUTE1,
                                                    ATTRIBUTE2)
      VALUES (P_OPERATING_UNIT,
              P_OPERATING_UNIT,
              P_SUBINVENTORY_CODE,
              P_OPT_LOCATION_CODE,                         --OPT_LOCATION_CODE
              P_OPT_YN,                                               --OPT_YN
              P_WH_SUBINVENTORY_CODE,                   --WH_SUBINVENTORY_CODE
              P_AGING_METHOD,                                   --AGING_METHOD
              SYSDATE,
              P_ATTRIBUTE1,
              'Deleted',
              P_RULEID);
   END p_Delete;

   PROCEDURE p_Add (P_ORGANIZATION_ID      VARCHAR,
                    P_SUBINVENTORY_CODE    VARCHAR,
                    P_CREATE_BY            VARCHAR)
   AS
   BEGIN
      INSERT INTO OER_LOCATION_CONFIG@ERPBRIDGE (OPERATING_UNIT,
                                                 ORGANIZATION_ID,
                                                 SUBINVENTORY_CODE,
                                                 OPT_LOCATION_CODE,
                                                 OPT_YN,
                                                 WH_SUBINVENTORY_CODE,
                                                 AGING_METHOD,
                                                 ACTIVE,
                                                 CREATE_DATE,
                                                 CREATE_BY)
         (SELECT OPERATING_UNIT,
                 ORGANIZATION_ID,
                 LOCATION_CODE,
                 OPERATING_UNIT || LOCATION_CODE,          --OPT_LOCATION_CODE
                 'N',                                                 --OPT_YN
                 '',                                    --WH_SUBINVENTORY_CODE
                 'MOV',                                         --AGING_METHOD
                 'N',                                                 --ACTIVE
                 SYSDATE,
                 P_CREATE_BY
            FROM V_DSS_LOCATIONS
           WHERE     ORGANIZATION_ID = P_ORGANIZATION_ID
                 AND LOCATION_CODE = P_SUBINVENTORY_CODE);
   END p_Add;
END PKG_OER_LOCATION_CONFIG;
/
