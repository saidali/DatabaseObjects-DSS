DROP PROCEDURE DSS.PC_SERIAL_PARENT;

CREATE OR REPLACE PROCEDURE DSS.pc_serial_parent (p_serialkey VARCHAR2)
AS
   p_ParentKey   VARCHAR2 (100);
   cnt           NUMBER;
BEGIN
   SELECT PARENTKEY
     INTO p_ParentKey
     FROM dss_serials_master
    WHERE serialkey = p_serialkey AND ROWNUM = 1;


   SELECT COUNT (*)
     INTO cnt
     FROM dss_serials_master
    WHERE serialkey = p_serialkey;

   IF cnt = 0
   THEN
      DBMS_OUTPUT.put_line ('Serial Key Not exists');
      RETURN;
   END IF;

   IF p_ParentKey IS NOT NULL
   THEN
      UPDATE dss_serials_master
         SET PARENTKEY = p_serialkey
       WHERE serialkey = p_serialkey;


      UPDATE dss_serials_child
         SET PARENTKEY = p_serialkey
       WHERE PARENTKEY = p_ParentKey;
   ELSE
      DBMS_OUTPUT.put_line ('Parent Key is null ');
   END IF;
EXCEPTION
   WHEN OTHERS
   THEN
      DBMS_OUTPUT.put_line ('Serial Key Not exists');
END;
/
