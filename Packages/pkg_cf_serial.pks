DROP PACKAGE DSS.PKG_CF_SERIAL;

CREATE OR REPLACE PACKAGE DSS.PKG_CF_SERIAL
AS
   FUNCTION PAIRED_IMEIS  (P_SERIALKEY VARCHAR2) RETURN VARCHAR2 ;
   FUNCTION PAIRED_KEYS (P_SERIALKEY VARCHAR2) RETURN VARCHAR2 ; 
   FUNCTION PAIRED_IMEI (P_SERIALKEY VARCHAR2) RETURN VARCHAR2 ; 

END PKG_CF_SERIAL;
/


DROP PACKAGE BODY DSS.PKG_CF_SERIAL;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_CF_SERIAL
AS

   FUNCTION PAIRED_IMEI (P_SERIALKEY VARCHAR2)
      RETURN VARCHAR2
   AS
      P_KEY   VARCHAR2 (500);
   BEGIN
      SELECT PSN.SERIALKEY   
        INTO P_KEY
        FROM (SELECT PARENTKEY, SERIALKEY
                FROM DSS_FILE_SERIALS
               WHERE SERIALKEY = P_SERIALKEY) SN
             LEFT OUTER JOIN DSS_FILE_SERIALS PSN
                ON SN.PARENTKEY = PSN.PARENTKEY
                WHERE PSN.SERIALKEY != P_SERIALKEY 
                AND  PKG_LUHN.ISLUHNKEY(PSN.SERIALKEY) = 1 
                and rownum = 1 
                ;
                
                
                RETURN P_KEY ;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN NULL;
   END;
   
   FUNCTION PAIRED_IMEIS (P_SERIALKEY VARCHAR2)
      RETURN VARCHAR2
   AS
      P_KEY   VARCHAR2 (500);
   BEGIN
      SELECT LISTAGG (PSN.SERIALKEY, ';') WITHIN GROUP (ORDER BY KEYID)
        INTO P_KEY
        FROM (SELECT PARENTKEY, SERIALKEY
                FROM DSS_FILE_SERIALS
               WHERE SERIALKEY = P_SERIALKEY) SN
             LEFT OUTER JOIN DSS_FILE_SERIALS PSN
                ON SN.PARENTKEY = PSN.PARENTKEY
                WHERE PSN.SERIALKEY != P_SERIALKEY 
                AND  PKG_LUHN.ISLUHNKEY(PSN.SERIALKEY) = 1 
               -- and rownum = 1 
                ;
                
                
                RETURN P_KEY ;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN NULL;
   END;
   
      FUNCTION PAIRED_KEYS (P_SERIALKEY VARCHAR2)
      RETURN VARCHAR2
   AS
      P_KEY   VARCHAR2 (500);
   BEGIN
      SELECT LISTAGG (PSN.SERIALKEY, ';') WITHIN GROUP (ORDER BY KEYID)
        INTO P_KEY
        FROM (SELECT PARENTKEY, SERIALKEY
                FROM DSS_FILE_SERIALS
               WHERE SERIALKEY = P_SERIALKEY) SN
             LEFT OUTER JOIN DSS_FILE_SERIALS PSN
                ON SN.PARENTKEY = PSN.PARENTKEY
                WHERE PSN.SERIALKEY != P_SERIALKEY 
                --AND  PKG_LUHN.ISLUHNKEY(PSN.SERIALKEY) = 1 
               -- and rownum = 1 
                ;
                
                
                RETURN P_KEY ;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN NULL;
   END;
   
   
   
   
END PKG_CF_SERIAL;
/
