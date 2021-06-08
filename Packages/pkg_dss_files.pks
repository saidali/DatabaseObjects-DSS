DROP PACKAGE DSS.PKG_DSS_FILES;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_FILES
AS
   CURSOR CR_SERIALS_UNPIVOT (
      P_FILE_SEQ    NUMBER)
   IS
      SELECT                                        ----PVKEYID.ROWSEQ UPLSEQ,
            COUNT (*) UPL_CNT,
             NULL UPLSEQ,
             PVKEYID.FILE_SEQ,
             PVKEYID.BRAND,
             PVKEYID.PART_CODE1,
             PVKEYID.PART_CODE2,
             PVKEYID.EAN_CODE1,
             PVKEYID.EAN_CODE2,
             PVKEYID.MODEL_CODE1,
             PVKEYID.MODEL_CODE2,
             PVKEYID.INVOICE_NO,
             PVKEYID.INVOICE_REF1,
             PVKEYID.INVOICE_REF2,
             TRUNC (PVKEYID.CREATE_DATE) CREATE_DATE,
             PVKEYID.PARENTKEY,
             PVKEYID.KEYID,
             CASE WHEN PVKEYID.KEYID = 1 THEN 'Y' ELSE 'N' END ISPARENT,
             PVKEYID.SERIALKEY,
             CASE WHEN ORGN.SERIALKEY IS NOT NULL THEN 'Y' ELSE 'N' END
                IS_EXISTS,
             AX_PRODUCT_CODE,
             COUNTRYCODE
        FROM TEMP_FILE_SERIALS
             UNPIVOT
                (SERIALKEY
                FOR KEYID
                IN (SERIAL_KEY_1 AS '1',
                   SERIAL_KEY_2 AS '2',
                   SERIAL_KEY_3 AS '3',
                   SERIAL_KEY_4 AS '4')) PVKEYID
             LEFT OUTER JOIN DSS_FILE_SERIALS ORGN
                ON PVKEYID.SERIALKEY = ORGN.SERIALKEY
       WHERE     PVKEYID.FILE_SEQ = P_FILE_SEQ
             AND ORGN.SERIALKEY IS NULL
             ---AND COUNTRYCODE IS NOT NULL
      GROUP BY PVKEYID.FILE_SEQ,
               PVKEYID.BRAND,
               PVKEYID.PART_CODE1,
               PVKEYID.PART_CODE2,
               PVKEYID.EAN_CODE1,
               PVKEYID.EAN_CODE2,
               PVKEYID.MODEL_CODE1,
               PVKEYID.MODEL_CODE2,
               PVKEYID.INVOICE_NO,
               PVKEYID.INVOICE_REF1,
               PVKEYID.INVOICE_REF2,
               TRUNC (PVKEYID.CREATE_DATE),
               PVKEYID.PARENTKEY,
               PVKEYID.KEYID,
               PVKEYID.SERIALKEY,
               ORGN.SERIALKEY,
               AX_PRODUCT_CODE,
               COUNTRYCODE;

   --      SELECT ----PVKEYID.ROWSEQ UPLSEQ,
   --              COUNT(*)  UPL_CNT ,
   --             NULL UPLSEQ,
   --             PVKEYID.FILE_SEQ,
   --             PVKEYID.BRAND,
   --             PVKEYID.PART_CODE1,
   --             PVKEYID.PART_CODE2,
   --             PVKEYID.EAN_CODE1,
   --             PVKEYID.EAN_CODE2,
   --             PVKEYID.MODEL_CODE1,
   --             PVKEYID.MODEL_CODE2,
   --             PVKEYID.INVOICE_NO,
   --             PVKEYID.INVOICE_REF1,
   --             PVKEYID.INVOICE_REF2,
   --             TRUNC (PVKEYID.CREATE_DATE) CREATE_DATE,
   --             PVKEYID.PARENTKEY,
   --             PVKEYID.KEYID,
   --             CASE WHEN PVKEYID.KEYID = 1 THEN 'Y' ELSE 'N' END ISPARENT,
   --             PVKEYID.SERIALKEY,
   --             CASE WHEN ORGN.SERIALKEY IS NOT NULL THEN 'Y' ELSE 'N' END
   --                IS_EXISTS,
   --             AX_PRODUCT_CODE,
   --             COUNTRYCODE
   --        FROM TEMP_FILE_SERIALS
   --             UNPIVOT
   --                (SERIALKEY
   --                FOR KEYID
   --                IN (SERIAL_KEY_1 AS '1',
   --                   SERIAL_KEY_2 AS '2',
   --                   SERIAL_KEY_3 AS '3',
   --                   SERIAL_KEY_4 AS '4')) PVKEYID
   --             LEFT OUTER JOIN DSS_FILE_SERIALS ORGN
   --                ON PVKEYID.SERIALKEY = ORGN.SERIALKEY
   --       WHERE     PVKEYID.FILE_SEQ = P_FILE_SEQ
   --             AND ORGN.SERIALKEY IS NULL
   --             AND COUNTRYCODE IS NOT NULL
   --      GROUP BY PVKEYID.FILE_SEQ,
   --               PVKEYID.BRAND,
   --               PVKEYID.PART_CODE1,
   --               PVKEYID.PART_CODE2,
   --               PVKEYID.EAN_CODE1,
   --               PVKEYID.EAN_CODE2,
   --               PVKEYID.MODEL_CODE1,
   --               PVKEYID.MODEL_CODE2,
   --               PVKEYID.INVOICE_NO,
   --               PVKEYID.INVOICE_REF1,
   --               PVKEYID.INVOICE_REF2,
   --               TRUNC (PVKEYID.CREATE_DATE),
   --               PVKEYID.PARENTKEY,
   --               PVKEYID.KEYID,
   --               PVKEYID.SERIALKEY,
   --               AX_PRODUCT_CODE,
   --               COUNTRYCODE;

   TYPE RW_SERIALS_UNPIVOT IS TABLE OF CR_SERIALS_UNPIVOT%ROWTYPE;

   PROCEDURE INS_FILE (P_FILENAME VARCHAR2, P_ROWSEQ IN OUT NUMBER);

   PROCEDURE INS_FILE (P_FILENAME           VARCHAR2,
                       P_FILE_PATH          VARCHAR2,
                       P_BRAND              VARCHAR2,
                       P_ROWSEQ      IN OUT NUMBER);

   PROCEDURE INS_FILE (P_FILENAME           VARCHAR2,
                       P_FILE_PATH          VARCHAR2,
                       P_BRAND              VARCHAR2,
                       P_TYPE               VARCHAR2,
                       P_ROWSEQ      IN OUT NUMBER);

   PROCEDURE INS_SERIALS (P_FILE_SEQ NUMBER);
