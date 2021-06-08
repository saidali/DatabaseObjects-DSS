DROP PACKAGE DSS.PKG_SEC_USER_FORM_ACCESS;

CREATE OR REPLACE PACKAGE DSS.PKG_SEC_USER_FORM_ACCESS
AS
    PROCEDURE P_LOADBYFORMID (
      p_FORM_ID     IN SEC_USER_FORM_ACCESS.FORM_ID%TYPE,
      outCursor        OUT MYGEN.sqlcur);
   
                       
   PROCEDURE P_LOADBYUSERNAME (
      p_USER_NAME   IN     SEC_USER_FORM_ACCESS.USER_NAME%TYPE,
      outCursor        OUT MYGEN.sqlcur) ; 
   PROCEDURE P_LoadAll (outCursor OUT MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_FORM_ID     IN     SEC_USER_FORM_ACCESS.FORM_ID%TYPE,
      p_USER_NAME   IN     SEC_USER_FORM_ACCESS.USER_NAME%TYPE,
      outCursor        OUT MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_USER_NAME     IN SEC_USER_FORM_ACCESS.USER_NAME%TYPE,
      p_FORM_ID       IN SEC_USER_FORM_ACCESS.FORM_ID%TYPE,
      p_MODIFY_DATE   IN SEC_USER_FORM_ACCESS.MODIFY_DATE%TYPE,
      p_EXPIRY_DATE   IN SEC_USER_FORM_ACCESS.EXPIRY_DATE%TYPE,
      p_CREATE_BY     IN SEC_USER_FORM_ACCESS.CREATE_BY%TYPE,
      p_CREATE_DATE   IN SEC_USER_FORM_ACCESS.CREATE_DATE%TYPE,
      p_ENABLED       IN SEC_USER_FORM_ACCESS.ENABLED%TYPE,
      p_ATTRIBUTE1    IN SEC_USER_FORM_ACCESS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2    IN SEC_USER_FORM_ACCESS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3    IN SEC_USER_FORM_ACCESS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4    IN SEC_USER_FORM_ACCESS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5    IN SEC_USER_FORM_ACCESS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6    IN SEC_USER_FORM_ACCESS.ATTRIBUTE6%TYPE);

   PROCEDURE P_Insert (
      p_USER_NAME     IN SEC_USER_FORM_ACCESS.USER_NAME%TYPE,
      p_FORM_ID       IN SEC_USER_FORM_ACCESS.FORM_ID%TYPE,
      p_MODIFY_DATE   IN SEC_USER_FORM_ACCESS.MODIFY_DATE%TYPE,
      p_EXPIRY_DATE   IN SEC_USER_FORM_ACCESS.EXPIRY_DATE%TYPE,
      p_CREATE_BY     IN SEC_USER_FORM_ACCESS.CREATE_BY%TYPE,
      p_CREATE_DATE   IN SEC_USER_FORM_ACCESS.CREATE_DATE%TYPE,
      p_ENABLED       IN SEC_USER_FORM_ACCESS.ENABLED%TYPE,
      p_ATTRIBUTE1    IN SEC_USER_FORM_ACCESS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2    IN SEC_USER_FORM_ACCESS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3    IN SEC_USER_FORM_ACCESS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4    IN SEC_USER_FORM_ACCESS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5    IN SEC_USER_FORM_ACCESS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6    IN SEC_USER_FORM_ACCESS.ATTRIBUTE6%TYPE);

   PROCEDURE P_Delete (p_FORM_ID     IN SEC_USER_FORM_ACCESS.FORM_ID%TYPE,
                       p_USER_NAME   IN SEC_USER_FORM_ACCESS.USER_NAME%TYPE);
END PKG_SEC_USER_FORM_ACCESS;
/


