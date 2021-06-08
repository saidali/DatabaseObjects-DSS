DROP PACKAGE DSS.PKG_LUHN;

CREATE OR REPLACE PACKAGE DSS.PKG_LUHN
AS
   PROCEDURE SP_GETCHECK_DIGIT (SERIAL_KEY NUMBER, DIGIT OUT NUMBER);

   FUNCTION FUN_GETCHECK_DIGIT (SERIAL_KEY NUMBER)
      RETURN NUMBER;
      
   FUNCTION ISLUHNKEY (SERIAL_KEY VARCHAR2)
      RETURN INT ; 
   FUNCTION IS_NUMBER (P_STRING IN VARCHAR2)
      RETURN INT ;
            
END PKG_LUHN;
/


DROP PACKAGE BODY DSS.PKG_LUHN;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_LUHN
AS
   PROCEDURE SP_GETCHECK_DIGIT (SERIAL_KEY NUMBER, DIGIT OUT NUMBER)
   AS
      L_X     NUMBER := SERIAL_KEY;
      L_SUM   NUMBER := 0;
      D       NUMBER;
   BEGIN
      WHILE L_X > 0
      LOOP
         D := MOD (L_X, 10) * 2;

         IF D > 9
         THEN
            D := D - 9;
         END IF;

         L_SUM := L_SUM + D;
         L_X := TRUNC (L_X / 10);
         D := MOD (L_X, 10);
         L_SUM := L_SUM + D;
         L_X := TRUNC (L_X / 10);
      END LOOP;

      L_SUM := 10 - MOD (L_SUM, 10);
      DIGIT := MOD (L_SUM, 10);
   END SP_GETCHECK_DIGIT;

   FUNCTION FUN_GETCHECK_DIGIT (SERIAL_KEY NUMBER)
      RETURN NUMBER
   AS
      L_X     NUMBER := SERIAL_KEY;
      L_SUM   NUMBER := 0;
      D       NUMBER;
   BEGIN
      WHILE L_X > 0
      LOOP
         D := MOD (L_X, 10) * 2;

         IF D > 9
         THEN
            D := D - 9;
         END IF;

         L_SUM := L_SUM + D;
         L_X := TRUNC (L_X / 10);
         D := MOD (L_X, 10);
         L_SUM := L_SUM + D;
         L_X := TRUNC (L_X / 10);
      END LOOP;

      L_SUM := 10 - MOD (L_SUM, 10);
      RETURN MOD (L_SUM, 10);
   END FUN_GETCHECK_DIGIT;


   FUNCTION IS_NUMBER (P_STRING IN VARCHAR2)
      RETURN INT
   IS
      V_NEW_NUM   NUMBER;
   BEGIN
      V_NEW_NUM := TO_NUMBER (P_STRING);
      RETURN 1;
   EXCEPTION
      WHEN VALUE_ERROR
      THEN
         RETURN 0;
   END IS_NUMBER;


   FUNCTION ISLUHNKEY (SERIAL_KEY VARCHAR2)
      RETURN INT
   AS
      CHECK_DIGIT      NUMBER;
      TEMPSERIAL_KEY   NUMBER;
   BEGIN
      IF IS_NUMBER (SERIAL_KEY) = 0
      THEN
         RETURN 0;
      ELSE
         CHECK_DIGIT := SUBSTR (SERIAL_KEY, LENGTH (SERIAL_KEY), 1);
         TEMPSERIAL_KEY := SUBSTR (SERIAL_KEY, 0, LENGTH (SERIAL_KEY) - 1);

         IF FUN_GETCHECK_DIGIT (TEMPSERIAL_KEY) = CHECK_DIGIT
         THEN
            RETURN 1;
         ELSE
            RETURN 0;
         END IF;
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN 0;
   END ISLUHNKEY;
END PKG_LUHN;
/
