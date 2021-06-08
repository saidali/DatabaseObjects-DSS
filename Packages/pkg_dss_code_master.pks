DROP PACKAGE DSS.PKG_DSS_CODE_MASTER;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_CODE_MASTER
AS
   PROCEDURE Get_Code_List (p_PARAM     IN     DSS_CODE_MASTER.PARAM%TYPE,
                            outCursor      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (p_SEQNO     IN     DSS_CODE_MASTER.SEQNO%TYPE,
                                 outCursor      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_SEQNO              IN DSS_CODE_MASTER.SEQNO%TYPE,
      p_MAIN_CODE          IN DSS_CODE_MASTER.MAIN_CODE%TYPE,
      p_SUB_CODE           IN DSS_CODE_MASTER.SUB_CODE%TYPE,
      p_PARAM              IN DSS_CODE_MASTER.PARAM%TYPE,
      p_PVALUE             IN DSS_CODE_MASTER.PVALUE%TYPE,
      p_DESCRIPTION        IN DSS_CODE_MASTER.DESCRIPTION%TYPE,
      p_REMARKS            IN DSS_CODE_MASTER.REMARKS%TYPE,
      p_EXAMPLES           IN DSS_CODE_MASTER.EXAMPLES%TYPE,
      p_ISACTIVE           IN DSS_CODE_MASTER.ISACTIVE%TYPE,
      p_STATUS             IN DSS_CODE_MASTER.STATUS%TYPE,
      p_CREATEBY           IN DSS_CODE_MASTER.CREATEBY%TYPE,
      p_CREATEDATE         IN DSS_CODE_MASTER.CREATEDATE%TYPE,
      p_LAST_UPDATE_BY     IN DSS_CODE_MASTER.LAST_UPDATE_BY%TYPE,
      p_LAST_UPDATE_DATE   IN DSS_CODE_MASTER.LAST_UPDATE_DATE%TYPE,
      p_ATTRIBUTE1         IN DSS_CODE_MASTER.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2         IN DSS_CODE_MASTER.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3         IN DSS_CODE_MASTER.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4         IN DSS_CODE_MASTER.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5         IN DSS_CODE_MASTER.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6         IN DSS_CODE_MASTER.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7         IN DSS_CODE_MASTER.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8         IN DSS_CODE_MASTER.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9         IN DSS_CODE_MASTER.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10        IN DSS_CODE_MASTER.ATTRIBUTE10%TYPE);

   PROCEDURE P_Insert (
      p_SEQNO              IN DSS_CODE_MASTER.SEQNO%TYPE,
      p_MAIN_CODE          IN DSS_CODE_MASTER.MAIN_CODE%TYPE,
      p_SUB_CODE           IN DSS_CODE_MASTER.SUB_CODE%TYPE,
      p_PARAM              IN DSS_CODE_MASTER.PARAM%TYPE,
      p_PVALUE             IN DSS_CODE_MASTER.PVALUE%TYPE,
      p_DESCRIPTION        IN DSS_CODE_MASTER.DESCRIPTION%TYPE,
      p_REMARKS            IN DSS_CODE_MASTER.REMARKS%TYPE,
      p_EXAMPLES           IN DSS_CODE_MASTER.EXAMPLES%TYPE,
      p_ISACTIVE           IN DSS_CODE_MASTER.ISACTIVE%TYPE,
      p_STATUS             IN DSS_CODE_MASTER.STATUS%TYPE,
      p_CREATEBY           IN DSS_CODE_MASTER.CREATEBY%TYPE,
      p_CREATEDATE         IN DSS_CODE_MASTER.CREATEDATE%TYPE,
      p_LAST_UPDATE_BY     IN DSS_CODE_MASTER.LAST_UPDATE_BY%TYPE,
      p_LAST_UPDATE_DATE   IN DSS_CODE_MASTER.LAST_UPDATE_DATE%TYPE,
      p_ATTRIBUTE1         IN DSS_CODE_MASTER.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2         IN DSS_CODE_MASTER.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3         IN DSS_CODE_MASTER.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4         IN DSS_CODE_MASTER.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5         IN DSS_CODE_MASTER.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6         IN DSS_CODE_MASTER.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7         IN DSS_CODE_MASTER.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8         IN DSS_CODE_MASTER.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9         IN DSS_CODE_MASTER.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10        IN DSS_CODE_MASTER.ATTRIBUTE10%TYPE);

   PROCEDURE P_Delete (p_SEQNO IN DSS_CODE_MASTER.SEQNO%TYPE);
END PKG_DSS_CODE_MASTER;
/


DROP PACKAGE BODY DSS.PKG_DSS_CODE_MASTER;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_CODE_MASTER
AS
   PROCEDURE Get_Code_List (p_PARAM     IN     DSS_CODE_MASTER.PARAM%TYPE,
                            outCursor      OUT DSS.MYGEN.sqlcur)
   AS
   BEGIN
      OPEN outCursor FOR
           SELECT SEQNO,
                  MAIN_CODE,
                  SUB_CODE,
                  PARAM,
                  PVALUE,
                  DESCRIPTION,
                  REMARKS,
                  EXAMPLES,
                  ISACTIVE,
                  STATUS,
                  CREATEBY,
                  CREATEDATE,
                  LAST_UPDATE_BY,
                  LAST_UPDATE_DATE,
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
             FROM DSS_CODE_MASTER
            WHERE     UPPER (PARAM) = UPPER (p_PARAM)
                  AND SUB_CODE <> 0
                  AND ISACTIVE = 'Y'
         ORDER BY SUB_CODE;
   END Get_Code_List;


   PROCEDURE P_LoadByPrimaryKey (p_SEQNO     IN     DSS_CODE_MASTER.SEQNO%TYPE,
                                 outCursor      OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT SEQNO,
                MAIN_CODE,
                SUB_CODE,
                PARAM,
                PVALUE,
                DESCRIPTION,
                REMARKS,
                EXAMPLES,
                ISACTIVE,
                STATUS,
                CREATEBY,
                CREATEDATE,
                LAST_UPDATE_BY,
                LAST_UPDATE_DATE,
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
           FROM DSS_CODE_MASTER
          WHERE SEQNO = p_SEQNO;
   END P_LoadByPrimaryKey;

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT SEQNO,
                MAIN_CODE,
                SUB_CODE,
                PARAM,
                PVALUE,
                DESCRIPTION,
                REMARKS,
                EXAMPLES,
                ISACTIVE,
                STATUS,
                CREATEBY,
                CREATEDATE,
                LAST_UPDATE_BY,
                LAST_UPDATE_DATE,
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
           FROM DSS_CODE_MASTER;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_SEQNO              IN DSS_CODE_MASTER.SEQNO%TYPE,
      p_MAIN_CODE          IN DSS_CODE_MASTER.MAIN_CODE%TYPE,
      p_SUB_CODE           IN DSS_CODE_MASTER.SUB_CODE%TYPE,
      p_PARAM              IN DSS_CODE_MASTER.PARAM%TYPE,
      p_PVALUE             IN DSS_CODE_MASTER.PVALUE%TYPE,
      p_DESCRIPTION        IN DSS_CODE_MASTER.DESCRIPTION%TYPE,
      p_REMARKS            IN DSS_CODE_MASTER.REMARKS%TYPE,
      p_EXAMPLES           IN DSS_CODE_MASTER.EXAMPLES%TYPE,
      p_ISACTIVE           IN DSS_CODE_MASTER.ISACTIVE%TYPE,
      p_STATUS             IN DSS_CODE_MASTER.STATUS%TYPE,
      p_CREATEBY           IN DSS_CODE_MASTER.CREATEBY%TYPE,
      p_CREATEDATE         IN DSS_CODE_MASTER.CREATEDATE%TYPE,
      p_LAST_UPDATE_BY     IN DSS_CODE_MASTER.LAST_UPDATE_BY%TYPE,
      p_LAST_UPDATE_DATE   IN DSS_CODE_MASTER.LAST_UPDATE_DATE%TYPE,
      p_ATTRIBUTE1         IN DSS_CODE_MASTER.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2         IN DSS_CODE_MASTER.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3         IN DSS_CODE_MASTER.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4         IN DSS_CODE_MASTER.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5         IN DSS_CODE_MASTER.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6         IN DSS_CODE_MASTER.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7         IN DSS_CODE_MASTER.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8         IN DSS_CODE_MASTER.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9         IN DSS_CODE_MASTER.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10        IN DSS_CODE_MASTER.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      UPDATE DSS_CODE_MASTER
         SET SEQNO = p_SEQNO,
             MAIN_CODE = p_MAIN_CODE,
             SUB_CODE = p_SUB_CODE,
             PARAM = p_PARAM,
             PVALUE = p_PVALUE,
             DESCRIPTION = p_DESCRIPTION,
             REMARKS = p_REMARKS,
             EXAMPLES = p_EXAMPLES,
             ISACTIVE = p_ISACTIVE,
             STATUS = p_STATUS,
             CREATEBY = p_CREATEBY,
             CREATEDATE = p_CREATEDATE,
             LAST_UPDATE_BY = p_LAST_UPDATE_BY,
             LAST_UPDATE_DATE = p_LAST_UPDATE_DATE,
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
       WHERE SEQNO = p_SEQNO;
   END P_Update;


   PROCEDURE P_Insert (
      p_SEQNO              IN DSS_CODE_MASTER.SEQNO%TYPE,
      p_MAIN_CODE          IN DSS_CODE_MASTER.MAIN_CODE%TYPE,
      p_SUB_CODE           IN DSS_CODE_MASTER.SUB_CODE%TYPE,
      p_PARAM              IN DSS_CODE_MASTER.PARAM%TYPE,
      p_PVALUE             IN DSS_CODE_MASTER.PVALUE%TYPE,
      p_DESCRIPTION        IN DSS_CODE_MASTER.DESCRIPTION%TYPE,
      p_REMARKS            IN DSS_CODE_MASTER.REMARKS%TYPE,
      p_EXAMPLES           IN DSS_CODE_MASTER.EXAMPLES%TYPE,
      p_ISACTIVE           IN DSS_CODE_MASTER.ISACTIVE%TYPE,
      p_STATUS             IN DSS_CODE_MASTER.STATUS%TYPE,
      p_CREATEBY           IN DSS_CODE_MASTER.CREATEBY%TYPE,
      p_CREATEDATE         IN DSS_CODE_MASTER.CREATEDATE%TYPE,
      p_LAST_UPDATE_BY     IN DSS_CODE_MASTER.LAST_UPDATE_BY%TYPE,
      p_LAST_UPDATE_DATE   IN DSS_CODE_MASTER.LAST_UPDATE_DATE%TYPE,
      p_ATTRIBUTE1         IN DSS_CODE_MASTER.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2         IN DSS_CODE_MASTER.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3         IN DSS_CODE_MASTER.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4         IN DSS_CODE_MASTER.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5         IN DSS_CODE_MASTER.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6         IN DSS_CODE_MASTER.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7         IN DSS_CODE_MASTER.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8         IN DSS_CODE_MASTER.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9         IN DSS_CODE_MASTER.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10        IN DSS_CODE_MASTER.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      INSERT INTO DSS_CODE_MASTER (SEQNO,
                                   MAIN_CODE,
                                   SUB_CODE,
                                   PARAM,
                                   PVALUE,
                                   DESCRIPTION,
                                   REMARKS,
                                   EXAMPLES,
                                   ISACTIVE,
                                   STATUS,
                                   CREATEBY,
                                   CREATEDATE,
                                   LAST_UPDATE_BY,
                                   LAST_UPDATE_DATE,
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
           VALUES (p_SEQNO,
                   p_MAIN_CODE,
                   p_SUB_CODE,
                   p_PARAM,
                   p_PVALUE,
                   p_DESCRIPTION,
                   p_REMARKS,
                   p_EXAMPLES,
                   p_ISACTIVE,
                   p_STATUS,
                   p_CREATEBY,
                   p_CREATEDATE,
                   p_LAST_UPDATE_BY,
                   p_LAST_UPDATE_DATE,
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

   PROCEDURE P_Delete (p_SEQNO IN DSS_CODE_MASTER.SEQNO%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_CODE_MASTER
            WHERE SEQNO = p_SEQNO;
   END P_Delete;
END PKG_DSS_CODE_MASTER;
/
