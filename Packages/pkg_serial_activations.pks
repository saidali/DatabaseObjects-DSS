DROP PACKAGE DSS.PKG_SERIAL_ACTIVATIONS;

CREATE OR REPLACE PACKAGE DSS.PKG_SERIAL_ACTIVATIONS
AS
   CURSOR CR_TEMP (
      P_FILE_SEQ    VARCHAR2)
   IS
      SELECT COUNT(*) ACTIVE_CNT ,
             PVKEYID.FILE_SEQ,
             TRUNC(PVKEYID.CREATE_DATE) CREATE_DATE,
             PVKEYID.PARENTKEY,
             PVKEYID.KEYID,
             PVKEYID.SERIALKEY ,
             FL.ATTRIBUTE1 COUNTRY_ID,FL.BRAND,
             CASE WHEN FL.ATTRIBUTE1 = '1000135354' THEN 'UAE' ELSE 'KSA' END
                AS COUNTRY_CODE,
             CASE WHEN  ISACTIVATIONDATE(FL.ATTRIBUTE2) = 'Y' 
                THEN TO_DATE (SUBSTR (FL.ATTRIBUTE2, 0, 8), 'YYYYMMDD') -1  ELSE  null END 
                AS ACTIVATION_DATE
                
        FROM TEMP_ACTIVATION_SERIALS
             UNPIVOT
                (SERIALKEY
                FOR KEYID
                IN (SERIAL_KEY_1 AS '1',
                   SERIAL_KEY_2 AS '2',
                   SERIAL_KEY_3 AS '3',
                   SERIAL_KEY_4 AS '4')) PVKEYID
             LEFT OUTER JOIN DSS_ACTIVATION_SERIAL ORGN
                ON PVKEYID.SERIALKEY = ORGN.SERIALKEY
             LEFT OUTER JOIN DSS_FILES FL ON PVKEYID.FILE_SEQ = FL.ROWSEQ
       WHERE PVKEYID.FILE_SEQ = P_FILE_SEQ AND ORGN.SERIALKEY IS NULL
       GROUP BY              PVKEYID.FILE_SEQ,
             TRUNC(PVKEYID.CREATE_DATE),
             PVKEYID.PARENTKEY,
             PVKEYID.KEYID,
             PVKEYID.SERIALKEY , FL.ATTRIBUTE1, FL.ATTRIBUTE2 ,FL.BRAND;
             
   CURSOR CR_TEMP2 (
      P_FILE_SEQ    VARCHAR2)
   IS
      SELECT COUNT(*) ACTIVE_CNT ,
             PVKEYID.FILE_SEQ,
             TRUNC(PVKEYID.CREATE_DATE) CREATE_DATE,
             PVKEYID.PARENTKEY,
             PVKEYID.KEYID,
             PVKEYID.SERIALKEY ,
             FL.ATTRIBUTE1 COUNTRY_ID,
             FL.BRAND,
             CASE WHEN FL.ATTRIBUTE1 = '1000135354' THEN 'UAE' ELSE 'KSA' END
                AS COUNTRY_CODE,
             CASE WHEN  ISACTIVATIONDATE(FL.ATTRIBUTE2) = 'Y' THEN TO_DATE (SUBSTR (FL.ATTRIBUTE2, 0, 8), 'YYYYMMDD') -1 ELSE  null END 
                AS ACTIVATION_DATE                
        FROM TEMP_ACTIVATION_SERIALS
             UNPIVOT
                (SERIALKEY
                FOR KEYID
                IN (SERIAL_KEY_1 AS '1',
                   SERIAL_KEY_2 AS '2',
                   SERIAL_KEY_3 AS '3',
                   SERIAL_KEY_4 AS '4')) PVKEYID
             LEFT OUTER JOIN DSS_ACTIVATION_SERIAL ORGN
                ON PVKEYID.SERIALKEY = ORGN.SERIALKEY
             LEFT OUTER JOIN DSS_FILES FL ON PVKEYID.FILE_SEQ = FL.ROWSEQ
       WHERE PVKEYID.FILE_SEQ = P_FILE_SEQ AND ORGN.SERIALKEY IS not NULL
       GROUP BY              PVKEYID.FILE_SEQ,
             TRUNC(PVKEYID.CREATE_DATE),
             PVKEYID.PARENTKEY,
             PVKEYID.KEYID,
             PVKEYID.SERIALKEY , FL.ATTRIBUTE1, FL.ATTRIBUTE2,FL.BRAND ;
                          

  PROCEDURE INS_SERIALS (P_FILE_SEQ VARCHAR2) ;
   TYPE RW_TEMP IS TABLE OF CR_TEMP%ROWTYPE;
    TYPE RW_TEMP2 IS TABLE OF CR_TEMP2%ROWTYPE;
END PKG_SERIAL_ACTIVATIONS;
/


