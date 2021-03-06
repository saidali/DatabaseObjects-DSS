DROP VIEW DSS.V_USER_FORM_ACCESS;

CREATE OR REPLACE FORCE VIEW DSS.V_USER_FORM_ACCESS
(
    USER_NAME
   ,DISPLAY_NAME
   ,FORM_ID
   ,MODIFY_DATE
   ,EXPIRY_DATE
   ,CREATE_BY
   ,CREATE_DATE
   ,ENABLED
   ,FORM_NAME
   ,FORM_TEXT
   ,FORM_NAMESPACE
   ,FULL_NAME
   ,STYLE
   ,FORM_TYPE
   ,FORM_HELP_URL
   ,WINDOW_STATE
   ,ALLOW_MULTIPLE
   ,FORM_INDEX
   ,TAB_ID
   ,FORM_STATUS
   ,FORM_ICON
   ,FORM_MENUICON
   ,TAB_INDEX
   ,TAB_NAME
   ,TAB_TEXT
   ,TAB_HELP_URL
   ,TAB_ENABLED
   ,TAB_HIDDEN
   ,TAB_ICON
)
AS
    SELECT CAST('' AS VARCHAR2(100)) USER_NAME
          ,CAST('' AS VARCHAR2(200)) DISPLAY_NAME
          ,FRM.FORM_ID
          ,SYSDATE MODIFY_DATE
          ,SYSDATE EXPIRY_DATE
          ,CAST('' AS VARCHAR2(100)) CREATE_BY
          ,SYSDATE CREATE_DATE
          ,'N'
          ,FRM.FORM_NAME
          ,FRM.TEXT FORM_TEXT
          ,FRM.FORM_NAMESPACE
          ,FRM.FULL_NAME
          ,FRM.STYLE
          ,FRM.FORM_TYPE
          ,FRM.HELP_URL FORM_HELP_URL
          ,FRM.WINDOW_STATE
          ,FRM.ALLOW_MULTIPLE
          ,FRM.INDEX_POSITION FORM_INDEX
          ,FRM.TAB_ID
          ,FRM.STATUS FORM_STATUS
          ,FRM.ICON FORM_ICON
          ,FRM.MENUICON FORM_MENUICON
          ,TB.POSTION_INDEX TAB_INDEX
          ,TB.TAB_NAME
          ,TB.TEXT TAB_TEXT
          ,TB.HELP_URL TAB_HELP_URL
          ,TB.ENABLED TAB_ENABLED
          ,TB.HIDDEN TAB_HIDDEN
          ,TB.ICON TAB_ICON
    FROM SEC_APPLICATION_FORMS FRM
         LEFT OUTER JOIN SEC_APPLICATION_TABS TB ON FRM.TAB_ID = TB.TAB_ID;


GRANT SELECT ON DSS.V_USER_FORM_ACCESS TO SELDATA;