DROP PACKAGE BODY DSS.PKG_SEC_USER_FORM_ACCESS;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_SEC_USER_FORM_ACCESS
AS
 

   PROCEDURE P_LoadByPrimaryKey (
      p_FORM_ID     IN     SEC_USER_FORM_ACCESS.FORM_ID%TYPE,
      p_USER_NAME   IN     SEC_USER_FORM_ACCESS.USER_NAME%TYPE,
      outCursor        OUT MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT USER_NAME,
                FORM_ID,
                MODIFY_DATE,
                EXPIRY_DATE,
                CREATE_BY,
                CREATE_DATE,
                ENABLED,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6
           FROM SEC_USER_FORM_ACCESS
          WHERE FORM_ID = p_FORM_ID AND USER_NAME = p_USER_NAME;
   END P_LoadByPrimaryKey;

   PROCEDURE P_LoadAll (outCursor OUT MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT USER_NAME,
                FORM_ID,
                MODIFY_DATE,
                EXPIRY_DATE,
                CREATE_BY,
                CREATE_DATE,
                ENABLED,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6
           FROM SEC_USER_FORM_ACCESS;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_USER_NAME     IN SEC_USER_FORM_ACCESS.USER_NAME%TYPE,
      p_FORM_ID       IN SEC_USER_FORM_ACCESS.FORM_ID%TYPE,
      p_MODIFY_DATE   IN SEC_USER_FORM_ACCESS.MODIFY_DATE%TYPE,
      p_EXPIRY_DATE   IN SEC_USER_FORM_ACCESS.EXPIRY_DATE%TYPE,
      p_CREATE_BY     IN SEC_USER_FORM_ACCESS.CREATE_BY%TYPE,
      p_CREATE_DATE   IN SEC_USER_FORM_ACCESS.CREATE_DATE%TYPE,
      p_ENABLED       IN SEC_USER_FORM_ACCESS.ENABLED%TYPE,
      p_ATTRIBUTE1    IN SEC_USER_FORM_ACCESS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2    IN SEC_USER_FORM_ACCESS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3    IN SEC_USER_FORM_ACCESS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4    IN SEC_USER_FORM_ACCESS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5    IN SEC_USER_FORM_ACCESS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6    IN SEC_USER_FORM_ACCESS.ATTRIBUTE6%TYPE)
   IS
   BEGIN
      UPDATE SEC_USER_FORM_ACCESS
         SET USER_NAME = p_USER_NAME,
             FORM_ID = p_FORM_ID,
             MODIFY_DATE = p_MODIFY_DATE,
             EXPIRY_DATE = p_EXPIRY_DATE,
             CREATE_BY = p_CREATE_BY,
             CREATE_DATE = p_CREATE_DATE,
             ENABLED = p_ENABLED,
             ATTRIBUTE1 = p_ATTRIBUTE1,
             ATTRIBUTE2 = p_ATTRIBUTE2,
             ATTRIBUTE3 = p_ATTRIBUTE3,
             ATTRIBUTE4 = p_ATTRIBUTE4,
             ATTRIBUTE5 = p_ATTRIBUTE5,
             ATTRIBUTE6 = p_ATTRIBUTE6
       WHERE FORM_ID = p_FORM_ID AND USER_NAME = p_USER_NAME;
   END P_Update;


   PROCEDURE P_Insert (
      p_USER_NAME     IN SEC_USER_FORM_ACCESS.USER_NAME%TYPE,
      p_FORM_ID       IN SEC_USER_FORM_ACCESS.FORM_ID%TYPE,
      p_MODIFY_DATE   IN SEC_USER_FORM_ACCESS.MODIFY_DATE%TYPE,
      p_EXPIRY_DATE   IN SEC_USER_FORM_ACCESS.EXPIRY_DATE%TYPE,
      p_CREATE_BY     IN SEC_USER_FORM_ACCESS.CREATE_BY%TYPE,
      p_CREATE_DATE   IN SEC_USER_FORM_ACCESS.CREATE_DATE%TYPE,
      p_ENABLED       IN SEC_USER_FORM_ACCESS.ENABLED%TYPE,
      p_ATTRIBUTE1    IN SEC_USER_FORM_ACCESS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2    IN SEC_USER_FORM_ACCESS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3    IN SEC_USER_FORM_ACCESS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4    IN SEC_USER_FORM_ACCESS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5    IN SEC_USER_FORM_ACCESS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6    IN SEC_USER_FORM_ACCESS.ATTRIBUTE6%TYPE)
   IS
   BEGIN
      INSERT INTO SEC_USER_FORM_ACCESS (USER_NAME,
                                        FORM_ID,
                                        MODIFY_DATE,
                                        EXPIRY_DATE,
                                        CREATE_BY,
                                        CREATE_DATE,
                                        ENABLED,
                                        ATTRIBUTE1,
                                        ATTRIBUTE2,
                                        ATTRIBUTE3,
                                        ATTRIBUTE4,
                                        ATTRIBUTE5,
                                        ATTRIBUTE6)
           VALUES (p_USER_NAME,
                   p_FORM_ID,
                   p_MODIFY_DATE,
                   p_EXPIRY_DATE,
                   p_CREATE_BY,
                   p_CREATE_DATE,
                   p_ENABLED,
                   p_ATTRIBUTE1,
                   p_ATTRIBUTE2,
                   p_ATTRIBUTE3,
                   p_ATTRIBUTE4,
                   p_ATTRIBUTE5,
                   p_ATTRIBUTE6);
   END P_Insert;

   PROCEDURE P_Delete (p_FORM_ID     IN SEC_USER_FORM_ACCESS.FORM_ID%TYPE,
                       p_USER_NAME   IN SEC_USER_FORM_ACCESS.USER_NAME%TYPE)
   IS
   BEGIN
      DELETE FROM SEC_USER_FORM_ACCESS
            WHERE FORM_ID = p_FORM_ID AND USER_NAME = p_USER_NAME;
   END P_Delete;


   PROCEDURE P_LOADBYUSERNAME (
      p_USER_NAME   IN     SEC_USER_FORM_ACCESS.USER_NAME%TYPE,
      outCursor        OUT MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT p_USER_NAME USER_NAME,
                FRMACC.FORM_ID,
                CASE
                   WHEN USR.USER_NAME IS NULL THEN NULL
                   ELSE UIF.DISPLAY_NAME
                END
                   DISPLAY_NAME,
                CASE
                   WHEN USR.MODIFY_DATE IS NULL THEN SYSDATE
                   ELSE USR.MODIFY_DATE
                END
                   MODIFY_DATE,
                CASE
                   WHEN USR.EXPIRY_DATE IS NULL THEN SYSDATE
                   ELSE USR.EXPIRY_DATE
                END
                   EXPIRY_DATE,
                CASE
                   WHEN USR.CREATE_BY IS NULL THEN ''
                   ELSE USR.CREATE_BY
                END
                   CREATE_BY,
                CASE
                   WHEN USR.CREATE_DATE IS NULL THEN SYSDATE
                   ELSE USR.CREATE_DATE
                END
                   CREATE_DATE,
                CASE WHEN USR.USER_NAME IS NULL THEN 'N' ELSE USR.ENABLED END
                   ENABLED,
                FRMACC.FORM_NAME,
                FRMACC.FORM_TEXT,
                FRMACC.FORM_NAMESPACE,
                FRMACC.FULL_NAME,
                FRMACC.STYLE,
                FRMACC.FORM_TYPE,
                FRMACC.FORM_HELP_URL,
                FRMACC.WINDOW_STATE,
                FRMACC.ALLOW_MULTIPLE,
                FRMACC.FORM_INDEX,
                FRMACC.TAB_ID,
                FRMACC.FORM_STATUS,
                FRMACC.FORM_ICON,
                FRMACC.FORM_MENUICON,
                FRMACC.TAB_INDEX,
                FRMACC.TAB_NAME,
                FRMACC.TAB_TEXT,
                FRMACC.TAB_HELP_URL,
                FRMACC.TAB_ENABLED,
                FRMACC.TAB_HIDDEN,
                FRMACC.TAB_ICON
           FROM V_USER_FORM_ACCESS FRMACC
                LEFT OUTER JOIN SEC_USER_FORM_ACCESS USR
                   ON     FRMACC.FORM_ID = USR.FORM_ID
                      AND UPPER (USR.USER_NAME) = UPPER (p_USER_NAME)
                LEFT OUTER JOIN SEC_USERS UIF
                   ON UPPER (USR.USER_NAME) = UPPER (UIF.USER_NAME);
   END P_LOADBYUSERNAME;
   
   PROCEDURE P_LOADBYFORMID (
      p_FORM_ID     IN SEC_USER_FORM_ACCESS.FORM_ID%TYPE,
      outCursor        OUT MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT  USR.USER_NAME  USER_NAME,
                FRMACC.FORM_ID,
                CASE
                   WHEN USR.USER_NAME IS NULL THEN NULL
                   ELSE UIF.DISPLAY_NAME
                END
                   DISPLAY_NAME,
                CASE
                   WHEN USR.MODIFY_DATE IS NULL THEN SYSDATE
                   ELSE USR.MODIFY_DATE
                END
                   MODIFY_DATE,
                CASE
                   WHEN USR.EXPIRY_DATE IS NULL THEN SYSDATE
                   ELSE USR.EXPIRY_DATE
                END
                   EXPIRY_DATE,
                CASE
                   WHEN USR.CREATE_BY IS NULL THEN ''
                   ELSE USR.CREATE_BY
                END
                   CREATE_BY,
                CASE
                   WHEN USR.CREATE_DATE IS NULL THEN SYSDATE
                   ELSE USR.CREATE_DATE
                END
                   CREATE_DATE,
                CASE WHEN USR.USER_NAME IS NULL THEN 'N' ELSE USR.ENABLED END
                   ENABLED,
                FRMACC.FORM_NAME,
                FRMACC.FORM_TEXT,
                FRMACC.FORM_NAMESPACE,
                FRMACC.FULL_NAME,
                FRMACC.STYLE,
                FRMACC.FORM_TYPE,
                FRMACC.FORM_HELP_URL,
                FRMACC.WINDOW_STATE,
                FRMACC.ALLOW_MULTIPLE,
                FRMACC.FORM_INDEX,
                FRMACC.TAB_ID,
                FRMACC.FORM_STATUS,
                FRMACC.FORM_ICON,
                FRMACC.FORM_MENUICON,
                FRMACC.TAB_INDEX,
                FRMACC.TAB_NAME,
                FRMACC.TAB_TEXT,
                FRMACC.TAB_HELP_URL,
                FRMACC.TAB_ENABLED,
                FRMACC.TAB_HIDDEN,
                FRMACC.TAB_ICON
           FROM V_USER_FORM_ACCESS FRMACC
                LEFT OUTER JOIN SEC_USER_FORM_ACCESS USR
                   ON     FRMACC.FORM_ID = USR.FORM_ID
                     -- AND UPPER (USR.USER_NAME) = UPPER (p_USER_NAME)
                LEFT OUTER JOIN SEC_USERS UIF
                   ON UPPER (USR.USER_NAME) = UPPER (UIF.USER_NAME)
                   WHERE USR.FORM_ID =  p_FORM_ID 
                   ;
                   
   END P_LOADBYFORMID;
      
END PKG_SEC_USER_FORM_ACCESS;
/
