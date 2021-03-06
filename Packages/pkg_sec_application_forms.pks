DROP PACKAGE DSS.PKG_SEC_APPLICATION_FORMS;

CREATE OR REPLACE PACKAGE DSS.PKG_SEC_APPLICATION_FORMS
AS


   PROCEDURE P_LOADBYUSERNAME (
      P_USER_NAME   IN     SEC_USER_FORM_ACCESS.USER_NAME%TYPE,
      P_TAB_ID    IN     SEC_APPLICATION_FORMS.TAB_ID%TYPE,
      OUTCURSOR        OUT MYGEN.SQLCUR) ; 
   PROCEDURE P_LoadAll (outCursor OUT MYGEN.sqlcur);

   PROCEDURE P_LoadByFullName (
      p_FULL_NAME   IN     SEC_APPLICATION_FORMS.FULL_NAME%TYPE,
      outCursor        OUT MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_FORM_ID   IN     SEC_APPLICATION_FORMS.FORM_ID%TYPE,
      outCursor      OUT MYGEN.sqlcur);
      
      PROCEDURE P_LOADBYTABID (
      p_TAB_ID   IN     SEC_APPLICATION_FORMS.TAB_ID%TYPE,
      outCursor      OUT MYGEN.sqlcur) ; 
            

   PROCEDURE P_Update (
      p_FORM_ID          IN SEC_APPLICATION_FORMS.FORM_ID%TYPE,
      p_FORM_NAME        IN SEC_APPLICATION_FORMS.FORM_NAME%TYPE,
      p_TEXT             IN SEC_APPLICATION_FORMS.TEXT%TYPE,
      p_FORM_NAMESPACE   IN SEC_APPLICATION_FORMS.FORM_NAMESPACE%TYPE,
      p_FULL_NAME        IN SEC_APPLICATION_FORMS.FULL_NAME%TYPE,
      p_STYLE            IN SEC_APPLICATION_FORMS.STYLE%TYPE,
      p_FORM_TYPE        IN SEC_APPLICATION_FORMS.FORM_TYPE%TYPE,
      p_HELP_URL         IN SEC_APPLICATION_FORMS.HELP_URL%TYPE,
      p_WINDOW_STATE     IN SEC_APPLICATION_FORMS.WINDOW_STATE%TYPE,
      p_ALLOW_MULTIPLE   IN SEC_APPLICATION_FORMS.ALLOW_MULTIPLE%TYPE,
      p_INDEX_POSITION   IN SEC_APPLICATION_FORMS.INDEX_POSITION%TYPE,
      p_TAB_ID           IN SEC_APPLICATION_FORMS.TAB_ID%TYPE,
      p_STATUS           IN SEC_APPLICATION_FORMS.STATUS%TYPE,
      p_ENABLED          IN SEC_APPLICATION_FORMS.ENABLED%TYPE,
      p_ICON             IN SEC_APPLICATION_FORMS.ICON%TYPE,
      p_MENUICON         IN SEC_APPLICATION_FORMS.MENUICON%TYPE,
      p_CREATEDATE       IN SEC_APPLICATION_FORMS.CREATEDATE%TYPE,
      p_CREATEBY         IN SEC_APPLICATION_FORMS.CREATEBY%TYPE,
      p_ATTRIBUTE1       IN SEC_APPLICATION_FORMS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2       IN SEC_APPLICATION_FORMS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3       IN SEC_APPLICATION_FORMS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4       IN SEC_APPLICATION_FORMS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5       IN SEC_APPLICATION_FORMS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6       IN SEC_APPLICATION_FORMS.ATTRIBUTE6%TYPE);

   PROCEDURE P_Insert (
      p_FORM_ID          IN OUT SEC_APPLICATION_FORMS.FORM_ID%TYPE,
      p_FORM_NAME        IN     SEC_APPLICATION_FORMS.FORM_NAME%TYPE,
      p_TEXT             IN     SEC_APPLICATION_FORMS.TEXT%TYPE,
      p_FORM_NAMESPACE   IN     SEC_APPLICATION_FORMS.FORM_NAMESPACE%TYPE,
      p_FULL_NAME        IN     SEC_APPLICATION_FORMS.FULL_NAME%TYPE,
      p_STYLE            IN     SEC_APPLICATION_FORMS.STYLE%TYPE,
      p_FORM_TYPE        IN     SEC_APPLICATION_FORMS.FORM_TYPE%TYPE,
      p_HELP_URL         IN     SEC_APPLICATION_FORMS.HELP_URL%TYPE,
      p_WINDOW_STATE     IN     SEC_APPLICATION_FORMS.WINDOW_STATE%TYPE,
      p_ALLOW_MULTIPLE   IN     SEC_APPLICATION_FORMS.ALLOW_MULTIPLE%TYPE,
      p_INDEX_POSITION   IN     SEC_APPLICATION_FORMS.INDEX_POSITION%TYPE,
      p_TAB_ID           IN     SEC_APPLICATION_FORMS.TAB_ID%TYPE,
      p_STATUS           IN     SEC_APPLICATION_FORMS.STATUS%TYPE,
      p_ENABLED          IN     SEC_APPLICATION_FORMS.ENABLED%TYPE,
      p_ICON             IN     SEC_APPLICATION_FORMS.ICON%TYPE,
      p_MENUICON         IN     SEC_APPLICATION_FORMS.MENUICON%TYPE,
      p_CREATEDATE       IN     SEC_APPLICATION_FORMS.CREATEDATE%TYPE,
      p_CREATEBY         IN     SEC_APPLICATION_FORMS.CREATEBY%TYPE,
      p_ATTRIBUTE1       IN     SEC_APPLICATION_FORMS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2       IN     SEC_APPLICATION_FORMS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3       IN     SEC_APPLICATION_FORMS.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4       IN     SEC_APPLICATION_FORMS.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5       IN     SEC_APPLICATION_FORMS.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6       IN     SEC_APPLICATION_FORMS.ATTRIBUTE6%TYPE);

   PROCEDURE P_Delete (p_FORM_ID IN SEC_APPLICATION_FORMS.FORM_ID%TYPE);
