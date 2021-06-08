DROP PACKAGE DSS.PKG_DSS_ERROR_LOG;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_ERROR_LOG  as 


 PROCEDURE PK_DSS_ERROR_LOG
(
    p_LOGID IN DSS_ERROR_LOG.LOGID%type,
    outCursor OUT DSS.MYGEN.sqlcur);  





PROCEDURE PL_DSS_ERROR_LOG 
(
    outCursor OUT DSS.MYGEN.sqlcur
) ; 

PROCEDURE PU_DSS_ERROR_LOG 
(
    p_LOGID IN DSS_ERROR_LOG.LOGID%type,
    p_ERRORID IN DSS_ERROR_LOG.ERRORID%type,
    p_ERROR_LEVEL IN DSS_ERROR_LOG.ERROR_LEVEL%type,
    p_ERROR_ON IN DSS_ERROR_LOG.ERROR_ON%type,
    p_ERROR_MESSAGE IN DSS_ERROR_LOG.ERROR_MESSAGE%type,
    p_ERROR_CODE IN DSS_ERROR_LOG.ERROR_CODE%type,
    p_ORG_ID IN DSS_ERROR_LOG.ORG_ID%type,
    p_ORGANIZATION_ID IN DSS_ERROR_LOG.ORGANIZATION_ID%type,
    p_LOCATION_CODE IN DSS_ERROR_LOG.LOCATION_CODE%type,
    p_LINEID IN DSS_ERROR_LOG.LINEID%type,
    p_PRODUCT_CODE IN DSS_ERROR_LOG.PRODUCT_CODE%type,
    p_REMARKS IN DSS_ERROR_LOG.REMARKS%type,
    p_CREATE_DATE IN DSS_ERROR_LOG.CREATE_DATE%type,
    p_STATUS IN DSS_ERROR_LOG.STATUS%type,
    p_ATTRIBUTE1 IN DSS_ERROR_LOG.ATTRIBUTE1%type,
    p_ATTRIBUTE2 IN DSS_ERROR_LOG.ATTRIBUTE2%type,
    p_ATTRIBUTE3 IN DSS_ERROR_LOG.ATTRIBUTE3%type,
    p_ATTRIBUTE4 IN DSS_ERROR_LOG.ATTRIBUTE4%type,
    p_ATTRIBUTE5 IN DSS_ERROR_LOG.ATTRIBUTE5%type
) ;     



PROCEDURE PI_DSS_ERROR_LOG 
(
    p_LOGID IN DSS_ERROR_LOG.LOGID%type,
    p_ERRORID IN DSS_ERROR_LOG.ERRORID%type,
    p_ERROR_LEVEL IN DSS_ERROR_LOG.ERROR_LEVEL%type,
    p_ERROR_ON IN DSS_ERROR_LOG.ERROR_ON%type,
    p_ERROR_MESSAGE IN DSS_ERROR_LOG.ERROR_MESSAGE%type,
    p_ERROR_CODE IN DSS_ERROR_LOG.ERROR_CODE%type,
    p_ORG_ID IN DSS_ERROR_LOG.ORG_ID%type,
    p_ORGANIZATION_ID IN DSS_ERROR_LOG.ORGANIZATION_ID%type,
    p_LOCATION_CODE IN DSS_ERROR_LOG.LOCATION_CODE%type,
    p_LINEID IN DSS_ERROR_LOG.LINEID%type,
    p_PRODUCT_CODE IN DSS_ERROR_LOG.PRODUCT_CODE%type,
    p_REMARKS IN DSS_ERROR_LOG.REMARKS%type,
    p_CREATE_DATE IN DSS_ERROR_LOG.CREATE_DATE%type,
    p_STATUS IN DSS_ERROR_LOG.STATUS%type,
    p_ATTRIBUTE1 IN DSS_ERROR_LOG.ATTRIBUTE1%type,
    p_ATTRIBUTE2 IN DSS_ERROR_LOG.ATTRIBUTE2%type,
    p_ATTRIBUTE3 IN DSS_ERROR_LOG.ATTRIBUTE3%type,
    p_ATTRIBUTE4 IN DSS_ERROR_LOG.ATTRIBUTE4%type,
    p_ATTRIBUTE5 IN DSS_ERROR_LOG.ATTRIBUTE5%type
);

 PROCEDURE PD_DSS_ERROR_LOG 
