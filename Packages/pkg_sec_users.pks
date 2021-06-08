DROP PACKAGE DSS.PKG_SEC_USERS;

CREATE OR REPLACE PACKAGE DSS.PKG_SEC_USERS
AS
   PROCEDURE P_LoadAll (outCursor OUT MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_USER_NAME   IN     SEC_USERS.USER_NAME%TYPE,
      outCursor        OUT MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_USER_NAME          IN SEC_USERS.USER_NAME%TYPE,
      p_DISPLAY_NAME       IN SEC_USERS.DISPLAY_NAME%TYPE,
      p_FIRST_NAME         IN SEC_USERS.FIRST_NAME%TYPE,
      p_LAST_NAME          IN SEC_USERS.LAST_NAME%TYPE,
      p_EMAIL              IN SEC_USERS.EMAIL%TYPE,
      p_TITLE              IN SEC_USERS.TITLE%TYPE,
      p_PERSONAL_TITLE     IN SEC_USERS.PERSONAL_TITLE%TYPE,
      p_MOBILE_NUMBER      IN SEC_USERS.MOBILE_NUMBER%TYPE,
      p_PHONE_NUMBER       IN SEC_USERS.PHONE_NUMBER%TYPE,
      p_TELEPHONE_NUMBER   IN SEC_USERS.TELEPHONE_NUMBER%TYPE,
      p_LOGIN_TYPE         IN SEC_USERS.LOGIN_TYPE%TYPE,
      p_OFFLINE_PASSWORD   IN SEC_USERS.OFFLINE_PASSWORD%TYPE,
      p_CREATE_DATE        IN SEC_USERS.CREATE_DATE%TYPE,
      p_LAST_LOGIN_DATE    IN SEC_USERS.LAST_LOGIN_DATE%TYPE,
      p_ENABLED            IN SEC_USERS.ENABLED%TYPE,
      p_ATTRIBUTE1         IN SEC_USERS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2         IN SEC_USERS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3         IN SEC_USERS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4         IN SEC_USERS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5         IN SEC_USERS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6         IN SEC_USERS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7         IN SEC_USERS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8         IN SEC_USERS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9         IN SEC_USERS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10        IN SEC_USERS.ATTRIBUTE10%TYPE);

   PROCEDURE P_Insert (
      p_USER_NAME          IN SEC_USERS.USER_NAME%TYPE,
      p_DISPLAY_NAME       IN SEC_USERS.DISPLAY_NAME%TYPE,
      p_FIRST_NAME         IN SEC_USERS.FIRST_NAME%TYPE,
      p_LAST_NAME          IN SEC_USERS.LAST_NAME%TYPE,
      p_EMAIL              IN SEC_USERS.EMAIL%TYPE,
      p_TITLE              IN SEC_USERS.TITLE%TYPE,
      p_PERSONAL_TITLE     IN SEC_USERS.PERSONAL_TITLE%TYPE,
      p_MOBILE_NUMBER      IN SEC_USERS.MOBILE_NUMBER%TYPE,
      p_PHONE_NUMBER       IN SEC_USERS.PHONE_NUMBER%TYPE,
      p_TELEPHONE_NUMBER   IN SEC_USERS.TELEPHONE_NUMBER%TYPE,
      p_LOGIN_TYPE         IN SEC_USERS.LOGIN_TYPE%TYPE,
      p_OFFLINE_PASSWORD   IN SEC_USERS.OFFLINE_PASSWORD%TYPE,
      p_CREATE_DATE        IN SEC_USERS.CREATE_DATE%TYPE,
      p_LAST_LOGIN_DATE    IN SEC_USERS.LAST_LOGIN_DATE%TYPE,
      p_ENABLED            IN SEC_USERS.ENABLED%TYPE,
      p_ATTRIBUTE1         IN SEC_USERS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2         IN SEC_USERS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3         IN SEC_USERS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4         IN SEC_USERS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5         IN SEC_USERS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6         IN SEC_USERS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7         IN SEC_USERS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8         IN SEC_USERS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9         IN SEC_USERS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10        IN SEC_USERS.ATTRIBUTE10%TYPE);

   PROCEDURE P_Delete (p_USER_NAME IN SEC_USERS.USER_NAME%TYPE);
      PROCEDURE P_CHECK (
      p_USER_NAME          IN     SEC_USERS.USER_NAME%TYPE,
      p_DISPLAY_NAME       IN     SEC_USERS.DISPLAY_NAME%TYPE,
      p_FIRST_NAME         IN     SEC_USERS.FIRST_NAME%TYPE,
      p_LAST_NAME          IN     SEC_USERS.LAST_NAME%TYPE,
      p_EMAIL              IN     SEC_USERS.EMAIL%TYPE,
      p_TITLE              IN     SEC_USERS.TITLE%TYPE,
      p_PERSONAL_TITLE     IN     SEC_USERS.PERSONAL_TITLE%TYPE,
      p_MOBILE_NUMBER      IN     SEC_USERS.MOBILE_NUMBER%TYPE,
      p_PHONE_NUMBER       IN     SEC_USERS.PHONE_NUMBER%TYPE,
      p_TELEPHONE_NUMBER   IN     SEC_USERS.TELEPHONE_NUMBER%TYPE,
      p_LOGIN_TYPE         IN     SEC_USERS.LOGIN_TYPE%TYPE,
      p_OFFLINE_PASSWORD   IN     SEC_USERS.OFFLINE_PASSWORD%TYPE,
      p_CREATE_DATE        IN     SEC_USERS.CREATE_DATE%TYPE,
      p_LAST_LOGIN_DATE    IN     SEC_USERS.LAST_LOGIN_DATE%TYPE,
      p_ENABLED            IN     SEC_USERS.ENABLED%TYPE,
      outCursor               OUT MYGEN.sqlcur) ;
