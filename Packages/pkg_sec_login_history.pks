DROP PACKAGE DSS.PKG_SEC_LOGIN_HISTORY;

CREATE OR REPLACE PACKAGE DSS.PKG_SEC_LOGIN_HISTORY
AS
   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_LOGID     IN     SEC_LOGIN_HISTORY.LOGID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_LOGID              IN SEC_LOGIN_HISTORY.LOGID%TYPE,
      p_USER_NAME          IN SEC_LOGIN_HISTORY.USER_NAME%TYPE,
      p_PC_NAME            IN SEC_LOGIN_HISTORY.PC_NAME%TYPE,
      p_IP_LOCAL           IN SEC_LOGIN_HISTORY.IP_LOCAL%TYPE,
      p_IP_PUBLIC          IN SEC_LOGIN_HISTORY.IP_PUBLIC%TYPE,
      p_IP_REMOTE          IN SEC_LOGIN_HISTORY.IP_REMOTE%TYPE,
      p_DOMAIN_NAME        IN SEC_LOGIN_HISTORY.DOMAIN_NAME%TYPE,
      p_PC_DATE_TIME       IN SEC_LOGIN_HISTORY.PC_DATE_TIME%TYPE,
      p_SERVER_DATE_TIME   IN SEC_LOGIN_HISTORY.SERVER_DATE_TIME%TYPE,
      p_TIME_DIFF          IN SEC_LOGIN_HISTORY.TIME_DIFF%TYPE,
      p_LOGIN_TYPE         IN SEC_LOGIN_HISTORY.LOGIN_TYPE%TYPE,
      p_LOGIN_DATE         IN SEC_LOGIN_HISTORY.LOGIN_DATE%TYPE,
      p_ATTRIBUTE1         IN SEC_LOGIN_HISTORY.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2         IN SEC_LOGIN_HISTORY.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3         IN SEC_LOGIN_HISTORY.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4         IN SEC_LOGIN_HISTORY.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5         IN SEC_LOGIN_HISTORY.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6         IN SEC_LOGIN_HISTORY.ATTRIBUTE6%TYPE);

   PROCEDURE P_Insert (
      p_LOGID              IN SEC_LOGIN_HISTORY.LOGID%TYPE,
      p_USER_NAME          IN SEC_LOGIN_HISTORY.USER_NAME%TYPE,
      p_PC_NAME            IN SEC_LOGIN_HISTORY.PC_NAME%TYPE,
      p_IP_LOCAL           IN SEC_LOGIN_HISTORY.IP_LOCAL%TYPE,
      p_IP_PUBLIC          IN SEC_LOGIN_HISTORY.IP_PUBLIC%TYPE,
      p_IP_REMOTE          IN SEC_LOGIN_HISTORY.IP_REMOTE%TYPE,
      p_DOMAIN_NAME        IN SEC_LOGIN_HISTORY.DOMAIN_NAME%TYPE,
      p_PC_DATE_TIME       IN SEC_LOGIN_HISTORY.PC_DATE_TIME%TYPE,
      p_SERVER_DATE_TIME   IN SEC_LOGIN_HISTORY.SERVER_DATE_TIME%TYPE,
      p_TIME_DIFF          IN SEC_LOGIN_HISTORY.TIME_DIFF%TYPE,
      p_LOGIN_TYPE         IN SEC_LOGIN_HISTORY.LOGIN_TYPE%TYPE,
      p_LOGIN_DATE         IN SEC_LOGIN_HISTORY.LOGIN_DATE%TYPE,
      p_ATTRIBUTE1         IN SEC_LOGIN_HISTORY.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2         IN SEC_LOGIN_HISTORY.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3         IN SEC_LOGIN_HISTORY.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4         IN SEC_LOGIN_HISTORY.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5         IN SEC_LOGIN_HISTORY.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6         IN SEC_LOGIN_HISTORY.ATTRIBUTE6%TYPE);

   PROCEDURE P_Delete (p_LOGID IN SEC_LOGIN_HISTORY.LOGID%TYPE);
END PKG_SEC_LOGIN_HISTORY;
/


