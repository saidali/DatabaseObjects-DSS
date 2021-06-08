DROP PACKAGE DSS.PKG_DSS_LOG_ORDER_SCAN;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_LOG_ORDER_SCAN
AS
   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_LOGID     IN     DSS_LOG_ORDER_SCAN.LOGID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_LOGID          IN DSS_LOG_ORDER_SCAN.LOGID%TYPE,
      p_CHANGE_LEVEL   IN DSS_LOG_ORDER_SCAN.CHANGE_LEVEL%TYPE,
      p_TABLE_NAME     IN DSS_LOG_ORDER_SCAN.TABLE_NAME%TYPE,
      p_COLUMN_NAME    IN DSS_LOG_ORDER_SCAN.COLUMN_NAME%TYPE,
      p_ROW_ID         IN DSS_LOG_ORDER_SCAN.ROW_ID%TYPE,
      p_OLD_VALUE      IN DSS_LOG_ORDER_SCAN.OLD_VALUE%TYPE,
      p_NEW_VALUE      IN DSS_LOG_ORDER_SCAN.NEW_VALUE%TYPE,
      p_STATUS         IN DSS_LOG_ORDER_SCAN.STATUS%TYPE,
      p_REMARKS        IN DSS_LOG_ORDER_SCAN.REMARKS%TYPE,
      p_MODIFY_BY      IN DSS_LOG_ORDER_SCAN.MODIFY_BY%TYPE,
      p_MODIFY_DATE    IN DSS_LOG_ORDER_SCAN.MODIFY_DATE%TYPE,
      p_ATTRIBUTE1     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10    IN DSS_LOG_ORDER_SCAN.ATTRIBUTE10%TYPE);

   PROCEDURE P_Insert (
      p_LOGID          IN DSS_LOG_ORDER_SCAN.LOGID%TYPE,
      p_CHANGE_LEVEL   IN DSS_LOG_ORDER_SCAN.CHANGE_LEVEL%TYPE,
      p_TABLE_NAME     IN DSS_LOG_ORDER_SCAN.TABLE_NAME%TYPE,
      p_COLUMN_NAME    IN DSS_LOG_ORDER_SCAN.COLUMN_NAME%TYPE,
      p_ROW_ID         IN DSS_LOG_ORDER_SCAN.ROW_ID%TYPE,
      p_OLD_VALUE      IN DSS_LOG_ORDER_SCAN.OLD_VALUE%TYPE,
      p_NEW_VALUE      IN DSS_LOG_ORDER_SCAN.NEW_VALUE%TYPE,
      p_STATUS         IN DSS_LOG_ORDER_SCAN.STATUS%TYPE,
      p_REMARKS        IN DSS_LOG_ORDER_SCAN.REMARKS%TYPE,
      p_MODIFY_BY      IN DSS_LOG_ORDER_SCAN.MODIFY_BY%TYPE,
      p_MODIFY_DATE    IN DSS_LOG_ORDER_SCAN.MODIFY_DATE%TYPE,
      p_ATTRIBUTE1     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10    IN DSS_LOG_ORDER_SCAN.ATTRIBUTE10%TYPE);

   PROCEDURE P_Delete (p_LOGID IN DSS_LOG_ORDER_SCAN.LOGID%TYPE);

   PROCEDURE Add_Log (
      p_CHANGE_LEVEL   IN DSS_LOG_ORDER_SCAN.CHANGE_LEVEL%TYPE,
      p_TABLE_NAME     IN DSS_LOG_ORDER_SCAN.TABLE_NAME%TYPE,
      p_COLUMN_NAME    IN DSS_LOG_ORDER_SCAN.COLUMN_NAME%TYPE,
      p_ROW_ID         IN DSS_LOG_ORDER_SCAN.ROW_ID%TYPE,
      p_OLD_VALUE      IN DSS_LOG_ORDER_SCAN.OLD_VALUE%TYPE,
      p_NEW_VALUE      IN DSS_LOG_ORDER_SCAN.NEW_VALUE%TYPE,
      p_STATUS         IN DSS_LOG_ORDER_SCAN.STATUS%TYPE,
      p_REMARKS        IN DSS_LOG_ORDER_SCAN.REMARKS%TYPE,
      p_MODIFY_BY      IN DSS_LOG_ORDER_SCAN.MODIFY_BY%TYPE);
