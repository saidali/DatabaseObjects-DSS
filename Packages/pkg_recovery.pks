DROP PACKAGE DSS.PKG_RECOVERY;

CREATE OR REPLACE PACKAGE DSS.PKG_RECOVERY
AS
   PROCEDURE ADD_SERIALS;

   CURSOR CR_HEADERS
   IS
      SELECT DISTINCT rec.JOBID
        FROM REC_ORDER_SCAN_HEADER rec
             LEFT OUTER JOIN DSS_ORDER_SCAN_SERIALS dss
                ON rec.JOBID = dss.JOBID
       WHERE     DSS.JOBID IS NULL
             AND rec.ORDER_TYPE = 'MO'
             AND handled = 'N'  
             AND ROWNUM <= 1000;

   TYPE RW_HEADERS IS TABLE OF CR_HEADERS%ROWTYPE;
END PKG_RECOVERY;
/


DROP PACKAGE BODY DSS.PKG_RECOVERY;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_RECOVERY
AS
   PROCEDURE ADD_SERIALS
   AS
      TEMP_RW   RW_HEADERS;
   BEGIN
      IF (CR_HEADERS%ISOPEN)
      THEN
         CLOSE CR_HEADERS;
      END IF;

      OPEN CR_HEADERS;

      LOOP
         FETCH CR_HEADERS
              BULK COLLECT INTO TEMP_RW
            LIMIT 1000;


         FORALL RW IN 1 .. TEMP_RW.COUNT
            INSERT INTO DSS_ORDER_SCAN_SERIALS (JOBID,
                                                LINEID,
                                                SEQINDEX,
                                                COLUMNINDEX,
                                                CONFIGID,
                                                CONFIGTYPE,
                                                SCANTYPE,
                                                SCAN_SOURCE,
                                                OPREATING_UNIT,
                                                ORGANIZATION_ID,
                                                ORDER_TYPE,
                                                ORDER_NUMBER,
                                                INVENTORY_ITEM_ID,
                                                PRODUCT_CODE,
                                                SERVICE_BRANDID,
                                                SERIALKEY,
                                                SERIALKEY_REF1,
                                                SERIALKEY_REF2,
                                                WARRANTYPRINT_YN,
                                                WARRANTY_YN,
                                                WARRANTY_SEQ,
                                                WARRANTY_CODE,
                                                WARRANTY_STARTDATE,
                                                WARRANTY_ENDATE,
                                                ACTIVE_YN,
                                                INF_YN,
                                                INF_DATE,
                                                CREATE_BY,
                                                CREATE_DATE,
                                                UPDATE_BY,
                                                UPDATE_DATE,
                                                ALLOW_EDIT,
                                                ATTRIBUTE1,
                                                ATTRIBUTE2,
                                                ATTRIBUTE3,
                                                ATTRIBUTE4,
                                                ATTRIBUTE5,
                                                ATTRIBUTE6,
                                                ATTRIBUTE7,
                                                ATTRIBUTE8,
                                                ATTRIBUTE9,
                                                ATTRIBUTE10)
               SELECT JOBID,
                      LINEID,
                      SEQINDEX,
                      COLUMNINDEX,
                      CONFIGID,
                      CONFIGTYPE,
                      SCANTYPE,
                      SCAN_SOURCE,
                      OPREATING_UNIT,
                      ORGANIZATION_ID,
                      ORDER_TYPE,
                      ORDER_NUMBER,
                      INVENTORY_ITEM_ID,
                      PRODUCT_CODE,
                      SERVICE_BRANDID,
                      SERIALKEY,
                      SERIALKEY_REF1,
                      SERIALKEY_REF2,
                      WARRANTYPRINT_YN,
                      WARRANTY_YN,
                      WARRANTY_SEQ,
                      WARRANTY_CODE,
                      WARRANTY_STARTDATE,
                      WARRANTY_ENDATE,
                      ACTIVE_YN,
                      INF_YN,
                      INF_DATE,
                      CREATE_BY,
                      CREATE_DATE,
                      UPDATE_BY,
                      UPDATE_DATE,
                      ALLOW_EDIT,
                      ATTRIBUTE1,
                      ATTRIBUTE2,
                      ATTRIBUTE3,
                      ATTRIBUTE4,
                      ATTRIBUTE5,
                      ATTRIBUTE6,
                      ATTRIBUTE7,
                      ATTRIBUTE8,
                      'RECOVERY' ATTRIBUTE9,
                      ATTRIBUTE10
                 FROM REC_ORDER_SCAN_SERIALS
                WHERE JOBID = TEMP_RW (RW).JOBID;

         FORALL RW IN 1 .. TEMP_RW.COUNT
            UPDATE REC_ORDER_SCAN_HEADER
               SET HANDLED = 'Y'
             WHERE JOBID = TEMP_RW (RW).JOBID;


         EXIT WHEN CR_HEADERS%NOTFOUND;
      END LOOP;

      CLOSE CR_HEADERS;
   END ADD_SERIALS;
END PKG_RECOVERY;
/
