DROP PACKAGE DSS.PKG_DSS_CATEGORY_INFO;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_CATEGORY_INFO
AS
      PROCEDURE Load_EPB_Categories_1 (
      outCursor              OUT DSS.MYGEN.sqlcur);
   
   PROCEDURE Load_EPB_Categories_2 (
      p_OPERATING_UNIT    IN     DECIMAL,
      p_ORGANIZATION_ID   IN     DECIMAL,
      outCursor              OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_CODEID    IN     DSS_CATEGORY_INFO.CODEID%TYPE,
      p_SETID     IN     DSS_CATEGORY_INFO.SETID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur);


   PROCEDURE P_LoadByBrand (p_Brand     IN     VARCHAR2,
                            outCursor      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_SETID              IN DSS_CATEGORY_INFO.SETID%TYPE,
      p_CODEID             IN DSS_CATEGORY_INFO.CODEID%TYPE,
      p_CODEVALUE          IN DSS_CATEGORY_INFO.CODEVALUE%TYPE,
      p_SHOTCODE           IN DSS_CATEGORY_INFO.SHOTCODE%TYPE,
      p_CODE_DESCRIPTION   IN DSS_CATEGORY_INFO.CODE_DESCRIPTION%TYPE,
      p_CREATE_DATE        IN DSS_CATEGORY_INFO.CREATE_DATE%TYPE,
      p_LAST_UPDATE_DATE   IN DSS_CATEGORY_INFO.LAST_UPDATE_DATE%TYPE,
      p_ENABLED            IN DSS_CATEGORY_INFO.ENABLED%TYPE,
      p_STATUS             IN DSS_CATEGORY_INFO.STATUS%TYPE);

   PROCEDURE P_Insert (
      p_SETID              IN DSS_CATEGORY_INFO.SETID%TYPE,
      p_CODEID             IN DSS_CATEGORY_INFO.CODEID%TYPE,
      p_CODEVALUE          IN DSS_CATEGORY_INFO.CODEVALUE%TYPE,
      p_SHOTCODE           IN DSS_CATEGORY_INFO.SHOTCODE%TYPE,
      p_CODE_DESCRIPTION   IN DSS_CATEGORY_INFO.CODE_DESCRIPTION%TYPE,
      p_CREATE_DATE        IN DSS_CATEGORY_INFO.CREATE_DATE%TYPE,
      p_LAST_UPDATE_DATE   IN DSS_CATEGORY_INFO.LAST_UPDATE_DATE%TYPE,
      p_ENABLED            IN DSS_CATEGORY_INFO.ENABLED%TYPE,
      p_STATUS             IN DSS_CATEGORY_INFO.STATUS%TYPE);

   PROCEDURE P_Delete (p_CODEID   IN DSS_CATEGORY_INFO.CODEID%TYPE,
                       p_SETID    IN DSS_CATEGORY_INFO.SETID%TYPE);
END PKG_DSS_CATEGORY_INFO;
/


