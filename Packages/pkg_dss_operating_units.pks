DROP PACKAGE DSS.PKG_DSS_OPERATING_UNITS;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_OPERATING_UNITS
AS
   PROCEDURE Get_EPB_Cat_OperatingUnit (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE Get_EPB_Loc_OperatingUnit (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE Get_EPB_Cat_OperatingUnit_Cat (
      P_CATEGORYCODE    IN     VARCHAR2,
      P_CATEGORYCODE2   IN     VARCHAR2,
      outCursor            OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_OPERATING_UNIT   IN     DSS_OPERATING_UNITS.OPERATING_UNIT%TYPE,
      outCursor             OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey2 (
      p_OPERATING_UNIT   IN     DSS_OPERATING_UNITS.OPERATING_UNIT%TYPE,
      outCursor             OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_OPERATING_UNIT             IN DSS_OPERATING_UNITS.OPERATING_UNIT%TYPE,
      p_STATUS                     IN DSS_OPERATING_UNITS.STATUS%TYPE,
      p_COUNTRY_NAME               IN DSS_OPERATING_UNITS.COUNTRY_NAME%TYPE,
      p_COUNTRY_CODE               IN DSS_OPERATING_UNITS.COUNTRY_CODE%TYPE,
      p_TIMEZONE                   IN DSS_OPERATING_UNITS.TIMEZONE%TYPE,
      p_ITEM_MASTER_ORGANIZATION   IN DSS_OPERATING_UNITS.ITEM_MASTER_ORGANIZATION%TYPE,
      p_WMS_ENABLED                IN DSS_OPERATING_UNITS.WMS_ENABLED%TYPE,
      p_WMS_CONFIG                 IN DSS_OPERATING_UNITS.WMS_CONFIG%TYPE,
      p_VCARE_ENABLED              IN DSS_OPERATING_UNITS.VCARE_ENABLED%TYPE,
      p_VCARE_CONFIG               IN DSS_OPERATING_UNITS.VCARE_CONFIG%TYPE,
      p_OPTIMIZA_ENABLED           IN DSS_OPERATING_UNITS.OPTIMIZA_ENABLED%TYPE,
      p_OPTIMIZA_CONFIG            IN DSS_OPERATING_UNITS.OPTIMIZA_CONFIG%TYPE,
      p_CREATE_BY                  IN DSS_OPERATING_UNITS.CREATE_BY%TYPE,
      p_CREATE_DATE                IN DSS_OPERATING_UNITS.CREATE_DATE%TYPE,
      p_MODIFY_BY                  IN DSS_OPERATING_UNITS.MODIFY_BY%TYPE,
      p_MODIFY_DATE                IN DSS_OPERATING_UNITS.MODIFY_DATE%TYPE,
      p_ATTRIBUTE1                 IN DSS_OPERATING_UNITS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2                 IN DSS_OPERATING_UNITS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3                 IN DSS_OPERATING_UNITS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4                 IN DSS_OPERATING_UNITS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5                 IN DSS_OPERATING_UNITS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6                 IN DSS_OPERATING_UNITS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7                 IN DSS_OPERATING_UNITS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8                 IN DSS_OPERATING_UNITS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9                 IN DSS_OPERATING_UNITS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10                IN DSS_OPERATING_UNITS.ATTRIBUTE10%TYPE);

   PROCEDURE P_Insert (
      p_OPERATING_UNIT             IN DSS_OPERATING_UNITS.OPERATING_UNIT%TYPE,
      p_STATUS                     IN DSS_OPERATING_UNITS.STATUS%TYPE,
      p_COUNTRY_NAME               IN DSS_OPERATING_UNITS.COUNTRY_NAME%TYPE,
      p_COUNTRY_CODE               IN DSS_OPERATING_UNITS.COUNTRY_CODE%TYPE,
      p_TIMEZONE                   IN DSS_OPERATING_UNITS.TIMEZONE%TYPE,
      p_ITEM_MASTER_ORGANIZATION   IN DSS_OPERATING_UNITS.ITEM_MASTER_ORGANIZATION%TYPE,
      p_WMS_ENABLED                IN DSS_OPERATING_UNITS.WMS_ENABLED%TYPE,
      p_WMS_CONFIG                 IN DSS_OPERATING_UNITS.WMS_CONFIG%TYPE,
      p_VCARE_ENABLED              IN DSS_OPERATING_UNITS.VCARE_ENABLED%TYPE,
      p_VCARE_CONFIG               IN DSS_OPERATING_UNITS.VCARE_CONFIG%TYPE,
      p_OPTIMIZA_ENABLED           IN DSS_OPERATING_UNITS.OPTIMIZA_ENABLED%TYPE,
      p_OPTIMIZA_CONFIG            IN DSS_OPERATING_UNITS.OPTIMIZA_CONFIG%TYPE,
      p_CREATE_BY                  IN DSS_OPERATING_UNITS.CREATE_BY%TYPE,
      p_CREATE_DATE                IN DSS_OPERATING_UNITS.CREATE_DATE%TYPE,
      p_MODIFY_BY                  IN DSS_OPERATING_UNITS.MODIFY_BY%TYPE,
      p_MODIFY_DATE                IN DSS_OPERATING_UNITS.MODIFY_DATE%TYPE,
      p_ATTRIBUTE1                 IN DSS_OPERATING_UNITS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2                 IN DSS_OPERATING_UNITS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3                 IN DSS_OPERATING_UNITS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4                 IN DSS_OPERATING_UNITS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5                 IN DSS_OPERATING_UNITS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6                 IN DSS_OPERATING_UNITS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7                 IN DSS_OPERATING_UNITS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8                 IN DSS_OPERATING_UNITS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9                 IN DSS_OPERATING_UNITS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10                IN DSS_OPERATING_UNITS.ATTRIBUTE10%TYPE);

   PROCEDURE P_Delete (
      p_OPERATING_UNIT IN DSS_OPERATING_UNITS.OPERATING_UNIT%TYPE);
END PKG_DSS_OPERATING_UNITS;
/


DROP PACKAGE BODY DSS.PKG_DSS_OPERATING_UNITS;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_OPERATING_UNITS
AS
   PROCEDURE Get_EPB_Cat_OperatingUnit (outCursor OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
           SELECT *
             FROM V_DSS_OPERATING_UNITS
            WHERE OPERATING_UNIT IN
                     (SELECT DISTINCT OPERATING_UNIT
                        FROM V_SYN_OER_CATEGORY_CONFIG)
         ORDER BY OPERATING_UNIT;
   END Get_EPB_Cat_OperatingUnit;
   
    PROCEDURE Get_EPB_Loc_OperatingUnit (outCursor OUT DSS.MYGEN.sqlcur)
    as
    BEGIN
    OPEN outCursor FOR
           SELECT *
             FROM V_DSS_OPERATING_UNITS
            WHERE OPERATING_UNIT IN
                     (SELECT DISTINCT OPERATING_UNIT
                        FROM V_SYN_OER_LOCATION_CONFIG)
         ORDER BY OPERATING_UNIT;
    END Get_EPB_Loc_OperatingUnit;

   PROCEDURE Get_EPB_Cat_OperatingUnit_Cat (
      P_CATEGORYCODE    IN     VARCHAR2,
      P_CATEGORYCODE2   IN     VARCHAR2,
      outCursor            OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
           SELECT *
             FROM V_DSS_OPERATING_UNITS
            WHERE OPERATING_UNIT IN
                     (SELECT DISTINCT OPERATING_UNIT
                        FROM V_SYN_OER_CATEGORY_CONFIG
                       WHERE     CATEGORYCODE = P_CATEGORYCODE
                             AND CATEGORYCODE2 = P_CATEGORYCODE2)
         ORDER BY OPERATING_UNIT;
   END Get_EPB_Cat_OperatingUnit_Cat;

   PROCEDURE P_LoadByPrimaryKey (
      p_OPERATING_UNIT   IN     DSS_OPERATING_UNITS.OPERATING_UNIT%TYPE,
      outCursor             OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT OPERATING_UNIT,
                STATUS,
                COUNTRY_NAME,
                COUNTRY_CODE,
                TIMEZONE,
                ITEM_MASTER_ORGANIZATION,
                WMS_ENABLED,
                WMS_CONFIG,
                VCARE_ENABLED,
                VCARE_CONFIG,
                OPTIMIZA_ENABLED,
                OPTIMIZA_CONFIG,
                CREATE_BY,
                CREATE_DATE,
                MODIFY_BY,
                MODIFY_DATE,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6,
                ATTRIBUTE7,
                ATTRIBUTE8,
                ATTRIBUTE9,
                ATTRIBUTE10
           FROM DSS_OPERATING_UNITS
          WHERE OPERATING_UNIT = p_OPERATING_UNIT;
   END P_LoadByPrimaryKey;


   PROCEDURE P_LoadByPrimaryKey2 (
      p_OPERATING_UNIT   IN     DSS_OPERATING_UNITS.OPERATING_UNIT%TYPE,
      outCursor             OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT OPERATING_UNIT,
                DESCRIPTION,
                CREATE_DATE,
                DISABLE_DATE,
                ACTIVE,
                STATUS,
                COUNTRY_NAME,
                COUNTRY_CODE,
                TIMEZONE,
                ITEM_MASTER_ORGANIZATION,
                WMS_ENABLED,
                WMS_CONFIG,
                VCARE_ENABLED,
                VCARE_CONFIG,
                OPTIMIZA_ENABLED,
                OPTIMIZA_CONFIG,
                CREATE_BY,
                MODIFY_BY,
                MODIFY_DATE,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6,
                ATTRIBUTE7,
                ATTRIBUTE8,
                ATTRIBUTE9,
                ATTRIBUTE10
           FROM V_DSS_OPERATING_UNITS
          WHERE OPERATING_UNIT = p_OPERATING_UNIT;
   END P_LoadByPrimaryKey2;

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT OPERATING_UNIT,
                STATUS,
                COUNTRY_NAME,
                COUNTRY_CODE,
                TIMEZONE,
                ITEM_MASTER_ORGANIZATION,
                WMS_ENABLED,
                WMS_CONFIG,
                VCARE_ENABLED,
                VCARE_CONFIG,
                OPTIMIZA_ENABLED,
                OPTIMIZA_CONFIG,
                CREATE_BY,
                CREATE_DATE,
                MODIFY_BY,
                MODIFY_DATE,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6,
                ATTRIBUTE7,
                ATTRIBUTE8,
                ATTRIBUTE9,
                ATTRIBUTE10
           FROM DSS_OPERATING_UNITS;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_OPERATING_UNIT             IN DSS_OPERATING_UNITS.OPERATING_UNIT%TYPE,
      p_STATUS                     IN DSS_OPERATING_UNITS.STATUS%TYPE,
      p_COUNTRY_NAME               IN DSS_OPERATING_UNITS.COUNTRY_NAME%TYPE,
      p_COUNTRY_CODE               IN DSS_OPERATING_UNITS.COUNTRY_CODE%TYPE,
      p_TIMEZONE                   IN DSS_OPERATING_UNITS.TIMEZONE%TYPE,
      p_ITEM_MASTER_ORGANIZATION   IN DSS_OPERATING_UNITS.ITEM_MASTER_ORGANIZATION%TYPE,
      p_WMS_ENABLED                IN DSS_OPERATING_UNITS.WMS_ENABLED%TYPE,
      p_WMS_CONFIG                 IN DSS_OPERATING_UNITS.WMS_CONFIG%TYPE,
      p_VCARE_ENABLED              IN DSS_OPERATING_UNITS.VCARE_ENABLED%TYPE,
      p_VCARE_CONFIG               IN DSS_OPERATING_UNITS.VCARE_CONFIG%TYPE,
      p_OPTIMIZA_ENABLED           IN DSS_OPERATING_UNITS.OPTIMIZA_ENABLED%TYPE,
      p_OPTIMIZA_CONFIG            IN DSS_OPERATING_UNITS.OPTIMIZA_CONFIG%TYPE,
      p_CREATE_BY                  IN DSS_OPERATING_UNITS.CREATE_BY%TYPE,
      p_CREATE_DATE                IN DSS_OPERATING_UNITS.CREATE_DATE%TYPE,
      p_MODIFY_BY                  IN DSS_OPERATING_UNITS.MODIFY_BY%TYPE,
      p_MODIFY_DATE                IN DSS_OPERATING_UNITS.MODIFY_DATE%TYPE,
      p_ATTRIBUTE1                 IN DSS_OPERATING_UNITS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2                 IN DSS_OPERATING_UNITS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3                 IN DSS_OPERATING_UNITS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4                 IN DSS_OPERATING_UNITS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5                 IN DSS_OPERATING_UNITS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6                 IN DSS_OPERATING_UNITS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7                 IN DSS_OPERATING_UNITS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8                 IN DSS_OPERATING_UNITS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9                 IN DSS_OPERATING_UNITS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10                IN DSS_OPERATING_UNITS.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      UPDATE DSS_OPERATING_UNITS
         SET OPERATING_UNIT = p_OPERATING_UNIT,
             STATUS = p_STATUS,
             COUNTRY_NAME = p_COUNTRY_NAME,
             COUNTRY_CODE = p_COUNTRY_CODE,
             TIMEZONE = p_TIMEZONE,
             ITEM_MASTER_ORGANIZATION = p_ITEM_MASTER_ORGANIZATION,
             WMS_ENABLED = p_WMS_ENABLED,
             WMS_CONFIG = p_WMS_CONFIG,
             VCARE_ENABLED = p_VCARE_ENABLED,
             VCARE_CONFIG = p_VCARE_CONFIG,
             OPTIMIZA_ENABLED = p_OPTIMIZA_ENABLED,
             OPTIMIZA_CONFIG = p_OPTIMIZA_CONFIG,
             CREATE_BY = p_CREATE_BY,
             CREATE_DATE = p_CREATE_DATE,
             MODIFY_BY = p_MODIFY_BY,
             MODIFY_DATE = p_MODIFY_DATE,
             ATTRIBUTE1 = p_ATTRIBUTE1,
             ATTRIBUTE2 = p_ATTRIBUTE2,
             ATTRIBUTE3 = p_ATTRIBUTE3,
             ATTRIBUTE4 = p_ATTRIBUTE4,
             ATTRIBUTE5 = p_ATTRIBUTE5,
             ATTRIBUTE6 = p_ATTRIBUTE6,
             ATTRIBUTE7 = p_ATTRIBUTE7,
             ATTRIBUTE8 = p_ATTRIBUTE8,
             ATTRIBUTE9 = p_ATTRIBUTE9,
             ATTRIBUTE10 = p_ATTRIBUTE10
       WHERE OPERATING_UNIT = p_OPERATING_UNIT;
   END P_Update;


   PROCEDURE P_Insert (
      p_OPERATING_UNIT             IN DSS_OPERATING_UNITS.OPERATING_UNIT%TYPE,
      p_STATUS                     IN DSS_OPERATING_UNITS.STATUS%TYPE,
      p_COUNTRY_NAME               IN DSS_OPERATING_UNITS.COUNTRY_NAME%TYPE,
      p_COUNTRY_CODE               IN DSS_OPERATING_UNITS.COUNTRY_CODE%TYPE,
      p_TIMEZONE                   IN DSS_OPERATING_UNITS.TIMEZONE%TYPE,
      p_ITEM_MASTER_ORGANIZATION   IN DSS_OPERATING_UNITS.ITEM_MASTER_ORGANIZATION%TYPE,
      p_WMS_ENABLED                IN DSS_OPERATING_UNITS.WMS_ENABLED%TYPE,
      p_WMS_CONFIG                 IN DSS_OPERATING_UNITS.WMS_CONFIG%TYPE,
      p_VCARE_ENABLED              IN DSS_OPERATING_UNITS.VCARE_ENABLED%TYPE,
      p_VCARE_CONFIG               IN DSS_OPERATING_UNITS.VCARE_CONFIG%TYPE,
      p_OPTIMIZA_ENABLED           IN DSS_OPERATING_UNITS.OPTIMIZA_ENABLED%TYPE,
      p_OPTIMIZA_CONFIG            IN DSS_OPERATING_UNITS.OPTIMIZA_CONFIG%TYPE,
      p_CREATE_BY                  IN DSS_OPERATING_UNITS.CREATE_BY%TYPE,
      p_CREATE_DATE                IN DSS_OPERATING_UNITS.CREATE_DATE%TYPE,
      p_MODIFY_BY                  IN DSS_OPERATING_UNITS.MODIFY_BY%TYPE,
      p_MODIFY_DATE                IN DSS_OPERATING_UNITS.MODIFY_DATE%TYPE,
      p_ATTRIBUTE1                 IN DSS_OPERATING_UNITS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2                 IN DSS_OPERATING_UNITS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3                 IN DSS_OPERATING_UNITS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4                 IN DSS_OPERATING_UNITS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5                 IN DSS_OPERATING_UNITS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6                 IN DSS_OPERATING_UNITS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7                 IN DSS_OPERATING_UNITS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8                 IN DSS_OPERATING_UNITS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9                 IN DSS_OPERATING_UNITS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10                IN DSS_OPERATING_UNITS.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      INSERT INTO DSS_OPERATING_UNITS (OPERATING_UNIT,
                                       STATUS,
                                       COUNTRY_NAME,
                                       COUNTRY_CODE,
                                       TIMEZONE,
                                       ITEM_MASTER_ORGANIZATION,
                                       WMS_ENABLED,
                                       WMS_CONFIG,
                                       VCARE_ENABLED,
                                       VCARE_CONFIG,
                                       OPTIMIZA_ENABLED,
                                       OPTIMIZA_CONFIG,
                                       CREATE_BY,
                                       CREATE_DATE,
                                       MODIFY_BY,
                                       MODIFY_DATE,
                                       ATTRIBUTE1,
                                       ATTRIBUTE2,
                                       ATTRIBUTE3,
                                       ATTRIBUTE4,
                                       ATTRIBUTE5,
                                       ATTRIBUTE6,
                                       ATTRIBUTE7,
                                       ATTRIBUTE8,
                                       ATTRIBUTE9,
                                       ATTRIBUTE10)
           VALUES (p_OPERATING_UNIT,
                   p_STATUS,
                   p_COUNTRY_NAME,
                   p_COUNTRY_CODE,
                   p_TIMEZONE,
                   p_ITEM_MASTER_ORGANIZATION,
                   p_WMS_ENABLED,
                   p_WMS_CONFIG,
                   p_VCARE_ENABLED,
                   p_VCARE_CONFIG,
                   p_OPTIMIZA_ENABLED,
                   p_OPTIMIZA_CONFIG,
                   p_CREATE_BY,
                   p_CREATE_DATE,
                   p_MODIFY_BY,
                   p_MODIFY_DATE,
                   p_ATTRIBUTE1,
                   p_ATTRIBUTE2,
                   p_ATTRIBUTE3,
                   p_ATTRIBUTE4,
                   p_ATTRIBUTE5,
                   p_ATTRIBUTE6,
                   p_ATTRIBUTE7,
                   p_ATTRIBUTE8,
                   p_ATTRIBUTE9,
                   p_ATTRIBUTE10);
   END P_Insert;

   PROCEDURE P_Delete (
      p_OPERATING_UNIT IN DSS_OPERATING_UNITS.OPERATING_UNIT%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_OPERATING_UNITS
            WHERE OPERATING_UNIT = p_OPERATING_UNIT;
   END P_Delete;
END PKG_DSS_OPERATING_UNITS;
/
