DROP PACKAGE DSS.PKG_DSS_ORDER_SCAN_HEADER;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_ORDER_SCAN_HEADER
AS
   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_JOBID     IN     DSS_ORDER_SCAN_HEADER.JOBID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadbyOrderNumber (
      p_SCR_OPREATING_UNIT    IN     dss_order_scan_header.SCR_OPREATING_UNIT%TYPE,
      p_SCR_ORGANIZATION_ID   IN     DSS_ORDER_SCAN_HEADER.SCR_ORGANIZATION_ID%TYPE,
      p_ORDER_TYPE            IN     DSS_ORDER_SCAN_HEADER.ORDER_TYPE%TYPE,
      p_ORDER_NUMBER          IN     DSS_ORDER_SCAN_HEADER.ORDER_NUMBER%TYPE,
      p_CREATE_BY             IN     DSS_ORDER_SCAN_HEADER.CREATE_BY%TYPE,
      outCursor                  OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_JOBID                  IN DSS_ORDER_SCAN_HEADER.JOBID%TYPE,
      p_APP_SOURCE             IN DSS_ORDER_SCAN_HEADER.APP_SOURCE%TYPE,
      p_ORDER_TYPE             IN DSS_ORDER_SCAN_HEADER.ORDER_TYPE%TYPE,
      p_ORDER_NUMBER           IN DSS_ORDER_SCAN_HEADER.ORDER_NUMBER%TYPE,
      p_ORDER_REF_NO           IN DSS_ORDER_SCAN_HEADER.ORDER_REF_NO%TYPE,
      p_ORDER_REF_NO2          IN DSS_ORDER_SCAN_HEADER.ORDER_REF_NO2%TYPE,
      p_ORDER_DATE             IN DSS_ORDER_SCAN_HEADER.ORDER_DATE%TYPE,
      p_ORDER_REMARKS          IN DSS_ORDER_SCAN_HEADER.ORDER_REMARKS%TYPE,
      p_WARRANTY_YN            IN DSS_ORDER_SCAN_HEADER.WARRANTY_YN%TYPE,
      p_WMS_YN                 IN DSS_ORDER_SCAN_HEADER.WMS_YN%TYPE,
      p_INTERNAL_YN            IN DSS_ORDER_SCAN_HEADER.INTERNAL_YN%TYPE,
      p_SCR_TYPE               IN DSS_ORDER_SCAN_HEADER.SCR_TYPE%TYPE,
      p_SCR_REF_NUMBER         IN DSS_ORDER_SCAN_HEADER.SCR_REF_NUMBER%TYPE,
      p_SCR_REF_CODE           IN DSS_ORDER_SCAN_HEADER.SCR_REF_CODE%TYPE,
      p_SCR_OPREATING_UNIT     IN DSS_ORDER_SCAN_HEADER.SCR_OPREATING_UNIT%TYPE,
      p_SCR_ORGANIZATION_ID    IN DSS_ORDER_SCAN_HEADER.SCR_ORGANIZATION_ID%TYPE,
      p_SCR_LOCATION_CODE      IN DSS_ORDER_SCAN_HEADER.SCR_LOCATION_CODE%TYPE,
      p_DEST_TYPE              IN DSS_ORDER_SCAN_HEADER.DEST_TYPE%TYPE,
      p_DEST_REF_NUMBER        IN DSS_ORDER_SCAN_HEADER.DEST_REF_NUMBER%TYPE,
      p_DEST_REF_CODE          IN DSS_ORDER_SCAN_HEADER.DEST_REF_CODE%TYPE,
      p_DEST_OPREATING_UNIT    IN DSS_ORDER_SCAN_HEADER.DEST_OPREATING_UNIT%TYPE,
      p_DEST_ORGANIZATION_ID   IN DSS_ORDER_SCAN_HEADER.DEST_ORGANIZATION_ID%TYPE,
      p_DEST_LOCATION_CODE     IN DSS_ORDER_SCAN_HEADER.DEST_LOCATION_CODE%TYPE,
      p_CREATE_DATE            IN DSS_ORDER_SCAN_HEADER.CREATE_DATE%TYPE,
      p_MODIFY_DATE            IN DSS_ORDER_SCAN_HEADER.MODIFY_DATE%TYPE,
      p_CREATE_BY              IN DSS_ORDER_SCAN_HEADER.CREATE_BY%TYPE,
      p_MODIFY_BY              IN DSS_ORDER_SCAN_HEADER.MODIFY_BY%TYPE,
      p_EXPIRY_DATE            IN DSS_ORDER_SCAN_HEADER.EXPIRY_DATE%TYPE,
      p_EXPIRY_AFTER           IN DSS_ORDER_SCAN_HEADER.EXPIRY_AFTER%TYPE,
      p_EDITABLE_YN            IN DSS_ORDER_SCAN_HEADER.EDITABLE_YN%TYPE,
      p_ARCHIVED_YN            IN DSS_ORDER_SCAN_HEADER.ARCHIVED_YN%TYPE,
      p_ACTIVE_YN              IN DSS_ORDER_SCAN_HEADER.ACTIVE_YN%TYPE,
      p_STATUS_YN              IN DSS_ORDER_SCAN_HEADER.STATUS_YN%TYPE,
      p_ATTRIBUTE1             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10            IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE10%TYPE);

   PROCEDURE P_Insert (
      p_JOBID                  IN DSS_ORDER_SCAN_HEADER.JOBID%TYPE,
      p_APP_SOURCE             IN DSS_ORDER_SCAN_HEADER.APP_SOURCE%TYPE,
      p_ORDER_TYPE             IN DSS_ORDER_SCAN_HEADER.ORDER_TYPE%TYPE,
      p_ORDER_NUMBER           IN DSS_ORDER_SCAN_HEADER.ORDER_NUMBER%TYPE,
      p_ORDER_REF_NO           IN DSS_ORDER_SCAN_HEADER.ORDER_REF_NO%TYPE,
      p_ORDER_REF_NO2          IN DSS_ORDER_SCAN_HEADER.ORDER_REF_NO2%TYPE,
      p_ORDER_DATE             IN DSS_ORDER_SCAN_HEADER.ORDER_DATE%TYPE,
      p_ORDER_REMARKS          IN DSS_ORDER_SCAN_HEADER.ORDER_REMARKS%TYPE,
      p_WARRANTY_YN            IN DSS_ORDER_SCAN_HEADER.WARRANTY_YN%TYPE,
      p_WMS_YN                 IN DSS_ORDER_SCAN_HEADER.WMS_YN%TYPE,
      p_INTERNAL_YN            IN DSS_ORDER_SCAN_HEADER.INTERNAL_YN%TYPE,
      p_SCR_TYPE               IN DSS_ORDER_SCAN_HEADER.SCR_TYPE%TYPE,
      p_SCR_REF_NUMBER         IN DSS_ORDER_SCAN_HEADER.SCR_REF_NUMBER%TYPE,
      p_SCR_REF_CODE           IN DSS_ORDER_SCAN_HEADER.SCR_REF_CODE%TYPE,
      p_SCR_OPREATING_UNIT     IN DSS_ORDER_SCAN_HEADER.SCR_OPREATING_UNIT%TYPE,
      p_SCR_ORGANIZATION_ID    IN DSS_ORDER_SCAN_HEADER.SCR_ORGANIZATION_ID%TYPE,
      p_SCR_LOCATION_CODE      IN DSS_ORDER_SCAN_HEADER.SCR_LOCATION_CODE%TYPE,
      p_DEST_TYPE              IN DSS_ORDER_SCAN_HEADER.DEST_TYPE%TYPE,
      p_DEST_REF_NUMBER        IN DSS_ORDER_SCAN_HEADER.DEST_REF_NUMBER%TYPE,
      p_DEST_REF_CODE          IN DSS_ORDER_SCAN_HEADER.DEST_REF_CODE%TYPE,
      p_DEST_OPREATING_UNIT    IN DSS_ORDER_SCAN_HEADER.DEST_OPREATING_UNIT%TYPE,
      p_DEST_ORGANIZATION_ID   IN DSS_ORDER_SCAN_HEADER.DEST_ORGANIZATION_ID%TYPE,
      p_DEST_LOCATION_CODE     IN DSS_ORDER_SCAN_HEADER.DEST_LOCATION_CODE%TYPE,
      p_CREATE_DATE            IN DSS_ORDER_SCAN_HEADER.CREATE_DATE%TYPE,
      p_MODIFY_DATE            IN DSS_ORDER_SCAN_HEADER.MODIFY_DATE%TYPE,
      p_CREATE_BY              IN DSS_ORDER_SCAN_HEADER.CREATE_BY%TYPE,
      p_MODIFY_BY              IN DSS_ORDER_SCAN_HEADER.MODIFY_BY%TYPE,
      p_EXPIRY_DATE            IN DSS_ORDER_SCAN_HEADER.EXPIRY_DATE%TYPE,
      p_EXPIRY_AFTER           IN DSS_ORDER_SCAN_HEADER.EXPIRY_AFTER%TYPE,
      p_EDITABLE_YN            IN DSS_ORDER_SCAN_HEADER.EDITABLE_YN%TYPE,
      p_ARCHIVED_YN            IN DSS_ORDER_SCAN_HEADER.ARCHIVED_YN%TYPE,
      p_ACTIVE_YN              IN DSS_ORDER_SCAN_HEADER.ACTIVE_YN%TYPE,
      p_STATUS_YN              IN DSS_ORDER_SCAN_HEADER.STATUS_YN%TYPE,
      p_ATTRIBUTE1             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10            IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE10%TYPE);

   PROCEDURE P_Delete (p_JOBID IN DSS_ORDER_SCAN_HEADER.JOBID%TYPE);

   PROCEDURE P_UpdateWithLog (
      p_JOBID          IN DSS_ORDER_SCAN_HEADER.JOBID%TYPE,
      p_WARRANTY_YN    IN DSS_ORDER_SCAN_HEADER.WARRANTY_YN%TYPE,
      p_EXPIRY_DATE    IN DSS_ORDER_SCAN_HEADER.EXPIRY_DATE%TYPE,
      p_MODIFY_BY      IN DSS_ORDER_SCAN_HEADER.MODIFY_BY%TYPE,
      UP_OLD_VALUE     IN VARCHAR2,
      UP_REMARKS       IN VARCHAR2,
      UP_COLUMN_NAME   IN VARCHAR2,
      UP_STATUS        IN VARCHAR2);

   PROCEDURE P_Delete_OrderByJobId (
      p_JOBID   IN DSS_ORDER_SCAN_HEADER.JOBID%TYPE);

   PROCEDURE P_Delete_OrderByOrderNumber (
      p_ORDER_NUMBER   IN DSS_ORDER_SCAN_HEADER.ORDER_NUMBER%TYPE);
