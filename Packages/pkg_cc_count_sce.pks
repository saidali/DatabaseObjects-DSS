DROP PACKAGE DSS.PKG_CC_COUNT_SCE;

CREATE OR REPLACE PACKAGE DSS.PKG_CC_COUNT_SCE
AS
  PROCEDURE RPT_STATUS_LOC ( P_STATUS     IN VARCHAR2,P_LOC IN VARCHAR2,outCursor  OUT DSS.MYGEN.sqlcur);
  PROCEDURE RPT_LOC (P_LOC IN VARCHAR2 ,OUTCURSOR OUT DSS.MYGEN.SQLCUR);
  PROCEDURE RPT_LOC_ALL (P_LOC IN VARCHAR2 ,OUTCURSOR OUT DSS.MYGEN.SQLCUR);
       PROCEDURE RPT_STATUS  (P_STATUS IN VARCHAR2,  OUTCURSOR OUT DSS.MYGEN.SQLCUR);
 END PKG_CC_COUNT_SCE;
/


DROP PACKAGE BODY DSS.PKG_CC_COUNT_SCE;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_CC_COUNT_SCE
AS
   PROCEDURE RPT_STATUS_LOC (P_STATUS    IN     VARCHAR2,
                             P_LOC       IN     VARCHAR2,
                             OUTCURSOR      OUT DSS.MYGEN.SQLCUR)
   AS
   BEGIN 
      IF UPPER (P_STATUS) = 'N'
      THEN
         BEGIN
            OPEN outCursor FOR
               SELECT *
                 FROM VW_CC_MASTER_RPT@WMWHSE1_LIVE
                WHERE STATUS = 'NoCount' AND LOC = P_LOC;
         END;
      ELSIF UPPER (P_STATUS) = 'C'
      THEN
         BEGIN
            OPEN outCursor FOR
               SELECT *
                 FROM VW_CC_MASTER_RPT@WMWHSE1_LIVE
                WHERE STATUS = 'PostedInERP' AND LOC = P_LOC;
         END;
      ELSIF UPPER (P_STATUS) = 'Y'
      THEN
         BEGIN
            OPEN outCursor FOR
               SELECT *
                 FROM VW_CC_MASTER_RPT@WMWHSE1_LIVE
                WHERE STATUS = 'NotPostedInERP' AND LOC = P_LOC;
         END;
      END IF;
   END RPT_STATUS_LOC;

   PROCEDURE RPT_LOC (P_LOC IN VARCHAR2, OUTCURSOR OUT DSS.MYGEN.SQLCUR)
   AS
   BEGIN
      OPEN outCursor FOR
         --SELECT  SKU, ID, LOC, ZONE_CODE, COMMINGLE_CODE, SEG_CODE, STATUS, COUNTS, CCQTY, SYSQTY, ADJQTY FROM VW_RPT_CC_MST@WMWHSE1_LIVE WHERE  LOC =UPPER(P_LOC);
         SELECT *
           FROM VW_CC_MASTER_RPT@WMWHSE1_LIVE
          WHERE LOC = UPPER (P_LOC);
   END RPT_LOC;

   PROCEDURE RPT_LOC_ALL (P_LOC IN VARCHAR2, OUTCURSOR OUT DSS.MYGEN.SQLCUR)
   AS
   BEGIN
      IF UPPER (P_LOC) = 'ALL'
      THEN
         BEGIN
            OPEN outCursor FOR
               SELECT *
                 FROM VW_CC_MASTER_RPT@WMWHSE1_LIVE
                WHERE 1 = 1;
         END;
      END IF;
   END RPT_LOC_ALL;

   PROCEDURE RPT_STATUS (P_STATUS    IN     VARCHAR2,
                         OUTCURSOR      OUT DSS.MYGEN.SQLCUR)
   AS
   BEGIN
      IF UPPER (P_STATUS) = 'N'
      THEN
         BEGIN
            OPEN outCursor FOR
               SELECT *
                 FROM VW_CC_MASTER_RPT@WMWHSE1_LIVE
                WHERE STATUS = 'NoCount';
         END;
      ELSIF UPPER (P_STATUS) = 'C'
      THEN
         BEGIN
            OPEN outCursor FOR
               SELECT *
                 FROM VW_CC_COUNTED@WMWHSE1_LIVE;
         END;
      ELSIF UPPER (P_STATUS) = 'Y'
      THEN
         BEGIN
            OPEN outCursor FOR
               SELECT *
                 FROM VW_CC_MASTER_RPT@WMWHSE1_LIVE
                WHERE STATUS = 'NotPostedInERP';
         END;
      END IF;
   END RPT_STATUS;
END PKG_CC_COUNT_SCE;
/
