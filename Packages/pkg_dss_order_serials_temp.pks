DROP PACKAGE DSS.PKG_DSS_ORDER_SERIALS_TEMP;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_ORDER_SERIALS_TEMP
AS
 
   TYPE TY_SCANID IS TABLE OF DSS_ORDER_SERIALS_TEMP.SCANID%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_JOBID IS TABLE OF DSS_ORDER_SERIALS_TEMP.JOBID%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_LINEID IS TABLE OF DSS_ORDER_SERIALS_TEMP.LINEID%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_SEQINDEX IS TABLE OF DSS_ORDER_SERIALS_TEMP.SEQINDEX%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_COLUMNINDEX IS TABLE OF DSS_ORDER_SERIALS_TEMP.COLUMNINDEX%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_CONFIGID IS TABLE OF DSS_ORDER_SERIALS_TEMP.CONFIGID%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_CONFIGTYPE IS TABLE OF DSS_ORDER_SERIALS_TEMP.CONFIGTYPE%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_SCANTYPE IS TABLE OF DSS_ORDER_SERIALS_TEMP.SCANTYPE%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_SCAN_SOURCE IS TABLE OF DSS_ORDER_SERIALS_TEMP.SCAN_SOURCE%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_OPREATING_UNIT
      IS TABLE OF DSS_ORDER_SERIALS_TEMP.OPREATING_UNIT%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_ORGANIZATION_ID
      IS TABLE OF DSS_ORDER_SERIALS_TEMP.ORGANIZATION_ID%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_ORDER_TYPE IS TABLE OF DSS_ORDER_SERIALS_TEMP.ORDER_TYPE%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_ORDER_NUMBER IS TABLE OF DSS_ORDER_SERIALS_TEMP.ORDER_NUMBER%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_INVENTORY_ITEM_ID
      IS TABLE OF DSS_ORDER_SERIALS_TEMP.INVENTORY_ITEM_ID%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_PRODUCT_CODE IS TABLE OF DSS_ORDER_SERIALS_TEMP.PRODUCT_CODE%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_SERVICE_BRANDID
      IS TABLE OF DSS_ORDER_SERIALS_TEMP.SERVICE_BRANDID%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_SERIALKEY IS TABLE OF DSS_ORDER_SERIALS_TEMP.SERIALKEY%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_SERIALKEY_REF1
      IS TABLE OF DSS_ORDER_SERIALS_TEMP.SERIALKEY_REF1%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_SERIALKEY_REF2
      IS TABLE OF DSS_ORDER_SERIALS_TEMP.SERIALKEY_REF2%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_WARRANTYPRINT_YN
      IS TABLE OF DSS_ORDER_SERIALS_TEMP.WARRANTYPRINT_YN%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_WARRANTY_YN IS TABLE OF DSS_ORDER_SERIALS_TEMP.WARRANTY_YN%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_WARRANTY_SEQ IS TABLE OF DSS_ORDER_SERIALS_TEMP.WARRANTY_SEQ%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_WARRANTY_CODE
      IS TABLE OF DSS_ORDER_SERIALS_TEMP.WARRANTY_CODE%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_WARRANTY_STARTDATE
      IS TABLE OF DSS_ORDER_SERIALS_TEMP.WARRANTY_STARTDATE%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_WARRANTY_ENDATE
      IS TABLE OF DSS_ORDER_SERIALS_TEMP.WARRANTY_ENDATE%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_ACTIVE_YN IS TABLE OF DSS_ORDER_SERIALS_TEMP.ACTIVE_YN%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_INF_YN IS TABLE OF DSS_ORDER_SERIALS_TEMP.INF_YN%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_INF_DATE IS TABLE OF DSS_ORDER_SERIALS_TEMP.INF_DATE%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_CREATE_BY IS TABLE OF DSS_ORDER_SERIALS_TEMP.CREATE_BY%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_CREATE_DATE IS TABLE OF DSS_ORDER_SERIALS_TEMP.CREATE_DATE%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_UPDATE_BY IS TABLE OF DSS_ORDER_SERIALS_TEMP.UPDATE_BY%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_UPDATE_DATE IS TABLE OF DSS_ORDER_SERIALS_TEMP.UPDATE_DATE%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_ALLOW_EDIT IS TABLE OF DSS_ORDER_SERIALS_TEMP.ALLOW_EDIT%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE1 IS TABLE OF DSS_ORDER_SERIALS_TEMP.ATTRIBUTE1%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE2 IS TABLE OF DSS_ORDER_SERIALS_TEMP.ATTRIBUTE2%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE3 IS TABLE OF DSS_ORDER_SERIALS_TEMP.ATTRIBUTE3%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE4 IS TABLE OF DSS_ORDER_SERIALS_TEMP.ATTRIBUTE4%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE5 IS TABLE OF DSS_ORDER_SERIALS_TEMP.ATTRIBUTE5%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE6 IS TABLE OF DSS_ORDER_SERIALS_TEMP.ATTRIBUTE6%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE7 IS TABLE OF DSS_ORDER_SERIALS_TEMP.ATTRIBUTE7%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE8 IS TABLE OF DSS_ORDER_SERIALS_TEMP.ATTRIBUTE8%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE9 IS TABLE OF DSS_ORDER_SERIALS_TEMP.ATTRIBUTE9%TYPE
      INDEX BY BINARY_INTEGER;

   TYPE TY_ATTRIBUTE10 IS TABLE OF DSS_ORDER_SERIALS_TEMP.ATTRIBUTE10%TYPE
      INDEX BY BINARY_INTEGER;

   PROCEDURE PI_LIVETABLE_INSERT (
      p_JOBID    IN DSS_ORDER_SERIALS_TEMP.JOBID%TYPE,
      p_LINEID   IN DSS_ORDER_SERIALS_TEMP.LINEID%TYPE);

   PROCEDURE PV_ORDER_DUPLICATION (
      p_JOBID     IN     DSS_ORDER_SERIALS_TEMP.JOBID%TYPE,
      p_LINEID    IN     DSS_ORDER_SERIALS_TEMP.LINEID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_BULK_Insert (A_SCANID               IN TY_SCANID,
                            A_JOBID                IN TY_JOBID,
                            A_LINEID               IN TY_LINEID,
                            A_SEQINDEX             IN TY_SEQINDEX,
                            A_COLUMNINDEX          IN TY_COLUMNINDEX,
                            A_CONFIGID             IN TY_CONFIGID,
                            A_CONFIGTYPE           IN TY_CONFIGTYPE,
                            A_SCANTYPE             IN TY_SCANTYPE,
                            A_SCAN_SOURCE          IN TY_SCAN_SOURCE,
                            A_OPREATING_UNIT       IN TY_OPREATING_UNIT,
                            A_ORGANIZATION_ID      IN TY_ORGANIZATION_ID,
                            A_ORDER_TYPE           IN TY_ORDER_TYPE,
                            A_ORDER_NUMBER         IN TY_ORDER_NUMBER,
                            A_INVENTORY_ITEM_ID    IN TY_INVENTORY_ITEM_ID,
                            A_PRODUCT_CODE         IN TY_PRODUCT_CODE,
                            A_SERVICE_BRANDID      IN TY_SERVICE_BRANDID,
                            A_SERIALKEY            IN TY_SERIALKEY,
                            A_SERIALKEY_REF1       IN TY_SERIALKEY_REF1,
                            A_SERIALKEY_REF2       IN TY_SERIALKEY_REF2,
                            A_WARRANTYPRINT_YN     IN TY_WARRANTYPRINT_YN,
                            A_WARRANTY_YN          IN TY_WARRANTY_YN,
                            A_WARRANTY_SEQ         IN TY_WARRANTY_SEQ,
                            A_WARRANTY_CODE        IN TY_WARRANTY_CODE,
                            A_WARRANTY_STARTDATE   IN TY_WARRANTY_STARTDATE,
                            A_WARRANTY_ENDATE      IN TY_WARRANTY_ENDATE,
                            A_ACTIVE_YN            IN TY_ACTIVE_YN,
                            A_INF_YN               IN TY_INF_YN,
                            A_INF_DATE             IN TY_INF_DATE,
                            A_CREATE_BY            IN TY_CREATE_BY,
                            A_CREATE_DATE          IN TY_CREATE_DATE,
                            A_UPDATE_BY            IN TY_UPDATE_BY,
                            A_UPDATE_DATE          IN TY_UPDATE_DATE,
                            A_ALLOW_EDIT           IN TY_ALLOW_EDIT,
                            A_ATTRIBUTE1           IN TY_ATTRIBUTE1,
                            A_ATTRIBUTE2           IN TY_ATTRIBUTE2,
                            A_ATTRIBUTE3           IN TY_ATTRIBUTE3,
                            A_ATTRIBUTE4           IN TY_ATTRIBUTE4,
                            A_ATTRIBUTE5           IN TY_ATTRIBUTE5,
                            A_ATTRIBUTE6           IN TY_ATTRIBUTE6,
                            A_ATTRIBUTE7           IN TY_ATTRIBUTE7,
                            A_ATTRIBUTE8           IN TY_ATTRIBUTE8,
                            A_ATTRIBUTE9           IN TY_ATTRIBUTE9,
                            A_ATTRIBUTE10          IN TY_ATTRIBUTE10);

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_JOBID     IN     DSS_ORDER_SERIALS_TEMP.JOBID%TYPE,
      p_LINEID    IN     DSS_ORDER_SERIALS_TEMP.LINEID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_SCANID               IN DSS_ORDER_SERIALS_TEMP.SCANID%TYPE,
      p_JOBID                IN DSS_ORDER_SERIALS_TEMP.JOBID%TYPE,
      p_LINEID               IN DSS_ORDER_SERIALS_TEMP.LINEID%TYPE,
      p_SEQINDEX             IN DSS_ORDER_SERIALS_TEMP.SEQINDEX%TYPE,
      p_COLUMNINDEX          IN DSS_ORDER_SERIALS_TEMP.COLUMNINDEX%TYPE,
      p_CONFIGID             IN DSS_ORDER_SERIALS_TEMP.CONFIGID%TYPE,
      p_CONFIGTYPE           IN DSS_ORDER_SERIALS_TEMP.CONFIGTYPE%TYPE,
      p_SCANTYPE             IN DSS_ORDER_SERIALS_TEMP.SCANTYPE%TYPE,
      p_SCAN_SOURCE          IN DSS_ORDER_SERIALS_TEMP.SCAN_SOURCE%TYPE,
      p_OPREATING_UNIT       IN DSS_ORDER_SERIALS_TEMP.OPREATING_UNIT%TYPE,
      p_ORGANIZATION_ID      IN DSS_ORDER_SERIALS_TEMP.ORGANIZATION_ID%TYPE,
      p_ORDER_TYPE           IN DSS_ORDER_SERIALS_TEMP.ORDER_TYPE%TYPE,
      p_ORDER_NUMBER         IN DSS_ORDER_SERIALS_TEMP.ORDER_NUMBER%TYPE,
      p_INVENTORY_ITEM_ID    IN DSS_ORDER_SERIALS_TEMP.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE         IN DSS_ORDER_SERIALS_TEMP.PRODUCT_CODE%TYPE,
      p_SERVICE_BRANDID      IN DSS_ORDER_SERIALS_TEMP.SERVICE_BRANDID%TYPE,
      p_SERIALKEY            IN DSS_ORDER_SERIALS_TEMP.SERIALKEY%TYPE,
      p_SERIALKEY_REF1       IN DSS_ORDER_SERIALS_TEMP.SERIALKEY_REF1%TYPE,
      p_SERIALKEY_REF2       IN DSS_ORDER_SERIALS_TEMP.SERIALKEY_REF2%TYPE,
      p_WARRANTYPRINT_YN     IN DSS_ORDER_SERIALS_TEMP.WARRANTYPRINT_YN%TYPE,
      p_WARRANTY_YN          IN DSS_ORDER_SERIALS_TEMP.WARRANTY_YN%TYPE,
      p_WARRANTY_SEQ         IN DSS_ORDER_SERIALS_TEMP.WARRANTY_SEQ%TYPE,
      p_WARRANTY_CODE        IN DSS_ORDER_SERIALS_TEMP.WARRANTY_CODE%TYPE,
      p_WARRANTY_STARTDATE   IN DSS_ORDER_SERIALS_TEMP.WARRANTY_STARTDATE%TYPE,
      p_WARRANTY_ENDATE      IN DSS_ORDER_SERIALS_TEMP.WARRANTY_ENDATE%TYPE,
      p_ACTIVE_YN            IN DSS_ORDER_SERIALS_TEMP.ACTIVE_YN%TYPE,
      p_INF_YN               IN DSS_ORDER_SERIALS_TEMP.INF_YN%TYPE,
      p_INF_DATE             IN DSS_ORDER_SERIALS_TEMP.INF_DATE%TYPE,
      p_CREATE_BY            IN DSS_ORDER_SERIALS_TEMP.CREATE_BY%TYPE,
      p_CREATE_DATE          IN DSS_ORDER_SERIALS_TEMP.CREATE_DATE%TYPE,
      p_UPDATE_BY            IN DSS_ORDER_SERIALS_TEMP.UPDATE_BY%TYPE,
      p_UPDATE_DATE          IN DSS_ORDER_SERIALS_TEMP.UPDATE_DATE%TYPE,
      p_ALLOW_EDIT           IN DSS_ORDER_SERIALS_TEMP.ALLOW_EDIT%TYPE,
      p_ATTRIBUTE1           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10          IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE10%TYPE);

   PROCEDURE P_Insert (
      p_SCANID               IN DSS_ORDER_SERIALS_TEMP.SCANID%TYPE,
      p_JOBID                IN DSS_ORDER_SERIALS_TEMP.JOBID%TYPE,
      p_LINEID               IN DSS_ORDER_SERIALS_TEMP.LINEID%TYPE,
      p_SEQINDEX             IN DSS_ORDER_SERIALS_TEMP.SEQINDEX%TYPE,
      p_COLUMNINDEX          IN DSS_ORDER_SERIALS_TEMP.COLUMNINDEX%TYPE,
      p_CONFIGID             IN DSS_ORDER_SERIALS_TEMP.CONFIGID%TYPE,
      p_CONFIGTYPE           IN DSS_ORDER_SERIALS_TEMP.CONFIGTYPE%TYPE,
      p_SCANTYPE             IN DSS_ORDER_SERIALS_TEMP.SCANTYPE%TYPE,
      p_SCAN_SOURCE          IN DSS_ORDER_SERIALS_TEMP.SCAN_SOURCE%TYPE,
      p_OPREATING_UNIT       IN DSS_ORDER_SERIALS_TEMP.OPREATING_UNIT%TYPE,
      p_ORGANIZATION_ID      IN DSS_ORDER_SERIALS_TEMP.ORGANIZATION_ID%TYPE,
      p_ORDER_TYPE           IN DSS_ORDER_SERIALS_TEMP.ORDER_TYPE%TYPE,
      p_ORDER_NUMBER         IN DSS_ORDER_SERIALS_TEMP.ORDER_NUMBER%TYPE,
      p_INVENTORY_ITEM_ID    IN DSS_ORDER_SERIALS_TEMP.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE         IN DSS_ORDER_SERIALS_TEMP.PRODUCT_CODE%TYPE,
      p_SERVICE_BRANDID      IN DSS_ORDER_SERIALS_TEMP.SERVICE_BRANDID%TYPE,
      p_SERIALKEY            IN DSS_ORDER_SERIALS_TEMP.SERIALKEY%TYPE,
      p_SERIALKEY_REF1       IN DSS_ORDER_SERIALS_TEMP.SERIALKEY_REF1%TYPE,
      p_SERIALKEY_REF2       IN DSS_ORDER_SERIALS_TEMP.SERIALKEY_REF2%TYPE,
      p_WARRANTYPRINT_YN     IN DSS_ORDER_SERIALS_TEMP.WARRANTYPRINT_YN%TYPE,
      p_WARRANTY_YN          IN DSS_ORDER_SERIALS_TEMP.WARRANTY_YN%TYPE,
      p_WARRANTY_SEQ         IN DSS_ORDER_SERIALS_TEMP.WARRANTY_SEQ%TYPE,
      p_WARRANTY_CODE        IN DSS_ORDER_SERIALS_TEMP.WARRANTY_CODE%TYPE,
      p_WARRANTY_STARTDATE   IN DSS_ORDER_SERIALS_TEMP.WARRANTY_STARTDATE%TYPE,
      p_WARRANTY_ENDATE      IN DSS_ORDER_SERIALS_TEMP.WARRANTY_ENDATE%TYPE,
      p_ACTIVE_YN            IN DSS_ORDER_SERIALS_TEMP.ACTIVE_YN%TYPE,
      p_INF_YN               IN DSS_ORDER_SERIALS_TEMP.INF_YN%TYPE,
      p_INF_DATE             IN DSS_ORDER_SERIALS_TEMP.INF_DATE%TYPE,
      p_CREATE_BY            IN DSS_ORDER_SERIALS_TEMP.CREATE_BY%TYPE,
      p_CREATE_DATE          IN DSS_ORDER_SERIALS_TEMP.CREATE_DATE%TYPE,
      p_UPDATE_BY            IN DSS_ORDER_SERIALS_TEMP.UPDATE_BY%TYPE,
      p_UPDATE_DATE          IN DSS_ORDER_SERIALS_TEMP.UPDATE_DATE%TYPE,
      p_ALLOW_EDIT           IN DSS_ORDER_SERIALS_TEMP.ALLOW_EDIT%TYPE,
      p_ATTRIBUTE1           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10          IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE10%TYPE);

   PROCEDURE P_Delete (p_JOBID    IN DSS_ORDER_SERIALS_TEMP.JOBID%TYPE,
                       p_LINEID   IN DSS_ORDER_SERIALS_TEMP.LINEID%TYPE);
