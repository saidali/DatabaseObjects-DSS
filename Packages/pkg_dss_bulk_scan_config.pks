DROP PACKAGE DSS.PKG_DSS_BULK_SCAN_CONFIG;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_BULK_SCAN_CONFIG
AS
   PROCEDURE P_AddBulkScanConfig (
      p_ORG_ID              IN DSS_BULK_SCAN_CONFIG.ORG_ID%TYPE,
      p_INVENTORY_ITEM_ID   IN DSS_BULK_SCAN_CONFIG.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE        IN DSS_BULK_SCAN_CONFIG.PRODUCT_CODE%TYPE,
      p_BRAND_NAME          IN DSS_BULK_SCAN_CONFIG.BRAND_NAME%TYPE,
      p_MODEL_NAME          IN DSS_BULK_SCAN_CONFIG.MODEL_NAME%TYPE,
      p_CONFIG_ID           IN DSS_BULK_SCAN_CONFIG.CONFIG_ID%TYPE,
      p_CONFIG_NAME         IN DSS_BULK_SCAN_CONFIG.CONFIG_NAME%TYPE,
      p_CREATE_BY           IN DSS_BULK_SCAN_CONFIG.CREATE_BY%TYPE,
      p_ATTRIBUTE1          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE1%TYPE);

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_INVENTORY_ITEM_ID   IN     DSS_BULK_SCAN_CONFIG.INVENTORY_ITEM_ID%TYPE,
      p_ORG_ID              IN     DSS_BULK_SCAN_CONFIG.ORG_ID%TYPE,
      outCursor                OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_SEQNO               IN DSS_BULK_SCAN_CONFIG.SEQNO%TYPE,
      p_ORG_ID              IN DSS_BULK_SCAN_CONFIG.ORG_ID%TYPE,
      p_INVENTORY_ITEM_ID   IN DSS_BULK_SCAN_CONFIG.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE        IN DSS_BULK_SCAN_CONFIG.PRODUCT_CODE%TYPE,
      p_BRAND_SEQ           IN DSS_BULK_SCAN_CONFIG.BRAND_SEQ%TYPE,
      p_BRAND_NAME          IN DSS_BULK_SCAN_CONFIG.BRAND_NAME%TYPE,
      p_MODEL_SEQ           IN DSS_BULK_SCAN_CONFIG.MODEL_SEQ%TYPE,
      p_MODEL_NAME          IN DSS_BULK_SCAN_CONFIG.MODEL_NAME%TYPE,
      p_CONFIG_ID           IN DSS_BULK_SCAN_CONFIG.CONFIG_ID%TYPE,
      p_CONFIG_NAME         IN DSS_BULK_SCAN_CONFIG.CONFIG_NAME%TYPE,
      p_CREATE_DATE         IN DSS_BULK_SCAN_CONFIG.CREATE_DATE%TYPE,
      p_CREATE_BY           IN DSS_BULK_SCAN_CONFIG.CREATE_BY%TYPE,
      p_ATTRIBUTE1          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE5%TYPE);

   PROCEDURE P_Insert (
      p_SEQNO               IN DSS_BULK_SCAN_CONFIG.SEQNO%TYPE,
      p_ORG_ID              IN DSS_BULK_SCAN_CONFIG.ORG_ID%TYPE,
      p_INVENTORY_ITEM_ID   IN DSS_BULK_SCAN_CONFIG.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE        IN DSS_BULK_SCAN_CONFIG.PRODUCT_CODE%TYPE,
      p_BRAND_SEQ           IN DSS_BULK_SCAN_CONFIG.BRAND_SEQ%TYPE,
      p_BRAND_NAME          IN DSS_BULK_SCAN_CONFIG.BRAND_NAME%TYPE,
      p_MODEL_SEQ           IN DSS_BULK_SCAN_CONFIG.MODEL_SEQ%TYPE,
      p_MODEL_NAME          IN DSS_BULK_SCAN_CONFIG.MODEL_NAME%TYPE,
      p_CONFIG_ID           IN DSS_BULK_SCAN_CONFIG.CONFIG_ID%TYPE,
      p_CONFIG_NAME         IN DSS_BULK_SCAN_CONFIG.CONFIG_NAME%TYPE,
      p_CREATE_DATE         IN DSS_BULK_SCAN_CONFIG.CREATE_DATE%TYPE,
      p_CREATE_BY           IN DSS_BULK_SCAN_CONFIG.CREATE_BY%TYPE,
      p_ATTRIBUTE1          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE5%TYPE);

   PROCEDURE P_Delete (
      p_INVENTORY_ITEM_ID   IN DSS_BULK_SCAN_CONFIG.INVENTORY_ITEM_ID%TYPE,
      p_ORG_ID              IN DSS_BULK_SCAN_CONFIG.ORG_ID%TYPE);