(
    p_LOGID IN DSS_ERROR_LOG.LOGID%type
);

PROCEDURE LOG_ERROR 
(
    p_LOGID IN DSS_ERROR_LOG.LOGID%type,
    p_ERRORID IN DSS_ERROR_LOG.ERRORID%type,
    p_ERROR_LEVEL IN DSS_ERROR_LOG.ERROR_LEVEL%type,
    p_ERROR_ON IN DSS_ERROR_LOG.ERROR_ON%type,
    p_ERROR_MESSAGE IN DSS_ERROR_LOG.ERROR_MESSAGE%type,
    p_ERROR_CODE IN DSS_ERROR_LOG.ERROR_CODE%type,
    p_ORG_ID IN DSS_ERROR_LOG.ORG_ID%type,
    p_ORGANIZATION_ID IN DSS_ERROR_LOG.ORGANIZATION_ID%type,
    p_LOCATION_CODE IN DSS_ERROR_LOG.LOCATION_CODE%type,
    p_LINEID IN DSS_ERROR_LOG.LINEID%type,
    p_PRODUCT_CODE IN DSS_ERROR_LOG.PRODUCT_CODE%type,
    p_REMARKS IN DSS_ERROR_LOG.REMARKS%type,
    p_CREATE_DATE IN DSS_ERROR_LOG.CREATE_DATE%type,
    p_STATUS IN DSS_ERROR_LOG.STATUS%type
);

 END PKG_DSS_ERROR_LOG ;
/


