DROP PACKAGE DSS.PKG_DSS_ORDER_SCAN_SERIALS;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_ORDER_SCAN_SERIALS
AS
   PROCEDURE P_DeletebyLineID (
      p_JOBID    IN DSS_ORDER_SCAN_SERIALS.JOBID%TYPE,
      p_LINEID   IN DSS_ORDER_SCAN_SERIALS.LINEID%TYPE);

   PROCEDURE P_LOADBYJOBNOHORZ (
      p_JOBID        IN     DSS_ORDER_SCAN_SERIALS.JOBID%TYPE,
      p_LINEID       IN     DSS_ORDER_SCAN_SERIALS.LINEID%TYPE,
      P_ConfigKeys   IN     VARCHAR2,
      p_archived     IN     VARCHAR2,
      outCursor         OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_SCANID    IN     DSS_ORDER_SCAN_SERIALS.SCANID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_SCANID               IN DSS_ORDER_SCAN_SERIALS.SCANID%TYPE,
      p_JOBID                IN DSS_ORDER_SCAN_SERIALS.JOBID%TYPE,
      p_LINEID               IN DSS_ORDER_SCAN_SERIALS.LINEID%TYPE,
      p_SEQINDEX             IN DSS_ORDER_SCAN_SERIALS.SEQINDEX%TYPE,
      p_COLUMNINDEX          IN DSS_ORDER_SCAN_SERIALS.COLUMNINDEX%TYPE,
      p_CONFIGID             IN DSS_ORDER_SCAN_SERIALS.CONFIGID%TYPE,
      p_CONFIGTYPE           IN DSS_ORDER_SCAN_SERIALS.CONFIGTYPE%TYPE,
      p_SCANTYPE             IN DSS_ORDER_SCAN_SERIALS.SCANTYPE%TYPE,
      p_SCAN_SOURCE          IN DSS_ORDER_SCAN_SERIALS.SCAN_SOURCE%TYPE,
      p_OPREATING_UNIT       IN DSS_ORDER_SCAN_SERIALS.OPREATING_UNIT%TYPE,
      p_ORGANIZATION_ID      IN DSS_ORDER_SCAN_SERIALS.ORGANIZATION_ID%TYPE,
      p_ORDER_TYPE           IN DSS_ORDER_SCAN_SERIALS.ORDER_TYPE%TYPE,
      p_ORDER_NUMBER         IN DSS_ORDER_SCAN_SERIALS.ORDER_NUMBER%TYPE,
      p_INVENTORY_ITEM_ID    IN DSS_ORDER_SCAN_SERIALS.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE         IN DSS_ORDER_SCAN_SERIALS.PRODUCT_CODE%TYPE,
      p_SERVICE_BRANDID      IN DSS_ORDER_SCAN_SERIALS.SERVICE_BRANDID%TYPE,
      p_SERIALKEY            IN DSS_ORDER_SCAN_SERIALS.SERIALKEY%TYPE,
      p_SERIALKEY_REF1       IN DSS_ORDER_SCAN_SERIALS.SERIALKEY_REF1%TYPE,
      p_SERIALKEY_REF2       IN DSS_ORDER_SCAN_SERIALS.SERIALKEY_REF2%TYPE,
      p_WARRANTYPRINT_YN     IN DSS_ORDER_SCAN_SERIALS.WARRANTYPRINT_YN%TYPE,
      p_WARRANTY_YN          IN DSS_ORDER_SCAN_SERIALS.WARRANTY_YN%TYPE,
      p_WARRANTY_SEQ         IN DSS_ORDER_SCAN_SERIALS.WARRANTY_SEQ%TYPE,
      p_WARRANTY_CODE        IN DSS_ORDER_SCAN_SERIALS.WARRANTY_CODE%TYPE,
      p_WARRANTY_STARTDATE   IN DSS_ORDER_SCAN_SERIALS.WARRANTY_STARTDATE%TYPE,
      p_WARRANTY_ENDATE      IN DSS_ORDER_SCAN_SERIALS.WARRANTY_ENDATE%TYPE,
      p_ACTIVE_YN            IN DSS_ORDER_SCAN_SERIALS.ACTIVE_YN%TYPE,
      p_INF_YN               IN DSS_ORDER_SCAN_SERIALS.INF_YN%TYPE,
      p_INF_DATE             IN DSS_ORDER_SCAN_SERIALS.INF_DATE%TYPE,
      p_CREATE_BY            IN DSS_ORDER_SCAN_SERIALS.CREATE_BY%TYPE,
      p_CREATE_DATE          IN DSS_ORDER_SCAN_SERIALS.CREATE_DATE%TYPE,
      p_UPDATE_BY            IN DSS_ORDER_SCAN_SERIALS.UPDATE_BY%TYPE,
      p_UPDATE_DATE          IN DSS_ORDER_SCAN_SERIALS.UPDATE_DATE%TYPE,
      p_ALLOW_EDIT           IN DSS_ORDER_SCAN_SERIALS.ALLOW_EDIT%TYPE,
      p_ATTRIBUTE1           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10          IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE10%TYPE);

   PROCEDURE P_Insert (
      p_SCANID               IN DSS_ORDER_SCAN_SERIALS.SCANID%TYPE,
      p_JOBID                IN DSS_ORDER_SCAN_SERIALS.JOBID%TYPE,
      p_LINEID               IN DSS_ORDER_SCAN_SERIALS.LINEID%TYPE,
      p_SEQINDEX             IN DSS_ORDER_SCAN_SERIALS.SEQINDEX%TYPE,
      p_COLUMNINDEX          IN DSS_ORDER_SCAN_SERIALS.COLUMNINDEX%TYPE,
      p_CONFIGID             IN DSS_ORDER_SCAN_SERIALS.CONFIGID%TYPE,
      p_CONFIGTYPE           IN DSS_ORDER_SCAN_SERIALS.CONFIGTYPE%TYPE,
      p_SCANTYPE             IN DSS_ORDER_SCAN_SERIALS.SCANTYPE%TYPE,
      p_SCAN_SOURCE          IN DSS_ORDER_SCAN_SERIALS.SCAN_SOURCE%TYPE,
      p_OPREATING_UNIT       IN DSS_ORDER_SCAN_SERIALS.OPREATING_UNIT%TYPE,
      p_ORGANIZATION_ID      IN DSS_ORDER_SCAN_SERIALS.ORGANIZATION_ID%TYPE,
      p_ORDER_TYPE           IN DSS_ORDER_SCAN_SERIALS.ORDER_TYPE%TYPE,
      p_ORDER_NUMBER         IN DSS_ORDER_SCAN_SERIALS.ORDER_NUMBER%TYPE,
      p_INVENTORY_ITEM_ID    IN DSS_ORDER_SCAN_SERIALS.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE         IN DSS_ORDER_SCAN_SERIALS.PRODUCT_CODE%TYPE,
      p_SERVICE_BRANDID      IN DSS_ORDER_SCAN_SERIALS.SERVICE_BRANDID%TYPE,
      p_SERIALKEY            IN DSS_ORDER_SCAN_SERIALS.SERIALKEY%TYPE,
      p_SERIALKEY_REF1       IN DSS_ORDER_SCAN_SERIALS.SERIALKEY_REF1%TYPE,
      p_SERIALKEY_REF2       IN DSS_ORDER_SCAN_SERIALS.SERIALKEY_REF2%TYPE,
      p_WARRANTYPRINT_YN     IN DSS_ORDER_SCAN_SERIALS.WARRANTYPRINT_YN%TYPE,
      p_WARRANTY_YN          IN DSS_ORDER_SCAN_SERIALS.WARRANTY_YN%TYPE,
      p_WARRANTY_SEQ         IN DSS_ORDER_SCAN_SERIALS.WARRANTY_SEQ%TYPE,
      p_WARRANTY_CODE        IN DSS_ORDER_SCAN_SERIALS.WARRANTY_CODE%TYPE,
      p_WARRANTY_STARTDATE   IN DSS_ORDER_SCAN_SERIALS.WARRANTY_STARTDATE%TYPE,
      p_WARRANTY_ENDATE      IN DSS_ORDER_SCAN_SERIALS.WARRANTY_ENDATE%TYPE,
      p_ACTIVE_YN            IN DSS_ORDER_SCAN_SERIALS.ACTIVE_YN%TYPE,
      p_INF_YN               IN DSS_ORDER_SCAN_SERIALS.INF_YN%TYPE,
      p_INF_DATE             IN DSS_ORDER_SCAN_SERIALS.INF_DATE%TYPE,
      p_CREATE_BY            IN DSS_ORDER_SCAN_SERIALS.CREATE_BY%TYPE,
      p_CREATE_DATE          IN DSS_ORDER_SCAN_SERIALS.CREATE_DATE%TYPE,
      p_UPDATE_BY            IN DSS_ORDER_SCAN_SERIALS.UPDATE_BY%TYPE,
      p_UPDATE_DATE          IN DSS_ORDER_SCAN_SERIALS.UPDATE_DATE%TYPE,
      p_ALLOW_EDIT           IN DSS_ORDER_SCAN_SERIALS.ALLOW_EDIT%TYPE,
      p_ATTRIBUTE1           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10          IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE10%TYPE);

   PROCEDURE P_Delete (p_SCANID IN DSS_ORDER_SCAN_SERIALS.SCANID%TYPE);

   PROCEDURE P_LOADBY_CONDITION (p_CONDITIONS   IN     VARCHAR2,
                                 OUTCURSOR         OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_SEARCHBY_SERIALS (p_SERIALS   IN     VARCHAR2,
                                 OUTCURSOR      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_SEARCHBY_SERIAL (P_SERIALS       VARCHAR2,
                                OUTCURSOR   OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_ARLOADBY_CONDITION (p_CONDITIONS   IN     VARCHAR2,
                                   OUTCURSOR         OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_ARSEARCHBY_SERIALS (p_SERIALS   IN     VARCHAR2,
                                   OUTCURSOR      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_ARSEARCHBY_SERIAL (P_SERIALS       VARCHAR2,
                                  OUTCURSOR   OUT DSS.MYGEN.sqlcur);

   PROCEDURE rpt_ProductSummary (p_ORGANIZATION_ID   IN     VARCHAR2,
                                 p_PRODUCT_CODE      IN     VARCHAR2,
                                 p_FROM_DATE         IN     DATE,
                                 p_TO_DATE           IN     DATE,
                                 outCursor              OUT DSS.MYGEN.sqlcur);
END PKG_DSS_ORDER_SCAN_SERIALS;
/


DROP PACKAGE BODY DSS.PKG_DSS_ORDER_SCAN_SERIALS;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_ORDER_SCAN_SERIALS
AS
   PROCEDURE P_LoadByPrimaryKey (
      p_SCANID    IN     DSS_ORDER_SCAN_SERIALS.SCANID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT SCANID,
                JOBID,
                LINEID,
                SEQINDEX,
                COLUMNINDEX,
                CONFIGID,
                CONFIGTYPE,
                SCANTYPE,
                SCAN_SOURCE,
                OPREATING_UNIT,
                ORGANIZATION_ID,
                ORDER_TYPE,
                ORDER_NUMBER,
                INVENTORY_ITEM_ID,
                PRODUCT_CODE,
                SERVICE_BRANDID,
                SERIALKEY,
                SERIALKEY_REF1,
                SERIALKEY_REF2,
                WARRANTYPRINT_YN,
                WARRANTY_YN,
                WARRANTY_SEQ,
                WARRANTY_CODE,
                WARRANTY_STARTDATE,
                WARRANTY_ENDATE,
                ACTIVE_YN,
                INF_YN,
                INF_DATE,
                CREATE_BY,
                CREATE_DATE,
                UPDATE_BY,
                UPDATE_DATE,
                ALLOW_EDIT,
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
           FROM DSS_ORDER_SCAN_SERIALS
          WHERE SCANID = p_SCANID;
   END P_LoadByPrimaryKey;


   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT SCANID,
                JOBID,
                LINEID,
                SEQINDEX,
                COLUMNINDEX,
                CONFIGID,
                CONFIGTYPE,
                SCANTYPE,
                SCAN_SOURCE,
                OPREATING_UNIT,
                ORGANIZATION_ID,
                ORDER_TYPE,
                ORDER_NUMBER,
                INVENTORY_ITEM_ID,
                PRODUCT_CODE,
                SERVICE_BRANDID,
                SERIALKEY,
                SERIALKEY_REF1,
                SERIALKEY_REF2,
                WARRANTYPRINT_YN,
                WARRANTY_YN,
                WARRANTY_SEQ,
                WARRANTY_CODE,
                WARRANTY_STARTDATE,
                WARRANTY_ENDATE,
                ACTIVE_YN,
                INF_YN,
                INF_DATE,
                CREATE_BY,
                CREATE_DATE,
                UPDATE_BY,
                UPDATE_DATE,
                ALLOW_EDIT,
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
           FROM DSS_ORDER_SCAN_SERIALS;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_SCANID               IN DSS_ORDER_SCAN_SERIALS.SCANID%TYPE,
      p_JOBID                IN DSS_ORDER_SCAN_SERIALS.JOBID%TYPE,
      p_LINEID               IN DSS_ORDER_SCAN_SERIALS.LINEID%TYPE,
      p_SEQINDEX             IN DSS_ORDER_SCAN_SERIALS.SEQINDEX%TYPE,
      p_COLUMNINDEX          IN DSS_ORDER_SCAN_SERIALS.COLUMNINDEX%TYPE,
      p_CONFIGID             IN DSS_ORDER_SCAN_SERIALS.CONFIGID%TYPE,
      p_CONFIGTYPE           IN DSS_ORDER_SCAN_SERIALS.CONFIGTYPE%TYPE,
      p_SCANTYPE             IN DSS_ORDER_SCAN_SERIALS.SCANTYPE%TYPE,
      p_SCAN_SOURCE          IN DSS_ORDER_SCAN_SERIALS.SCAN_SOURCE%TYPE,
      p_OPREATING_UNIT       IN DSS_ORDER_SCAN_SERIALS.OPREATING_UNIT%TYPE,
      p_ORGANIZATION_ID      IN DSS_ORDER_SCAN_SERIALS.ORGANIZATION_ID%TYPE,
      p_ORDER_TYPE           IN DSS_ORDER_SCAN_SERIALS.ORDER_TYPE%TYPE,
      p_ORDER_NUMBER         IN DSS_ORDER_SCAN_SERIALS.ORDER_NUMBER%TYPE,
      p_INVENTORY_ITEM_ID    IN DSS_ORDER_SCAN_SERIALS.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE         IN DSS_ORDER_SCAN_SERIALS.PRODUCT_CODE%TYPE,
      p_SERVICE_BRANDID      IN DSS_ORDER_SCAN_SERIALS.SERVICE_BRANDID%TYPE,
      p_SERIALKEY            IN DSS_ORDER_SCAN_SERIALS.SERIALKEY%TYPE,
      p_SERIALKEY_REF1       IN DSS_ORDER_SCAN_SERIALS.SERIALKEY_REF1%TYPE,
      p_SERIALKEY_REF2       IN DSS_ORDER_SCAN_SERIALS.SERIALKEY_REF2%TYPE,
      p_WARRANTYPRINT_YN     IN DSS_ORDER_SCAN_SERIALS.WARRANTYPRINT_YN%TYPE,
      p_WARRANTY_YN          IN DSS_ORDER_SCAN_SERIALS.WARRANTY_YN%TYPE,
      p_WARRANTY_SEQ         IN DSS_ORDER_SCAN_SERIALS.WARRANTY_SEQ%TYPE,
      p_WARRANTY_CODE        IN DSS_ORDER_SCAN_SERIALS.WARRANTY_CODE%TYPE,
      p_WARRANTY_STARTDATE   IN DSS_ORDER_SCAN_SERIALS.WARRANTY_STARTDATE%TYPE,
      p_WARRANTY_ENDATE      IN DSS_ORDER_SCAN_SERIALS.WARRANTY_ENDATE%TYPE,
      p_ACTIVE_YN            IN DSS_ORDER_SCAN_SERIALS.ACTIVE_YN%TYPE,
      p_INF_YN               IN DSS_ORDER_SCAN_SERIALS.INF_YN%TYPE,
      p_INF_DATE             IN DSS_ORDER_SCAN_SERIALS.INF_DATE%TYPE,
      p_CREATE_BY            IN DSS_ORDER_SCAN_SERIALS.CREATE_BY%TYPE,
      p_CREATE_DATE          IN DSS_ORDER_SCAN_SERIALS.CREATE_DATE%TYPE,
      p_UPDATE_BY            IN DSS_ORDER_SCAN_SERIALS.UPDATE_BY%TYPE,
      p_UPDATE_DATE          IN DSS_ORDER_SCAN_SERIALS.UPDATE_DATE%TYPE,
      p_ALLOW_EDIT           IN DSS_ORDER_SCAN_SERIALS.ALLOW_EDIT%TYPE,
      p_ATTRIBUTE1           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10          IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      UPDATE DSS_ORDER_SCAN_SERIALS
         SET SCANID = p_SCANID,
             JOBID = p_JOBID,
             LINEID = p_LINEID,
             SEQINDEX = p_SEQINDEX,
             COLUMNINDEX = p_COLUMNINDEX,
             CONFIGID = p_CONFIGID,
             CONFIGTYPE = p_CONFIGTYPE,
             SCANTYPE = p_SCANTYPE,
             SCAN_SOURCE = p_SCAN_SOURCE,
             OPREATING_UNIT = p_OPREATING_UNIT,
             ORGANIZATION_ID = p_ORGANIZATION_ID,
             ORDER_TYPE = p_ORDER_TYPE,
             ORDER_NUMBER = p_ORDER_NUMBER,
             INVENTORY_ITEM_ID = p_INVENTORY_ITEM_ID,
             PRODUCT_CODE = p_PRODUCT_CODE,
             SERVICE_BRANDID = p_SERVICE_BRANDID,
             SERIALKEY = UPPER(p_SERIALKEY),
             SERIALKEY_REF1 = p_SERIALKEY_REF1,
             SERIALKEY_REF2 = p_SERIALKEY_REF2,
             WARRANTYPRINT_YN = p_WARRANTYPRINT_YN,
             WARRANTY_YN = p_WARRANTY_YN,
             WARRANTY_SEQ = p_WARRANTY_SEQ,
             WARRANTY_CODE = p_WARRANTY_CODE,
             WARRANTY_STARTDATE = p_WARRANTY_STARTDATE,
             WARRANTY_ENDATE = p_WARRANTY_ENDATE,
             ACTIVE_YN = p_ACTIVE_YN,
             INF_YN = p_INF_YN,
             INF_DATE = p_INF_DATE,
             CREATE_BY = p_CREATE_BY,
             CREATE_DATE = p_CREATE_DATE,
             UPDATE_BY = p_UPDATE_BY,
             UPDATE_DATE = p_UPDATE_DATE,
             ALLOW_EDIT = p_ALLOW_EDIT,
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
       WHERE SCANID = p_SCANID;
   END P_Update;


   PROCEDURE P_Insert (
      p_SCANID               IN DSS_ORDER_SCAN_SERIALS.SCANID%TYPE,
      p_JOBID                IN DSS_ORDER_SCAN_SERIALS.JOBID%TYPE,
      p_LINEID               IN DSS_ORDER_SCAN_SERIALS.LINEID%TYPE,
      p_SEQINDEX             IN DSS_ORDER_SCAN_SERIALS.SEQINDEX%TYPE,
      p_COLUMNINDEX          IN DSS_ORDER_SCAN_SERIALS.COLUMNINDEX%TYPE,
      p_CONFIGID             IN DSS_ORDER_SCAN_SERIALS.CONFIGID%TYPE,
      p_CONFIGTYPE           IN DSS_ORDER_SCAN_SERIALS.CONFIGTYPE%TYPE,
      p_SCANTYPE             IN DSS_ORDER_SCAN_SERIALS.SCANTYPE%TYPE,
      p_SCAN_SOURCE          IN DSS_ORDER_SCAN_SERIALS.SCAN_SOURCE%TYPE,
      p_OPREATING_UNIT       IN DSS_ORDER_SCAN_SERIALS.OPREATING_UNIT%TYPE,
      p_ORGANIZATION_ID      IN DSS_ORDER_SCAN_SERIALS.ORGANIZATION_ID%TYPE,
      p_ORDER_TYPE           IN DSS_ORDER_SCAN_SERIALS.ORDER_TYPE%TYPE,
      p_ORDER_NUMBER         IN DSS_ORDER_SCAN_SERIALS.ORDER_NUMBER%TYPE,
      p_INVENTORY_ITEM_ID    IN DSS_ORDER_SCAN_SERIALS.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE         IN DSS_ORDER_SCAN_SERIALS.PRODUCT_CODE%TYPE,
      p_SERVICE_BRANDID      IN DSS_ORDER_SCAN_SERIALS.SERVICE_BRANDID%TYPE,
      p_SERIALKEY            IN DSS_ORDER_SCAN_SERIALS.SERIALKEY%TYPE,
      p_SERIALKEY_REF1       IN DSS_ORDER_SCAN_SERIALS.SERIALKEY_REF1%TYPE,
      p_SERIALKEY_REF2       IN DSS_ORDER_SCAN_SERIALS.SERIALKEY_REF2%TYPE,
      p_WARRANTYPRINT_YN     IN DSS_ORDER_SCAN_SERIALS.WARRANTYPRINT_YN%TYPE,
      p_WARRANTY_YN          IN DSS_ORDER_SCAN_SERIALS.WARRANTY_YN%TYPE,
      p_WARRANTY_SEQ         IN DSS_ORDER_SCAN_SERIALS.WARRANTY_SEQ%TYPE,
      p_WARRANTY_CODE        IN DSS_ORDER_SCAN_SERIALS.WARRANTY_CODE%TYPE,
      p_WARRANTY_STARTDATE   IN DSS_ORDER_SCAN_SERIALS.WARRANTY_STARTDATE%TYPE,
      p_WARRANTY_ENDATE      IN DSS_ORDER_SCAN_SERIALS.WARRANTY_ENDATE%TYPE,
      p_ACTIVE_YN            IN DSS_ORDER_SCAN_SERIALS.ACTIVE_YN%TYPE,
      p_INF_YN               IN DSS_ORDER_SCAN_SERIALS.INF_YN%TYPE,
      p_INF_DATE             IN DSS_ORDER_SCAN_SERIALS.INF_DATE%TYPE,
      p_CREATE_BY            IN DSS_ORDER_SCAN_SERIALS.CREATE_BY%TYPE,
      p_CREATE_DATE          IN DSS_ORDER_SCAN_SERIALS.CREATE_DATE%TYPE,
      p_UPDATE_BY            IN DSS_ORDER_SCAN_SERIALS.UPDATE_BY%TYPE,
      p_UPDATE_DATE          IN DSS_ORDER_SCAN_SERIALS.UPDATE_DATE%TYPE,
      p_ALLOW_EDIT           IN DSS_ORDER_SCAN_SERIALS.ALLOW_EDIT%TYPE,
      p_ATTRIBUTE1           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9           IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10          IN DSS_ORDER_SCAN_SERIALS.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      INSERT INTO DSS_ORDER_SCAN_SERIALS (SCANID,
                                          JOBID,
                                          LINEID,
                                          SEQINDEX,
                                          COLUMNINDEX,
                                          CONFIGID,
                                          CONFIGTYPE,
                                          SCANTYPE,
                                          SCAN_SOURCE,
                                          OPREATING_UNIT,
                                          ORGANIZATION_ID,
                                          ORDER_TYPE,
                                          ORDER_NUMBER,
                                          INVENTORY_ITEM_ID,
                                          PRODUCT_CODE,
                                          SERVICE_BRANDID,
                                          SERIALKEY,
                                          SERIALKEY_REF1,
                                          SERIALKEY_REF2,
                                          WARRANTYPRINT_YN,
                                          WARRANTY_YN,
                                          WARRANTY_SEQ,
                                          WARRANTY_CODE,
                                          WARRANTY_STARTDATE,
                                          WARRANTY_ENDATE,
                                          ACTIVE_YN,
                                          INF_YN,
                                          INF_DATE,
                                          CREATE_BY,
                                          CREATE_DATE,
                                          UPDATE_BY,
                                          UPDATE_DATE,
                                          ALLOW_EDIT,
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
           VALUES (p_SCANID,
                   p_JOBID,
                   p_LINEID,
                   p_SEQINDEX,
                   p_COLUMNINDEX,
                   p_CONFIGID,
                   p_CONFIGTYPE,
                   p_SCANTYPE,
                   p_SCAN_SOURCE,
                   p_OPREATING_UNIT,
                   p_ORGANIZATION_ID,
                   p_ORDER_TYPE,
                   p_ORDER_NUMBER,
                   p_INVENTORY_ITEM_ID,
                   p_PRODUCT_CODE,
                   p_SERVICE_BRANDID,
                   UPPER(p_SERIALKEY),
                   p_SERIALKEY_REF1,
                   p_SERIALKEY_REF2,
                   p_WARRANTYPRINT_YN,
                   p_WARRANTY_YN,
                   p_WARRANTY_SEQ,
                   p_WARRANTY_CODE,
                   p_WARRANTY_STARTDATE,
                   p_WARRANTY_ENDATE,
                   p_ACTIVE_YN,
                   p_INF_YN,
                   p_INF_DATE,
                   p_CREATE_BY,
                   p_CREATE_DATE,
                   p_UPDATE_BY,
                   p_UPDATE_DATE,
                   p_ALLOW_EDIT,
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

   PROCEDURE P_Delete (p_SCANID IN DSS_ORDER_SCAN_SERIALS.SCANID%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_ORDER_SCAN_SERIALS
            WHERE SCANID = p_SCANID;
   END P_Delete;



   PROCEDURE P_LOADBY_CONDITION (p_CONDITIONS   IN     VARCHAR2,
                                 OUTCURSOR         OUT DSS.MYGEN.sqlcur)
   AS
      P_SQLQUERY   VARCHAR2 (1000);
   BEGIN
      P_SQLQUERY :=
         'SELECT * FROM V_DSS_SERIAL_MANAGER WHERE 1=1 ' || p_CONDITIONS;

      OPEN outCursor FOR P_SQLQUERY;
   END P_LOADBY_CONDITION;


   PROCEDURE P_ARLOADBY_CONDITION (p_CONDITIONS   IN     VARCHAR2,
                                   OUTCURSOR         OUT DSS.MYGEN.sqlcur)
   AS
      P_SQLQUERY   VARCHAR2 (1000);
   BEGIN
      P_SQLQUERY :=
         'SELECT * FROM V_AR_SERIAL_MANAGER WHERE 1=1 ' || p_CONDITIONS;

      OPEN outCursor FOR P_SQLQUERY;
   END P_ARLOADBY_CONDITION;



   PROCEDURE P_SEARCHBY_SERIALS (p_SERIALS   IN     VARCHAR2,
                                 OUTCURSOR      OUT DSS.MYGEN.sqlcur)
   AS
      P_SQLQUERY   VARCHAR2 (4000);
   BEGIN
      P_SQLQUERY :=
            'SELECT V.*
           FROM V_DSS_SERIAL_MANAGER V
                JOIN
                DSS_ORDER_SCAN_SERIALS S
                   ON     V.JOBID = S.JOBID
                      AND V.LINEID = S.LINEID
                      AND V.SEQINDEX = S.SEQINDEX WHERE 1=1 '
         || p_SERIALS;

      OPEN outCursor FOR P_SQLQUERY;
   END P_SEARCHBY_SERIALS;



   PROCEDURE P_ARSEARCHBY_SERIALS (p_SERIALS   IN     VARCHAR2,
                                   OUTCURSOR      OUT DSS.MYGEN.sqlcur)
   AS
      P_SQLQUERY   VARCHAR2 (4000);
   BEGIN
      P_SQLQUERY :=
            'SELECT V.*
           FROM V_AR_SERIAL_MANAGER V
                JOIN
                AR_ORDER_SCAN_SERIALS S
                   ON     V.JOBID = S.JOBID
                      AND V.LINEID = S.LINEID
                      AND V.SEQINDEX = S.SEQINDEX WHERE 1=1 '
         || p_SERIALS;

      OPEN outCursor FOR P_SQLQUERY;
   END P_ARSEARCHBY_SERIALS;



   PROCEDURE P_SEARCHBY_SERIAL (P_SERIALS       VARCHAR2,
                                OUTCURSOR   OUT DSS.MYGEN.sqlcur)
   AS
   BEGIN
      OPEN outCursor FOR
         SELECT JOBID,
                LINEID,
                SEQINDEX,
                OPREATING_UNIT,
                ORGANIZATION_ID,
                SCR_TYPE,
                SCR_OPREATING_UNIT,
                SCR_ORGANIZATION_ID,
                SCR_LOCATION_CODE,
                DEST_TYPE,
                DEST_OPREATING_UNIT,
                DEST_ORGANIZATION_ID,
                DEST_LOCATION_CODE,
                ORDER_TYPE,
                ORDER_NUMBER,
                ORDER_REF_NO,
                ORDER_REF_NO2,
                ORDER_DATE,
                KEY1,
                KEY2,
                KEY3,
                KEY4,
                INVENTORY_ITEM_ID,
                PRODUCT_CODE,
                PRODUCT_DESC,
                BRAND,
                CAETGORY_ID,
                CATEGORY_CODE,
                CATEGORY_DESCRIPTION,
                SUB_CATEGORY_CODE,
                SUB_CATEGORY_DESCRIPTION,
                SUB_SUB_CATEGORY_CODE,
                SUB_SUB_CATEGORY_DESCRIPTION,
                SCANTYPE,
                SCAN_SOURCE,
                WMS_YN,
                INTERNAL_YN,
                WARRANTYPRINT_YN,
                WARRANTY_YN,
                WARRANTY_SEQ,
                WARRANTY_CODE,
                WARRANTY_STARTDATE,
                WARRANTY_ENDATE,
                ACTIVE_YN,
                INF_YN,
                INF_DATE,
                EXPIRY_AFTER,
                EXPIRY_DATE,
                STATUS_YN,
                CREATE_BY,
                CREATE_DATE,
                MODIFY_BY,
                MODIFY_DATE,
                ORDER_REMARKS
           FROM (SELECT S.JOBID,
                        S.LINEID,
                        S.SEQINDEX,
                        S.COLUMNINDEX,
                        S.OPREATING_UNIT,
                        S.ORGANIZATION_ID,
                        H.SCR_TYPE,
                        H.SCR_OPREATING_UNIT,
                        H.SCR_ORGANIZATION_ID,
                        H.SCR_LOCATION_CODE,
                        H.DEST_TYPE,
                        H.DEST_OPREATING_UNIT,
                        H.DEST_ORGANIZATION_ID,
                        H.DEST_LOCATION_CODE,
                        S.ORDER_TYPE,
                        S.ORDER_NUMBER,
                        H.ORDER_REF_NO,
                        H.ORDER_REF_NO2,
                        H.ORDER_DATE,
                        S.SERIALKEY,
                        S.INVENTORY_ITEM_ID,
                        S.PRODUCT_CODE,
                        P.DESCRIPTION PRODUCT_DESC,
                        C.BRAND,
                        L.CAETGORY_ID,
                        C.CATEGORY_CODE,
                        CI.CODE_DESCRIPTION CATEGORY_DESCRIPTION,
                        C.SUB_CATEGORY_CODE,
                        SCI.CODE_DESCRIPTION SUB_CATEGORY_DESCRIPTION,
                        C.SUB_SUB_CATEGORY_CODE,
                        SSCI.CODE_DESCRIPTION SUB_SUB_CATEGORY_DESCRIPTION,
                        S.SCANTYPE,
                        S.SCAN_SOURCE,
                        H.WMS_YN,
                        H.INTERNAL_YN,
                        L.WARRANTYPRINT_YN,
                        L.WARRANTY_YN,
                        L.WARRANTY_SEQ,
                        L.WARRANTY_CODE,
                        S.WARRANTY_STARTDATE,
                        S.WARRANTY_ENDATE,
                        S.ACTIVE_YN,
                        S.INF_YN,
                        S.INF_DATE,
                        H.EXPIRY_AFTER,
                        H.EXPIRY_DATE,
                        H.STATUS_YN,
                        H.CREATE_BY,
                        H.CREATE_DATE,
                        H.MODIFY_BY,
                        H.MODIFY_DATE,
                        H.ORDER_REMARKS
                   FROM DSS_ORDER_SCAN_SERIALS S
                        LEFT JOIN DSS_ORDER_SCAN_HEADER H
                           ON S.JOBID = H.JOBID
                        LEFT JOIN DSS_ORDER_SCAN_LINES L
                           ON S.LINEID = L.LINEID
                        LEFT JOIN TK_CATEGORIES_CONFIG C
                           ON L.CAETGORY_ID = C.CATEGORY_ID
                        LEFT JOIN DSS_CATEGORY_INFO CI
                           ON C.CATEGORY_CODE = CI.CODEVALUE
                        LEFT JOIN DSS_SUB_CATEGORY_INFO SCI
                           ON C.SUB_CATEGORY_CODE = SCI.CODEVALUE
                        LEFT JOIN DSS_SUB_SUB_CATEGORY_INFO SSCI
                           ON C.SUB_SUB_CATEGORY_CODE = SSCI.CODEVALUE
                        LEFT JOIN DSS_PRODUCTS P
                           ON S.INVENTORY_ITEM_ID = P.INVENTORY_ITEM_ID
                  WHERE S.SERIALKEY = P_SERIALS) PIVOT (MAX (SERIALKEY)
                                                 FOR COLUMNINDEX
                                                 IN  (1 AS KEY1,
                                                     2 AS KEY2,
                                                     3 AS KEY3,
                                                     4 AS KEY4));
   END P_SEARCHBY_SERIAL;

   PROCEDURE P_ARSEARCHBY_SERIAL (P_SERIALS       VARCHAR2,
                                  OUTCURSOR   OUT DSS.MYGEN.sqlcur)
   AS
   BEGIN
      OPEN outCursor FOR
         SELECT JOBID,
                LINEID,
                SEQINDEX,
                OPREATING_UNIT,
                ORGANIZATION_ID,
                SCR_TYPE,
                SCR_OPREATING_UNIT,
                SCR_ORGANIZATION_ID,
                SCR_LOCATION_CODE,
                DEST_TYPE,
                DEST_OPREATING_UNIT,
                DEST_ORGANIZATION_ID,
                DEST_LOCATION_CODE,
                ORDER_TYPE,
                ORDER_NUMBER,
                ORDER_REF_NO,
                ORDER_REF_NO2,
                ORDER_DATE,
                KEY1,
                KEY2,
                KEY3,
                KEY4,
                INVENTORY_ITEM_ID,
                PRODUCT_CODE,
                PRODUCT_DESC,
                BRAND,
                CAETGORY_ID,
                CATEGORY_CODE,
                CATEGORY_DESCRIPTION,
                SUB_CATEGORY_CODE,
                SUB_CATEGORY_DESCRIPTION,
                SUB_SUB_CATEGORY_CODE,
                SUB_SUB_CATEGORY_DESCRIPTION,
                SCANTYPE,
                SCAN_SOURCE,
                WMS_YN,
                INTERNAL_YN,
                WARRANTYPRINT_YN,
                WARRANTY_YN,
                WARRANTY_SEQ,
                WARRANTY_CODE,
                WARRANTY_STARTDATE,
                WARRANTY_ENDATE,
                ACTIVE_YN,
                INF_YN,
                INF_DATE,
                EXPIRY_AFTER,
                EXPIRY_DATE,
                STATUS_YN,
                CREATE_BY,
                CREATE_DATE,
                MODIFY_BY,
                MODIFY_DATE,
                ORDER_REMARKS
           FROM (SELECT S.JOBID,
                        S.LINEID,
                        S.SEQINDEX,
                        S.COLUMNINDEX,
                        S.OPREATING_UNIT,
                        S.ORGANIZATION_ID,
                        H.SCR_TYPE,
                        H.SCR_OPREATING_UNIT,
                        H.SCR_ORGANIZATION_ID,
                        H.SCR_LOCATION_CODE,
                        H.DEST_TYPE,
                        H.DEST_OPREATING_UNIT,
                        H.DEST_ORGANIZATION_ID,
                        H.DEST_LOCATION_CODE,
                        S.ORDER_TYPE,
                        S.ORDER_NUMBER,
                        H.ORDER_REF_NO,
                        H.ORDER_REF_NO2,
                        H.ORDER_DATE,
                        S.SERIALKEY,
                        S.INVENTORY_ITEM_ID,
                        S.PRODUCT_CODE,
                        P.DESCRIPTION PRODUCT_DESC,
                        C.BRAND,
                        L.CAETGORY_ID,
                        C.CATEGORY_CODE,
                        CI.CODE_DESCRIPTION CATEGORY_DESCRIPTION,
                        C.SUB_CATEGORY_CODE,
                        SCI.CODE_DESCRIPTION SUB_CATEGORY_DESCRIPTION,
                        C.SUB_SUB_CATEGORY_CODE,
                        SSCI.CODE_DESCRIPTION SUB_SUB_CATEGORY_DESCRIPTION,
                        S.SCANTYPE,
                        S.SCAN_SOURCE,
                        H.WMS_YN,
                        H.INTERNAL_YN,
                        L.WARRANTYPRINT_YN,
                        L.WARRANTY_YN,
                        L.WARRANTY_SEQ,
                        L.WARRANTY_CODE,
                        S.WARRANTY_STARTDATE,
                        S.WARRANTY_ENDATE,
                        S.ACTIVE_YN,
                        S.INF_YN,
                        S.INF_DATE,
                        H.EXPIRY_AFTER,
                        H.EXPIRY_DATE,
                        H.STATUS_YN,
                        H.CREATE_BY,
                        H.CREATE_DATE,
                        H.MODIFY_BY,
                        H.MODIFY_DATE,
                        H.ORDER_REMARKS
                   FROM AR_ORDER_SCAN_SERIALS S
                        LEFT JOIN AR_ORDER_SCAN_HEADER H ON S.JOBID = H.JOBID
                        LEFT JOIN AR_ORDER_SCAN_LINES L
                           ON S.LINEID = L.LINEID
                        LEFT JOIN TK_CATEGORIES_CONFIG C
                           ON L.CAETGORY_ID = C.CATEGORY_ID
                        LEFT JOIN DSS_CATEGORY_INFO CI
                           ON C.CATEGORY_CODE = CI.CODEVALUE
                        LEFT JOIN DSS_SUB_CATEGORY_INFO SCI
                           ON C.SUB_CATEGORY_CODE = SCI.CODEVALUE
                        LEFT JOIN DSS_SUB_SUB_CATEGORY_INFO SSCI
                           ON C.SUB_SUB_CATEGORY_CODE = SSCI.CODEVALUE
                        LEFT JOIN DSS_PRODUCTS P
                           ON S.INVENTORY_ITEM_ID = P.INVENTORY_ITEM_ID
                  WHERE S.SERIALKEY = P_SERIALS) PIVOT (MAX (SERIALKEY)
                                                 FOR COLUMNINDEX
                                                 IN  (1 AS KEY1,
                                                     2 AS KEY2,
                                                     3 AS KEY3,
                                                     4 AS KEY4));
   END P_ARSEARCHBY_SERIAL;

   PROCEDURE P_LOADBYJOBNOHORZ (
      p_JOBID        IN     DSS_ORDER_SCAN_SERIALS.JOBID%TYPE,
      p_LINEID       IN     DSS_ORDER_SCAN_SERIALS.LINEID%TYPE,
      P_ConfigKeys   IN     VARCHAR2,
      p_archived     IN     VARCHAR2,
      outCursor         OUT DSS.MYGEN.sqlcur)
   IS
      P_SQLQUERY   VARCHAR2 (1000);
   BEGIN
      IF p_archived = 'N'
      THEN
         P_SQLQUERY :=
               'SELECT * FROM (SELECT JOBID,LINEID,OPREATING_UNIT,ORGANIZATION_ID,ORDER_TYPE,ORDER_NUMBER,INVENTORY_ITEM_ID,PRODUCT_CODE,SERIALKEY,SEQINDEX , COLUMNINDEX FROM DSS_ORDER_SCAN_SERIALS WHERE JOBID = '
            || p_JOBID
            || ' AND lINEID = '
            || p_LINEID
            || ') PIVOT (MAX (SERIALKEY) FOR COLUMNINDEX IN ('
            || P_ConfigKeys
            || '))';
      ELSE
         P_SQLQUERY :=
               'SELECT * FROM (SELECT JOBID,LINEID,OPREATING_UNIT,ORGANIZATION_ID,ORDER_TYPE,ORDER_NUMBER,INVENTORY_ITEM_ID,PRODUCT_CODE,SERIALKEY,SEQINDEX , COLUMNINDEX FROM AR_ORDER_SCAN_SERIALS WHERE JOBID = '
            || p_JOBID
            || ' AND lINEID = '
            || p_LINEID
            || ') PIVOT (MAX (SERIALKEY) FOR COLUMNINDEX IN ('
            || P_ConfigKeys
            || '))';
      END IF;

      --P_SQLQUERY := 'SELECT JOBID,LINEID,OPREATING_UNIT,ORGANIZATION_ID,ORDER_TYPE,ORDER_NUMBER,INVENTORY_ITEM_ID,PRODUCT_CODE,KEY1,KEY2,KEY3,KEY4 FROM (SELECT JOBID,LINEID,OPREATING_UNIT,ORGANIZATION_ID,ORDER_TYPE,ORDER_NUMBER,INVENTORY_ITEM_ID,PRODUCT_CODE,SERIALKEY,SEQINDEX FROM DSS_ORDER_SCAN_SERIALS WHERE JOBID = 100 AND lINEID = 100) PIVOT (MAX (SERIALKEY) FOR SEQINDEX IN (1 AS KEY1,2 AS KEY2,3 AS KEY3,4 AS KEY4))' ;

      OPEN outCursor FOR P_SQLQUERY;
   END P_LOADBYJOBNOHORZ;



   PROCEDURE P_DeletebyLineID (
      p_JOBID    IN DSS_ORDER_SCAN_SERIALS.JOBID%TYPE,
      p_LINEID   IN DSS_ORDER_SCAN_SERIALS.LINEID%TYPE)
   IS
   BEGIN
   
         BEGIN
         INSERT INTO DSS_ORDER_SCAN_LOG (PR_CREATE_DATE, LINEID, JOBID,MAX_SCANID, MIN_SCANID)
            SELECT MAX (CREATE_DATE), LINEID, JOBID , MAX(SCANID),MIN(SCANID)
              FROM DSS_ORDER_SCAN_SERIALS
             WHERE LINEID = p_LINEID AND JOBID = p_JOBID
            GROUP BY LINEID, JOBID;
      EXCEPTION
         WHEN OTHERS
         THEN
            NULL;
      END;
      
      DELETE FROM DSS_ORDER_SCAN_SERIALS
            WHERE JOBID = p_JOBID AND LINEID = p_LINEID;
   END P_DeletebyLineID;


   PROCEDURE rpt_ProductSummary (p_ORGANIZATION_ID   IN     VARCHAR2,
                                 p_PRODUCT_CODE      IN     VARCHAR2,
                                 p_FROM_DATE         IN     DATE,
                                 p_TO_DATE           IN     DATE,
                                 outCursor              OUT DSS.MYGEN.sqlcur)
   AS
      P_SQLQUERY    VARCHAR2 (4000);
      P_CONDITION   VARCHAR2 (1000);
   BEGIN
      IF (p_ORGANIZATION_ID <> '')
      THEN
         P_CONDITION :=
            P_CONDITION || ' AND S.ORGANIZATION_ID = p_ORGANIZATION_ID ';
      END IF;

      IF (p_PRODUCT_CODE <> '')
      THEN
         P_CONDITION :=
               P_CONDITION
            || ' AND UPPER (S.PRODUCT_CODE) = UPPER ('
            || p_PRODUCT_CODE
            || ') ';
      END IF;

      OPEN outCursor FOR
           SELECT S.OPREATING_UNIT "Org Id",
                  S.ORGANIZATION_ID "Channel",
                  S.ORDER_TYPE "Order Type",
                  S.INVENTORY_ITEM_ID "Item Id",
                  S.PRODUCT_CODE "Product Code",
                  P.DESCRIPTION "Product Description",
                  COUNT (*) "Scanned Qty",
                  TRUNC (CREATE_DATE) "Create Date"
             FROM DSS_ORDER_SCAN_SERIALS S
                  LEFT JOIN
                  DSS_PRODUCTS P
                     ON     S.OPREATING_UNIT = P.OPERATING_UNIT
                        AND S.ORGANIZATION_ID = P.ORGANIZATION_ID
                        AND S.INVENTORY_ITEM_ID = P.INVENTORY_ITEM_ID
            WHERE     TRUNC (S.CREATE_DATE) >= TRUNC (p_FROM_DATE)
                  AND TRUNC (S.CREATE_DATE) <= TRUNC (p_TO_DATE)
                  AND S.ORGANIZATION_ID = TRIM (p_ORGANIZATION_ID)
         GROUP BY S.OPREATING_UNIT,
                  S.ORGANIZATION_ID,
                  S.ORDER_TYPE,
                  S.INVENTORY_ITEM_ID,
                  S.PRODUCT_CODE,
                  P.DESCRIPTION,
                  TRUNC (CREATE_DATE);
   -- OPEN outCursor FOR P_SQLQUERY;
   --      OPEN outCursor FOR
   --           SELECT S.OPREATING_UNIT "Org Id",
   --                  S.ORGANIZATION_ID "Channel",
   --                  S.ORDER_TYPE "Order Type",
   --                  S.INVENTORY_ITEM_ID "Item Id",
   --                  S.PRODUCT_CODE "Product Code",
   --                  P.DESCRIPTION "Product Description",
   --                  COUNT (*) "Scanned Qty",
   --                  TRUNC (CREATE_DATE) "Create Date"
   --             FROM DSS_ORDER_SCAN_SERIALS S
   --                  LEFT JOIN
   --                  DSS_PRODUCTS P
   --                     ON     S.OPREATING_UNIT = P.OPERATING_UNIT
   --                        AND S.ORGANIZATION_ID = P.ORGANIZATION_ID
   --                        AND S.INVENTORY_ITEM_ID = P.INVENTORY_ITEM_ID
   --            WHERE     TRUNC (S.CREATE_DATE) >= TRUNC (p_FROM_DATE)
   --                  AND TRUNC (S.CREATE_DATE) <= TRUNC (p_TO_DATE)
   --                  AND UPPER (S.PRODUCT_CODE) LIKE
   --                         UPPER ('%' || p_PRODUCT_CODE || '%')
   --         GROUP BY S.OPREATING_UNIT,
   --                  S.ORGANIZATION_ID,
   --                  S.ORDER_TYPE,
   --                  S.INVENTORY_ITEM_ID,
   --                  S.PRODUCT_CODE,
   --                  P.DESCRIPTION,
   --                  TRUNC (CREATE_DATE);
   END rpt_ProductSummary;
END PKG_DSS_ORDER_SCAN_SERIALS;
/