END PKG_DSS_BULK_SCAN_CONFIG;
/


DROP PACKAGE BODY DSS.PKG_DSS_BULK_SCAN_CONFIG;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_BULK_SCAN_CONFIG
AS
   PROCEDURE P_AddBulkScanConfig (
      p_ORG_ID              IN DSS_BULK_SCAN_CONFIG.ORG_ID%TYPE,
      p_INVENTORY_ITEM_ID   IN DSS_BULK_SCAN_CONFIG.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE        IN DSS_BULK_SCAN_CONFIG.PRODUCT_CODE%TYPE,
      p_BRAND_NAME          IN DSS_BULK_SCAN_CONFIG.BRAND_NAME%TYPE,
      p_MODEL_NAME          IN DSS_BULK_SCAN_CONFIG.MODEL_NAME%TYPE,
      p_CONFIG_ID           IN DSS_BULK_SCAN_CONFIG.CONFIG_ID%TYPE,
      p_CONFIG_NAME         IN DSS_BULK_SCAN_CONFIG.CONFIG_NAME%TYPE,
      p_CREATE_BY           IN DSS_BULK_SCAN_CONFIG.CREATE_BY%TYPE,
      p_ATTRIBUTE1          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE1%TYPE)
   AS
   BEGIN
      CASE
         WHEN p_ATTRIBUTE1 = 'P'
         THEN
            DELETE FROM DSS_BULK_SCAN_CONFIG
                  WHERE     PRODUCT_CODE = p_PRODUCT_CODE
                        AND BRAND_NAME = p_BRAND_NAME
                        AND MODEL_NAME = p_MODEL_NAME;

            INSERT INTO DSS_BULK_SCAN_CONFIG (ORG_ID,
                                              INVENTORY_ITEM_ID,
                                              PRODUCT_CODE,
                                              BRAND_SEQ,
                                              BRAND_NAME,
                                              MODEL_SEQ,
                                              MODEL_NAME,
                                              CONFIG_ID,
                                              CONFIG_NAME,
                                              CREATE_DATE,
                                              CREATE_BY,
                                              ATTRIBUTE1)
               SELECT DISTINCT OPERATING_UNIT ORG_ID,
                               INVENTORY_ITEM_ID,
                               TRIM(PRODUCT_CODE),
                               B.CODEID BRAND_SEQ,
                               BRAND_CODE BRAND_NAME,
                               M.CODEID MODEL_SEQ,
                               MODEL_CODE MODEL_NAME,
                               p_CONFIG_ID CONFIG_ID,
                               p_CONFIG_NAME CONFIG_NAME,
                               SYSDATE,
                               p_CREATE_BY CREATE_BY,
                               p_ATTRIBUTE1
                 FROM DSS_PRODUCTS P
                      LEFT OUTER JOIN DSS_BRAND_INFO B
                         ON P.BRAND_CODE = B.CODEVALUE
                      LEFT OUTER JOIN DSS_MODEL_INFO M
                         ON P.MODEL_CODE = M.CODEVALUE
                WHERE     P.OPERATING_UNIT = p_ORG_ID
                      AND P.PRODUCT_CODE = p_PRODUCT_CODE
                      AND P.BRAND_CODE = p_BRAND_NAME
                      AND P.MODEL_CODE = p_MODEL_NAME;
         WHEN p_ATTRIBUTE1 = 'M'
         THEN
            DELETE FROM DSS_BULK_SCAN_CONFIG
                  WHERE     1 = 1
                        AND BRAND_NAME = p_BRAND_NAME
                        AND MODEL_NAME = p_MODEL_NAME;

            INSERT INTO DSS_BULK_SCAN_CONFIG (ORG_ID,
                                              INVENTORY_ITEM_ID,
                                              PRODUCT_CODE,
                                              BRAND_SEQ,
                                              BRAND_NAME,
                                              MODEL_SEQ,
                                              MODEL_NAME,
                                              CONFIG_ID,
                                              CONFIG_NAME,
                                              CREATE_DATE,
                                              CREATE_BY,
                                              ATTRIBUTE1)
               SELECT DISTINCT OPERATING_UNIT ORG_ID,
                               INVENTORY_ITEM_ID,
                               TRIM(PRODUCT_CODE),
                               B.CODEID BRAND_SEQ,
                               BRAND_CODE BRAND_NAME,
                               M.CODEID MODEL_SEQ,
                               MODEL_CODE MODEL_NAME,
                               p_CONFIG_ID CONFIG_ID,
                               p_CONFIG_NAME CONFIG_NAME,
                               SYSDATE,
                               p_CREATE_BY CREATE_BY,
                               p_ATTRIBUTE1
                 FROM DSS_PRODUCTS P
                      LEFT OUTER JOIN DSS_BRAND_INFO B
                         ON P.BRAND_CODE = B.CODEVALUE
                      LEFT OUTER JOIN DSS_MODEL_INFO M
                         ON P.MODEL_CODE = M.CODEVALUE
                WHERE     P.OPERATING_UNIT = p_ORG_ID
                      AND P.BRAND_CODE = p_BRAND_NAME
                      AND P.MODEL_CODE = p_MODEL_NAME;
         WHEN p_ATTRIBUTE1 = 'B'
         THEN
            DELETE FROM DSS_BULK_SCAN_CONFIG
                  WHERE 1 = 1 AND BRAND_NAME = p_BRAND_NAME;

            INSERT INTO DSS_BULK_SCAN_CONFIG (ORG_ID,
                                              INVENTORY_ITEM_ID,
                                              PRODUCT_CODE,
                                              BRAND_SEQ,
                                              BRAND_NAME,
                                              MODEL_SEQ,
                                              MODEL_NAME,
                                              CONFIG_ID,
                                              CONFIG_NAME,
                                              CREATE_DATE,
                                              CREATE_BY,
                                              ATTRIBUTE1)
               SELECT DISTINCT OPERATING_UNIT ORG_ID,
                               INVENTORY_ITEM_ID,
                               REPLACE(PRODUCT_CODE , ' ','')PRODUCT_CODE,
                               B.CODEID BRAND_SEQ,
                               BRAND_CODE BRAND_NAME,
                               M.CODEID MODEL_SEQ,
                               MODEL_CODE MODEL_NAME,
                               p_CONFIG_ID CONFIG_ID,
                               p_CONFIG_NAME CONFIG_NAME,
                               SYSDATE,
                               p_CREATE_BY CREATE_BY,
                               p_ATTRIBUTE1
                 FROM DSS_PRODUCTS P
                      LEFT OUTER JOIN DSS_BRAND_INFO B
                         ON P.BRAND_CODE = B.CODEVALUE
                      LEFT OUTER JOIN DSS_MODEL_INFO M
                         ON P.MODEL_CODE = M.CODEVALUE
                WHERE     P.OPERATING_UNIT = p_ORG_ID AND NVL(P.ATTRIBUTE10,'Y') != 'N'
                      AND P.BRAND_CODE = p_BRAND_NAME;
      END CASE;
   END P_AddBulkScanConfig;


   PROCEDURE P_LoadByPrimaryKey (
      p_INVENTORY_ITEM_ID   IN     DSS_BULK_SCAN_CONFIG.INVENTORY_ITEM_ID%TYPE,
      p_ORG_ID              IN     DSS_BULK_SCAN_CONFIG.ORG_ID%TYPE,
      outCursor                OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT SEQNO,
                ORG_ID,
                INVENTORY_ITEM_ID,
                PRODUCT_CODE,
                BRAND_SEQ,
                BRAND_NAME,
                MODEL_SEQ,
                MODEL_NAME,
                CONFIG_ID,
                CONFIG_NAME,
                CREATE_DATE,
                CREATE_BY,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5
           FROM DSS_BULK_SCAN_CONFIG
          WHERE INVENTORY_ITEM_ID = p_INVENTORY_ITEM_ID AND ORG_ID = p_ORG_ID;
   END P_LoadByPrimaryKey;

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT SEQNO,
                ORG_ID,
                INVENTORY_ITEM_ID,
                PRODUCT_CODE,
                BRAND_SEQ,
                BRAND_NAME,
                MODEL_SEQ,
                MODEL_NAME,
                CONFIG_ID,
                CONFIG_NAME,
                CREATE_DATE,
                CREATE_BY,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5
           FROM DSS_BULK_SCAN_CONFIG;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_SEQNO               IN DSS_BULK_SCAN_CONFIG.SEQNO%TYPE,
      p_ORG_ID              IN DSS_BULK_SCAN_CONFIG.ORG_ID%TYPE,
      p_INVENTORY_ITEM_ID   IN DSS_BULK_SCAN_CONFIG.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE        IN DSS_BULK_SCAN_CONFIG.PRODUCT_CODE%TYPE,
      p_BRAND_SEQ           IN DSS_BULK_SCAN_CONFIG.BRAND_SEQ%TYPE,
      p_BRAND_NAME          IN DSS_BULK_SCAN_CONFIG.BRAND_NAME%TYPE,
      p_MODEL_SEQ           IN DSS_BULK_SCAN_CONFIG.MODEL_SEQ%TYPE,
      p_MODEL_NAME          IN DSS_BULK_SCAN_CONFIG.MODEL_NAME%TYPE,
      p_CONFIG_ID           IN DSS_BULK_SCAN_CONFIG.CONFIG_ID%TYPE,
      p_CONFIG_NAME         IN DSS_BULK_SCAN_CONFIG.CONFIG_NAME%TYPE,
      p_CREATE_DATE         IN DSS_BULK_SCAN_CONFIG.CREATE_DATE%TYPE,
      p_CREATE_BY           IN DSS_BULK_SCAN_CONFIG.CREATE_BY%TYPE,
      p_ATTRIBUTE1          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE5%TYPE)
   IS
   BEGIN
      UPDATE DSS_BULK_SCAN_CONFIG
         SET SEQNO = p_SEQNO,
             ORG_ID = p_ORG_ID,
             INVENTORY_ITEM_ID = p_INVENTORY_ITEM_ID,
             PRODUCT_CODE = p_PRODUCT_CODE,
             BRAND_SEQ = p_BRAND_SEQ,
             BRAND_NAME = p_BRAND_NAME,
             MODEL_SEQ = p_MODEL_SEQ,
             MODEL_NAME = p_MODEL_NAME,
             CONFIG_ID = p_CONFIG_ID,
             CONFIG_NAME = p_CONFIG_NAME,
             CREATE_DATE = p_CREATE_DATE,
             CREATE_BY = p_CREATE_BY,
             ATTRIBUTE1 = p_ATTRIBUTE1,
             ATTRIBUTE2 = p_ATTRIBUTE2,
             ATTRIBUTE3 = p_ATTRIBUTE3,
             ATTRIBUTE4 = p_ATTRIBUTE4,
             ATTRIBUTE5 = p_ATTRIBUTE5
       WHERE INVENTORY_ITEM_ID = p_INVENTORY_ITEM_ID AND ORG_ID = p_ORG_ID;
   END P_Update;


   PROCEDURE P_Insert (
      p_SEQNO               IN DSS_BULK_SCAN_CONFIG.SEQNO%TYPE,
      p_ORG_ID              IN DSS_BULK_SCAN_CONFIG.ORG_ID%TYPE,
      p_INVENTORY_ITEM_ID   IN DSS_BULK_SCAN_CONFIG.INVENTORY_ITEM_ID%TYPE,
      p_PRODUCT_CODE        IN DSS_BULK_SCAN_CONFIG.PRODUCT_CODE%TYPE,
      p_BRAND_SEQ           IN DSS_BULK_SCAN_CONFIG.BRAND_SEQ%TYPE,
      p_BRAND_NAME          IN DSS_BULK_SCAN_CONFIG.BRAND_NAME%TYPE,
      p_MODEL_SEQ           IN DSS_BULK_SCAN_CONFIG.MODEL_SEQ%TYPE,
      p_MODEL_NAME          IN DSS_BULK_SCAN_CONFIG.MODEL_NAME%TYPE,
      p_CONFIG_ID           IN DSS_BULK_SCAN_CONFIG.CONFIG_ID%TYPE,
      p_CONFIG_NAME         IN DSS_BULK_SCAN_CONFIG.CONFIG_NAME%TYPE,
      p_CREATE_DATE         IN DSS_BULK_SCAN_CONFIG.CREATE_DATE%TYPE,
      p_CREATE_BY           IN DSS_BULK_SCAN_CONFIG.CREATE_BY%TYPE,
      p_ATTRIBUTE1          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5          IN DSS_BULK_SCAN_CONFIG.ATTRIBUTE5%TYPE)
   IS
   BEGIN
      INSERT INTO DSS_BULK_SCAN_CONFIG (SEQNO,
                                        ORG_ID,
                                        INVENTORY_ITEM_ID,
                                        PRODUCT_CODE,
                                        BRAND_SEQ,
                                        BRAND_NAME,
                                        MODEL_SEQ,
                                        MODEL_NAME,
                                        CONFIG_ID,
                                        CONFIG_NAME,
                                        CREATE_DATE,
                                        CREATE_BY,
                                        ATTRIBUTE1,
                                        ATTRIBUTE2,
                                        ATTRIBUTE3,
                                        ATTRIBUTE4,
                                        ATTRIBUTE5)
           VALUES (p_SEQNO,
                   p_ORG_ID,
                   p_INVENTORY_ITEM_ID,
                   p_PRODUCT_CODE,
                   p_BRAND_SEQ,
                   p_BRAND_NAME,
                   p_MODEL_SEQ,
                   p_MODEL_NAME,
                   p_CONFIG_ID,
                   p_CONFIG_NAME,
                   SYSDATE,                                  -- p_CREATE_DATE,
                   p_CREATE_BY,
                   p_ATTRIBUTE1,
                   p_ATTRIBUTE2,
                   p_ATTRIBUTE3,
                   p_ATTRIBUTE4,
                   p_ATTRIBUTE5);
   END P_Insert;

   PROCEDURE P_Delete (
      p_INVENTORY_ITEM_ID   IN DSS_BULK_SCAN_CONFIG.INVENTORY_ITEM_ID%TYPE,
      p_ORG_ID              IN DSS_BULK_SCAN_CONFIG.ORG_ID%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_BULK_SCAN_CONFIG
            WHERE     INVENTORY_ITEM_ID = p_INVENTORY_ITEM_ID
                  AND ORG_ID = p_ORG_ID;
   END P_Delete;
END PKG_DSS_BULK_SCAN_CONFIG;
/
