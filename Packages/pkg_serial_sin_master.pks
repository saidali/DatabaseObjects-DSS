DROP PACKAGE DSS.PKG_SERIAL_SIN_MASTER;

CREATE OR REPLACE PACKAGE DSS.PKG_SERIAL_SIN_MASTER
AS
   /*
       1- DWLD CHILD SERIALS FROM SHIPMENT FILES
       2- DWLD SCANNED SERIALS from TRNSACTION TABLE TO MASTER
       3- DWLD  SCANNED SERIALS from TRNSACTION TABLE TO CHILD

   */



   P_INTERFACEID     NUMBER DEFAULT 29;
   P_NOYEARS         NUMBER DEFAULT 1;
   p_LAST_RUN_DATE   DATE DEFAULT SYSDATE - (365 * 3);
   P_BULKLIMIT       NUMBER DEFAULT 1000;

   PROCEDURE START_SYNC;

   /* Get All Serials on DSS_FILE_SERIALS inserted after last run time */
   CURSOR CR_SERIAL_SHIPMENT
   IS
      SELECT BRAND,
             PARENTKEY,
             KEYID,
             SERIALKEY,
             ISPARENT,
             CREATE_DATE
        FROM DSS_FILE_SERIALS
       WHERE 1 = 1 AND CREATE_DATE > p_LAST_RUN_DATE /* FILTER DATE INSERTED AFTER  LAST RUN DATE */
                                                    ;

   TYPE RW_SERIAL_SHIPMENT IS TABLE OF CR_SERIAL_SHIPMENT%ROWTYPE;

   /* Get distinct  Serials on DSS_ORDER_SCAN_SERIALS inserted after last run time */
   CURSOR CR_SERIALS
   IS
      SELECT SN.SERIALKEY,
             SN.PRODUCT_CODE,
             MAX (NVL (SH.ORDER_DATE, SN.CREATE_DATE)) AS LAST_SCANDATE,
             CSN.PARENTKEY,
             CASE WHEN CSN.PARENTKEY IS NULL THEN 'N' ELSE 'Y' END HASCHILD,
             CSN.ISPARENT
        FROM DSS_ORDER_SCAN_SERIALS SN
             LEFT OUTER JOIN DSS_FILE_SERIALS CSN
                ON SN.SERIALKEY = CSN.SERIALKEY 
                
               and SN.product_code=csn.product_code
             LEFT OUTER JOIN DSS_ORDER_SCAN_HEADER SH ON SN.JOBID = SH.JOBID
             LEFT OUTER JOIN VW_SYN_ITEM_BARCODES  BR ON   SN.SERIALKEY =BR.BARCODES 
       WHERE     1 = 1
