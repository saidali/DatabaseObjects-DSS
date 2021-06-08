DROP PACKAGE DSS.PKG_DSS_MODEL_INFO;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_MODEL_INFO
AS
   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_CODEID    IN     DSS_MODEL_INFO.CODEID%TYPE,
      p_SETID     IN     DSS_MODEL_INFO.SETID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_SETID              IN DSS_MODEL_INFO.SETID%TYPE,
      p_CODEID             IN DSS_MODEL_INFO.CODEID%TYPE,
      p_CODEVALUE          IN DSS_MODEL_INFO.CODEVALUE%TYPE,
      p_SHOTCODE           IN DSS_MODEL_INFO.SHOTCODE%TYPE,
      p_CODE_DESCRIPTION   IN DSS_MODEL_INFO.CODE_DESCRIPTION%TYPE,
      p_CREATE_DATE        IN DSS_MODEL_INFO.CREATE_DATE%TYPE,
      p_LAST_UPDATE_DATE   IN DSS_MODEL_INFO.LAST_UPDATE_DATE%TYPE,
      p_ENABLED           IN DSS_MODEL_INFO.ENABLED%TYPE,
      p_STATUS             IN DSS_MODEL_INFO.STATUS%TYPE);

   PROCEDURE P_Insert (
      p_SETID              IN DSS_MODEL_INFO.SETID%TYPE,
      p_CODEID             IN DSS_MODEL_INFO.CODEID%TYPE,
      p_CODEVALUE          IN DSS_MODEL_INFO.CODEVALUE%TYPE,
      p_SHOTCODE           IN DSS_MODEL_INFO.SHOTCODE%TYPE,
      p_CODE_DESCRIPTION   IN DSS_MODEL_INFO.CODE_DESCRIPTION%TYPE,
      p_CREATE_DATE        IN DSS_MODEL_INFO.CREATE_DATE%TYPE,
      p_LAST_UPDATE_DATE   IN DSS_MODEL_INFO.LAST_UPDATE_DATE%TYPE,
      p_ENABLED           IN DSS_MODEL_INFO.ENABLED%TYPE,
      p_STATUS             IN DSS_MODEL_INFO.STATUS%TYPE);

   PROCEDURE P_Delete (p_CODEID   IN DSS_MODEL_INFO.CODEID%TYPE,
                       p_SETID    IN DSS_MODEL_INFO.SETID%TYPE);
END PKG_DSS_MODEL_INFO;
/


DROP PACKAGE BODY DSS.PKG_DSS_MODEL_INFO;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_MODEL_INFO
AS
   PROCEDURE P_LoadByPrimaryKey (
      p_CODEID    IN     DSS_MODEL_INFO.CODEID%TYPE,
      p_SETID     IN     DSS_MODEL_INFO.SETID%TYPE,
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
           FROM DSS_MODEL_INFO
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
           FROM DSS_MODEL_INFO;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_SETID              IN DSS_MODEL_INFO.SETID%TYPE,
      p_CODEID             IN DSS_MODEL_INFO.CODEID%TYPE,
      p_CODEVALUE          IN DSS_MODEL_INFO.CODEVALUE%TYPE,
      p_SHOTCODE           IN DSS_MODEL_INFO.SHOTCODE%TYPE,
      p_CODE_DESCRIPTION   IN DSS_MODEL_INFO.CODE_DESCRIPTION%TYPE,
      p_CREATE_DATE        IN DSS_MODEL_INFO.CREATE_DATE%TYPE,
      p_LAST_UPDATE_DATE   IN DSS_MODEL_INFO.LAST_UPDATE_DATE%TYPE,
      p_ENABLED           IN DSS_MODEL_INFO.ENABLED%TYPE,
      p_STATUS             IN DSS_MODEL_INFO.STATUS%TYPE)
   IS
   BEGIN
      UPDATE DSS_MODEL_INFO
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
      p_SETID              IN DSS_MODEL_INFO.SETID%TYPE,
      p_CODEID             IN DSS_MODEL_INFO.CODEID%TYPE,
      p_CODEVALUE          IN DSS_MODEL_INFO.CODEVALUE%TYPE,
      p_SHOTCODE           IN DSS_MODEL_INFO.SHOTCODE%TYPE,
      p_CODE_DESCRIPTION   IN DSS_MODEL_INFO.CODE_DESCRIPTION%TYPE,
      p_CREATE_DATE        IN DSS_MODEL_INFO.CREATE_DATE%TYPE,
      p_LAST_UPDATE_DATE   IN DSS_MODEL_INFO.LAST_UPDATE_DATE%TYPE,
      p_ENABLED           IN DSS_MODEL_INFO.ENABLED%TYPE,
      p_STATUS             IN DSS_MODEL_INFO.STATUS%TYPE)
   IS
   BEGIN
      INSERT INTO DSS_MODEL_INFO (SETID,
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

   PROCEDURE P_Delete (p_CODEID   IN DSS_MODEL_INFO.CODEID%TYPE,
                       p_SETID    IN DSS_MODEL_INFO.SETID%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_MODEL_INFO
            WHERE CODEID = p_CODEID AND SETID = p_SETID;
   END P_Delete;
END PKG_DSS_MODEL_INFO;
/
