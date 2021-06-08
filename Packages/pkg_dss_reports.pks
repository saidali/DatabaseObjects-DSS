DROP PACKAGE DSS.PKG_DSS_REPORTS;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_REPORTS
AS
   PROCEDURE GetProcedureParamter (p_PACKAGE_NAME    IN     VARCHAR2,
                                   p_PROCEDURENAME   IN     VARCHAR2,
                                   OUTCURSOR            OUT DSS.MYGEN.sqlcur);

   PROCEDURE report_test (ordernumber   IN     varchar2,
                          orderdate            DATE,
                          outCursor        OUT DSS.MYGEN.sqlcur);
                          
   PROCEDURE serial_test (imei   IN     varchar2,
                          outCursor        OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (p_REPT_ID   IN     DSS_REPORTS.REPT_ID%TYPE,
                                 outCursor      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (p_REPT_ID          IN DSS_REPORTS.REPT_ID%TYPE,
                       p_PARENT_ID        IN DSS_REPORTS.PARENT_ID%TYPE,
                       p_REPT_NAME        IN DSS_REPORTS.REPT_NAME%TYPE,
                       p_REPT_PACKAGE     IN DSS_REPORTS.REPT_PACKAGE%TYPE,
                       p_REPT_PROCEDURE   IN DSS_REPORTS.REPT_PROCEDURE%TYPE,
                       p_IS_REPORT        IN DSS_REPORTS.IS_REPORT%TYPE,
                       p_IS_ACTIVE        IN DSS_REPORTS.IS_ACTIVE%TYPE,
                       p_IS_PAGING        IN DSS_REPORTS.IS_PAGING%TYPE,
                       p_IS_DEFAULT       IN DSS_REPORTS.IS_DEFAULT%TYPE,
                       p_CREATE_BY        IN DSS_REPORTS.CREATE_BY%TYPE,
                       p_CREATE_DATE      IN DSS_REPORTS.CREATE_DATE%TYPE,
                       p_MODIFY_BY        IN DSS_REPORTS.MODIFY_BY%TYPE,
                       p_MODIFY_DATE      IN DSS_REPORTS.MODIFY_DATE%TYPE,
                       p_ATTRIBUTE1       IN DSS_REPORTS.ATTRIBUTE1%TYPE,
                       p_ATTRIBUTE2       IN DSS_REPORTS.ATTRIBUTE2%TYPE,
                       p_ATTRIBUTE3       IN DSS_REPORTS.ATTRIBUTE3%TYPE,
                       p_ATTRIBUTE4       IN DSS_REPORTS.ATTRIBUTE4%TYPE,
                       p_ATTRIBUTE5       IN DSS_REPORTS.ATTRIBUTE5%TYPE,
                       p_ATTRIBUTE6       IN DSS_REPORTS.ATTRIBUTE6%TYPE,
                       p_ATTRIBUTE7       IN DSS_REPORTS.ATTRIBUTE7%TYPE,
                       p_ATTRIBUTE8       IN DSS_REPORTS.ATTRIBUTE8%TYPE,
                       p_ATTRIBUTE9       IN DSS_REPORTS.ATTRIBUTE9%TYPE,
                       p_ATTRIBUTE10      IN DSS_REPORTS.ATTRIBUTE10%TYPE);

   PROCEDURE P_Insert (p_REPT_ID          IN DSS_REPORTS.REPT_ID%TYPE,
                       p_PARENT_ID        IN DSS_REPORTS.PARENT_ID%TYPE,
                       p_REPT_NAME        IN DSS_REPORTS.REPT_NAME%TYPE,
                       p_REPT_PACKAGE     IN DSS_REPORTS.REPT_PACKAGE%TYPE,
                       p_REPT_PROCEDURE   IN DSS_REPORTS.REPT_PROCEDURE%TYPE,
                       p_IS_REPORT        IN DSS_REPORTS.IS_REPORT%TYPE,
                       p_IS_ACTIVE        IN DSS_REPORTS.IS_ACTIVE%TYPE,
                       p_IS_PAGING        IN DSS_REPORTS.IS_PAGING%TYPE,
                       p_IS_DEFAULT       IN DSS_REPORTS.IS_DEFAULT%TYPE,
                       p_CREATE_BY        IN DSS_REPORTS.CREATE_BY%TYPE,
                       p_CREATE_DATE      IN DSS_REPORTS.CREATE_DATE%TYPE,
                       p_MODIFY_BY        IN DSS_REPORTS.MODIFY_BY%TYPE,
                       p_MODIFY_DATE      IN DSS_REPORTS.MODIFY_DATE%TYPE,
                       p_ATTRIBUTE1       IN DSS_REPORTS.ATTRIBUTE1%TYPE,
                       p_ATTRIBUTE2       IN DSS_REPORTS.ATTRIBUTE2%TYPE,
                       p_ATTRIBUTE3       IN DSS_REPORTS.ATTRIBUTE3%TYPE,
                       p_ATTRIBUTE4       IN DSS_REPORTS.ATTRIBUTE4%TYPE,
                       p_ATTRIBUTE5       IN DSS_REPORTS.ATTRIBUTE5%TYPE,
                       p_ATTRIBUTE6       IN DSS_REPORTS.ATTRIBUTE6%TYPE,
                       p_ATTRIBUTE7       IN DSS_REPORTS.ATTRIBUTE7%TYPE,
                       p_ATTRIBUTE8       IN DSS_REPORTS.ATTRIBUTE8%TYPE,
                       p_ATTRIBUTE9       IN DSS_REPORTS.ATTRIBUTE9%TYPE,
                       p_ATTRIBUTE10      IN DSS_REPORTS.ATTRIBUTE10%TYPE);

   PROCEDURE P_Delete (p_REPT_ID IN DSS_REPORTS.REPT_ID%TYPE);
END PKG_DSS_REPORTS;
/


DROP PACKAGE BODY DSS.PKG_DSS_REPORTS;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_REPORTS
AS
   PROCEDURE GetProcedureParamter (p_PACKAGE_NAME    IN     VARCHAR2,
                                   p_PROCEDURENAME   IN     VARCHAR2,
                                   OUTCURSOR            OUT DSS.MYGEN.sqlcur)
   AS
   BEGIN
      OPEN OUTCURSOR FOR
         SELECT *
           FROM V_PROCEDURE_PARAMETERS
          WHERE     UPPER (PACKAGE_NAME) = UPPER (p_PACKAGE_NAME)
                AND UPPER (PROCEDURENAME) = UPPER (p_PROCEDURENAME);
   END GetProcedureParamter;

   PROCEDURE report_test (ordernumber   IN     VARCHAR2,
                          orderdate            DATE,
                          outCursor        OUT DSS.MYGEN.sqlcur)
   AS
   BEGIN
      OPEN outcursor FOR
         SELECT *
           FROM dss_order_scan_serials
          WHERE order_number = ordernumber;
   --trunc(CREATE_DATE) = trunc(orderdate) AND
   END report_test;

   PROCEDURE serial_test (imei IN VARCHAR2, outCursor OUT DSS.MYGEN.sqlcur)
   AS
   BEGIN
      OPEN outcursor FOR
         SELECT *
           FROM dss_order_scan_serials
          WHERE serialkey = imei;
   END serial_test;

   PROCEDURE P_LoadByPrimaryKey (p_REPT_ID   IN     DSS_REPORTS.REPT_ID%TYPE,
                                 outCursor      OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT REPT_ID,
                PARENT_ID,
                REPT_NAME,
                REPT_PACKAGE,
                REPT_PROCEDURE,
                IS_REPORT,
                IS_ACTIVE,
                IS_PAGING,
                IS_DEFAULT,
                CREATE_BY,
                CREATE_DATE,
                MODIFY_BY,
                MODIFY_DATE,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6,
                ATTRIBUTE7,
                ATTRIBUTE8,
                ATTRIBUTE9,
                ATTRIBUTE10
           FROM DSS_REPORTS
          WHERE REPT_ID = p_REPT_ID;
   END P_LoadByPrimaryKey;

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT REPT_ID,
                PARENT_ID,
                REPT_NAME,
                REPT_PACKAGE,
                REPT_PROCEDURE,
                IS_REPORT,
                IS_ACTIVE,
                IS_PAGING,
                IS_DEFAULT,
                CREATE_BY,
                CREATE_DATE,
                MODIFY_BY,
                MODIFY_DATE,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6,
                ATTRIBUTE7,
                ATTRIBUTE8,
                ATTRIBUTE9,
                ATTRIBUTE10
           FROM DSS_REPORTS;
   END P_LoadAll;


   PROCEDURE P_Update (p_REPT_ID          IN DSS_REPORTS.REPT_ID%TYPE,
                       p_PARENT_ID        IN DSS_REPORTS.PARENT_ID%TYPE,
                       p_REPT_NAME        IN DSS_REPORTS.REPT_NAME%TYPE,
                       p_REPT_PACKAGE     IN DSS_REPORTS.REPT_PACKAGE%TYPE,
                       p_REPT_PROCEDURE   IN DSS_REPORTS.REPT_PROCEDURE%TYPE,
                       p_IS_REPORT        IN DSS_REPORTS.IS_REPORT%TYPE,
                       p_IS_ACTIVE        IN DSS_REPORTS.IS_ACTIVE%TYPE,
                       p_IS_PAGING        IN DSS_REPORTS.IS_PAGING%TYPE,
                       p_IS_DEFAULT       IN DSS_REPORTS.IS_DEFAULT%TYPE,
                       p_CREATE_BY        IN DSS_REPORTS.CREATE_BY%TYPE,
                       p_CREATE_DATE      IN DSS_REPORTS.CREATE_DATE%TYPE,
                       p_MODIFY_BY        IN DSS_REPORTS.MODIFY_BY%TYPE,
                       p_MODIFY_DATE      IN DSS_REPORTS.MODIFY_DATE%TYPE,
                       p_ATTRIBUTE1       IN DSS_REPORTS.ATTRIBUTE1%TYPE,
                       p_ATTRIBUTE2       IN DSS_REPORTS.ATTRIBUTE2%TYPE,
                       p_ATTRIBUTE3       IN DSS_REPORTS.ATTRIBUTE3%TYPE,
                       p_ATTRIBUTE4       IN DSS_REPORTS.ATTRIBUTE4%TYPE,
                       p_ATTRIBUTE5       IN DSS_REPORTS.ATTRIBUTE5%TYPE,
                       p_ATTRIBUTE6       IN DSS_REPORTS.ATTRIBUTE6%TYPE,
                       p_ATTRIBUTE7       IN DSS_REPORTS.ATTRIBUTE7%TYPE,
                       p_ATTRIBUTE8       IN DSS_REPORTS.ATTRIBUTE8%TYPE,
                       p_ATTRIBUTE9       IN DSS_REPORTS.ATTRIBUTE9%TYPE,
                       p_ATTRIBUTE10      IN DSS_REPORTS.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      UPDATE DSS_REPORTS
         SET REPT_ID = p_REPT_ID,
             PARENT_ID = p_PARENT_ID,
             REPT_NAME = p_REPT_NAME,
             REPT_PACKAGE = p_REPT_PACKAGE,
             REPT_PROCEDURE = p_REPT_PROCEDURE,
             IS_REPORT = p_IS_REPORT,
             IS_ACTIVE = p_IS_ACTIVE,
             IS_PAGING = p_IS_PAGING,
             IS_DEFAULT = p_IS_DEFAULT,
             CREATE_BY = p_CREATE_BY,
             CREATE_DATE = p_CREATE_DATE,
             MODIFY_BY = p_MODIFY_BY,
             MODIFY_DATE = p_MODIFY_DATE,
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
       WHERE REPT_ID = p_REPT_ID;
   END P_Update;


   PROCEDURE P_Insert (p_REPT_ID          IN DSS_REPORTS.REPT_ID%TYPE,
                       p_PARENT_ID        IN DSS_REPORTS.PARENT_ID%TYPE,
                       p_REPT_NAME        IN DSS_REPORTS.REPT_NAME%TYPE,
                       p_REPT_PACKAGE     IN DSS_REPORTS.REPT_PACKAGE%TYPE,
                       p_REPT_PROCEDURE   IN DSS_REPORTS.REPT_PROCEDURE%TYPE,
                       p_IS_REPORT        IN DSS_REPORTS.IS_REPORT%TYPE,
                       p_IS_ACTIVE        IN DSS_REPORTS.IS_ACTIVE%TYPE,
                       p_IS_PAGING        IN DSS_REPORTS.IS_PAGING%TYPE,
                       p_IS_DEFAULT       IN DSS_REPORTS.IS_DEFAULT%TYPE,
                       p_CREATE_BY        IN DSS_REPORTS.CREATE_BY%TYPE,
                       p_CREATE_DATE      IN DSS_REPORTS.CREATE_DATE%TYPE,
                       p_MODIFY_BY        IN DSS_REPORTS.MODIFY_BY%TYPE,
                       p_MODIFY_DATE      IN DSS_REPORTS.MODIFY_DATE%TYPE,
                       p_ATTRIBUTE1       IN DSS_REPORTS.ATTRIBUTE1%TYPE,
                       p_ATTRIBUTE2       IN DSS_REPORTS.ATTRIBUTE2%TYPE,
                       p_ATTRIBUTE3       IN DSS_REPORTS.ATTRIBUTE3%TYPE,
                       p_ATTRIBUTE4       IN DSS_REPORTS.ATTRIBUTE4%TYPE,
                       p_ATTRIBUTE5       IN DSS_REPORTS.ATTRIBUTE5%TYPE,
                       p_ATTRIBUTE6       IN DSS_REPORTS.ATTRIBUTE6%TYPE,
                       p_ATTRIBUTE7       IN DSS_REPORTS.ATTRIBUTE7%TYPE,
                       p_ATTRIBUTE8       IN DSS_REPORTS.ATTRIBUTE8%TYPE,
                       p_ATTRIBUTE9       IN DSS_REPORTS.ATTRIBUTE9%TYPE,
                       p_ATTRIBUTE10      IN DSS_REPORTS.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      INSERT INTO DSS_REPORTS (REPT_ID,
                               PARENT_ID,
                               REPT_NAME,
                               REPT_PACKAGE,
                               REPT_PROCEDURE,
                               IS_REPORT,
                               IS_ACTIVE,
                               IS_PAGING,
                               IS_DEFAULT,
                               CREATE_BY,
                               CREATE_DATE,
                               MODIFY_BY,
                               MODIFY_DATE,
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
           VALUES (p_REPT_ID,
                   p_PARENT_ID,
                   p_REPT_NAME,
                   p_REPT_PACKAGE,
                   p_REPT_PROCEDURE,
                   p_IS_REPORT,
                   p_IS_ACTIVE,
                   p_IS_PAGING,
                   p_IS_DEFAULT,
                   p_CREATE_BY,
                   p_CREATE_DATE,
                   p_MODIFY_BY,
                   p_MODIFY_DATE,
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

   PROCEDURE P_Delete (p_REPT_ID IN DSS_REPORTS.REPT_ID%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_REPORTS
            WHERE REPT_ID = p_REPT_ID;
   END P_Delete;
END PKG_DSS_REPORTS;
/