DROP PACKAGE BODY DSS.PKG_SEC_LOGIN_HISTORY;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_SEC_LOGIN_HISTORY
AS
   PROCEDURE P_LoadByPrimaryKey (
      p_LOGID     IN     SEC_LOGIN_HISTORY.LOGID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT LOGID,
                USER_NAME,
                PC_NAME,
                IP_LOCAL,
                IP_PUBLIC,
                IP_REMOTE,
                DOMAIN_NAME,
                PC_DATE_TIME,
                SERVER_DATE_TIME,
                TIME_DIFF,
                LOGIN_TYPE,
                LOGIN_DATE,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6
           FROM SEC_LOGIN_HISTORY
          WHERE LOGID = p_LOGID;
   END P_LoadByPrimaryKey;

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT LOGID,
                USER_NAME,
                PC_NAME,
                IP_LOCAL,
                IP_PUBLIC,
                IP_REMOTE,
                DOMAIN_NAME,
                PC_DATE_TIME,
                SERVER_DATE_TIME,
                TIME_DIFF,
                LOGIN_TYPE,
                LOGIN_DATE,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6
           FROM SEC_LOGIN_HISTORY;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_LOGID              IN SEC_LOGIN_HISTORY.LOGID%TYPE,
      p_USER_NAME          IN SEC_LOGIN_HISTORY.USER_NAME%TYPE,
      p_PC_NAME            IN SEC_LOGIN_HISTORY.PC_NAME%TYPE,
      p_IP_LOCAL           IN SEC_LOGIN_HISTORY.IP_LOCAL%TYPE,
      p_IP_PUBLIC          IN SEC_LOGIN_HISTORY.IP_PUBLIC%TYPE,
      p_IP_REMOTE          IN SEC_LOGIN_HISTORY.IP_REMOTE%TYPE,
      p_DOMAIN_NAME        IN SEC_LOGIN_HISTORY.DOMAIN_NAME%TYPE,
      p_PC_DATE_TIME       IN SEC_LOGIN_HISTORY.PC_DATE_TIME%TYPE,
      p_SERVER_DATE_TIME   IN SEC_LOGIN_HISTORY.SERVER_DATE_TIME%TYPE,
      p_TIME_DIFF          IN SEC_LOGIN_HISTORY.TIME_DIFF%TYPE,
      p_LOGIN_TYPE         IN SEC_LOGIN_HISTORY.LOGIN_TYPE%TYPE,
      p_LOGIN_DATE         IN SEC_LOGIN_HISTORY.LOGIN_DATE%TYPE,
      p_ATTRIBUTE1         IN SEC_LOGIN_HISTORY.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2         IN SEC_LOGIN_HISTORY.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3         IN SEC_LOGIN_HISTORY.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4         IN SEC_LOGIN_HISTORY.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5         IN SEC_LOGIN_HISTORY.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6         IN SEC_LOGIN_HISTORY.ATTRIBUTE6%TYPE)
   IS
   BEGIN
      UPDATE SEC_LOGIN_HISTORY
         SET LOGID = p_LOGID,
             USER_NAME = p_USER_NAME,
             PC_NAME = p_PC_NAME,
             IP_LOCAL = p_IP_LOCAL,
             IP_PUBLIC = p_IP_PUBLIC,
             IP_REMOTE = p_IP_REMOTE,
             DOMAIN_NAME = p_DOMAIN_NAME,
             PC_DATE_TIME = p_PC_DATE_TIME,
             SERVER_DATE_TIME = p_SERVER_DATE_TIME,
             TIME_DIFF = p_TIME_DIFF,
             LOGIN_TYPE = p_LOGIN_TYPE,
             LOGIN_DATE = p_LOGIN_DATE,
             ATTRIBUTE1 = p_ATTRIBUTE1,
             ATTRIBUTE2 = p_ATTRIBUTE2,
             ATTRIBUTE3 = p_ATTRIBUTE3,
             ATTRIBUTE4 = p_ATTRIBUTE4,
             ATTRIBUTE5 = p_ATTRIBUTE5,
             ATTRIBUTE6 = p_ATTRIBUTE6
       WHERE LOGID = p_LOGID;
   END P_Update;


   PROCEDURE P_Insert (
      p_LOGID              IN SEC_LOGIN_HISTORY.LOGID%TYPE,
      p_USER_NAME          IN SEC_LOGIN_HISTORY.USER_NAME%TYPE,
      p_PC_NAME            IN SEC_LOGIN_HISTORY.PC_NAME%TYPE,
      p_IP_LOCAL           IN SEC_LOGIN_HISTORY.IP_LOCAL%TYPE,
      p_IP_PUBLIC          IN SEC_LOGIN_HISTORY.IP_PUBLIC%TYPE,
      p_IP_REMOTE          IN SEC_LOGIN_HISTORY.IP_REMOTE%TYPE,
      p_DOMAIN_NAME        IN SEC_LOGIN_HISTORY.DOMAIN_NAME%TYPE,
      p_PC_DATE_TIME       IN SEC_LOGIN_HISTORY.PC_DATE_TIME%TYPE,
      p_SERVER_DATE_TIME   IN SEC_LOGIN_HISTORY.SERVER_DATE_TIME%TYPE,
      p_TIME_DIFF          IN SEC_LOGIN_HISTORY.TIME_DIFF%TYPE,
      p_LOGIN_TYPE         IN SEC_LOGIN_HISTORY.LOGIN_TYPE%TYPE,
      p_LOGIN_DATE         IN SEC_LOGIN_HISTORY.LOGIN_DATE%TYPE,
      p_ATTRIBUTE1         IN SEC_LOGIN_HISTORY.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2         IN SEC_LOGIN_HISTORY.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3         IN SEC_LOGIN_HISTORY.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4         IN SEC_LOGIN_HISTORY.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5         IN SEC_LOGIN_HISTORY.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6         IN SEC_LOGIN_HISTORY.ATTRIBUTE6%TYPE)
   IS
   BEGIN
