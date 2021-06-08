DROP PACKAGE DSS.PKG_DSS_LOG_BARCODES;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_LOG_BARCODES  as 

PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur); 
PROCEDURE P_LoadByPrimaryKey (    p_LOGID IN DSS_LOG_BARCODES.LOGID%type,
  outCursor OUT DSS.MYGEN.sqlcur); 
PROCEDURE P_Update (    p_LOGID IN DSS_LOG_BARCODES.LOGID%type,
    p_OPERATING_UNIT IN DSS_LOG_BARCODES.OPERATING_UNIT%type,
    p_ORGANIZATION_ID IN DSS_LOG_BARCODES.ORGANIZATION_ID%type,
    p_PRODUCT_CODE IN DSS_LOG_BARCODES.PRODUCT_CODE%type,
    p_INVENTORY_ITEM_ID IN DSS_LOG_BARCODES.INVENTORY_ITEM_ID%type,
    p_BARCODE IN DSS_LOG_BARCODES.BARCODE%type,
    p_ACTION_TYPE IN DSS_LOG_BARCODES.ACTION_TYPE%type,
    p_REMARKS IN DSS_LOG_BARCODES.REMARKS%type,
    p_CREATE_BY IN DSS_LOG_BARCODES.CREATE_BY%type,
    p_CRAETE_DATE IN DSS_LOG_BARCODES.CRAETE_DATE%type,
    p_ATTRIBUTE1 IN DSS_LOG_BARCODES.ATTRIBUTE1%type,
    p_ATTRIBUTE2 IN DSS_LOG_BARCODES.ATTRIBUTE2%type,
    p_ATTRIBUTE3 IN DSS_LOG_BARCODES.ATTRIBUTE3%type,
    p_ATTRIBUTE4 IN DSS_LOG_BARCODES.ATTRIBUTE4%type,
    p_ATTRIBUTE5 IN DSS_LOG_BARCODES.ATTRIBUTE5%type,
    p_ATTRIBUTE6 IN DSS_LOG_BARCODES.ATTRIBUTE6%type,
    p_ATTRIBUTE7 IN DSS_LOG_BARCODES.ATTRIBUTE7%type,
    p_ATTRIBUTE8 IN DSS_LOG_BARCODES.ATTRIBUTE8%type,
    p_ATTRIBUTE9 IN DSS_LOG_BARCODES.ATTRIBUTE9%type,
    p_ATTRIBUTE10 IN DSS_LOG_BARCODES.ATTRIBUTE10%type); 
PROCEDURE P_Insert (    p_LOGID IN DSS_LOG_BARCODES.LOGID%type,
    p_OPERATING_UNIT IN DSS_LOG_BARCODES.OPERATING_UNIT%type,
    p_ORGANIZATION_ID IN DSS_LOG_BARCODES.ORGANIZATION_ID%type,
    p_PRODUCT_CODE IN DSS_LOG_BARCODES.PRODUCT_CODE%type,
    p_INVENTORY_ITEM_ID IN DSS_LOG_BARCODES.INVENTORY_ITEM_ID%type,
    p_BARCODE IN DSS_LOG_BARCODES.BARCODE%type,
    p_ACTION_TYPE IN DSS_LOG_BARCODES.ACTION_TYPE%type,
    p_REMARKS IN DSS_LOG_BARCODES.REMARKS%type,
    p_CREATE_BY IN DSS_LOG_BARCODES.CREATE_BY%type,
    p_CRAETE_DATE IN DSS_LOG_BARCODES.CRAETE_DATE%type,
    p_ATTRIBUTE1 IN DSS_LOG_BARCODES.ATTRIBUTE1%type,
    p_ATTRIBUTE2 IN DSS_LOG_BARCODES.ATTRIBUTE2%type,
    p_ATTRIBUTE3 IN DSS_LOG_BARCODES.ATTRIBUTE3%type,
    p_ATTRIBUTE4 IN DSS_LOG_BARCODES.ATTRIBUTE4%type,
    p_ATTRIBUTE5 IN DSS_LOG_BARCODES.ATTRIBUTE5%type,
    p_ATTRIBUTE6 IN DSS_LOG_BARCODES.ATTRIBUTE6%type,
    p_ATTRIBUTE7 IN DSS_LOG_BARCODES.ATTRIBUTE7%type,
    p_ATTRIBUTE8 IN DSS_LOG_BARCODES.ATTRIBUTE8%type,
    p_ATTRIBUTE9 IN DSS_LOG_BARCODES.ATTRIBUTE9%type,
    p_ATTRIBUTE10 IN DSS_LOG_BARCODES.ATTRIBUTE10%type); 
