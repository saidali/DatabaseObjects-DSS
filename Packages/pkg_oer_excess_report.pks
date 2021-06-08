DROP PACKAGE DSS.PKG_OER_EXCESS_REPORT;

CREATE OR REPLACE PACKAGE DSS.PKG_OER_EXCESS_REPORT
AS
   PROCEDURE P_EXCESS_LOAD_CONDITIONS (
      P_CountryCode   IN     VARCHAR2,
   --   P_DATE             IN     DATE,
      OUTCURSOR             OUT DSS.MYGEN.sqlcur);
END PKG_OER_EXCESS_REPORT;
/


DROP PACKAGE BODY DSS.PKG_OER_EXCESS_REPORT;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_OER_EXCESS_REPORT
AS
   PROCEDURE P_EXCESS_LOAD_CONDITIONS (
      P_CountryCode   IN     VARCHAR2,
      OUTCURSOR             OUT DSS.MYGEN.sqlcur)
   AS
   BEGIN
      OPEN outCursor FOR
        SELECT  * FROM V_DSS_EXCESS_PULL_BACK  
        WHERE    "ExcessQuantity" > 0  AND  "Country" = P_CountryCode ;
      END P_EXCESS_LOAD_CONDITIONS;
END PKG_OER_EXCESS_REPORT;
/