END PKG_SEC_APPLICATION_FORMS;
/


DROP PACKAGE BODY DSS.PKG_SEC_APPLICATION_FORMS;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_SEC_APPLICATION_FORMS
AS
   PROCEDURE P_LOADBYPRIMARYKEY (
      P_FORM_ID   IN     SEC_APPLICATION_FORMS.FORM_ID%TYPE,
      OUTCURSOR      OUT MYGEN.SQLCUR)
   IS
   BEGIN
      OPEN OUTCURSOR FOR
         SELECT FORM_ID,
                FORM_NAME,
                TEXT,
                FORM_NAMESPACE,
                FULL_NAME,
                STYLE,
                FORM_TYPE,
                HELP_URL,
                WINDOW_STATE,
                ALLOW_MULTIPLE,
                INDEX_POSITION,
                TAB_ID,
                STATUS,
                ENABLED,
                ICON,
                MENUICON,
                CREATEDATE,
                CREATEBY,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6
           FROM SEC_APPLICATION_FORMS
          WHERE FORM_ID = P_FORM_ID;
   END P_LOADBYPRIMARYKEY;


   PROCEDURE P_LOADBYUSERNAME (
      P_USER_NAME   IN     SEC_USER_FORM_ACCESS.USER_NAME%TYPE,
      P_TAB_ID    IN     SEC_APPLICATION_FORMS.TAB_ID%TYPE,
      OUTCURSOR        OUT MYGEN.SQLCUR)
   IS
   BEGIN
      OPEN OUTCURSOR FOR
         SELECT FRM.FORM_ID,
                FRM.FORM_NAME,
                FRM.TEXT,
                FRM.FORM_NAMESPACE,
                FRM.FULL_NAME,
                FRM.STYLE,
                FRM.FORM_TYPE,
                FRM.HELP_URL,
                FRM.WINDOW_STATE,
                FRM.ALLOW_MULTIPLE,
                FRM.INDEX_POSITION,
                FRM.TAB_ID,
                FRM.STATUS,
                FRM.ENABLED,
                FRM.ICON,
                FRM.MENUICON,
                FRM.CREATEDATE,
                FRM.CREATEBY,
                FRM.ATTRIBUTE1,
                FRM.ATTRIBUTE2,
                FRM.ATTRIBUTE3,
                FRM.ATTRIBUTE4,
                FRM.ATTRIBUTE5,
                FRM.ATTRIBUTE6
           FROM    SEC_APPLICATION_FORMS FRM
                LEFT OUTER JOIN
                   SEC_USER_FORM_ACCESS USR
                ON FRM.FORM_ID = USR.FORM_ID
          WHERE UPPER(USER_NAME) = UPPER(P_USER_NAME)
          AND P_TAB_ID =  FRM.TAB_ID  and  USR.ENABLED = 'Y' ;
          
   END P_LOADBYUSERNAME;


   PROCEDURE P_LOADBYFULLNAME (
      P_FULL_NAME   IN     SEC_APPLICATION_FORMS.FULL_NAME%TYPE,
      OUTCURSOR        OUT MYGEN.SQLCUR)
   IS
   BEGIN
      OPEN OUTCURSOR FOR
         SELECT FORM_ID,
                FORM_NAME,
                TEXT,
                FORM_NAMESPACE,
                FULL_NAME,
                STYLE,
                FORM_TYPE,
                HELP_URL,
                WINDOW_STATE,
                ALLOW_MULTIPLE,
                INDEX_POSITION,
                TAB_ID,
                STATUS,
                ENABLED,
                ICON,
                MENUICON,
                CREATEDATE,
                CREATEBY,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6
           FROM SEC_APPLICATION_FORMS
          WHERE FULL_NAME = P_FULL_NAME;
   END P_LOADBYFULLNAME;


   PROCEDURE P_LOADBYTABID (
      P_TAB_ID    IN     SEC_APPLICATION_FORMS.TAB_ID%TYPE,
      OUTCURSOR      OUT MYGEN.SQLCUR)
   IS
   BEGIN
      OPEN OUTCURSOR FOR
         SELECT FORM_ID,
                FORM_NAME,
                TEXT,
                FORM_NAMESPACE,
                FULL_NAME,
                STYLE,
                FORM_TYPE,
                HELP_URL,
                WINDOW_STATE,
                ALLOW_MULTIPLE,
                INDEX_POSITION,
                TAB_ID,
                STATUS,
                ENABLED,
                ICON,
                MENUICON,
                CREATEDATE,
                CREATEBY,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6
           FROM SEC_APPLICATION_FORMS
          WHERE TAB_ID = P_TAB_ID;
   END P_LOADBYTABID;

   PROCEDURE P_LOADALL (OUTCURSOR OUT MYGEN.SQLCUR)
   IS
   BEGIN
      OPEN OUTCURSOR FOR
         SELECT FORM_ID,
                FORM_NAME,
                TEXT,
                FORM_NAMESPACE,
                FULL_NAME,
                STYLE,
                FORM_TYPE,
                HELP_URL,
                WINDOW_STATE,
                ALLOW_MULTIPLE,
                INDEX_POSITION,
                TAB_ID,
                STATUS,
                ENABLED,
                ICON,
                MENUICON,
                CREATEDATE,
                CREATEBY,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6
           FROM SEC_APPLICATION_FORMS;
   END P_LOADALL;


   PROCEDURE P_UPDATE (
      P_FORM_ID          IN SEC_APPLICATION_FORMS.FORM_ID%TYPE,
      P_FORM_NAME        IN SEC_APPLICATION_FORMS.FORM_NAME%TYPE,
      P_TEXT             IN SEC_APPLICATION_FORMS.TEXT%TYPE,
      P_FORM_NAMESPACE   IN SEC_APPLICATION_FORMS.FORM_NAMESPACE%TYPE,
      P_FULL_NAME        IN SEC_APPLICATION_FORMS.FULL_NAME%TYPE,
      P_STYLE            IN SEC_APPLICATION_FORMS.STYLE%TYPE,
      P_FORM_TYPE        IN SEC_APPLICATION_FORMS.FORM_TYPE%TYPE,
      P_HELP_URL         IN SEC_APPLICATION_FORMS.HELP_URL%TYPE,
      P_WINDOW_STATE     IN SEC_APPLICATION_FORMS.WINDOW_STATE%TYPE,
      P_ALLOW_MULTIPLE   IN SEC_APPLICATION_FORMS.ALLOW_MULTIPLE%TYPE,
      P_INDEX_POSITION   IN SEC_APPLICATION_FORMS.INDEX_POSITION%TYPE,
      P_TAB_ID           IN SEC_APPLICATION_FORMS.TAB_ID%TYPE,
      P_STATUS           IN SEC_APPLICATION_FORMS.STATUS%TYPE,
      P_ENABLED          IN SEC_APPLICATION_FORMS.ENABLED%TYPE,
      P_ICON             IN SEC_APPLICATION_FORMS.ICON%TYPE,
      P_MENUICON         IN SEC_APPLICATION_FORMS.MENUICON%TYPE,
      P_CREATEDATE       IN SEC_APPLICATION_FORMS.CREATEDATE%TYPE,
      P_CREATEBY         IN SEC_APPLICATION_FORMS.CREATEBY%TYPE,
      P_ATTRIBUTE1       IN SEC_APPLICATION_FORMS.ATTRIBUTE1%TYPE,
      P_ATTRIBUTE2       IN SEC_APPLICATION_FORMS.ATTRIBUTE2%TYPE,
      P_ATTRIBUTE3       IN SEC_APPLICATION_FORMS.ATTRIBUTE3%TYPE,
      P_ATTRIBUTE4       IN SEC_APPLICATION_FORMS.ATTRIBUTE4%TYPE,
      P_ATTRIBUTE5       IN SEC_APPLICATION_FORMS.ATTRIBUTE5%TYPE,
      P_ATTRIBUTE6       IN SEC_APPLICATION_FORMS.ATTRIBUTE6%TYPE)
   IS
   BEGIN
      UPDATE SEC_APPLICATION_FORMS
         SET FORM_ID = P_FORM_ID,
             FORM_NAME = P_FORM_NAME,
             TEXT = P_TEXT,
             FORM_NAMESPACE = P_FORM_NAMESPACE,
             FULL_NAME = P_FULL_NAME,
             STYLE = P_STYLE,
             FORM_TYPE = P_FORM_TYPE,
             HELP_URL = P_HELP_URL,
             WINDOW_STATE = P_WINDOW_STATE,
             ALLOW_MULTIPLE = P_ALLOW_MULTIPLE,
             INDEX_POSITION = P_INDEX_POSITION,
             TAB_ID = P_TAB_ID,
             STATUS = P_STATUS,
             ENABLED = P_ENABLED,
             ICON = P_ICON,
             MENUICON = P_MENUICON,
             CREATEDATE = P_CREATEDATE,
             CREATEBY = P_CREATEBY,
             ATTRIBUTE1 = P_ATTRIBUTE1,
             ATTRIBUTE2 = P_ATTRIBUTE2,
             ATTRIBUTE3 = P_ATTRIBUTE3,
             ATTRIBUTE4 = P_ATTRIBUTE4,
             ATTRIBUTE5 = P_ATTRIBUTE5,
             ATTRIBUTE6 = P_ATTRIBUTE6
       WHERE FORM_ID = P_FORM_ID;
   END P_UPDATE;


   PROCEDURE P_INSERT (
      P_FORM_ID          IN OUT SEC_APPLICATION_FORMS.FORM_ID%TYPE,
      P_FORM_NAME        IN     SEC_APPLICATION_FORMS.FORM_NAME%TYPE,
      P_TEXT             IN     SEC_APPLICATION_FORMS.TEXT%TYPE,
      P_FORM_NAMESPACE   IN     SEC_APPLICATION_FORMS.FORM_NAMESPACE%TYPE,
      P_FULL_NAME        IN     SEC_APPLICATION_FORMS.FULL_NAME%TYPE,
      P_STYLE            IN     SEC_APPLICATION_FORMS.STYLE%TYPE,
      P_FORM_TYPE        IN     SEC_APPLICATION_FORMS.FORM_TYPE%TYPE,
      P_HELP_URL         IN     SEC_APPLICATION_FORMS.HELP_URL%TYPE,
      P_WINDOW_STATE     IN     SEC_APPLICATION_FORMS.WINDOW_STATE%TYPE,
      P_ALLOW_MULTIPLE   IN     SEC_APPLICATION_FORMS.ALLOW_MULTIPLE%TYPE,
      P_INDEX_POSITION   IN     SEC_APPLICATION_FORMS.INDEX_POSITION%TYPE,
      P_TAB_ID           IN     SEC_APPLICATION_FORMS.TAB_ID%TYPE,
      P_STATUS           IN     SEC_APPLICATION_FORMS.STATUS%TYPE,
      P_ENABLED          IN     SEC_APPLICATION_FORMS.ENABLED%TYPE,
      P_ICON             IN     SEC_APPLICATION_FORMS.ICON%TYPE,
      P_MENUICON         IN     SEC_APPLICATION_FORMS.MENUICON%TYPE,
      P_CREATEDATE       IN     SEC_APPLICATION_FORMS.CREATEDATE%TYPE,
      P_CREATEBY         IN     SEC_APPLICATION_FORMS.CREATEBY%TYPE,
      P_ATTRIBUTE1       IN     SEC_APPLICATION_FORMS.ATTRIBUTE1%TYPE,
      P_ATTRIBUTE2       IN     SEC_APPLICATION_FORMS.ATTRIBUTE2%TYPE,
      P_ATTRIBUTE3       IN     SEC_APPLICATION_FORMS.ATTRIBUTE3%TYPE,
      P_ATTRIBUTE4       IN     SEC_APPLICATION_FORMS.ATTRIBUTE4%TYPE,
      P_ATTRIBUTE5       IN     SEC_APPLICATION_FORMS.ATTRIBUTE5%TYPE,
      P_ATTRIBUTE6       IN     SEC_APPLICATION_FORMS.ATTRIBUTE6%TYPE)
   IS
   BEGIN
      SELECT SEC_APPLICATION_FORM_ID.NEXTVAL INTO P_FORM_ID FROM DUAL;

      INSERT INTO SEC_APPLICATION_FORMS (FORM_ID,
                                         FORM_NAME,
                                         TEXT,
                                         FORM_NAMESPACE,
                                         FULL_NAME,
                                         STYLE,
                                         FORM_TYPE,
                                         HELP_URL,
                                         WINDOW_STATE,
                                         ALLOW_MULTIPLE,
                                         INDEX_POSITION,
                                         TAB_ID,
                                         STATUS,
                                         ENABLED,
                                         ICON,
                                         MENUICON,
                                         CREATEDATE,
                                         CREATEBY,
                                         ATTRIBUTE1,
                                         ATTRIBUTE2,
                                         ATTRIBUTE3,
                                         ATTRIBUTE4,
                                         ATTRIBUTE5,
                                         ATTRIBUTE6)
           VALUES (P_FORM_ID,
                   P_FORM_NAME,
                   P_TEXT,
                   P_FORM_NAMESPACE,
                   P_FULL_NAME,
                   P_STYLE,
                   P_FORM_TYPE,
                   P_HELP_URL,
                   P_WINDOW_STATE,
                   P_ALLOW_MULTIPLE,
                   P_INDEX_POSITION,
                   P_TAB_ID,
                   P_STATUS,
                   P_ENABLED,
                   P_ICON,
                   P_MENUICON,
                   P_CREATEDATE,
                   P_CREATEBY,
                   P_ATTRIBUTE1,
                   P_ATTRIBUTE2,
                   P_ATTRIBUTE3,
                   P_ATTRIBUTE4,
                   P_ATTRIBUTE5,
                   P_ATTRIBUTE6);
   END P_INSERT;

   PROCEDURE P_DELETE (P_FORM_ID IN SEC_APPLICATION_FORMS.FORM_ID%TYPE)
   IS
   BEGIN
      DELETE FROM SEC_APPLICATION_FORMS
            WHERE FORM_ID = P_FORM_ID;
   END P_DELETE;
END PKG_SEC_APPLICATION_FORMS;
/