--             AND SN.CREATE_DATE > p_LAST_RUN_DATE /* FILTER DATE INSERTED AFTER  LAST RUN DATE */
             AND NVL (SN.ATTRIBUTE2, 'Y') = 'Y' /* Indicate if it's serialized Items */
             AND  BR.BARCODES  IS NULL  
              and CSN.SERIALKEY='864794045227546'
      GROUP BY SN.SERIALKEY,
               CSN.ISPARENT,
               SN.PRODUCT_CODE,
               CSN.PARENTKEY; 

   TYPE RW_SERIALS IS TABLE OF CR_SERIALS%ROWTYPE;

   /* Get DUPLICATED PARENTKEY on DSS_SERIALS_MASTER */
   CURSOR CR_DUP_PARENTS
   IS
      SELECT PARENTKEY, PRODUCT_CODE, COUNT (*)
        FROM DSS_SERIALS_MASTER
       WHERE PARENTKEY IS NOT NULL
      GROUP BY PARENTKEY, PRODUCT_CODE
      HAVING COUNT (*) > 1;

   TYPE RW_DUP_PARENTS IS TABLE OF CR_DUP_PARENTS%ROWTYPE;


   --   CURSOR CR_NO_PARENTS
   --   IS
   --      SELECT DISTINCT SERIALKEY
   --        FROM DSS_SERIALS_MASTER
   --       WHERE PARENTKEY IS NULL;
   --
   --   TYPE RW_NO_PARENTS IS TABLE OF CR_NO_PARENTS%ROWTYPE;


   CURSOR CR_NON_PARENT_SERIALS
   IS
      SELECT MS.ROWSEQ, CSN.PARENTKEY
        FROM DSS_SERIALS_MASTER MS
             LEFT OUTER JOIN DSS_SERIALS_CHILD CSN
                ON MS.SERIALKEY = CSN.SERIALKEY
       WHERE     CSN.PARENTKEY != MS.PARENTKEY
             AND HASCHILD = 'N'
             AND CSN.PARENTKEY IS NOT NULL;

   TYPE RW_NON_PARENT_SERIALS IS TABLE OF CR_NON_PARENT_SERIALS%ROWTYPE;

   --   PROCEDURE UP_MASTER_CHILD;

   CURSOR CR_BARCODE_SERIALS
   IS
      SELECT SERIALKEY
        FROM DSS_SERIALS_MASTER SNM
             INNER JOIN VW_SYN_ITEM_BARCODES ON BARCODES = SERIALKEY;

   TYPE RW_BARCODE_SERIALS IS TABLE OF CR_BARCODE_SERIALS%ROWTYPE;
END PKG_SERIAL_SIN_MASTER;
/