DROP PACKAGE BODY DSS.PKG_DSS_CATEGORY_INFO;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_CATEGORY_INFO
AS
   PROCEDURE Load_EPB_Categories_1 ( 
      outCursor              OUT DSS.MYGEN.sqlcur)
   AS
   BEGIN
      OPEN outCursor FOR
         SELECT SETID,
                CODEID,
                CODEVALUE,
                SHOTCODE,
                CODE_DESCRIPTION,
                CREATE_DATE,
                LAST_UPDATE_DATE,
                ENABLED,
                STATUS
           FROM DSS_CATEGORY_INFO
          WHERE CODEVALUE IN
                   (SELECT DISTINCT CATEGORYCODE
                      FROM V_SYN_OER_CATEGORY_CONFIG)
                      order by CODEVALUE;
   END Load_EPB_Categories_1;


   PROCEDURE Load_EPB_Categories_2 (
      p_OPERATING_UNIT    IN     DECIMAL,
      p_ORGANIZATION_ID   IN     DECIMAL,
      outCursor              OUT DSS.MYGEN.sqlcur)
   AS
   BEGIN
      OPEN outCursor FOR
         SELECT SETID,
                CODEID,
                CODEVALUE,
                SHOTCODE,
                CODE_DESCRIPTION,
                CREATE_DATE,
                LAST_UPDATE_DATE,
                ENABLED,
                STATUS
           FROM DSS_CATEGORY_INFO
          WHERE CODEVALUE IN
                   (SELECT DISTINCT CATEGORYCODE
                      FROM V_SYN_OER_CATEGORY_CONFIG
                     WHERE     OPERATING_UNIT = p_OPERATING_UNIT
                           AND ORGANIZATION_ID = p_ORGANIZATION_ID)
                           order by CODEVALUE;
   END Load_EPB_Categories_2;

   PROCEDURE P_LoadByBrand (p_Brand     IN     VARCHAR2,
                            outCursor      OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT SETID,
                CODEID,
                CODEVALUE,
                SHOTCODE,
                CODE_DESCRIPTION,
                CREATE_DATE,
                LAST_UPDATE_DATE,
                ENABLED,
                STATUS
           FROM DSS_CATEGORY_INFO
          WHERE CODEVALUE IN (SELECT CATEGORY_CODE
                                FROM TK_CATEGORIES_CONFIG
                               WHERE BRAND = p_Brand);
   END P_LoadByBrand;



   PROCEDURE P_LoadByPrimaryKey (
      p_CODEID    IN     DSS_CATEGORY_INFO.CODEID%TYPE,
      p_SETID     IN     DSS_CATEGORY_INFO.SETID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT SETID,
                CODEID,
                CODEVALUE,
                SHOTCODE,
                CODE_DESCRIPTION,
                CREATE_DATE,
                LAST_UPDATE_DATE,
                ENABLED,
                STATUS
           FROM DSS_CATEGORY_INFO
          WHERE CODEID = p_CODEID AND SETID = p_SETID;
   END P_LoadByPrimaryKey;

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT SETID,
                CODEID,
                CODEVALUE,
                SHOTCODE,
                CODE_DESCRIPTION,
                CREATE_DATE,
                LAST_UPDATE_DATE,
                ENABLED,
                STATUS
           FROM DSS_CATEGORY_INFO;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_SETID              IN DSS_CATEGORY_INFO.SETID%TYPE,
      p_CODEID             IN DSS_CATEGORY_INFO.CODEID%TYPE,
      p_CODEVALUE          IN DSS_CATEGORY_INFO.CODEVALUE%TYPE,
      p_SHOTCODE           IN DSS_CATEGORY_INFO.SHOTCODE%TYPE,
      p_CODE_DESCRIPTION   IN DSS_CATEGORY_INFO.CODE_DESCRIPTION%TYPE,
      p_CREATE_DATE        IN DSS_CATEGORY_INFO.CREATE_DATE%TYPE,
      p_LAST_UPDATE_DATE   IN DSS_CATEGORY_INFO.LAST_UPDATE_DATE%TYPE,
      p_ENABLED            IN DSS_CATEGORY_INFO.ENABLED%TYPE,
      p_STATUS             IN DSS_CATEGORY_INFO.STATUS%TYPE)
   IS
   BEGIN
      UPDATE DSS_CATEGORY_INFO
         SET SETID = p_SETID,
             CODEID = p_CODEID,
             CODEVALUE = p_CODEVALUE,
             SHOTCODE = p_SHOTCODE,
             CODE_DESCRIPTION = p_CODE_DESCRIPTION,
             CREATE_DATE = p_CREATE_DATE,
             LAST_UPDATE_DATE = p_LAST_UPDATE_DATE,
             ENABLED = p_ENABLED,
             STATUS = p_STATUS
       WHERE CODEID = p_CODEID AND SETID = p_SETID;
   END P_Update;


   PROCEDURE P_Insert (
      p_SETID              IN DSS_CATEGORY_INFO.SETID%TYPE,
      p_CODEID             IN DSS_CATEGORY_INFO.CODEID%TYPE,
      p_CODEVALUE          IN DSS_CATEGORY_INFO.CODEVALUE%TYPE,
      p_SHOTCODE           IN DSS_CATEGORY_INFO.SHOTCODE%TYPE,
      p_CODE_DESCRIPTION   IN DSS_CATEGORY_INFO.CODE_DESCRIPTION%TYPE,
      p_CREATE_DATE        IN DSS_CATEGORY_INFO.CREATE_DATE%TYPE,
      p_LAST_UPDATE_DATE   IN DSS_CATEGORY_INFO.LAST_UPDATE_DATE%TYPE,
      p_ENABLED            IN DSS_CATEGORY_INFO.ENABLED%TYPE,
      p_STATUS             IN DSS_CATEGORY_INFO.STATUS%TYPE)
   IS
   BEGIN
      INSERT INTO DSS_CATEGORY_INFO (SETID,
                                     CODEID,
                                     CODEVALUE,
                                     SHOTCODE,
                                     CODE_DESCRIPTION,
                                     CREATE_DATE,
                                     LAST_UPDATE_DATE,
                                     ENABLED,
                                     STATUS)
           VALUES (p_SETID,
                   p_CODEID,
                   p_CODEVALUE,
                   p_SHOTCODE,
                   p_CODE_DESCRIPTION,
                   p_CREATE_DATE,
                   p_LAST_UPDATE_DATE,
                   p_ENABLED,
                   p_STATUS);
   END P_Insert;

   PROCEDURE P_Delete (p_CODEID   IN DSS_CATEGORY_INFO.CODEID%TYPE,
                       p_SETID    IN DSS_CATEGORY_INFO.SETID%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_CATEGORY_INFO
            WHERE CODEID = p_CODEID AND SETID = p_SETID;
   END P_Delete;
END PKG_DSS_CATEGORY_INFO;
/