PROCEDURE P_Delete (    p_LOGID IN DSS_LOG_BARCODES.LOGID%type); 

 PROCEDURE ADD_LOG (P_OPERATING_UNIT       VARCHAR2,
                           P_ORGANIZATION_ID      VARCHAR2,
                           P_PRODUCT_CODE         VARCHAR2,
                           P_INVENTORY_ITEM_ID    VARCHAR2,
                           P_BARCODE              VARCHAR2,
                           P_ACTION_TYPE          VARCHAR2,
                           P_REMARKS              VARCHAR2,
                           P_CREATED_BY            VARCHAR2);

END PKG_DSS_LOG_BARCODES;
/


DROP PACKAGE BODY DSS.PKG_DSS_LOG_BARCODES;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_LOG_BARCODES
AS
   PROCEDURE P_LoadByPrimaryKey (
      p_LOGID     IN     DSS_LOG_BARCODES.LOGID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT LOGID,
                OPERATING_UNIT,
                ORGANIZATION_ID,
                PRODUCT_CODE,
                INVENTORY_ITEM_ID,
                BARCODE,
                ACTION_TYPE,
                REMARKS,
                CREATE_BY,
                CRAETE_DATE,
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
           FROM DSS_LOG_BARCODES
          WHERE LOGID = p_LOGID;
   END P_LoadByPrimaryKey;

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT LOGID,
                OPERATING_UNIT,
                ORGANIZATION_ID,
                PRODUCT_CODE,
                INVENTORY_ITEM_ID,
                BARCODE,
                ACTION_TYPE,
                REMARKS,
                CREATE_BY,
                CRAETE_DATE,
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
           FROM DSS_LOG_BARCODES;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_LOGID               IN DSS_LOG_BARCODES.LOGID%TYPE,
      p_OPERATING_UNIT      IN DSS_LOG_BARCODES.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID     IN DSS_LOG_BARCODES.ORGANIZATION_ID%TYPE,
      p_PRODUCT_CODE        IN DSS_LOG_BARCODES.PRODUCT_CODE%TYPE,
      p_INVENTORY_ITEM_ID   IN DSS_LOG_BARCODES.INVENTORY_ITEM_ID%TYPE,
      p_BARCODE             IN DSS_LOG_BARCODES.BARCODE%TYPE,
      p_ACTION_TYPE         IN DSS_LOG_BARCODES.ACTION_TYPE%TYPE,
      p_REMARKS             IN DSS_LOG_BARCODES.REMARKS%TYPE,
      p_CREATE_BY           IN DSS_LOG_BARCODES.CREATE_BY%TYPE,
      p_CRAETE_DATE         IN DSS_LOG_BARCODES.CRAETE_DATE%TYPE,
      p_ATTRIBUTE1          IN DSS_LOG_BARCODES.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2          IN DSS_LOG_BARCODES.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3          IN DSS_LOG_BARCODES.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4          IN DSS_LOG_BARCODES.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5          IN DSS_LOG_BARCODES.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6          IN DSS_LOG_BARCODES.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7          IN DSS_LOG_BARCODES.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8          IN DSS_LOG_BARCODES.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9          IN DSS_LOG_BARCODES.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10         IN DSS_LOG_BARCODES.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      UPDATE DSS_LOG_BARCODES
         SET LOGID = p_LOGID,
             OPERATING_UNIT = p_OPERATING_UNIT,
             ORGANIZATION_ID = p_ORGANIZATION_ID,
             PRODUCT_CODE = p_PRODUCT_CODE,
             INVENTORY_ITEM_ID = p_INVENTORY_ITEM_ID,
             BARCODE = p_BARCODE,
             ACTION_TYPE = p_ACTION_TYPE,
             REMARKS = p_REMARKS,
             CREATE_BY = p_CREATE_BY,
             CRAETE_DATE = p_CRAETE_DATE,
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
       WHERE LOGID = p_LOGID;
   END P_Update;


   PROCEDURE P_Insert (
      p_LOGID               IN DSS_LOG_BARCODES.LOGID%TYPE,
      p_OPERATING_UNIT      IN DSS_LOG_BARCODES.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID     IN DSS_LOG_BARCODES.ORGANIZATION_ID%TYPE,
      p_PRODUCT_CODE        IN DSS_LOG_BARCODES.PRODUCT_CODE%TYPE,
      p_INVENTORY_ITEM_ID   IN DSS_LOG_BARCODES.INVENTORY_ITEM_ID%TYPE,
      p_BARCODE             IN DSS_LOG_BARCODES.BARCODE%TYPE,
      p_ACTION_TYPE         IN DSS_LOG_BARCODES.ACTION_TYPE%TYPE,
      p_REMARKS             IN DSS_LOG_BARCODES.REMARKS%TYPE,
      p_CREATE_BY           IN DSS_LOG_BARCODES.CREATE_BY%TYPE,
      p_CRAETE_DATE         IN DSS_LOG_BARCODES.CRAETE_DATE%TYPE,
      p_ATTRIBUTE1          IN DSS_LOG_BARCODES.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2          IN DSS_LOG_BARCODES.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3          IN DSS_LOG_BARCODES.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4          IN DSS_LOG_BARCODES.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5          IN DSS_LOG_BARCODES.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6          IN DSS_LOG_BARCODES.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7          IN DSS_LOG_BARCODES.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8          IN DSS_LOG_BARCODES.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9          IN DSS_LOG_BARCODES.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10         IN DSS_LOG_BARCODES.ATTRIBUTE10%TYPE)
   IS
      V_LOGID   NUMBER;
   BEGIN
      SELECT NVL (MAX (LOGID), 0) + 1 INTO V_LOGID FROM DSS_LOG_BARCODES;

      INSERT INTO DSS_LOG_BARCODES (LOGID,
                                    OPERATING_UNIT,
                                    ORGANIZATION_ID,
                                    PRODUCT_CODE,
                                    INVENTORY_ITEM_ID,
                                    BARCODE,
                                    ACTION_TYPE,
                                    REMARKS,
                                    CREATE_BY,
                                    CRAETE_DATE,
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
           VALUES (V_LOGID,                                         --p_LOGID,
                   p_OPERATING_UNIT,
                   p_ORGANIZATION_ID,
                   p_PRODUCT_CODE,
                   p_INVENTORY_ITEM_ID,
                   p_BARCODE,
                   p_ACTION_TYPE,
                   p_REMARKS,
                   p_CREATE_BY,
                   SYSDATE,                                  -- p_CRAETE_DATE,
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

   PROCEDURE P_Delete (p_LOGID IN DSS_LOG_BARCODES.LOGID%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_LOG_BARCODES
            WHERE LOGID = p_LOGID;
   END P_Delete;


   PROCEDURE ADD_LOG (P_OPERATING_UNIT       VARCHAR2,
                      P_ORGANIZATION_ID      VARCHAR2,
                      P_PRODUCT_CODE         VARCHAR2,
                      P_INVENTORY_ITEM_ID    VARCHAR2,
                      P_BARCODE              VARCHAR2,
                      P_ACTION_TYPE          VARCHAR2,
                      P_REMARKS              VARCHAR2,
                      P_CREATED_BY           VARCHAR2)
   AS
      V_LOGID   NUMBER;
   BEGIN
      SELECT NVL (MAX (LOGID), 0) + 1 INTO V_LOGID FROM DSS_LOG_BARCODES;

      INSERT INTO DSS_LOG_BARCODES (LOGID,
                                    OPERATING_UNIT,
                                    ORGANIZATION_ID,
                                    PRODUCT_CODE,
                                    INVENTORY_ITEM_ID,
                                    BARCODE,
                                    ACTION_TYPE,
                                    REMARKS,
                                    CREATE_BY,
                                    CRAETE_DATE)
           VALUES (V_LOGID,
                   P_OPERATING_UNIT,
                   P_ORGANIZATION_ID,
                   P_PRODUCT_CODE,
                   P_INVENTORY_ITEM_ID,
                   P_BARCODE,
                   P_ACTION_TYPE,
                   P_REMARKS,
                   P_CREATED_BY,
                   SYSDATE);
   END ADD_LOG;
END PKG_DSS_LOG_BARCODES;
/