DROP PACKAGE BODY DSS.PKG_SERIAL_SIN_MASTER;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_SERIAL_SIN_MASTER
AS
   /*Interface LAST_RUN_DATE  procedures */
   PROCEDURE REST_LAST_RUN_DATE (P_DATE DATE)
   AS
   BEGIN
      UPDATE DSS_INTERFACE_PROCESS
         SET LAST_RUN_DATE = P_DATE
       WHERE INTERFACEID = P_INTERFACEID;
   END REST_LAST_RUN_DATE;

   PROCEDURE SET_LAST_RUN_DATE
   AS
   BEGIN
      SELECT NVL (LAST_RUN_DATE, p_LAST_RUN_DATE)
        INTO p_LAST_RUN_DATE
        FROM DSS_INTERFACE_PROCESS
       WHERE INTERFACEID = P_INTERFACEID;
   END SET_LAST_RUN_DATE;


   /*Procedures for SHIPMENTS Child upload */

   PROCEDURE UPSERT_SHIPMENTS
   AS
      TEMP_RW      RW_SERIAL_SHIPMENT;
      P_ROWCOUNT   NUMBER DEFAULT 0;
      P_RUNDATE    DATE;
   BEGIN
      P_RUNDATE := SYSDATE;

      IF (CR_SERIAL_SHIPMENT%ISOPEN)
      THEN
         CLOSE CR_SERIAL_SHIPMENT;
      END IF;

      OPEN CR_SERIAL_SHIPMENT;

      LOOP
         FETCH CR_SERIAL_SHIPMENT
              BULK COLLECT INTO TEMP_RW
            LIMIT P_BULKLIMIT;

         P_ROWCOUNT := NVL (P_ROWCOUNT, 0) + NVL (TEMP_RW.COUNT, 0);

         BEGIN
            FORALL RW IN 1 .. TEMP_RW.COUNT
               MERGE INTO DSS_SERIALS_CHILD TRG
                USING (SELECT TEMP_RW (RW).SERIALKEY AS SERIALKEY
                         FROM DUAL) MTCH
                   ON (MTCH.SERIALKEY = TRG.SERIALKEY)
               WHEN MATCHED
               THEN
                  UPDATE SET
                     PARENTKEY = TEMP_RW (RW).PARENTKEY,
                     ISPARENT = TEMP_RW (RW).ISPARENT
               WHEN NOT MATCHED
               THEN
                  INSERT (SERIALKEY,
                          PARENTKEY,
                          ISPARENT,
                          keyid)
                  VALUES (TEMP_RW (RW).SERIALKEY,
                          TEMP_RW (RW).PARENTKEY,
                          TEMP_RW (RW).ISPARENT,
                          TEMP_RW (RW).KEYID);
         END;

         EXIT WHEN CR_SERIAL_SHIPMENT%NOTFOUND;
      END LOOP;

      CLOSE CR_SERIAL_SHIPMENT;

      BEGIN
         PKG_INTERFACE.INS_INTERFACE_LOG2 (P_INTERFACEID,
                                           p_LAST_RUN_DATE,
                                           P_ROWCOUNT,
                                           'UPSERT',
                                           'C',
                                           'Serial Shipments ',
                                           P_RUNDATE);
      EXCEPTION
         WHEN OTHERS
         THEN
            NULL;
      END;
   END UPSERT_SHIPMENTS;

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
            LIMIT P_BULKLIMIT;

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
                          'DSS');
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

      BEGIN



         PKG_INTERFACE.INS_INTERFACE_LOG2 (P_INTERFACEID,
                                           p_LAST_RUN_DATE,
                                           P_ROWCOUNT,
                                           'UPSERT',
                                           'C',
                                           P_RUNDATE,
                                           'MASTER DATA');
      EXCEPTION
         WHEN OTHERS
         THEN
            NULL;
      END;
   END UPSERT_MASTER;


   PROCEDURE DEL_PARENT_DUP
   AS
      TEMP_RW      RW_DUP_PARENTS;
      P_ROWCOUNT   NUMBER DEFAULT 0;
      P_RUNDATE    DATE;
   BEGIN
      P_RUNDATE := SYSDATE;

      IF (CR_DUP_PARENTS%ISOPEN)
      THEN
         CLOSE CR_DUP_PARENTS;
      END IF;

      OPEN CR_DUP_PARENTS;

      LOOP
         FETCH CR_DUP_PARENTS
              BULK COLLECT INTO TEMP_RW
            LIMIT P_BULKLIMIT;

         P_ROWCOUNT := NVL (P_ROWCOUNT, 0) + TEMP_RW.COUNT;

         FORALL RW IN 1 .. TEMP_RW.COUNT
            DELETE FROM DSS_SERIALS_MASTER
             WHERE     PARENTKEY = TEMP_RW (RW).PARENTKEY
                   AND PRODUCT_CODE = TEMP_RW (RW).PRODUCT_CODE
                   AND ISPARENT = 'N';

         EXIT WHEN CR_DUP_PARENTS%NOTFOUND;
      END LOOP;

      CLOSE CR_DUP_PARENTS;

      BEGIN
         PKG_INTERFACE.INS_INTERFACE_LOG2 (P_INTERFACEID,
                                           p_LAST_RUN_DATE,
                                           P_ROWCOUNT,
                                           'DEL',
                                           'C',
                                           'DELETE DUPLICATED PARENTS',
                                           SYSDATE);
      EXCEPTION
         WHEN OTHERS
         THEN
            NULL;
      END;
   END DEL_PARENT_DUP;


   --   /* Only One time use*/
   --   PROCEDURE UP_MASTER_CHILD
   --   AS
   --      TEMP_RW      RW_NO_PARENTS;
   --      P_ROWCOUNT   NUMBER default 0;
   --      P_RUNDATE    DATE;
   --   BEGIN
   --      P_RUNDATE := SYSDATE;
   --
   --      IF (CR_NO_PARENTS%ISOPEN)
   --      THEN
   --         CLOSE CR_NO_PARENTS;
   --      END IF;
   --
   --      OPEN CR_NO_PARENTS;
   --
   --      LOOP
   --         FETCH CR_NO_PARENTS
   --              BULK COLLECT INTO TEMP_RW
   --            LIMIT P_BULKLIMIT;
   --
   --         P_ROWCOUNT := NVL (P_ROWCOUNT, 0) + TEMP_RW.COUNT;
   --
   --         BEGIN
   --            FORALL RW IN 1 .. TEMP_RW.COUNT
   --               INSERT INTO DSS_SERIALS_CHILD (SERIALKEY,
   --                                              PARENTKEY,
   --                                              ISPARENT,
   --                                              keyid,
   --                                              DATA_SRC)
   --               VALUES (TEMP_RW (RW).SERIALKEY,
   --                       TEMP_RW (RW).SERIALKEY,
   --                       'Y',
   --                       1,
   --                       'DSS');
   --         END;
   --
   --         BEGIN
   --            FORALL RW IN 1 .. TEMP_RW.COUNT
   --               UPDATE DSS_SERIALS_MASTER
   --                  SET ISPARENT = 'Y', PARENTKEY = TEMP_RW (RW).SERIALKEY
   --                WHERE SERIALKEY = TEMP_RW (RW).SERIALKEY;
   --         END;
   --         EXIT WHEN CR_NO_PARENTS%NOTFOUND;
   --      END LOOP;
   --
   --      CLOSE CR_NO_PARENTS;
   --
   --      PKG_INTERFACE.INS_INTERFACE_LOG2 (P_INTERFACEID,
   --                                        p_LAST_RUN_DATE,
   --                                        P_ROWCOUNT,
   --                                        'INS',
   --                                        'C',
   --                                        'CHILD UPDATE',
   --                                        SYSDATE);
   --   END UP_MASTER_CHILD;

   PROCEDURE UP_NON_PARENT_SERIALS
   AS
      TEMP_RW      RW_NON_PARENT_SERIALS;
      P_ROWCOUNT   NUMBER DEFAULT 0;
      P_RUNDATE    DATE;
   BEGIN
      P_RUNDATE := SYSDATE;

      IF (CR_NON_PARENT_SERIALS%ISOPEN)
      THEN
         CLOSE CR_NON_PARENT_SERIALS;
      END IF;

      OPEN CR_NON_PARENT_SERIALS;

      LOOP
         FETCH CR_NON_PARENT_SERIALS
              BULK COLLECT INTO TEMP_RW
            LIMIT P_BULKLIMIT;

         P_ROWCOUNT := NVL (P_ROWCOUNT, 0) + TEMP_RW.COUNT;

         FORALL RW IN 1 .. TEMP_RW.COUNT
            UPDATE DSS_SERIALS_MASTER
               SET PARENTKEY = TEMP_RW (RW).PARENTKEY, HASCHILD = 'Y'
             WHERE ROWSEQ = TEMP_RW (RW).ROWSEQ;

         EXIT WHEN CR_NON_PARENT_SERIALS%NOTFOUND;
      END LOOP;

      CLOSE CR_NON_PARENT_SERIALS;

      PKG_INTERFACE.INS_INTERFACE_LOG2 (P_INTERFACEID,
                                        p_LAST_RUN_DATE,
                                        P_ROWCOUNT,
                                        'INS',
                                        'C',
                                        'CHILD UPDATE',
                                        SYSDATE);
   END UP_NON_PARENT_SERIALS;


   PROCEDURE START_SYNC
   AS
      ERRORMSG   VARCHAR2 (200);
   BEGIN
--      SET_LAST_RUN_DATE;
--      UPSERT_SHIPMENTS;
      UPSERT_MASTER;
--      DEL_PARENT_DUP;
--      UP_NON_PARENT_SERIALS;
   EXCEPTION
      WHEN OTHERS
      THEN
         BEGIN
            ERRORMSG := SUBSTR (SQLERRM, 1, 150);
            PKG_INTERFACE.INS_INTERFACE_LOG (P_INTERFACEID,
                                             SYSDATE,
                                             0,
                                             'INS',
                                             'E',
                                             ERRORMSG);
         EXCEPTION
            WHEN OTHERS
            THEN
               NULL;
         END;
   END START_SYNC;
END;
/