DROP PACKAGE BODY DSS.PKG_DSS_ERROR_LOG;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_ERROR_LOG
AS
   PROCEDURE PK_DSS_ERROR_LOG (p_LOGID     IN     DSS_ERROR_LOG.LOGID%TYPE,
                               outCursor      OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT LOGID,
                ERRORID,
                ERROR_LEVEL,
                ERROR_ON,
                ERROR_MESSAGE,
                ERROR_CODE,
                ORG_ID,
                ORGANIZATION_ID,
                LOCATION_CODE,
                LINEID,
                PRODUCT_CODE,
                REMARKS,
                CREATE_DATE,
                STATUS,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5
           FROM DSS_ERROR_LOG
          WHERE LOGID = p_LOGID;
   END PK_DSS_ERROR_LOG;



   PROCEDURE PL_DSS_ERROR_LOG (outCursor OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT LOGID,
                ERRORID,
                ERROR_LEVEL,
                ERROR_ON,
                ERROR_MESSAGE,
                ERROR_CODE,
                ORG_ID,
                ORGANIZATION_ID,
                LOCATION_CODE,
                LINEID,
                PRODUCT_CODE,
                REMARKS,
                CREATE_DATE,
                STATUS,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5
           FROM DSS_ERROR_LOG;
   END PL_DSS_ERROR_LOG;

   PROCEDURE PU_DSS_ERROR_LOG (
      p_LOGID             IN DSS_ERROR_LOG.LOGID%TYPE,
      p_ERRORID           IN DSS_ERROR_LOG.ERRORID%TYPE,
      p_ERROR_LEVEL       IN DSS_ERROR_LOG.ERROR_LEVEL%TYPE,
      p_ERROR_ON          IN DSS_ERROR_LOG.ERROR_ON%TYPE,
      p_ERROR_MESSAGE     IN DSS_ERROR_LOG.ERROR_MESSAGE%TYPE,
      p_ERROR_CODE        IN DSS_ERROR_LOG.ERROR_CODE%TYPE,
      p_ORG_ID            IN DSS_ERROR_LOG.ORG_ID%TYPE,
      p_ORGANIZATION_ID   IN DSS_ERROR_LOG.ORGANIZATION_ID%TYPE,
      p_LOCATION_CODE     IN DSS_ERROR_LOG.LOCATION_CODE%TYPE,
      p_LINEID            IN DSS_ERROR_LOG.LINEID%TYPE,
      p_PRODUCT_CODE      IN DSS_ERROR_LOG.PRODUCT_CODE%TYPE,
      p_REMARKS           IN DSS_ERROR_LOG.REMARKS%TYPE,
      p_CREATE_DATE       IN DSS_ERROR_LOG.CREATE_DATE%TYPE,
      p_STATUS            IN DSS_ERROR_LOG.STATUS%TYPE,
      p_ATTRIBUTE1        IN DSS_ERROR_LOG.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2        IN DSS_ERROR_LOG.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3        IN DSS_ERROR_LOG.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4        IN DSS_ERROR_LOG.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5        IN DSS_ERROR_LOG.ATTRIBUTE5%TYPE)
   IS
   BEGIN
      UPDATE DSS_ERROR_LOG
         SET LOGID = p_LOGID,
             ERRORID = p_ERRORID,
             ERROR_LEVEL = p_ERROR_LEVEL,
             ERROR_ON = p_ERROR_ON,
             ERROR_MESSAGE = p_ERROR_MESSAGE,
             ERROR_CODE = p_ERROR_CODE,
             ORG_ID = p_ORG_ID,
             ORGANIZATION_ID = p_ORGANIZATION_ID,
             LOCATION_CODE = p_LOCATION_CODE,
             LINEID = p_LINEID,
             PRODUCT_CODE = p_PRODUCT_CODE,
             REMARKS = p_REMARKS,
             CREATE_DATE = p_CREATE_DATE,
             STATUS = p_STATUS,
             ATTRIBUTE1 = p_ATTRIBUTE1,
             ATTRIBUTE2 = p_ATTRIBUTE2,
             ATTRIBUTE3 = p_ATTRIBUTE3,
             ATTRIBUTE4 = p_ATTRIBUTE4,
             ATTRIBUTE5 = p_ATTRIBUTE5
       WHERE LOGID = p_LOGID;
   END PU_DSS_ERROR_LOG;



   PROCEDURE PI_DSS_ERROR_LOG (
      p_LOGID             IN DSS_ERROR_LOG.LOGID%TYPE,
      p_ERRORID           IN DSS_ERROR_LOG.ERRORID%TYPE,
      p_ERROR_LEVEL       IN DSS_ERROR_LOG.ERROR_LEVEL%TYPE,
      p_ERROR_ON          IN DSS_ERROR_LOG.ERROR_ON%TYPE,
      p_ERROR_MESSAGE     IN DSS_ERROR_LOG.ERROR_MESSAGE%TYPE,
      p_ERROR_CODE        IN DSS_ERROR_LOG.ERROR_CODE%TYPE,
      p_ORG_ID            IN DSS_ERROR_LOG.ORG_ID%TYPE,
      p_ORGANIZATION_ID   IN DSS_ERROR_LOG.ORGANIZATION_ID%TYPE,
      p_LOCATION_CODE     IN DSS_ERROR_LOG.LOCATION_CODE%TYPE,
      p_LINEID            IN DSS_ERROR_LOG.LINEID%TYPE,
      p_PRODUCT_CODE      IN DSS_ERROR_LOG.PRODUCT_CODE%TYPE,
      p_REMARKS           IN DSS_ERROR_LOG.REMARKS%TYPE,
      p_CREATE_DATE       IN DSS_ERROR_LOG.CREATE_DATE%TYPE,
      p_STATUS            IN DSS_ERROR_LOG.STATUS%TYPE,
      p_ATTRIBUTE1        IN DSS_ERROR_LOG.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2        IN DSS_ERROR_LOG.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3        IN DSS_ERROR_LOG.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4        IN DSS_ERROR_LOG.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5        IN DSS_ERROR_LOG.ATTRIBUTE5%TYPE)
   IS
   BEGIN
      INSERT INTO DSS_ERROR_LOG (LOGID,
                                 ERRORID,
                                 ERROR_LEVEL,
                                 ERROR_ON,
                                 ERROR_MESSAGE,
                                 ERROR_CODE,
                                 ORG_ID,
                                 ORGANIZATION_ID,
                                 LOCATION_CODE,
                                 LINEID,
                                 PRODUCT_CODE,
                                 REMARKS,
                                 CREATE_DATE,
                                 STATUS,
                                 ATTRIBUTE1,
                                 ATTRIBUTE2,
                                 ATTRIBUTE3,
                                 ATTRIBUTE4,
                                 ATTRIBUTE5)
           VALUES (p_LOGID,
                   p_ERRORID,
                   p_ERROR_LEVEL,
                   p_ERROR_ON,
                   p_ERROR_MESSAGE,
                   p_ERROR_CODE,
                   p_ORG_ID,
                   p_ORGANIZATION_ID,
                   p_LOCATION_CODE,
                   p_LINEID,
                   p_PRODUCT_CODE,
                   p_REMARKS,
                   p_CREATE_DATE,
                   p_STATUS,
                   p_ATTRIBUTE1,
                   p_ATTRIBUTE2,
                   p_ATTRIBUTE3,
                   p_ATTRIBUTE4,
                   p_ATTRIBUTE5);
   END PI_DSS_ERROR_LOG;

   PROCEDURE PD_DSS_ERROR_LOG (p_LOGID IN DSS_ERROR_LOG.LOGID%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_ERROR_LOG
            WHERE LOGID = p_LOGID;
   END PD_DSS_ERROR_LOG;


   PROCEDURE LOG_ERROR (
      p_LOGID             IN DSS_ERROR_LOG.LOGID%TYPE,
      p_ERRORID           IN DSS_ERROR_LOG.ERRORID%TYPE,
      p_ERROR_LEVEL       IN DSS_ERROR_LOG.ERROR_LEVEL%TYPE,
      p_ERROR_ON          IN DSS_ERROR_LOG.ERROR_ON%TYPE,
      p_ERROR_MESSAGE     IN DSS_ERROR_LOG.ERROR_MESSAGE%TYPE,
      p_ERROR_CODE        IN DSS_ERROR_LOG.ERROR_CODE%TYPE,
      p_ORG_ID            IN DSS_ERROR_LOG.ORG_ID%TYPE,
      p_ORGANIZATION_ID   IN DSS_ERROR_LOG.ORGANIZATION_ID%TYPE,
      p_LOCATION_CODE     IN DSS_ERROR_LOG.LOCATION_CODE%TYPE,
      p_LINEID            IN DSS_ERROR_LOG.LINEID%TYPE,
      p_PRODUCT_CODE      IN DSS_ERROR_LOG.PRODUCT_CODE%TYPE,
      p_REMARKS           IN DSS_ERROR_LOG.REMARKS%TYPE,
      p_CREATE_DATE       IN DSS_ERROR_LOG.CREATE_DATE%TYPE,
      p_STATUS            IN DSS_ERROR_LOG.STATUS%TYPE)
   IS
   BEGIN
      INSERT INTO DSS_ERROR_LOG (LOGID,
                                 ERRORID,
                                 ERROR_LEVEL,
                                 ERROR_ON,
                                 ERROR_MESSAGE,
                                 ERROR_CODE,
                                 ORG_ID,
                                 ORGANIZATION_ID,
                                 LOCATION_CODE,
                                 LINEID,
                                 PRODUCT_CODE,
                                 REMARKS,
                                 CREATE_DATE,
                                 STATUS)
           VALUES (p_LOGID,
                   p_ERRORID,
                   p_ERROR_LEVEL,
                   p_ERROR_ON,
                   p_ERROR_MESSAGE,
                   p_ERROR_CODE,
                   p_ORG_ID,
                   p_ORGANIZATION_ID,
                   p_LOCATION_CODE,
                   p_LINEID,
                   p_PRODUCT_CODE,
                   p_REMARKS,
                   p_CREATE_DATE,
                   p_STATUS);
   END LOG_ERROR;
END PKG_DSS_ERROR_LOG;
/