END;
/


DROP PACKAGE BODY DSS.PKG_DSS_FILES;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_FILES
AS
   PROCEDURE INS_FILE (P_FILENAME           VARCHAR2,
                       P_FILE_PATH          VARCHAR2,
                       P_BRAND              VARCHAR2,
                       P_ROWSEQ      IN OUT NUMBER)
   AS
   BEGIN
      INSERT INTO DSS_FILES (FILE_NAME, FILE_PATH, BRAND)
      VALUES (P_FILENAME, P_FILE_PATH, P_BRAND)
      RETURNING ROWSEQ
        INTO P_ROWSEQ;
   END;

   PROCEDURE INS_FILE (P_FILENAME           VARCHAR2,
                       P_ROWSEQ      IN OUT NUMBER)
   AS
   BEGIN
      INSERT INTO DSS_FILES (FILE_NAME )
      VALUES (P_FILENAME)
      RETURNING ROWSEQ
        INTO P_ROWSEQ;
   END;


   PROCEDURE INS_FILE (P_FILENAME           VARCHAR2,
                       P_FILE_PATH          VARCHAR2,
                       P_BRAND              VARCHAR2,
                       P_TYPE               VARCHAR2,
                       P_ROWSEQ      IN OUT NUMBER)
   AS
      P_attribute1   VARCHAR2 (100);
      P_attribute2   VARCHAR2 (100);
      P_attribute3   VARCHAR2 (100);
      P_attribute4   VARCHAR2 (100);
   BEGIN
      IF (P_TYPE) = 'Activation File'
      THEN
         P_attribute1 := REGEXP_SUBSTR (P_FILENAME, '([^_|.]{1})+', 1, 1);
         P_attribute2 := REGEXP_SUBSTR (P_FILENAME, '([^_|.]{1})+', 1, 2);
         P_attribute3 := REGEXP_SUBSTR (P_FILENAME, '([^_|.]{1})+', 1, 3);
      END IF;

      INSERT INTO DSS_FILES (FILE_NAME, FILE_PATH, BRAND, FILE_TYPE,
                             ATTRIBUTE1, ATTRIBUTE2, ATTRIBUTE3, ATTRIBUTE4)
      VALUES (P_FILENAME,
              P_FILE_PATH,
              P_BRAND,
              P_TYPE,
              P_attribute1,
              P_attribute2,
              P_attribute3,
              P_attribute4)
      RETURNING ROWSEQ
        INTO P_ROWSEQ;
   END;

   PROCEDURE INS_SERIALS_UNPIVOT (P_FILE_SEQ NUMBER)
   AS
      TEMP_RW   RW_SERIALS_UNPIVOT;
      CNT       NUMBER DEFAULT 0;
   BEGIN
      IF (CR_SERIALS_UNPIVOT%ISOPEN)
      THEN
         CLOSE CR_SERIALS_UNPIVOT;
      END IF;

      OPEN CR_SERIALS_UNPIVOT (P_FILE_SEQ);

      LOOP
         FETCH CR_SERIALS_UNPIVOT
              BULK COLLECT INTO TEMP_RW;

         CNT := TEMP_RW.COUNT;

         FORALL RW IN 1 .. TEMP_RW.COUNT
            INSERT 
             /*+ IGNORE_ROW_ON_DUPKEY_INDEX(DSS_FILE_SERIALS,UDX_FLS_PARENT_KEY_ID) */
            INTO DSS_FILE_SERIALS (UPL_SEQ, UPL_CNT,
                                          FILE_SEQ, PARENTKEY,
                                          ISPARENT, KEYID,
                                          SERIALKEY, BRAND,
                                          PART_CODE1, PART_CODE2,
                                          EAN_CODE1, EAN_CODE2,
                                          MODEL_CODE1, MODEL_CODE2,
                                          INVOICE_NO, INVOICE_REF1,
                                          INVOICE_REF2, PRODUCT_CODE,
                                          COUNTRY_CODE)
            VALUES (TEMP_RW (RW).UPLSEQ,
                    TEMP_RW (RW).UPL_CNT,
                    TEMP_RW (RW).FILE_SEQ,
                    TEMP_RW (RW).PARENTKEY,
                    CASE WHEN TEMP_RW (RW).PARENTKEY = TEMP_RW (RW).SERIALKEY THEN 'Y' ELSE 'N' END  ,
                    TEMP_RW (RW).KEYID,
                    TEMP_RW (RW).SERIALKEY,
                    TEMP_RW (RW).BRAND,
                    TEMP_RW (RW).PART_CODE1,
                    TEMP_RW (RW).PART_CODE2,
                    TEMP_RW (RW).EAN_CODE1,
                    TEMP_RW (RW).EAN_CODE2,
                    TEMP_RW (RW).MODEL_CODE1,
                    TEMP_RW (RW).MODEL_CODE2,
                    TEMP_RW (RW).INVOICE_NO,
                    TEMP_RW (RW).INVOICE_REF1,
                    TEMP_RW (RW).INVOICE_REF2,
                    TEMP_RW (RW).AX_PRODUCT_CODE,
                    nvl(TEMP_RW (RW).COUNTRYCODE, 'ALL'));

         EXIT WHEN CR_SERIALS_UNPIVOT%NOTFOUND;
      END LOOP;

      CLOSE CR_SERIALS_UNPIVOT;

      UPDATE DSS_FILES
         SET INS_COUNT = CNT, ISARCHIVED = 'Y'
       WHERE ROWSEQ = P_FILE_SEQ;
   END INS_SERIALS_UNPIVOT;



   PROCEDURE INS_SERIALS (P_FILE_SEQ NUMBER)
   AS
   BEGIN
      /*
          ADD YOUR SCRIPT TO MOVE FROM TEAMP  TO  ORGINAL TABLE
      */
      INS_SERIALS_UNPIVOT (P_FILE_SEQ);

      DELETE FROM TEMP_FILE_SERIALS
       WHERE FILE_SEQ = P_FILE_SEQ;
   END;
END;
/