END PKG_SEC_USERS;
/


DROP PACKAGE BODY DSS.PKG_SEC_USERS;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_SEC_USERS
AS
   PROCEDURE P_LoadByPrimaryKey (
      p_USER_NAME   IN     SEC_USERS.USER_NAME%TYPE,
      outCursor        OUT MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT USER_NAME,
                DISPLAY_NAME,
                FIRST_NAME,
                LAST_NAME,
                EMAIL,
                TITLE,
                PERSONAL_TITLE,
                MOBILE_NUMBER,
                PHONE_NUMBER,
                TELEPHONE_NUMBER,
                LOGIN_TYPE,
                OFFLINE_PASSWORD,
                CREATE_DATE,
                LAST_LOGIN_DATE,
                ENABLED,
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
           FROM SEC_USERS
          WHERE USER_NAME = p_USER_NAME;
   END P_LoadByPrimaryKey;

   PROCEDURE P_LoadAll (outCursor OUT MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT USER_NAME,
                DISPLAY_NAME,
                FIRST_NAME,
                LAST_NAME,
                EMAIL,
                TITLE,
                PERSONAL_TITLE,
                MOBILE_NUMBER,
                PHONE_NUMBER,
                TELEPHONE_NUMBER,
                LOGIN_TYPE,
                OFFLINE_PASSWORD,
                CREATE_DATE,
                LAST_LOGIN_DATE,
                ENABLED,
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
           FROM SEC_USERS;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_USER_NAME          IN SEC_USERS.USER_NAME%TYPE,
      p_DISPLAY_NAME       IN SEC_USERS.DISPLAY_NAME%TYPE,
      p_FIRST_NAME         IN SEC_USERS.FIRST_NAME%TYPE,
      p_LAST_NAME          IN SEC_USERS.LAST_NAME%TYPE,
      p_EMAIL              IN SEC_USERS.EMAIL%TYPE,
      p_TITLE              IN SEC_USERS.TITLE%TYPE,
      p_PERSONAL_TITLE     IN SEC_USERS.PERSONAL_TITLE%TYPE,
      p_MOBILE_NUMBER      IN SEC_USERS.MOBILE_NUMBER%TYPE,
      p_PHONE_NUMBER       IN SEC_USERS.PHONE_NUMBER%TYPE,
      p_TELEPHONE_NUMBER   IN SEC_USERS.TELEPHONE_NUMBER%TYPE,
      p_LOGIN_TYPE         IN SEC_USERS.LOGIN_TYPE%TYPE,
      p_OFFLINE_PASSWORD   IN SEC_USERS.OFFLINE_PASSWORD%TYPE,
      p_CREATE_DATE        IN SEC_USERS.CREATE_DATE%TYPE,
      p_LAST_LOGIN_DATE    IN SEC_USERS.LAST_LOGIN_DATE%TYPE,
      p_ENABLED            IN SEC_USERS.ENABLED%TYPE,
      p_ATTRIBUTE1         IN SEC_USERS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2         IN SEC_USERS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3         IN SEC_USERS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4         IN SEC_USERS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5         IN SEC_USERS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6         IN SEC_USERS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7         IN SEC_USERS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8         IN SEC_USERS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9         IN SEC_USERS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10        IN SEC_USERS.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      UPDATE SEC_USERS
         SET USER_NAME = p_USER_NAME,
             DISPLAY_NAME = p_DISPLAY_NAME,
             FIRST_NAME = p_FIRST_NAME,
             LAST_NAME = p_LAST_NAME,
             EMAIL = p_EMAIL,
             TITLE = p_TITLE,
             PERSONAL_TITLE = p_PERSONAL_TITLE,
             MOBILE_NUMBER = p_MOBILE_NUMBER,
             PHONE_NUMBER = p_PHONE_NUMBER,
             TELEPHONE_NUMBER = p_TELEPHONE_NUMBER,
             LOGIN_TYPE = p_LOGIN_TYPE,
             OFFLINE_PASSWORD = p_OFFLINE_PASSWORD,
             CREATE_DATE = p_CREATE_DATE,
             LAST_LOGIN_DATE = p_LAST_LOGIN_DATE,
             ENABLED = p_ENABLED,
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
       WHERE USER_NAME = p_USER_NAME;
   END P_Update;


   PROCEDURE P_Insert (
      p_USER_NAME          IN SEC_USERS.USER_NAME%TYPE,
      p_DISPLAY_NAME       IN SEC_USERS.DISPLAY_NAME%TYPE,
      p_FIRST_NAME         IN SEC_USERS.FIRST_NAME%TYPE,
      p_LAST_NAME          IN SEC_USERS.LAST_NAME%TYPE,
      p_EMAIL              IN SEC_USERS.EMAIL%TYPE,
      p_TITLE              IN SEC_USERS.TITLE%TYPE,
      p_PERSONAL_TITLE     IN SEC_USERS.PERSONAL_TITLE%TYPE,
      p_MOBILE_NUMBER      IN SEC_USERS.MOBILE_NUMBER%TYPE,
      p_PHONE_NUMBER       IN SEC_USERS.PHONE_NUMBER%TYPE,
      p_TELEPHONE_NUMBER   IN SEC_USERS.TELEPHONE_NUMBER%TYPE,
      p_LOGIN_TYPE         IN SEC_USERS.LOGIN_TYPE%TYPE,
      p_OFFLINE_PASSWORD   IN SEC_USERS.OFFLINE_PASSWORD%TYPE,
      p_CREATE_DATE        IN SEC_USERS.CREATE_DATE%TYPE,
      p_LAST_LOGIN_DATE    IN SEC_USERS.LAST_LOGIN_DATE%TYPE,
      p_ENABLED            IN SEC_USERS.ENABLED%TYPE,
      p_ATTRIBUTE1         IN SEC_USERS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2         IN SEC_USERS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3         IN SEC_USERS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4         IN SEC_USERS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5         IN SEC_USERS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6         IN SEC_USERS.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7         IN SEC_USERS.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8         IN SEC_USERS.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9         IN SEC_USERS.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10        IN SEC_USERS.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      INSERT INTO SEC_USERS (USER_NAME,
                             DISPLAY_NAME,
                             FIRST_NAME,
                             LAST_NAME,
                             EMAIL,
                             TITLE,
                             PERSONAL_TITLE,
                             MOBILE_NUMBER,
                             PHONE_NUMBER,
                             TELEPHONE_NUMBER,
                             LOGIN_TYPE,
                             OFFLINE_PASSWORD,
                             CREATE_DATE,
                             LAST_LOGIN_DATE,
                             ENABLED,
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
           VALUES (p_USER_NAME,
                   p_DISPLAY_NAME,
                   p_FIRST_NAME,
                   p_LAST_NAME,
                   p_EMAIL,
                   p_TITLE,
                   p_PERSONAL_TITLE,
                   p_MOBILE_NUMBER,
                   p_PHONE_NUMBER,
                   p_TELEPHONE_NUMBER,
                   p_LOGIN_TYPE,
                   p_OFFLINE_PASSWORD,
                   p_CREATE_DATE,
                   p_LAST_LOGIN_DATE,
                   p_ENABLED,
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

   PROCEDURE P_Delete (p_USER_NAME IN SEC_USERS.USER_NAME%TYPE)
   IS
   BEGIN
      DELETE FROM SEC_USERS
            WHERE USER_NAME = p_USER_NAME;
   END P_Delete;


   PROCEDURE P_CHECK (
      p_USER_NAME          IN     SEC_USERS.USER_NAME%TYPE,
      p_DISPLAY_NAME       IN     SEC_USERS.DISPLAY_NAME%TYPE,
      p_FIRST_NAME         IN     SEC_USERS.FIRST_NAME%TYPE,
      p_LAST_NAME          IN     SEC_USERS.LAST_NAME%TYPE,
      p_EMAIL              IN     SEC_USERS.EMAIL%TYPE,
      p_TITLE              IN     SEC_USERS.TITLE%TYPE,
      p_PERSONAL_TITLE     IN     SEC_USERS.PERSONAL_TITLE%TYPE,
      p_MOBILE_NUMBER      IN     SEC_USERS.MOBILE_NUMBER%TYPE,
      p_PHONE_NUMBER       IN     SEC_USERS.PHONE_NUMBER%TYPE,
      p_TELEPHONE_NUMBER   IN     SEC_USERS.TELEPHONE_NUMBER%TYPE,
      p_LOGIN_TYPE         IN     SEC_USERS.LOGIN_TYPE%TYPE,
      p_OFFLINE_PASSWORD   IN     SEC_USERS.OFFLINE_PASSWORD%TYPE,
      p_CREATE_DATE        IN     SEC_USERS.CREATE_DATE%TYPE,
      p_LAST_LOGIN_DATE    IN     SEC_USERS.LAST_LOGIN_DATE%TYPE,
      p_ENABLED            IN     SEC_USERS.ENABLED%TYPE,
      outCursor               OUT MYGEN.sqlcur)
   IS
      CNT   NUMBER;
   BEGIN
      SELECT COUNT (*)
        INTO CNT
        FROM SEC_USERS
       WHERE USER_NAME = p_USER_NAME;

      IF CNT = 0
      THEN
   INSERT INTO SEC_USERS (USER_NAME,
                             DISPLAY_NAME,
                             FIRST_NAME,
                             LAST_NAME,
                             EMAIL,
                             TITLE,
                             PERSONAL_TITLE,
                             MOBILE_NUMBER,
                             PHONE_NUMBER,
                             TELEPHONE_NUMBER,
                             LOGIN_TYPE,
                             OFFLINE_PASSWORD,
                             CREATE_DATE,
                             LAST_LOGIN_DATE,
                             ENABLED)
           VALUES (p_USER_NAME,
                   p_DISPLAY_NAME,
                   p_FIRST_NAME,
                   p_LAST_NAME,
                   p_EMAIL,
                   p_TITLE,
                   p_PERSONAL_TITLE,
                   p_MOBILE_NUMBER,
                   p_PHONE_NUMBER,
                   p_TELEPHONE_NUMBER,
                   p_LOGIN_TYPE,
                   p_OFFLINE_PASSWORD,
                   sysdate,
                   sysdate,
                   p_ENABLED);

      ELSE
      UPDATE SEC_USERS
         SET 
             LOGIN_TYPE = p_LOGIN_TYPE,
             OFFLINE_PASSWORD = p_OFFLINE_PASSWORD,
             LAST_LOGIN_DATE = sysdate,
             ENABLED = p_ENABLED
       WHERE USER_NAME = p_USER_NAME;
      END IF;

      OPEN outCursor FOR
         SELECT USER_NAME,
                DISPLAY_NAME,
                FIRST_NAME,
                LAST_NAME,
                EMAIL,
                TITLE,
                PERSONAL_TITLE,
                MOBILE_NUMBER,
                PHONE_NUMBER,
                TELEPHONE_NUMBER,
                LOGIN_TYPE,
                OFFLINE_PASSWORD,
                CREATE_DATE,
                LAST_LOGIN_DATE,
                ENABLED,
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
           FROM SEC_USERS
          WHERE USER_NAME = p_USER_NAME;
   END P_CHECK;
END PKG_SEC_USERS;
/