--      INSERT INTO SEC_LOGIN_HISTORY (LOGID,
--                                     USER_NAME,
--                                     PC_NAME,
--                                     IP_LOCAL,
--                                     IP_PUBLIC,
--                                     IP_REMOTE,
--                                     DOMAIN_NAME,
--                                     PC_DATE_TIME,
--                                     SERVER_DATE_TIME,
--                                     TIME_DIFF,
--                                     LOGIN_TYPE,
--                                     LOGIN_DATE,
--                                     ATTRIBUTE1,
--                                     ATTRIBUTE2,
--                                     ATTRIBUTE3,
--                                     ATTRIBUTE4,
--                                     ATTRIBUTE5,
--                                     ATTRIBUTE6)
--           VALUES (
--                     SEQ_LOGIN_HISTORY.NEXTVAL,                     --p_LOGID,
--                     p_USER_NAME,
--                     p_PC_NAME,
--                     p_IP_LOCAL,
--                     p_IP_PUBLIC,
--                     p_IP_REMOTE,
--                     p_DOMAIN_NAME,
--                     p_PC_DATE_TIME,
--                     SYSDATE,                            --p_SERVER_DATE_TIME,
--                     MOD (FLOOR ( (SYSDATE - p_PC_DATE_TIME) * 24 * 60 * 60),
--                          60),                                  --p_TIME_DIFF,
--                     p_LOGIN_TYPE,
--                     SYSDATE,                                 -- p_LOGIN_DATE,
--                     p_ATTRIBUTE1,
--                     p_ATTRIBUTE2,
--                     p_ATTRIBUTE3,
--                     p_ATTRIBUTE4,
--                     p_ATTRIBUTE5,
--                     p_ATTRIBUTE6);
            DBMS_OUTPUT.PUT_LINE('No User') ;
   END P_Insert;

   PROCEDURE P_Delete (p_LOGID IN SEC_LOGIN_HISTORY.LOGID%TYPE)
   IS
   BEGIN
      DELETE FROM SEC_LOGIN_HISTORY
            WHERE LOGID = p_LOGID;
   END P_Delete;
END PKG_SEC_LOGIN_HISTORY;
/
