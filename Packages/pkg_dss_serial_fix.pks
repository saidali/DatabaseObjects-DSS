DROP PACKAGE DSS.PKG_DSS_SERIAL_FIX;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_SERIAL_FIX
AS

 PROCEDURE START_FIX ; 
 
   CURSOR CR_NonIMEI_Serials
   IS
      SELECT *
        FROM DSS_SERIAL_CORRECTION   ;

   TYPE RW_NonIMEI_Serials IS TABLE OF CR_NonIMEI_Serials%ROWTYPE;
END PKG_DSS_SERIAL_FIX;
/


DROP PACKAGE BODY DSS.PKG_DSS_SERIAL_FIX;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_SERIAL_FIX
AS
   PROCEDURE START_FIX
   AS
      TEMP_RW   RW_NonIMEI_Serials;
   BEGIN
      IF (CR_NonIMEI_Serials%ISOPEN)
      THEN
         CLOSE CR_NonIMEI_Serials;
      END IF;

      OPEN CR_NonIMEI_Serials;

      LOOP
         FETCH CR_NonIMEI_Serials
              BULK COLLECT INTO TEMP_RW
            LIMIT 1000;

         FORALL RW IN 1 .. TEMP_RW.COUNT
            UPDATE DSS_SERIALS_CHILD
               SET PARENTKEY = TEMP_RW (RW).SERIALKEY
             WHERE PARENTKEY = TEMP_RW (RW).PARENTKEY;

         FORALL RW IN 1 .. TEMP_RW.COUNT
             DELETE FROM  DSS_SERIAL_CORRECTION 
             WHERE PARENTKEY = TEMP_RW (RW).PARENTKEY;
             
           

         /*bulk
            forall rw in 1..TEMP_RW.count
            insert or update satatment
         */
         /*looping
            for rw in 1..TEMP_RW.count
            loop
            insert or update satatment
            end  loop
         */
         EXIT WHEN CR_NonIMEI_Serials%NOTFOUND;
      END LOOP;

  
        
      CLOSE CR_NonIMEI_Serials;
   END START_FIX;
END PKG_DSS_SERIAL_FIX;
/