DROP PACKAGE BODY DSS.PKG_SERIAL_ACTIVATIONS;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_SERIAL_ACTIVATIONS
AS
   PROCEDURE INS_SERIALS2 (P_FILE_SEQ VARCHAR2)
   AS
      TEMP_RW   RW_TEMP;
   BEGIN
      IF (CR_TEMP%ISOPEN)
      THEN
         CLOSE CR_TEMP;
      END IF;

      OPEN CR_TEMP (P_FILE_SEQ);

      LOOP
         FETCH CR_TEMP
              BULK COLLECT INTO TEMP_RW
            LIMIT 1000;

         FORALL rw IN 1 .. TEMP_RW.COUNT
            INSERT INTO DSS_ACTIVATION_SERIAL (FILE_SEQ,
                                               COUNTRY_CODE,
                                               COUNTRY_ID,
                                               KEYID,
                                               SERIALKEY,
                                               ACTIVATION_DATE,
                                               ACTIVE_CNT,
                                               BRAND)
            VALUES (TEMP_RW (RW).FILE_SEQ,
                    TEMP_RW (RW).COUNTRY_CODE,
                    TEMP_RW (RW).COUNTRY_ID,
                    TEMP_RW (RW).KEYID,
                    TEMP_RW (RW).SERIALKEY,
                    TEMP_RW (RW).ACTIVATION_DATE,
                    TEMP_RW (RW).ACTIVE_CNT,
                    TEMP_RW (RW).BRAND);


         /*looping
            for rw in 1..TEMP_RW.count
            loop
            insert or update satatment
            end  loop
         */
         EXIT WHEN CR_TEMP%NOTFOUND;
      END LOOP;

      DELETE FROM TEMP_ACTIVATION_SERIALS
       WHERE FILE_SEQ = P_FILE_SEQ;

      CLOSE CR_TEMP;
   END INS_SERIALS2;

   PROCEDURE INS_SERIALS (P_FILE_SEQ VARCHAR2)
   AS
      TEMP_RW   RW_TEMP2;
   BEGIN
      IF (CR_TEMP2%ISOPEN)
      THEN
         CLOSE CR_TEMP2;
      END IF;

      OPEN CR_TEMP2 (P_FILE_SEQ);

      LOOP
         FETCH CR_TEMP2
              BULK COLLECT INTO TEMP_RW
            LIMIT 1000;


         --      SELECT COUNT(*) ACTIVE_CNT ,
         --             PVKEYID.FILE_SEQ,
         --             TRUNC(PVKEYID.CREATE_DATE) CREATE_DATE,
         --             PVKEYID.PARENTKEY,
         --             PVKEYID.KEYID,
         --             PVKEYID.SERIALKEY ,
         --             FL.ATTRIBUTE1 COUNTRY_ID,
         --             FL.BRAND,
         --             CASE WHEN FL.ATTRIBUTE1 = '1000135354' THEN 'UAE' ELSE 'KSA' END
         --                AS COUNTRY_CODE,
         --             CASE WHEN  ISACTIVATIONDATE(FL.ATTRIBUTE2) = 'Y' THEN TO_DATE (SUBSTR (FL.ATTRIBUTE2, 0, 8), 'YYYYMMDD') -1 ELSE  null END
         --                AS ACTIVATION_DATE

         FORALL rw IN 1 .. TEMP_RW.COUNT
            INSERT INTO DSS_ACTIVATION_SERIAL_LOG (FILE_SEQ,
                                                   ACTIVE_CNT,
                                                   COUNTRY_CODE,
                                                   SERIALKEY,
                                                   ACTIVATION_DATE)
            VALUES (TEMP_RW (RW).FILE_SEQ,
                    TEMP_RW (RW).ACTIVE_CNT,
                    TEMP_RW (RW).COUNTRY_CODE,
                    TEMP_RW (RW).SERIALKEY,
                    TEMP_RW (RW).ACTIVATION_DATE);

         --            UPDATE DSS_ACTIVATION_SERIAL
         --               SET ACTIVE_CNT = NVL (ACTIVE_CNT, 0) + TEMP_RW (RW).ACTIVE_CNT,
         --                   COUNTRY_CODE = TEMP_RW (RW).COUNTRY_CODE,
         --                   ATTRIBUTE4 = TEMP_RW (RW).COUNTRY_ID,
         --                   ATTRIBUTE5 = TEMP_RW (RW).ACTIVATION_DATE
         --             WHERE SERIALKEY = TEMP_RW (RW).SERIALKEY;



         EXIT WHEN CR_TEMP2%NOTFOUND;
      END LOOP;

      CLOSE CR_TEMP2;

      INS_SERIALS2 (P_FILE_SEQ);

      UPDATE DSS_ACTIVATION_SERIAL ASL
         SET PARENTKEY =
                (SELECT PARENTKEY
                   FROM DSS_FILE_SERIALS FS
                  WHERE FS.SERIALKEY = ASL.SERIALKEY)
       WHERE PARENTKEY IS NULL AND FILE_SEQ = P_FILE_SEQ;
   END INS_SERIALS;
END PKG_SERIAL_ACTIVATIONS;
/
