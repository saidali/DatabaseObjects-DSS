DROP PACKAGE DSS.PKG_SAM_TEMP;

CREATE OR REPLACE PACKAGE DSS.PKG_SAM_TEMP
AS

   PROCEDURE UPSERT_MASTER ;
    
   CURSOR CR_SERIALS
   IS
      SELECT SN.SERIALKEY,
             SN.PRODUCT_CODE,
             SYSDATE LAST_SCANDATE,
             SN.SERIALKEY PARENTKEY ,
             'N' HASCHILD,
             'Y' ISPARENT
        FROM TEM_SAMSUNG_SERIALS SN
       WHERE 1 = 1  ;

   TYPE RW_SERIALS IS TABLE OF CR_SERIALS%ROWTYPE;
END PKG_SAM_TEMP;
/


DROP PACKAGE BODY DSS.PKG_SAM_TEMP;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_SAM_TEMP
AS
   PROCEDURE UPSERT_MASTER
   AS
      TEMP_RW      RW_SERIALS;
      P_RUNDATE    DATE;
      P_ROWCOUNT   NUMBER DEFAULT 0;
   BEGIN
      P_RUNDATE := SYSDATE;

      IF (CR_SERIALS%ISOPEN)
      THEN
         CLOSE CR_SERIALS;
      END IF;

      OPEN CR_SERIALS;

      LOOP
         FETCH CR_SERIALS
              BULK COLLECT INTO TEMP_RW
            LIMIT 1000;

         P_ROWCOUNT := NVL (P_ROWCOUNT, 0) + TEMP_RW.COUNT;

         /*UPDATE CHILD TABLE FOR MISSING SERIALS */
         BEGIN
            FORALL RW IN 1 .. TEMP_RW.COUNT
               MERGE INTO DSS_SERIALS_CHILD TRG
                USING (SELECT TEMP_RW (RW).SERIALKEY AS SERIALKEY
                         FROM DUAL) MTCH
                   ON (MTCH.SERIALKEY = TRG.SERIALKEY)
               WHEN NOT MATCHED
               THEN
                  INSERT (SERIALKEY,
                          PARENTKEY,
                          ISPARENT,
                          keyid,
                          DATA_SRC)
                  VALUES (TEMP_RW (RW).SERIALKEY,
                          TEMP_RW (RW).SERIALKEY,
                          'Y',
                          1,
                          'ML');
         END;


         /*UPSERT SERIAL TABLE FOR MISSING SERIALS */
         BEGIN
            FORALL RW IN 1 .. TEMP_RW.COUNT
               MERGE INTO DSS_SERIALS_MASTER TRG
                USING (SELECT TEMP_RW (RW).SERIALKEY AS SERIALKEY,
                              TEMP_RW (RW).PRODUCT_CODE AS PRODUCT_CODE
                         FROM DUAL) MTCH
                   ON (    MTCH.SERIALKEY = TRG.SERIALKEY
                       AND MTCH.PRODUCT_CODE = TRG.PRODUCT_CODE)
               WHEN MATCHED
               THEN
                  UPDATE SET
                     LAST_SCANDATE = TEMP_RW (RW).LAST_SCANDATE,
                     PARENTKEY =
                        CASE
                           WHEN TEMP_RW (RW).HASCHILD = 'N'
                           THEN
                              TEMP_RW (RW).SERIALKEY
                           ELSE
                              TEMP_RW (RW).PARENTKEY
                        END,
                     ISPARENT =
                        CASE
                           WHEN TEMP_RW (RW).HASCHILD = 'N'
                           THEN
                              'Y'
                           ELSE
                              TEMP_RW (RW).ISPARENT
                        END,
                     HASCHILD = TEMP_RW (RW).HASCHILD,
                     UPDATE_CNT = NVL (UPDATE_CNT, 0) + 1
               WHEN NOT MATCHED
               THEN
                  INSERT (SERIALKEY,
                          PARENTKEY,
                          PRODUCT_CODE,
                          ISPARENT,
                          HASCHILD,
                          LAST_SCANDATE,
                          UPDATE_CNT)
                  VALUES (
                            TEMP_RW (RW).SERIALKEY,
                            CASE
                               WHEN TEMP_RW (RW).HASCHILD = 'N'
                               THEN
                                  TEMP_RW (RW).SERIALKEY
                               ELSE
                                  TEMP_RW (RW).PARENTKEY
                            END,
                            TEMP_RW (RW).PRODUCT_CODE,
                            CASE
                               WHEN TEMP_RW (RW).HASCHILD = 'N'
                               THEN
                                  'Y'
                               ELSE
                                  TEMP_RW (RW).ISPARENT
                            END,
                            TEMP_RW (RW).HASCHILD,
                            TEMP_RW (RW).LAST_SCANDATE,
                            1);
         END;


         EXIT WHEN CR_SERIALS%NOTFOUND;
      END LOOP;

      CLOSE CR_SERIALS;
   END UPSERT_MASTER;
END;
/