END PKG_DSS_ORDER_SCAN_HEADER;

/


DROP PACKAGE BODY DSS.PKG_DSS_ORDER_SCAN_HEADER;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_ORDER_SCAN_HEADER
AS
   PROCEDURE UPDATE_WARRANTYSEQ (p_JOBID IN DSS_ORDER_SCAN_HEADER.JOBID%TYPE)
   AS
   BEGIN
      UPDATE (SELECT LIN.WARRANTY_SEQ,
                     LIN.WARRANTY_CODE,
                     OWR.WARRANTY_SEQ OR_WARRANTY_SEQ,
                     PWR.WARRANTY_SEQ PR_WARRANTY_SEQ
                FROM DSS_ORDER_SCAN_LINES LIN
                     LEFT OUTER JOIN
                     TK_ORGANIZATION_WARRANTY OWR
                        ON     LIN.CAETGORY_ID = OWR.CATEGORY_ID
                           AND LIN.ORGANIZATION_ID = OWR.ORGANIZATION_ID
                     LEFT OUTER JOIN
                     TK_PRODUCT_WARRANTY PWR
                        ON     LIN.INVENTORY_ITEM_ID = PWR.INVENTORY_ITEM_ID
                           AND LIN.ORGANIZATION_ID = PWR.ORGANIZATION_ID
               WHERE LIN.WARRANTY_YN = 'Y' AND LIN.JOBID = P_JOBID)
         SET WARRANTY_SEQ =
                NVL (WARRANTY_SEQ, NVL (OR_WARRANTY_SEQ, PR_WARRANTY_SEQ));
   END UPDATE_WARRANTYSEQ;

   PROCEDURE P_LoadByPrimaryKey (
      p_JOBID     IN     DSS_ORDER_SCAN_HEADER.JOBID%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT H.JOBID,
                H.APP_SOURCE,
                H.ORDER_TYPE,
                H.ORDER_NUMBER,
                H.ORDER_REF_NO,
                H.ORDER_REF_NO2,
                H.ORDER_DATE,
                H.ORDER_REMARKS,
                H.WARRANTY_YN,
                O.WMS_QTY_SYNC WMS_YN,
                H.INTERNAL_YN,
                H.SCR_TYPE,
                H.SCR_REF_NUMBER,
                H.SCR_REF_CODE,
                H.SCR_OPREATING_UNIT,
                H.SCR_ORGANIZATION_ID,
                H.SCR_LOCATION_CODE,
                H.DEST_TYPE,
                H.DEST_REF_NUMBER,
                H.DEST_REF_CODE,
                H.DEST_OPREATING_UNIT,
                H.DEST_ORGANIZATION_ID,
                H.DEST_LOCATION_CODE,
                H.CREATE_DATE,
                H.MODIFY_DATE,
                H.CREATE_BY,
                H.MODIFY_BY,
                H.EXPIRY_DATE,
                H.EXPIRY_AFTER,
                H.EDITABLE_YN,
                H.ARCHIVED_YN,
                H.ACTIVE_YN,
                H.STATUS_YN,
                H.ATTRIBUTE1,
                H.ATTRIBUTE2,
                H.ATTRIBUTE3,
                H.ATTRIBUTE4,
                H.ATTRIBUTE5,
                H.ATTRIBUTE6,
                H.ATTRIBUTE7,
                H.ATTRIBUTE8,
                H.ATTRIBUTE9,
                H.ATTRIBUTE10,
                SYSDATE SERVER_DATE
           FROM DSS_ORDER_SCAN_HEADER H
                LEFT OUTER JOIN
                TK_ORG_ORDER_CONFIG O
                   ON     H.DEST_ORGANIZATION_ID = O.ORGANIZATION_ID
                      AND H.ORDER_TYPE = O.ORDER_SHORT_CODE
          WHERE JOBID = p_JOBID;
   END P_LoadByPrimaryKey;


   PROCEDURE P_LoadbyOrderNumber (
      p_SCR_OPREATING_UNIT    IN     DSS_ORDER_SCAN_HEADER.SCR_OPREATING_UNIT%TYPE,
      p_SCR_ORGANIZATION_ID   IN     DSS_ORDER_SCAN_HEADER.SCR_ORGANIZATION_ID%TYPE,
      p_ORDER_TYPE            IN     DSS_ORDER_SCAN_HEADER.ORDER_TYPE%TYPE,
      p_ORDER_NUMBER          IN     DSS_ORDER_SCAN_HEADER.ORDER_NUMBER%TYPE,
      p_CREATE_BY             IN     DSS_ORDER_SCAN_HEADER.CREATE_BY%TYPE,
      outCursor                  OUT DSS.MYGEN.sqlcur)
   IS
      V_OrderExists     CHAR (1) DEFAULT 'N';
      V_JOBNO           NUMBER;
      V_ORDER_FILTER    NUMBER;
      V_ORDER_EXPIRED   NUMBER;
      V_ORDER_TYPE      VARCHAR (50);
   BEGIN
      V_ORDER_TYPE := p_ORDER_TYPE;

      SELECT CASE WHEN COUNT (*) > 0 THEN 'Y' ELSE 'N' END
        INTO V_OrderExists
        FROM v_ORDER_SCAN_HEADER
       WHERE (    SCR_ORGANIZATION_ID = p_SCR_ORGANIZATION_ID
              AND ORDER_TYPE = V_ORDER_TYPE
              AND ORDER_NUMBER = p_ORDER_NUMBER);



      SELECT ORDER_FILTER, ORDER_EXPIRED
        INTO V_ORDER_FILTER, V_ORDER_EXPIRED
        FROM TK_ORG_ORDER_CONFIG
       WHERE     ORGANIZATION_ID = p_SCR_ORGANIZATION_ID
             AND ORDER_SHORT_CODE = V_ORDER_TYPE
             AND ROWNUM = 1;

      IF V_OrderExists = 'N'
      THEN
         PKG_SCAN_ORDERS.P_CREATE_ORDER (p_SCR_OPREATING_UNIT,
                                         P_SCR_ORGANIZATION_ID,
                                         V_ORDER_TYPE,
                                         P_ORDER_NUMBER,
                                         P_CREATE_BY,
                                         'DSS',                    --  'DSS-',
                                         V_ORDER_EXPIRED,
                                         V_ORDER_FILTER,
                                         V_JOBNO);
         UPDATE_WARRANTYSEQ (V_JOBNO);
      ELSE
           SELECT JOBID
             INTO V_JOBNO
             FROM v_ORDER_SCAN_HEADER
            WHERE     (    SCR_ORGANIZATION_ID = p_SCR_ORGANIZATION_ID
                       AND ORDER_TYPE = V_ORDER_TYPE
                       AND ORDER_NUMBER = p_ORDER_NUMBER)
                  AND ROWNUM = 1
         ORDER BY ORDER_DATE DESC;
      END IF;

      OPEN outCursor FOR
         SELECT JOBID,
                APP_SOURCE,
                ORDER_TYPE,
                ORDER_NUMBER,
                ORDER_REF_NO,
                ORDER_REF_NO2,
                ORDER_DATE,
                ORDER_REMARKS,
                WARRANTY_YN,
                WMS_YN,
                INTERNAL_YN,
                SCR_TYPE,
                SCR_REF_NUMBER,
                SCR_REF_CODE,
                SCR_OPREATING_UNIT,
                SCR_ORGANIZATION_ID,
                SCR_LOCATION_CODE,
                DEST_TYPE,
                DEST_REF_NUMBER,
                DEST_REF_CODE,
                DEST_OPREATING_UNIT,
                DEST_ORGANIZATION_ID,
                DEST_LOCATION_CODE,
                CREATE_DATE,
                MODIFY_DATE,
                CREATE_BY,
                MODIFY_BY,
                EXPIRY_DATE,
                EXPIRY_AFTER,
                EDITABLE_YN,
                ARCHIVED_YN,
                ACTIVE_YN,
                STATUS_YN,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6,
                ATTRIBUTE7,
                ATTRIBUTE8,
                ATTRIBUTE9,
                ATTRIBUTE10,
                SYSDATE SERVER_DATE
           FROM v_ORDER_SCAN_HEADER
          WHERE JOBID = V_JOBNO;
   EXCEPTION
      WHEN OTHERS
      THEN
         DBMS_OUTPUT.PUT_LINE (SQLERRM);
   END P_LoadbyOrderNumber;



   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT JOBID,
                APP_SOURCE,
                ORDER_TYPE,
                ORDER_NUMBER,
                ORDER_REF_NO,
                ORDER_REF_NO2,
                ORDER_DATE,
                ORDER_REMARKS,
                WARRANTY_YN,
                WMS_YN,
                INTERNAL_YN,
                SCR_TYPE,
                SCR_REF_NUMBER,
                SCR_REF_CODE,
                SCR_OPREATING_UNIT,
                SCR_ORGANIZATION_ID,
                SCR_LOCATION_CODE,
                DEST_TYPE,
                DEST_REF_NUMBER,
                DEST_REF_CODE,
                DEST_OPREATING_UNIT,
                DEST_ORGANIZATION_ID,
                DEST_LOCATION_CODE,
                CREATE_DATE,
                MODIFY_DATE,
                CREATE_BY,
                MODIFY_BY,
                EXPIRY_DATE,
                EXPIRY_AFTER,
                EDITABLE_YN,
                ARCHIVED_YN,
                ACTIVE_YN,
                STATUS_YN,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6,
                ATTRIBUTE7,
                ATTRIBUTE8,
                ATTRIBUTE9,
                ATTRIBUTE10,
                SYSDATE SERVER_DATE
           FROM DSS_ORDER_SCAN_HEADER;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_JOBID                  IN DSS_ORDER_SCAN_HEADER.JOBID%TYPE,
      p_APP_SOURCE             IN DSS_ORDER_SCAN_HEADER.APP_SOURCE%TYPE,
      p_ORDER_TYPE             IN DSS_ORDER_SCAN_HEADER.ORDER_TYPE%TYPE,
      p_ORDER_NUMBER           IN DSS_ORDER_SCAN_HEADER.ORDER_NUMBER%TYPE,
      p_ORDER_REF_NO           IN DSS_ORDER_SCAN_HEADER.ORDER_REF_NO%TYPE,
      p_ORDER_REF_NO2          IN DSS_ORDER_SCAN_HEADER.ORDER_REF_NO2%TYPE,
      p_ORDER_DATE             IN DSS_ORDER_SCAN_HEADER.ORDER_DATE%TYPE,
      p_ORDER_REMARKS          IN DSS_ORDER_SCAN_HEADER.ORDER_REMARKS%TYPE,
      p_WARRANTY_YN            IN DSS_ORDER_SCAN_HEADER.WARRANTY_YN%TYPE,
      p_WMS_YN                 IN DSS_ORDER_SCAN_HEADER.WMS_YN%TYPE,
      p_INTERNAL_YN            IN DSS_ORDER_SCAN_HEADER.INTERNAL_YN%TYPE,
      p_SCR_TYPE               IN DSS_ORDER_SCAN_HEADER.SCR_TYPE%TYPE,
      p_SCR_REF_NUMBER         IN DSS_ORDER_SCAN_HEADER.SCR_REF_NUMBER%TYPE,
      p_SCR_REF_CODE           IN DSS_ORDER_SCAN_HEADER.SCR_REF_CODE%TYPE,
      p_SCR_OPREATING_UNIT     IN DSS_ORDER_SCAN_HEADER.SCR_OPREATING_UNIT%TYPE,
      p_SCR_ORGANIZATION_ID    IN DSS_ORDER_SCAN_HEADER.SCR_ORGANIZATION_ID%TYPE,
      p_SCR_LOCATION_CODE      IN DSS_ORDER_SCAN_HEADER.SCR_LOCATION_CODE%TYPE,
      p_DEST_TYPE              IN DSS_ORDER_SCAN_HEADER.DEST_TYPE%TYPE,
      p_DEST_REF_NUMBER        IN DSS_ORDER_SCAN_HEADER.DEST_REF_NUMBER%TYPE,
      p_DEST_REF_CODE          IN DSS_ORDER_SCAN_HEADER.DEST_REF_CODE%TYPE,
      p_DEST_OPREATING_UNIT    IN DSS_ORDER_SCAN_HEADER.DEST_OPREATING_UNIT%TYPE,
      p_DEST_ORGANIZATION_ID   IN DSS_ORDER_SCAN_HEADER.DEST_ORGANIZATION_ID%TYPE,
      p_DEST_LOCATION_CODE     IN DSS_ORDER_SCAN_HEADER.DEST_LOCATION_CODE%TYPE,
      p_CREATE_DATE            IN DSS_ORDER_SCAN_HEADER.CREATE_DATE%TYPE,
      p_MODIFY_DATE            IN DSS_ORDER_SCAN_HEADER.MODIFY_DATE%TYPE,
      p_CREATE_BY              IN DSS_ORDER_SCAN_HEADER.CREATE_BY%TYPE,
      p_MODIFY_BY              IN DSS_ORDER_SCAN_HEADER.MODIFY_BY%TYPE,
      p_EXPIRY_DATE            IN DSS_ORDER_SCAN_HEADER.EXPIRY_DATE%TYPE,
      p_EXPIRY_AFTER           IN DSS_ORDER_SCAN_HEADER.EXPIRY_AFTER%TYPE,
      p_EDITABLE_YN            IN DSS_ORDER_SCAN_HEADER.EDITABLE_YN%TYPE,
      p_ARCHIVED_YN            IN DSS_ORDER_SCAN_HEADER.ARCHIVED_YN%TYPE,
      p_ACTIVE_YN              IN DSS_ORDER_SCAN_HEADER.ACTIVE_YN%TYPE,
      p_STATUS_YN              IN DSS_ORDER_SCAN_HEADER.STATUS_YN%TYPE,
      p_ATTRIBUTE1             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10            IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      UPDATE DSS_ORDER_SCAN_HEADER
         SET APP_SOURCE = p_APP_SOURCE,
             ORDER_TYPE = p_ORDER_TYPE,
             ORDER_NUMBER = p_ORDER_NUMBER,
             ORDER_REF_NO = p_ORDER_REF_NO,
             ORDER_REF_NO2 = p_ORDER_REF_NO2,
             ORDER_DATE = p_ORDER_DATE,
             ORDER_REMARKS = p_ORDER_REMARKS,
             WARRANTY_YN = p_WARRANTY_YN,
             WMS_YN = p_WMS_YN,
             INTERNAL_YN = p_INTERNAL_YN,
             SCR_TYPE = p_SCR_TYPE,
             SCR_REF_NUMBER = p_SCR_REF_NUMBER,
             SCR_REF_CODE = p_SCR_REF_CODE,
             SCR_OPREATING_UNIT = p_SCR_OPREATING_UNIT,
             SCR_ORGANIZATION_ID = p_SCR_ORGANIZATION_ID,
             SCR_LOCATION_CODE = p_SCR_LOCATION_CODE,
             DEST_TYPE = p_DEST_TYPE,
             DEST_REF_NUMBER = p_DEST_REF_NUMBER,
             DEST_REF_CODE = p_DEST_REF_CODE,
             DEST_OPREATING_UNIT = p_DEST_OPREATING_UNIT,
             DEST_ORGANIZATION_ID = p_DEST_ORGANIZATION_ID,
             DEST_LOCATION_CODE = p_DEST_LOCATION_CODE,
             ---CREATE_DATE = p_CREATE_DATE,
             MODIFY_DATE = SYSDATE,
             CREATE_BY = p_CREATE_BY,
             MODIFY_BY = p_MODIFY_BY,
             EXPIRY_DATE = p_EXPIRY_DATE,
             EXPIRY_AFTER = p_EXPIRY_AFTER,
             EDITABLE_YN = p_EDITABLE_YN,
             ARCHIVED_YN = p_ARCHIVED_YN,
             ACTIVE_YN = p_ACTIVE_YN,
             STATUS_YN = p_STATUS_YN,
             ATTRIBUTE1 = p_ATTRIBUTE1,
             ATTRIBUTE2 = p_ATTRIBUTE2,
             ATTRIBUTE3 = p_ATTRIBUTE3,
             ATTRIBUTE4 = p_ATTRIBUTE4,
             ATTRIBUTE5 = p_ATTRIBUTE5,
             ATTRIBUTE6 = p_ATTRIBUTE6,
             ATTRIBUTE7 = p_ATTRIBUTE7,
             ATTRIBUTE8 = p_ATTRIBUTE8,
             ATTRIBUTE9 = p_ATTRIBUTE9,
             ATTRIBUTE10 = p_ATTRIBUTE10
       WHERE JOBID = p_JOBID;
   END P_Update;


   PROCEDURE P_Insert (
      p_JOBID                  IN DSS_ORDER_SCAN_HEADER.JOBID%TYPE,
      p_APP_SOURCE             IN DSS_ORDER_SCAN_HEADER.APP_SOURCE%TYPE,
      p_ORDER_TYPE             IN DSS_ORDER_SCAN_HEADER.ORDER_TYPE%TYPE,
      p_ORDER_NUMBER           IN DSS_ORDER_SCAN_HEADER.ORDER_NUMBER%TYPE,
      p_ORDER_REF_NO           IN DSS_ORDER_SCAN_HEADER.ORDER_REF_NO%TYPE,
      p_ORDER_REF_NO2          IN DSS_ORDER_SCAN_HEADER.ORDER_REF_NO2%TYPE,
      p_ORDER_DATE             IN DSS_ORDER_SCAN_HEADER.ORDER_DATE%TYPE,
      p_ORDER_REMARKS          IN DSS_ORDER_SCAN_HEADER.ORDER_REMARKS%TYPE,
      p_WARRANTY_YN            IN DSS_ORDER_SCAN_HEADER.WARRANTY_YN%TYPE,
      p_WMS_YN                 IN DSS_ORDER_SCAN_HEADER.WMS_YN%TYPE,
      p_INTERNAL_YN            IN DSS_ORDER_SCAN_HEADER.INTERNAL_YN%TYPE,
      p_SCR_TYPE               IN DSS_ORDER_SCAN_HEADER.SCR_TYPE%TYPE,
      p_SCR_REF_NUMBER         IN DSS_ORDER_SCAN_HEADER.SCR_REF_NUMBER%TYPE,
      p_SCR_REF_CODE           IN DSS_ORDER_SCAN_HEADER.SCR_REF_CODE%TYPE,
      p_SCR_OPREATING_UNIT     IN DSS_ORDER_SCAN_HEADER.SCR_OPREATING_UNIT%TYPE,
      p_SCR_ORGANIZATION_ID    IN DSS_ORDER_SCAN_HEADER.SCR_ORGANIZATION_ID%TYPE,
      p_SCR_LOCATION_CODE      IN DSS_ORDER_SCAN_HEADER.SCR_LOCATION_CODE%TYPE,
      p_DEST_TYPE              IN DSS_ORDER_SCAN_HEADER.DEST_TYPE%TYPE,
      p_DEST_REF_NUMBER        IN DSS_ORDER_SCAN_HEADER.DEST_REF_NUMBER%TYPE,
      p_DEST_REF_CODE          IN DSS_ORDER_SCAN_HEADER.DEST_REF_CODE%TYPE,
      p_DEST_OPREATING_UNIT    IN DSS_ORDER_SCAN_HEADER.DEST_OPREATING_UNIT%TYPE,
      p_DEST_ORGANIZATION_ID   IN DSS_ORDER_SCAN_HEADER.DEST_ORGANIZATION_ID%TYPE,
      p_DEST_LOCATION_CODE     IN DSS_ORDER_SCAN_HEADER.DEST_LOCATION_CODE%TYPE,
      p_CREATE_DATE            IN DSS_ORDER_SCAN_HEADER.CREATE_DATE%TYPE,
      p_MODIFY_DATE            IN DSS_ORDER_SCAN_HEADER.MODIFY_DATE%TYPE,
      p_CREATE_BY              IN DSS_ORDER_SCAN_HEADER.CREATE_BY%TYPE,
      p_MODIFY_BY              IN DSS_ORDER_SCAN_HEADER.MODIFY_BY%TYPE,
      p_EXPIRY_DATE            IN DSS_ORDER_SCAN_HEADER.EXPIRY_DATE%TYPE,
      p_EXPIRY_AFTER           IN DSS_ORDER_SCAN_HEADER.EXPIRY_AFTER%TYPE,
      p_EDITABLE_YN            IN DSS_ORDER_SCAN_HEADER.EDITABLE_YN%TYPE,
      p_ARCHIVED_YN            IN DSS_ORDER_SCAN_HEADER.ARCHIVED_YN%TYPE,
      p_ACTIVE_YN              IN DSS_ORDER_SCAN_HEADER.ACTIVE_YN%TYPE,
      p_STATUS_YN              IN DSS_ORDER_SCAN_HEADER.STATUS_YN%TYPE,
      p_ATTRIBUTE1             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9             IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10            IN DSS_ORDER_SCAN_HEADER.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      INSERT INTO DSS_ORDER_SCAN_HEADER (JOBID,
                                         APP_SOURCE,
                                         ORDER_TYPE,
                                         ORDER_NUMBER,
                                         ORDER_REF_NO,
                                         ORDER_REF_NO2,
                                         ORDER_DATE,
                                         ORDER_REMARKS,
                                         WARRANTY_YN,
                                         WMS_YN,
                                         INTERNAL_YN,
                                         SCR_TYPE,
                                         SCR_REF_NUMBER,
                                         SCR_REF_CODE,
                                         SCR_OPREATING_UNIT,
                                         SCR_ORGANIZATION_ID,
                                         SCR_LOCATION_CODE,
                                         DEST_TYPE,
                                         DEST_REF_NUMBER,
                                         DEST_REF_CODE,
                                         DEST_OPREATING_UNIT,
                                         DEST_ORGANIZATION_ID,
                                         DEST_LOCATION_CODE,
                                         CREATE_DATE,
                                         MODIFY_DATE,
                                         CREATE_BY,
                                         MODIFY_BY,
                                         EXPIRY_DATE,
                                         EXPIRY_AFTER,
                                         EDITABLE_YN,
                                         ARCHIVED_YN,
                                         ACTIVE_YN,
                                         STATUS_YN,
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
           VALUES (p_JOBID,
                   p_APP_SOURCE,
                   p_ORDER_TYPE,
                   p_ORDER_NUMBER,
                   p_ORDER_REF_NO,
                   p_ORDER_REF_NO2,
                   p_ORDER_DATE,
                   p_ORDER_REMARKS,
                   p_WARRANTY_YN,
                   p_WMS_YN,
                   p_INTERNAL_YN,
                   p_SCR_TYPE,
                   p_SCR_REF_NUMBER,
                   p_SCR_REF_CODE,
                   p_SCR_OPREATING_UNIT,
                   p_SCR_ORGANIZATION_ID,
                   p_SCR_LOCATION_CODE,
                   p_DEST_TYPE,
                   p_DEST_REF_NUMBER,
                   p_DEST_REF_CODE,
                   p_DEST_OPREATING_UNIT,
                   p_DEST_ORGANIZATION_ID,
                   p_DEST_LOCATION_CODE,
                   SYSDATE,
                   SYSDATE,
                   p_CREATE_BY,
                   p_MODIFY_BY,
                   p_EXPIRY_DATE,
                   p_EXPIRY_AFTER,
                   p_EDITABLE_YN,
                   p_ARCHIVED_YN,
                   p_ACTIVE_YN,
                   p_STATUS_YN,
                   p_ATTRIBUTE1,
                   p_ATTRIBUTE2,
                   p_ATTRIBUTE3,
                   p_ATTRIBUTE4,
                   p_ATTRIBUTE5,
                   p_ATTRIBUTE6,
                   p_ATTRIBUTE7,
                   p_ATTRIBUTE8,
                   p_ATTRIBUTE9,
                   p_ATTRIBUTE10);
   END P_Insert;

   PROCEDURE P_Delete (p_JOBID IN DSS_ORDER_SCAN_HEADER.JOBID%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_ORDER_SCAN_HEADER
            WHERE JOBID = p_JOBID;
   END P_Delete;

   PROCEDURE P_UpdateWithLog (
      p_JOBID          IN DSS_ORDER_SCAN_HEADER.JOBID%TYPE,
      p_WARRANTY_YN    IN DSS_ORDER_SCAN_HEADER.WARRANTY_YN%TYPE,
      p_EXPIRY_DATE    IN DSS_ORDER_SCAN_HEADER.EXPIRY_DATE%TYPE,
      p_MODIFY_BY      IN DSS_ORDER_SCAN_HEADER.MODIFY_BY%TYPE,
      UP_OLD_VALUE     IN VARCHAR2,
      UP_REMARKS       IN VARCHAR2,
      UP_COLUMN_NAME   IN VARCHAR2,
      UP_STATUS        IN VARCHAR2)
   AS
   BEGIN
      UPDATE DSS_ORDER_SCAN_HEADER
         SET WARRANTY_YN = p_WARRANTY_YN,
             EXPIRY_DATE = p_EXPIRY_DATE,
             MODIFY_BY = p_MODIFY_BY,
             MODIFY_DATE = SYSDATE
       WHERE JOBID = p_JOBID;

      PKG_DSS_LOG_ORDER_SCAN.ADD_LOG ('H',        -- CHANGES AT (H)EADER LEVEL
                                      'DSS_ORDER_SCAN_HEADER',
                                      UP_COLUMN_NAME,
                                      p_JOBID,
                                      TO_CHAR (UP_OLD_VALUE),
                                      TO_CHAR (p_EXPIRY_DATE),
                                      UP_STATUS,
                                      UP_REMARKS,
                                      p_MODIFY_BY);
   END P_UpdateWithLog;


   PROCEDURE P_Delete_OrderByJobId (
      p_JOBID IN DSS_ORDER_SCAN_HEADER.JOBID%TYPE)
   AS
      V_EXISTS   VARCHAR2 (1);
   BEGIN
      SELECT CASE
                WHEN EXISTS
                        (SELECT 1
                           FROM dss_order_scan_serials
                          WHERE jobid = p_JOBID)
                THEN
                   'Y'
                ELSE
                   'N'
             END
                AS rec_exists
        INTO V_EXISTS
        FROM DUAL;

      IF (V_EXISTS = 'N')
      THEN
         DELETE FROM dss_order_scan_lines
               WHERE jobid = p_JOBID;

         DELETE FROM dss_order_scan_header
               WHERE jobid = p_JOBID;
      END IF;
   END P_Delete_OrderByJobId;

   PROCEDURE P_Delete_OrderByOrderNumber (
      p_ORDER_NUMBER IN DSS_ORDER_SCAN_HEADER.ORDER_NUMBER%TYPE)
   AS
      V_EXISTS   VARCHAR2 (1);
   BEGIN
      SELECT CASE
                WHEN EXISTS
                        (SELECT 1
                           FROM dss_order_scan_serials
                          WHERE order_number = p_ORDER_NUMBER)
                THEN
                   'Y'
                ELSE
                   'N'
             END
                AS rec_exists
        INTO V_EXISTS
        FROM DUAL;

      IF (V_EXISTS = 'N')
      THEN
         DELETE FROM dss_order_scan_lines
               WHERE order_number = p_ORDER_NUMBER;

         DELETE FROM dss_order_scan_header
               WHERE order_number = p_ORDER_NUMBER;
      END IF;
   END P_Delete_OrderByOrderNumber;
END PKG_DSS_ORDER_SCAN_HEADER;
/