END PKG_DSS_ORDER_SERIALS_TEMP;
/


DROP PACKAGE BODY DSS.PKG_DSS_ORDER_SERIALS_TEMP;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_ORDER_SERIALS_TEMP
AS
   PROCEDURE P_LoadByPrimaryKey (
      p_JOBID     IN     DSS_ORDER_SERIALS_TEMP.JOBID%TYPE,
      p_LINEID    IN     DSS_ORDER_SERIALS_TEMP.LINEID%TYPE,
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
           FROM DSS_ORDER_SERIALS_TEMP
          WHERE JOBID = p_JOBID AND LINEID = p_LINEID;
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
           FROM DSS_ORDER_SERIALS_TEMP;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_SCANID               IN DSS_ORDER_SERIALS_TEMP.SCANID%TYPE,
      p_JOBID                IN DSS_ORDER_SERIALS_TEMP.JOBID%TYPE,
      p_LINEID               IN DSS_ORDER_SERIALS_TEMP.LINEID%TYPE,
      p_SEQINDEX             IN DSS_ORDER_SERIALS_TEMP.SEQINDEX%TYPE,
      p_COLUMNINDEX          IN DSS_ORDER_SERIALS_TEMP.COLUMNINDEX%TYPE,
      p_CONFIGID             IN DSS_ORDER_SERIALS_TEMP.CONFIGID%TYPE,
      p_CONFIGTYPE           IN DSS_ORDER_SERIALS_TEMP.CONFIGTYPE%TYPE,
      p_SCANTYPE             IN DSS_ORDER_SERIALS_TEMP.SCANTYPE%TYPE,
      p_SCAN_SOURCE          IN DSS_ORDER_SERIALS_TEMP.SCAN_SOURCE%TYPE,
      p_OPREATING_UNIT       IN DSS_ORDER_SERIALS_TEMP.OPREATING_UNIT%TYPE,
      p_ORGANIZATION_ID      IN DSS_ORDER_SERIALS_TEMP.ORGANIZATION_ID%TYPE,
      p_ORDER_TYPE           IN DSS_ORDER_SERIALS_TEMP.ORDER_TYPE%TYPE,
      p_ORDER_NUMBER         IN DSS_ORDER_SERIALS_TEMP.ORDER_NUMBER%TYPE,
      p_INVENTORY_ITEM_ID    IN DSS_ORDER_SERIALS_TEMP.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE         IN DSS_ORDER_SERIALS_TEMP.PRODUCT_CODE%TYPE,
      p_SERVICE_BRANDID      IN DSS_ORDER_SERIALS_TEMP.SERVICE_BRANDID%TYPE,
      p_SERIALKEY            IN DSS_ORDER_SERIALS_TEMP.SERIALKEY%TYPE,
      p_SERIALKEY_REF1       IN DSS_ORDER_SERIALS_TEMP.SERIALKEY_REF1%TYPE,
      p_SERIALKEY_REF2       IN DSS_ORDER_SERIALS_TEMP.SERIALKEY_REF2%TYPE,
      p_WARRANTYPRINT_YN     IN DSS_ORDER_SERIALS_TEMP.WARRANTYPRINT_YN%TYPE,
      p_WARRANTY_YN          IN DSS_ORDER_SERIALS_TEMP.WARRANTY_YN%TYPE,
      p_WARRANTY_SEQ         IN DSS_ORDER_SERIALS_TEMP.WARRANTY_SEQ%TYPE,
      p_WARRANTY_CODE        IN DSS_ORDER_SERIALS_TEMP.WARRANTY_CODE%TYPE,
      p_WARRANTY_STARTDATE   IN DSS_ORDER_SERIALS_TEMP.WARRANTY_STARTDATE%TYPE,
      p_WARRANTY_ENDATE      IN DSS_ORDER_SERIALS_TEMP.WARRANTY_ENDATE%TYPE,
      p_ACTIVE_YN            IN DSS_ORDER_SERIALS_TEMP.ACTIVE_YN%TYPE,
      p_INF_YN               IN DSS_ORDER_SERIALS_TEMP.INF_YN%TYPE,
      p_INF_DATE             IN DSS_ORDER_SERIALS_TEMP.INF_DATE%TYPE,
      p_CREATE_BY            IN DSS_ORDER_SERIALS_TEMP.CREATE_BY%TYPE,
      p_CREATE_DATE          IN DSS_ORDER_SERIALS_TEMP.CREATE_DATE%TYPE,
      p_UPDATE_BY            IN DSS_ORDER_SERIALS_TEMP.UPDATE_BY%TYPE,
      p_UPDATE_DATE          IN DSS_ORDER_SERIALS_TEMP.UPDATE_DATE%TYPE,
      p_ALLOW_EDIT           IN DSS_ORDER_SERIALS_TEMP.ALLOW_EDIT%TYPE,
      p_ATTRIBUTE1           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10          IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      UPDATE DSS_ORDER_SERIALS_TEMP
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
             SERIALKEY = p_SERIALKEY,
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
       WHERE JOBID = p_JOBID AND LINEID = p_LINEID;
   END P_Update;


   PROCEDURE P_Insert (
      p_SCANID               IN DSS_ORDER_SERIALS_TEMP.SCANID%TYPE,
      p_JOBID                IN DSS_ORDER_SERIALS_TEMP.JOBID%TYPE,
      p_LINEID               IN DSS_ORDER_SERIALS_TEMP.LINEID%TYPE,
      p_SEQINDEX             IN DSS_ORDER_SERIALS_TEMP.SEQINDEX%TYPE,
      p_COLUMNINDEX          IN DSS_ORDER_SERIALS_TEMP.COLUMNINDEX%TYPE,
      p_CONFIGID             IN DSS_ORDER_SERIALS_TEMP.CONFIGID%TYPE,
      p_CONFIGTYPE           IN DSS_ORDER_SERIALS_TEMP.CONFIGTYPE%TYPE,
      p_SCANTYPE             IN DSS_ORDER_SERIALS_TEMP.SCANTYPE%TYPE,
      p_SCAN_SOURCE          IN DSS_ORDER_SERIALS_TEMP.SCAN_SOURCE%TYPE,
      p_OPREATING_UNIT       IN DSS_ORDER_SERIALS_TEMP.OPREATING_UNIT%TYPE,
      p_ORGANIZATION_ID      IN DSS_ORDER_SERIALS_TEMP.ORGANIZATION_ID%TYPE,
      p_ORDER_TYPE           IN DSS_ORDER_SERIALS_TEMP.ORDER_TYPE%TYPE,
      p_ORDER_NUMBER         IN DSS_ORDER_SERIALS_TEMP.ORDER_NUMBER%TYPE,
      p_INVENTORY_ITEM_ID    IN DSS_ORDER_SERIALS_TEMP.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE         IN DSS_ORDER_SERIALS_TEMP.PRODUCT_CODE%TYPE,
      p_SERVICE_BRANDID      IN DSS_ORDER_SERIALS_TEMP.SERVICE_BRANDID%TYPE,
      p_SERIALKEY            IN DSS_ORDER_SERIALS_TEMP.SERIALKEY%TYPE,
      p_SERIALKEY_REF1       IN DSS_ORDER_SERIALS_TEMP.SERIALKEY_REF1%TYPE,
      p_SERIALKEY_REF2       IN DSS_ORDER_SERIALS_TEMP.SERIALKEY_REF2%TYPE,
      p_WARRANTYPRINT_YN     IN DSS_ORDER_SERIALS_TEMP.WARRANTYPRINT_YN%TYPE,
      p_WARRANTY_YN          IN DSS_ORDER_SERIALS_TEMP.WARRANTY_YN%TYPE,
      p_WARRANTY_SEQ         IN DSS_ORDER_SERIALS_TEMP.WARRANTY_SEQ%TYPE,
      p_WARRANTY_CODE        IN DSS_ORDER_SERIALS_TEMP.WARRANTY_CODE%TYPE,
      p_WARRANTY_STARTDATE   IN DSS_ORDER_SERIALS_TEMP.WARRANTY_STARTDATE%TYPE,
      p_WARRANTY_ENDATE      IN DSS_ORDER_SERIALS_TEMP.WARRANTY_ENDATE%TYPE,
      p_ACTIVE_YN            IN DSS_ORDER_SERIALS_TEMP.ACTIVE_YN%TYPE,
      p_INF_YN               IN DSS_ORDER_SERIALS_TEMP.INF_YN%TYPE,
      p_INF_DATE             IN DSS_ORDER_SERIALS_TEMP.INF_DATE%TYPE,
      p_CREATE_BY            IN DSS_ORDER_SERIALS_TEMP.CREATE_BY%TYPE,
      p_CREATE_DATE          IN DSS_ORDER_SERIALS_TEMP.CREATE_DATE%TYPE,
      p_UPDATE_BY            IN DSS_ORDER_SERIALS_TEMP.UPDATE_BY%TYPE,
      p_UPDATE_DATE          IN DSS_ORDER_SERIALS_TEMP.UPDATE_DATE%TYPE,
      p_ALLOW_EDIT           IN DSS_ORDER_SERIALS_TEMP.ALLOW_EDIT%TYPE,
      p_ATTRIBUTE1           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9           IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10          IN DSS_ORDER_SERIALS_TEMP.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      INSERT INTO DSS_ORDER_SERIALS_TEMP (SCANID,
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
              p_SERIALKEY,
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

   PROCEDURE P_Delete (p_JOBID    IN DSS_ORDER_SERIALS_TEMP.JOBID%TYPE,
                       p_LINEID   IN DSS_ORDER_SERIALS_TEMP.LINEID%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_ORDER_SERIALS_TEMP
       WHERE JOBID = p_JOBID AND LINEID = p_LINEID;
   END P_Delete;



   PROCEDURE P_BULK_Insert (A_SCANID               IN TY_SCANID,
                            A_JOBID                IN TY_JOBID,
                            A_LINEID               IN TY_LINEID,
                            A_SEQINDEX             IN TY_SEQINDEX,
                            A_COLUMNINDEX          IN TY_COLUMNINDEX,
                            A_CONFIGID             IN TY_CONFIGID,
                            A_CONFIGTYPE           IN TY_CONFIGTYPE,
                            A_SCANTYPE             IN TY_SCANTYPE,
                            A_SCAN_SOURCE          IN TY_SCAN_SOURCE,
                            A_OPREATING_UNIT       IN TY_OPREATING_UNIT,
                            A_ORGANIZATION_ID      IN TY_ORGANIZATION_ID,
                            A_ORDER_TYPE           IN TY_ORDER_TYPE,
                            A_ORDER_NUMBER         IN TY_ORDER_NUMBER,
                            A_INVENTORY_ITEM_ID    IN TY_INVENTORY_ITEM_ID,
                            A_PRODUCT_CODE         IN TY_PRODUCT_CODE,
                            A_SERVICE_BRANDID      IN TY_SERVICE_BRANDID,
                            A_SERIALKEY            IN TY_SERIALKEY,
                            A_SERIALKEY_REF1       IN TY_SERIALKEY_REF1,
                            A_SERIALKEY_REF2       IN TY_SERIALKEY_REF2,
                            A_WARRANTYPRINT_YN     IN TY_WARRANTYPRINT_YN,
                            A_WARRANTY_YN          IN TY_WARRANTY_YN,
                            A_WARRANTY_SEQ         IN TY_WARRANTY_SEQ,
                            A_WARRANTY_CODE        IN TY_WARRANTY_CODE,
                            A_WARRANTY_STARTDATE   IN TY_WARRANTY_STARTDATE,
                            A_WARRANTY_ENDATE      IN TY_WARRANTY_ENDATE,
                            A_ACTIVE_YN            IN TY_ACTIVE_YN,
                            A_INF_YN               IN TY_INF_YN,
                            A_INF_DATE             IN TY_INF_DATE,
                            A_CREATE_BY            IN TY_CREATE_BY,
                            A_CREATE_DATE          IN TY_CREATE_DATE,
                            A_UPDATE_BY            IN TY_UPDATE_BY,
                            A_UPDATE_DATE          IN TY_UPDATE_DATE,
                            A_ALLOW_EDIT           IN TY_ALLOW_EDIT,
                            A_ATTRIBUTE1           IN TY_ATTRIBUTE1,
                            A_ATTRIBUTE2           IN TY_ATTRIBUTE2,
                            A_ATTRIBUTE3           IN TY_ATTRIBUTE3,
                            A_ATTRIBUTE4           IN TY_ATTRIBUTE4,
                            A_ATTRIBUTE5           IN TY_ATTRIBUTE5,
                            A_ATTRIBUTE6           IN TY_ATTRIBUTE6,
                            A_ATTRIBUTE7           IN TY_ATTRIBUTE7,
                            A_ATTRIBUTE8           IN TY_ATTRIBUTE8,
                            A_ATTRIBUTE9           IN TY_ATTRIBUTE9,
                            A_ATTRIBUTE10          IN TY_ATTRIBUTE10)
   IS
   BEGIN
      FORALL I IN A_SCANID.FIRST .. A_SCANID.LAST
         INSERT INTO DSS_ORDER_SERIALS_TEMP (JOBID,
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
         VALUES (A_JOBID (I),
                 A_LINEID (I),
                 A_SEQINDEX (I),
                 A_COLUMNINDEX (I),
                 A_CONFIGID (I),
                 A_CONFIGTYPE (I),
                 A_SCANTYPE (I),
                 A_SCAN_SOURCE (I),
                 A_OPREATING_UNIT (I),
                 A_ORGANIZATION_ID (I),
                 A_ORDER_TYPE (I),
                 A_ORDER_NUMBER (I),
                 A_INVENTORY_ITEM_ID (I),
                 A_PRODUCT_CODE (I),
                 A_SERVICE_BRANDID (I),
                 A_SERIALKEY (I),
                 A_SERIALKEY_REF1 (I),
                 A_SERIALKEY_REF2 (I),
                 A_WARRANTYPRINT_YN (I),
                 A_WARRANTY_YN (I),
                 A_WARRANTY_SEQ (I),
                 A_WARRANTY_CODE (I),
                 A_WARRANTY_STARTDATE (I),
                 A_WARRANTY_ENDATE (I),
                 A_ACTIVE_YN (I),
                 A_INF_YN (I),
                 A_INF_DATE (I),
                 A_CREATE_BY (I),
                 SYSDATE,
                 A_UPDATE_BY (I),
                 A_UPDATE_DATE (I),
                 A_ALLOW_EDIT (I),
                 A_ATTRIBUTE1 (I),
                 A_ATTRIBUTE2 (I),
                 A_ATTRIBUTE3 (I),
                 A_ATTRIBUTE4 (I),
                 A_ATTRIBUTE5 (I),
                 A_ATTRIBUTE6 (I),
                 A_ATTRIBUTE7 (I),
                 A_ATTRIBUTE8 (I),
                 A_ATTRIBUTE9 (I),
                 A_ATTRIBUTE10 (I));
   END P_BULK_Insert;


   PROCEDURE PV_ORDER_DUPLICATION (
      p_JOBID     IN     DSS_ORDER_SERIALS_TEMP.JOBID%TYPE,
      p_LINEID    IN     DSS_ORDER_SERIALS_TEMP.LINEID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT TE.*,
                   'This Already Scanned In Same Order For '
                || L.PRODUCT_CODE
                || ' Product'
                   ERRORMESSAGE
           FROM DSS_ORDER_SCAN_SERIALS L
                INNER JOIN DSS_ORDER_SERIALS_TEMP TE
                   ON TE.SERIALKEY = L.SERIALKEY
          WHERE L.JOBID = p_JOBID AND L.LINEID != p_LINEID;
   END PV_ORDER_DUPLICATION;

   PROCEDURE PI_LIVETABLE_INSERT (
      p_JOBID    IN DSS_ORDER_SERIALS_TEMP.JOBID%TYPE,
      p_LINEID   IN DSS_ORDER_SERIALS_TEMP.LINEID%TYPE)
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

      INSERT INTO DSS_ORDER_SCAN_SERIALS (JOBID,
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
         SELECT JOBID,
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
                UPPER(SERIALKEY),
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
           FROM DSS_ORDER_SERIALS_TEMP
          WHERE JOBID = p_JOBID AND LINEID = p_LINEID;


      P_Delete (p_JOBID, p_LINEID);
      
   END PI_LIVETABLE_INSERT;
END PKG_DSS_ORDER_SERIALS_TEMP;
/
