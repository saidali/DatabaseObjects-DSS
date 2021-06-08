DROP PACKAGE DSS.PKG_NOTIFICATION;

CREATE OR REPLACE PACKAGE DSS.PKG_NOTIFICATION
AS
   TYPE TY_ARRAY IS TABLE OF VARCHAR2 (200)
      INDEX BY BINARY_INTEGER;

   FUNCTION SPLIT_STRING_TO_ARRAY (P_STRING VARCHAR2, P_DELIMTER VARCHAR2)
      RETURN TY_ARRAY;

   PROCEDURE SEND_EMAIL (P_TOEMAILID    VARCHAR2,
                         P_SUBJECT      VARCHAR2,
                         P_TEXT         VARCHAR2);

   PROCEDURE SEND_SMS (P_RECIPIENT VARCHAR2, P_BODY VARCHAR2);

   PROCEDURE SEND_SMS_BY_TYPE (P_TYPE VARCHAR2, P_MESSAGE VARCHAR2);
END PKG_NOTIFICATION;
/


DROP PACKAGE BODY DSS.PKG_NOTIFICATION;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_NOTIFICATION
AS
   FUNCTION SPLIT_STRING_TO_ARRAY (P_STRING VARCHAR2, P_DELIMTER VARCHAR2)
      RETURN TY_ARRAY
   IS
      I            NUMBER := 0;
      POS          NUMBER := 0;
      V_P_STRING   VARCHAR2 (200) := P_STRING;
      STRINGS      TY_ARRAY;
   BEGIN
      POS :=
         INSTR (V_P_STRING,
                P_DELIMTER,
                1,
                1);

      IF POS = 0
      THEN
         STRINGS (I + 1) := V_P_STRING;
      END IF;

      WHILE (POS != 0)
      LOOP
         I := I + 1;
         STRINGS (I) := SUBSTR (V_P_STRING, 1, POS - 1);
         V_P_STRING := SUBSTR (V_P_STRING, POS + 1, LENGTH (V_P_STRING));
         POS :=
            INSTR (V_P_STRING,
                   P_DELIMTER,
                   1,
                   1);

         IF POS = 0
         THEN
            STRINGS (I + 1) := V_P_STRING;
         END IF;
      END LOOP;

      RETURN STRINGS;
   END SPLIT_STRING_TO_ARRAY;


   PROCEDURE SEND_EMAIL (P_TOEMAILID    VARCHAR2,
                         P_SUBJECT      VARCHAR2,
                         P_TEXT         VARCHAR2)
   AS
      C_MAILHOST   CONSTANT VARCHAR2 (30) := 'smtp-relay.gmail.com';
      CRLF         CONSTANT VARCHAR2 (2) := CHR (13) || CHR (10);
      V_FROM_EMAILID        VARCHAR2 (50) := 'SC_Notification@axiomtelecom.com';
      MAIL_CONN             UTL_SMTP.CONNECTION;
      P_TOEMAIL_ARRAY       TY_ARRAY;
   BEGIN
      MAIL_CONN := UTL_SMTP.OPEN_CONNECTION (C_MAILHOST, 587);
      UTL_SMTP.HELO (MAIL_CONN, C_MAILHOST);
      UTL_SMTP.MAIL (MAIL_CONN, V_FROM_EMAILID);

      P_TOEMAIL_ARRAY := SPLIT_STRING_TO_ARRAY (P_TOEMAILID, ';');

      FOR I IN 1 .. P_TOEMAIL_ARRAY.COUNT
      LOOP
         UTL_SMTP.RCPT (MAIL_CONN, P_TOEMAIL_ARRAY (I));
      END LOOP;

      UTL_SMTP.DATA (
         MAIL_CONN,
            'Date: '
         || TO_CHAR (SYSDATE, 'Dy, DD Mon YYYY hh24:mi:ss')
         || CRLF
         || 'From: '
         || V_FROM_EMAILID
         || CRLF
         || 'Subject: '
         || P_SUBJECT
         || CRLF
         || 'To: '
         || P_TOEMAILID
         || CRLF
         || CRLF
         || P_TEXT
         || CRLF);

      UTL_SMTP.QUIT (MAIL_CONN);
   END SEND_EMAIL;

   PROCEDURE SEND_SMS (P_RECIPIENT VARCHAR2, P_BODY VARCHAR2)
   AS
      REQ     UTL_HTTP.REQ;
      RESP    UTL_HTTP.RESP;
      VALUE   VARCHAR2 (1024);
      TEMP    VARCHAR (1000);
   BEGIN
      TEMP := REPLACE (P_BODY, ' ', 'ghjkk');
      REQ :=
         UTL_HTTP.BEGIN_REQUEST (
               'http://www.axiomeasy.com/sms/PhoneCare.aspx?M='
            || TEMP
            || 'Recipient='
            || P_RECIPIENT);
      UTL_HTTP.SET_HEADER (REQ, 'User-Agent', 'Mozilla/4.0');
      RESP := UTL_HTTP.GET_RESPONSE (REQ);

      LOOP
         UTL_HTTP.READ_LINE (RESP, VALUE, TRUE);
      END LOOP;

      UTL_HTTP.END_RESPONSE (RESP);
   EXCEPTION
      WHEN UTL_HTTP.END_OF_BODY
      THEN
         UTL_HTTP.END_RESPONSE (RESP);
   END;


   PROCEDURE SEND_SMS_BY_TYPE (P_TYPE VARCHAR2, P_MESSAGE VARCHAR2)
   AS
   BEGIN
      FOR S
         IN (SELECT RECIPIENT
               FROM DSS_USER_NOTIFICATIONS
              WHERE     notify_type = 'S'
                    AND notify_for = P_TYPE
                    AND active = 'Y')
      LOOP
         PKG_NOTIFICATION.SEND_SMS (S.RECIPIENT, P_MESSAGE);
      END LOOP;
   END SEND_SMS_BY_TYPE;
END PKG_NOTIFICATION;
/