END PKG_DSS_LOG_ORDER_SCAN;
/


DROP PACKAGE BODY DSS.PKG_DSS_LOG_ORDER_SCAN;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_LOG_ORDER_SCAN
AS
   PROCEDURE P_LoadByPrimaryKey (
      p_LOGID     IN     DSS_LOG_ORDER_SCAN.LOGID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT LOGID,
                CHANGE_LEVEL,
                TABLE_NAME,
                COLUMN_NAME,
                ROW_ID,
                OLD_VALUE,
                NEW_VALUE,
                STATUS,
                REMARKS,
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
           FROM DSS_LOG_ORDER_SCAN
          WHERE LOGID = p_LOGID;
   END P_LoadByPrimaryKey;



   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT LOGID,
                CHANGE_LEVEL,
                TABLE_NAME,
                COLUMN_NAME,
                ROW_ID,
                OLD_VALUE,
                NEW_VALUE,
                STATUS,
                REMARKS,
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
           FROM DSS_LOG_ORDER_SCAN;
   END P_LoadAll;



   PROCEDURE P_Update (
      p_LOGID          IN DSS_LOG_ORDER_SCAN.LOGID%TYPE,
      p_CHANGE_LEVEL   IN DSS_LOG_ORDER_SCAN.CHANGE_LEVEL%TYPE,
      p_TABLE_NAME     IN DSS_LOG_ORDER_SCAN.TABLE_NAME%TYPE,
      p_COLUMN_NAME    IN DSS_LOG_ORDER_SCAN.COLUMN_NAME%TYPE,
      p_ROW_ID         IN DSS_LOG_ORDER_SCAN.ROW_ID%TYPE,
      p_OLD_VALUE      IN DSS_LOG_ORDER_SCAN.OLD_VALUE%TYPE,
      p_NEW_VALUE      IN DSS_LOG_ORDER_SCAN.NEW_VALUE%TYPE,
      p_STATUS         IN DSS_LOG_ORDER_SCAN.STATUS%TYPE,
      p_REMARKS        IN DSS_LOG_ORDER_SCAN.REMARKS%TYPE,
      p_MODIFY_BY      IN DSS_LOG_ORDER_SCAN.MODIFY_BY%TYPE,
      p_MODIFY_DATE    IN DSS_LOG_ORDER_SCAN.MODIFY_DATE%TYPE,
      p_ATTRIBUTE1     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10    IN DSS_LOG_ORDER_SCAN.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      UPDATE DSS_LOG_ORDER_SCAN
         SET LOGID = p_LOGID,
             CHANGE_LEVEL = p_CHANGE_LEVEL,
             TABLE_NAME = p_TABLE_NAME,
             COLUMN_NAME = p_COLUMN_NAME,
             ROW_ID = p_ROW_ID,
             OLD_VALUE = p_OLD_VALUE,
             NEW_VALUE = p_NEW_VALUE,
             STATUS = p_STATUS,
             REMARKS = p_REMARKS,
             MODIFY_BY = p_MODIFY_BY,
             MODIFY_DATE = SYSDATE,                          -- p_MODIFY_DATE,
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
      p_LOGID          IN DSS_LOG_ORDER_SCAN.LOGID%TYPE,
      p_CHANGE_LEVEL   IN DSS_LOG_ORDER_SCAN.CHANGE_LEVEL%TYPE,
      p_TABLE_NAME     IN DSS_LOG_ORDER_SCAN.TABLE_NAME%TYPE,
      p_COLUMN_NAME    IN DSS_LOG_ORDER_SCAN.COLUMN_NAME%TYPE,
      p_ROW_ID         IN DSS_LOG_ORDER_SCAN.ROW_ID%TYPE,
      p_OLD_VALUE      IN DSS_LOG_ORDER_SCAN.OLD_VALUE%TYPE,
      p_NEW_VALUE      IN DSS_LOG_ORDER_SCAN.NEW_VALUE%TYPE,
      p_STATUS         IN DSS_LOG_ORDER_SCAN.STATUS%TYPE,
      p_REMARKS        IN DSS_LOG_ORDER_SCAN.REMARKS%TYPE,
      p_MODIFY_BY      IN DSS_LOG_ORDER_SCAN.MODIFY_BY%TYPE,
      p_MODIFY_DATE    IN DSS_LOG_ORDER_SCAN.MODIFY_DATE%TYPE,
      p_ATTRIBUTE1     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9     IN DSS_LOG_ORDER_SCAN.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10    IN DSS_LOG_ORDER_SCAN.ATTRIBUTE10%TYPE)
   IS
      V_LOG_SEQ   NUMBER;
   BEGIN
      SELECT NVL (MAX (LOGID), 0) + 1 INTO V_LOG_SEQ FROM DSS_LOG_ORDER_SCAN;



      INSERT INTO DSS_LOG_ORDER_SCAN (LOGID,
                                      CHANGE_LEVEL,
                                      TABLE_NAME,
                                      COLUMN_NAME,
                                      ROW_ID,
                                      OLD_VALUE,
                                      NEW_VALUE,
                                      STATUS,
                                      REMARKS,
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
           VALUES (V_LOG_SEQ,                                      -- p_LOGID,
                   p_CHANGE_LEVEL,
                   p_TABLE_NAME,
                   p_COLUMN_NAME,
                   p_ROW_ID,
                   p_OLD_VALUE,
                   p_NEW_VALUE,
                   p_STATUS,
                   p_REMARKS,
                   p_MODIFY_BY,
                   SYSDATE,                                 --  p_MODIFY_DATE,
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



   PROCEDURE P_Delete (p_LOGID IN DSS_LOG_ORDER_SCAN.LOGID%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_LOG_ORDER_SCAN
            WHERE LOGID = p_LOGID;
   END P_Delete;



   PROCEDURE Add_Log (
      p_CHANGE_LEVEL   IN DSS_LOG_ORDER_SCAN.CHANGE_LEVEL%TYPE,
      p_TABLE_NAME     IN DSS_LOG_ORDER_SCAN.TABLE_NAME%TYPE,
      p_COLUMN_NAME    IN DSS_LOG_ORDER_SCAN.COLUMN_NAME%TYPE,
      p_ROW_ID         IN DSS_LOG_ORDER_SCAN.ROW_ID%TYPE,
      p_OLD_VALUE      IN DSS_LOG_ORDER_SCAN.OLD_VALUE%TYPE,
      p_NEW_VALUE      IN DSS_LOG_ORDER_SCAN.NEW_VALUE%TYPE,
      p_STATUS         IN DSS_LOG_ORDER_SCAN.STATUS%TYPE,
      p_REMARKS        IN DSS_LOG_ORDER_SCAN.REMARKS%TYPE,
      p_MODIFY_BY      IN DSS_LOG_ORDER_SCAN.MODIFY_BY%TYPE)
   AS
      V_LOG_SEQ   NUMBER;
   BEGIN
      SELECT NVL (MAX (LOGID), 0) + 1 INTO V_LOG_SEQ FROM DSS_LOG_ORDER_SCAN;

      INSERT INTO DSS_LOG_ORDER_SCAN (LOGID,
                                      CHANGE_LEVEL,
                                      TABLE_NAME,
                                      COLUMN_NAME,
                                      ROW_ID,
                                      OLD_VALUE,
                                      NEW_VALUE,
                                      STATUS,
                                      REMARKS,
                                      MODIFY_BY,
                                      MODIFY_DATE)
           VALUES (V_LOG_SEQ,                                      -- p_LOGID,
                   p_CHANGE_LEVEL,
                   p_TABLE_NAME,
                   p_COLUMN_NAME,
                   p_ROW_ID,
                   p_OLD_VALUE,
                   p_NEW_VALUE,
                   p_STATUS,
                   p_REMARKS,
                   p_MODIFY_BY,
                   SYSDATE);
   END Add_Log;
END PKG_DSS_LOG_ORDER_SCAN;
/
