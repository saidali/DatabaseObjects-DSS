DROP PACKAGE DSS.PKG_ARCH_SCAN_ORDERS;

CREATE OR REPLACE PACKAGE DSS.PKG_ARCH_SCAN_ORDERS
AS
   CURSOR CR_CR_SCAN_ORDERS_HEADER
   IS
      SELECT *
        FROM DSS_ORDER_SCAN_HEADER
        --- PARTITION (DSCNH_2015) 
        WHERE  1=1 
        and create_date <= sysdate - 1095
        --AND NVL(ARCHIVED_YN ,  'N') != 'I'
             and jobid != 3409805 
        AND  ROWNUM <= 300
        ;

   TYPE RW_CR_SCAN_ORDERS_HEADER IS TABLE OF CR_CR_SCAN_ORDERS_HEADER%ROWTYPE;

   PROCEDURE DATA_ARCHIVE;
END PKG_ARCH_SCAN_ORDERS;
/


DROP PACKAGE BODY DSS.PKG_ARCH_SCAN_ORDERS;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_ARCH_SCAN_ORDERS
AS
   PROCEDURE DATA_ARCHIVE
   AS
      TEMP_RW   RW_CR_SCAN_ORDERS_HEADER;
   BEGIN
      IF (CR_CR_SCAN_ORDERS_HEADER%ISOPEN)
      THEN
         CLOSE CR_CR_SCAN_ORDERS_HEADER;
      END IF;

      OPEN CR_CR_SCAN_ORDERS_HEADER;

      LOOP
         FETCH CR_CR_SCAN_ORDERS_HEADER BULK COLLECT INTO TEMP_RW LIMIT 10;

         /*INSERT INTO HEADER*/
         FORALL RW IN 1 .. TEMP_RW.COUNT
            INSERT INTO AR_ORDER_SCAN_HEADER
                 VALUES (TEMP_RW (RW).JOBID,
                         TEMP_RW (RW).APP_SOURCE,
                         TEMP_RW (RW).ORDER_TYPE,
                         TEMP_RW (RW).ORDER_NUMBER,
                         TEMP_RW (RW).ORDER_REF_NO,
                         TEMP_RW (RW).ORDER_REF_NO2,
                         TEMP_RW (RW).ORDER_DATE,
                         TEMP_RW (RW).ORDER_REMARKS,
                         TEMP_RW (RW).WARRANTY_YN,
                         TEMP_RW (RW).WMS_YN,
                         TEMP_RW (RW).INTERNAL_YN,
                         TEMP_RW (RW).SCR_TYPE,
                         TEMP_RW (RW).SCR_REF_NUMBER,
                         TEMP_RW (RW).SCR_REF_CODE,
                         TEMP_RW (RW).SCR_OPREATING_UNIT,
                         TEMP_RW (RW).SCR_ORGANIZATION_ID,
                         TEMP_RW (RW).SCR_LOCATION_CODE,
                         TEMP_RW (RW).DEST_TYPE,
                         TEMP_RW (RW).DEST_REF_NUMBER,
                         TEMP_RW (RW).DEST_REF_CODE,
                         TEMP_RW (RW).DEST_OPREATING_UNIT,
                         TEMP_RW (RW).DEST_ORGANIZATION_ID,
                         TEMP_RW (RW).DEST_LOCATION_CODE,
                         TEMP_RW (RW).CREATE_DATE,
                         TEMP_RW (RW).MODIFY_DATE,
                         TEMP_RW (RW).CREATE_BY,
                         TEMP_RW (RW).MODIFY_BY,
                         TEMP_RW (RW).EXPIRY_DATE,
                         TEMP_RW (RW).EXPIRY_AFTER,
                         TEMP_RW (RW).EDITABLE_YN,
                         TEMP_RW (RW).ARCHIVED_YN,
                         TEMP_RW (RW).ACTIVE_YN,
                         TEMP_RW (RW).STATUS_YN,
                         TEMP_RW (RW).ATTRIBUTE1,
                         TEMP_RW (RW).ATTRIBUTE2,
                         TEMP_RW (RW).ATTRIBUTE3,
                         TEMP_RW (RW).ATTRIBUTE4,
                         TEMP_RW (RW).ATTRIBUTE5,
                         TEMP_RW (RW).ATTRIBUTE6,
                         TEMP_RW (RW).ATTRIBUTE7,
                         TEMP_RW (RW).ATTRIBUTE8,
                         TEMP_RW (RW).ATTRIBUTE9,
                         TEMP_RW (RW).ATTRIBUTE10);

         /*INSERT INTO LINES*/
         FORALL RW IN 1 .. TEMP_RW.COUNT
            INSERT INTO AR_ORDER_SCAN_LINES
               SELECT *
                 FROM DSS_ORDER_SCAN_LINES
                WHERE JOBID = TEMP_RW (RW).JOBID;

         /*INSERT INTO SERIALS*/
         FORALL RW IN 1 .. TEMP_RW.COUNT
            INSERT INTO AR_ORDER_SCAN_SERIALS
               SELECT *
                 FROM DSS_ORDER_SCAN_SERIALS
                WHERE JOBID = TEMP_RW (RW).JOBID;

         /*DELETE INTO SERIALS*/
         FORALL RW IN 1 .. TEMP_RW.COUNT
            DELETE FROM DSS_ORDER_SCAN_SERIALS
                  WHERE JOBID = TEMP_RW (RW).JOBID;

         /*DELETE INTO LINES*/
         FORALL RW IN 1 .. TEMP_RW.COUNT
            DELETE FROM DSS_ORDER_SCAN_LINES
                  WHERE JOBID = TEMP_RW (RW).JOBID;

         /*DELETE INTO HEADER*/
         FORALL RW IN 1 .. TEMP_RW.COUNT
            DELETE FROM DSS_ORDER_SCAN_HEADER
                  WHERE JOBID = TEMP_RW (RW).JOBID;


         EXIT WHEN CR_CR_SCAN_ORDERS_HEADER%NOTFOUND;
      END LOOP;

      CLOSE CR_CR_SCAN_ORDERS_HEADER;
   END DATA_ARCHIVE;
END PKG_ARCH_SCAN_ORDERS;
/
