DROP PACKAGE DSS.PKG_RPT_SCAN_CONFIG;

CREATE OR REPLACE PACKAGE DSS.PKG_RPT_SCAN_CONFIG
AS
   CURSOR CR_LINES
   IS
      SELECT LN.ORGANIZATION_ID,
             LN.ORDER_TYPE,
             LN.INVENTORY_ITEM_ID,
             SUM (LN.ORDER_QTY) AS ORDER_QTY,
             SUM (LN.DELIVERED_QTY) AS DELIVERED_QTY,
             SUM (SR.CNT) AS SCANNED , 
             CASE WHEN  LN.ORDER_TYPE = 'SO' THEN   'Y'
                  WHEN  LN.ORDER_TYPE = 'SR' THEN   'Y'
                  WHEN  LN.ORDER_TYPE = 'GRN' THEN   'Y'
                  ELSE 'N'
             END  ISEXTERNAL ,
                          CASE WHEN  LN.ORDER_TYPE = 'SO' THEN   'Outbound'
                  WHEN  LN.ORDER_TYPE = 'SR' THEN   'Inbound'
                  WHEN  LN.ORDER_TYPE = 'GRN' THEN  'Inbound'
                  ELSE 'Transfer'
             END  PROCESSTYPE 
                  
        FROM DSS_ORDER_SCAN_HEADER HD
             LEFT OUTER JOIN DSS_ORDER_SCAN_LINES LN ON HD.JOBID = LN.JOBID
             LEFT OUTER JOIN (SELECT JOBID, LINEID, COUNT (*) CNT
                                FROM DSS_ORDER_SCAN_SERIALS SRS
                               WHERE TRUNC (SRS.CREATE_DATE) >= '1-APR-2019'
                               AND NVL(ATTRIBUTE2,'N') = 'Y'
                              GROUP BY JOBID, LINEID) SR
                ON LN.JOBID = SR.JOBID AND LN.LINEID = SR.LINEID
       WHERE     1 = 1
             AND TRUNC (HD.ORDER_DATE) >= '1-APR-2019'
             AND TRUNC (HD.ORDER_DATE) <= '30-JUN-2019'
      GROUP BY LN.ORGANIZATION_ID, LN.ORDER_TYPE, LN.INVENTORY_ITEM_ID;


   TYPE RW_LINES IS TABLE OF CR_LINES%ROWTYPE;
   
   PROCEDURE INS_LINE_LEVEL ;  
   
END PKG_RPT_SCAN_CONFIG;
/


DROP PACKAGE BODY DSS.PKG_RPT_SCAN_CONFIG;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_RPT_SCAN_CONFIG
AS
   PROCEDURE INS_LINE_LEVEL
   AS
      TEMP_RW   RW_LINES;
   BEGIN
      IF (CR_LINES%ISOPEN)
      THEN
         CLOSE CR_LINES;
      END IF;

      OPEN CR_LINES;

      LOOP
         FETCH CR_LINES
              BULK COLLECT INTO TEMP_RW
            LIMIT 1000;

         FORALL rw IN 1 .. TEMP_RW.COUNT
            INSERT INTO RPT_SCAN_ITEM_LEVEL (ORGANIZATION_ID,
                                             ORDER_TYPE,
                                             INVENTORY_ITEM_ID,
                                             ORDER_QTY,
                                             DELIVERED_QTY,
                                             SCANNED,PROCESSTYPE, ISEXTERNAL)
            VALUES (TEMP_RW (RW).ORGANIZATION_ID,
                    TEMP_RW (RW).ORDER_TYPE,
                    TEMP_RW (RW).INVENTORY_ITEM_ID,
                    TEMP_RW (RW).ORDER_QTY,
                    TEMP_RW (RW).DELIVERED_QTY,
                    TEMP_RW (RW).SCANNED,TEMP_RW (RW).PROCESSTYPE, TEMP_RW (RW).ISEXTERNAL);

         EXIT WHEN CR_LINES%NOTFOUND;
      END LOOP;

      CLOSE CR_LINES;
   END INS_LINE_LEVEL;
END PKG_RPT_SCAN_CONFIG;
/
