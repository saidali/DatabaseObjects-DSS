DROP PACKAGE DSS.PKG_SHOPPER_API_SHOPS;

CREATE OR REPLACE PACKAGE DSS.PKG_SHOPPER_API_SHOPS
AS

   PROCEDURE P_KEYHOURLYEVENTS (
      P_APIPARAMETER_2   IN SHOPPER_API_EVENTS.APIPARAMETER_2%TYPE,
      P_APIPARAMETER_3   IN SHOPPER_API_EVENTS.APIPARAMETER_3%TYPE,
      P_APIPARAMETER_4   IN SHOPPER_API_EVENTS.APIPARAMETER_4%TYPE) ; 
      
         PROCEDURE P_KEYBASICEVENTS (
      P_APIPARAMETER_2   IN SHOPPER_API_EVENTS.APIPARAMETER_2%TYPE,
      P_APIPARAMETER_3   IN SHOPPER_API_EVENTS.APIPARAMETER_3%TYPE) ;
      
   PROCEDURE P_DeleteAll;

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_ROWSEQ    IN     SHOPPER_API_SHOPS.ROWSEQ%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_ROWSEQ               IN SHOPPER_API_SHOPS.ROWSEQ%TYPE,
      p_SHOPPERTRAKID        IN SHOPPER_API_SHOPS.SHOPPERTRAKID%TYPE,
      p_PARENTID             IN SHOPPER_API_SHOPS.PARENTID%TYPE,
      p_CUSTOMERID           IN SHOPPER_API_SHOPS.CUSTOMERID%TYPE,
      p_CUSTOMER_NAME        IN SHOPPER_API_SHOPS.CUSTOMER_NAME%TYPE,
      p_HIERARCHYGROUPID     IN SHOPPER_API_SHOPS.HIERARCHYGROUPID%TYPE,
      p_HIERARCHYGROUPNAME   IN SHOPPER_API_SHOPS.HIERARCHYGROUPNAME%TYPE,
      p_DATE_PERIOD          IN SHOPPER_API_SHOPS.DATE_PERIOD%TYPE,
      p_GROUPBY              IN SHOPPER_API_SHOPS.GROUPBY%TYPE,
      p_CREATE_DATE          IN SHOPPER_API_SHOPS.CREATE_DATE%TYPE,
      p_DWL_DATE             IN SHOPPER_API_SHOPS.DWL_DATE%TYPE,
      p_LAST_UPDATE          IN SHOPPER_API_SHOPS.LAST_UPDATE%TYPE,
      p_ACTIVE               IN SHOPPER_API_SHOPS.ACTIVE%TYPE,
      p_ATTRIBUTE1           IN SHOPPER_API_SHOPS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2           IN SHOPPER_API_SHOPS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3           IN SHOPPER_API_SHOPS.ATTRIBUTE3%TYPE);

   PROCEDURE P_Insert (
      p_ROWSEQ               IN SHOPPER_API_SHOPS.ROWSEQ%TYPE,
      p_SHOPPERTRAKID        IN SHOPPER_API_SHOPS.SHOPPERTRAKID%TYPE,
      p_PARENTID             IN SHOPPER_API_SHOPS.PARENTID%TYPE,
      p_CUSTOMERID           IN SHOPPER_API_SHOPS.CUSTOMERID%TYPE,
      p_CUSTOMER_NAME        IN SHOPPER_API_SHOPS.CUSTOMER_NAME%TYPE,
      p_HIERARCHYGROUPID     IN SHOPPER_API_SHOPS.HIERARCHYGROUPID%TYPE,
      p_HIERARCHYGROUPNAME   IN SHOPPER_API_SHOPS.HIERARCHYGROUPNAME%TYPE,
      p_DATE_PERIOD          IN SHOPPER_API_SHOPS.DATE_PERIOD%TYPE,
      p_GROUPBY              IN SHOPPER_API_SHOPS.GROUPBY%TYPE,
      p_CREATE_DATE          IN SHOPPER_API_SHOPS.CREATE_DATE%TYPE,
      p_DWL_DATE             IN SHOPPER_API_SHOPS.DWL_DATE%TYPE,
      p_LAST_UPDATE          IN SHOPPER_API_SHOPS.LAST_UPDATE%TYPE,
      p_ACTIVE               IN SHOPPER_API_SHOPS.ACTIVE%TYPE,
      p_ATTRIBUTE1           IN SHOPPER_API_SHOPS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2           IN SHOPPER_API_SHOPS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3           IN SHOPPER_API_SHOPS.ATTRIBUTE3%TYPE);

   PROCEDURE P_Delete (p_ROWSEQ IN SHOPPER_API_SHOPS.ROWSEQ%TYPE);
END PKG_SHOPPER_API_SHOPS;
/


DROP PACKAGE BODY DSS.PKG_SHOPPER_API_SHOPS;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_SHOPPER_API_SHOPS
AS
   PROCEDURE P_LoadByPrimaryKey (
      p_ROWSEQ    IN     SHOPPER_API_SHOPS.ROWSEQ%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT ROWSEQ,
                SHOPPERTRAKID,
                PARENTID,
                CUSTOMERID,
                CUSTOMER_NAME,
                HIERARCHYGROUPID,
                HIERARCHYGROUPNAME,
                DATE_PERIOD,
                GROUPBY,
                CREATE_DATE,
                DWL_DATE,
                LAST_UPDATE,
                ACTIVE,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3
           FROM SHOPPER_API_SHOPS
          WHERE ROWSEQ = p_ROWSEQ;
   END P_LoadByPrimaryKey;

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT ROWSEQ,
                SHOPPERTRAKID,
                PARENTID,
                CUSTOMERID,
                CUSTOMER_NAME,
                HIERARCHYGROUPID,
                HIERARCHYGROUPNAME,
                DATE_PERIOD,
                GROUPBY,
                CREATE_DATE,
                DWL_DATE,
                LAST_UPDATE,
                ACTIVE,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3
           FROM SHOPPER_API_SHOPS;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_ROWSEQ               IN SHOPPER_API_SHOPS.ROWSEQ%TYPE,
      p_SHOPPERTRAKID        IN SHOPPER_API_SHOPS.SHOPPERTRAKID%TYPE,
      p_PARENTID             IN SHOPPER_API_SHOPS.PARENTID%TYPE,
      p_CUSTOMERID           IN SHOPPER_API_SHOPS.CUSTOMERID%TYPE,
      p_CUSTOMER_NAME        IN SHOPPER_API_SHOPS.CUSTOMER_NAME%TYPE,
      p_HIERARCHYGROUPID     IN SHOPPER_API_SHOPS.HIERARCHYGROUPID%TYPE,
      p_HIERARCHYGROUPNAME   IN SHOPPER_API_SHOPS.HIERARCHYGROUPNAME%TYPE,
      p_DATE_PERIOD          IN SHOPPER_API_SHOPS.DATE_PERIOD%TYPE,
      p_GROUPBY              IN SHOPPER_API_SHOPS.GROUPBY%TYPE,
      p_CREATE_DATE          IN SHOPPER_API_SHOPS.CREATE_DATE%TYPE,
      p_DWL_DATE             IN SHOPPER_API_SHOPS.DWL_DATE%TYPE,
      p_LAST_UPDATE          IN SHOPPER_API_SHOPS.LAST_UPDATE%TYPE,
      p_ACTIVE               IN SHOPPER_API_SHOPS.ACTIVE%TYPE,
      p_ATTRIBUTE1           IN SHOPPER_API_SHOPS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2           IN SHOPPER_API_SHOPS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3           IN SHOPPER_API_SHOPS.ATTRIBUTE3%TYPE)
   IS
   BEGIN
      UPDATE SHOPPER_API_SHOPS
         SET ROWSEQ = p_ROWSEQ,
             SHOPPERTRAKID = p_SHOPPERTRAKID,
             PARENTID = p_PARENTID,
             CUSTOMERID = p_CUSTOMERID,
             CUSTOMER_NAME = p_CUSTOMER_NAME,
             HIERARCHYGROUPID = p_HIERARCHYGROUPID,
             HIERARCHYGROUPNAME = p_HIERARCHYGROUPNAME,
             DATE_PERIOD = p_DATE_PERIOD,
             GROUPBY = p_GROUPBY,
             CREATE_DATE = p_CREATE_DATE,
             DWL_DATE = p_DWL_DATE,
             LAST_UPDATE = p_LAST_UPDATE,
             ACTIVE = p_ACTIVE,
             ATTRIBUTE1 = p_ATTRIBUTE1,
             ATTRIBUTE2 = p_ATTRIBUTE2,
             ATTRIBUTE3 = p_ATTRIBUTE3
       WHERE ROWSEQ = p_ROWSEQ;
   END P_Update;


   PROCEDURE P_Insert (
      p_ROWSEQ               IN SHOPPER_API_SHOPS.ROWSEQ%TYPE,
      p_SHOPPERTRAKID        IN SHOPPER_API_SHOPS.SHOPPERTRAKID%TYPE,
      p_PARENTID             IN SHOPPER_API_SHOPS.PARENTID%TYPE,
      p_CUSTOMERID           IN SHOPPER_API_SHOPS.CUSTOMERID%TYPE,
      p_CUSTOMER_NAME        IN SHOPPER_API_SHOPS.CUSTOMER_NAME%TYPE,
      p_HIERARCHYGROUPID     IN SHOPPER_API_SHOPS.HIERARCHYGROUPID%TYPE,
      p_HIERARCHYGROUPNAME   IN SHOPPER_API_SHOPS.HIERARCHYGROUPNAME%TYPE,
      p_DATE_PERIOD          IN SHOPPER_API_SHOPS.DATE_PERIOD%TYPE,
      p_GROUPBY              IN SHOPPER_API_SHOPS.GROUPBY%TYPE,
      p_CREATE_DATE          IN SHOPPER_API_SHOPS.CREATE_DATE%TYPE,
      p_DWL_DATE             IN SHOPPER_API_SHOPS.DWL_DATE%TYPE,
      p_LAST_UPDATE          IN SHOPPER_API_SHOPS.LAST_UPDATE%TYPE,
      p_ACTIVE               IN SHOPPER_API_SHOPS.ACTIVE%TYPE,
      p_ATTRIBUTE1           IN SHOPPER_API_SHOPS.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2           IN SHOPPER_API_SHOPS.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3           IN SHOPPER_API_SHOPS.ATTRIBUTE3%TYPE)
   IS
   BEGIN
      INSERT INTO SHOPPER_API_SHOPS (ROWSEQ,
                                     SHOPPERTRAKID,
                                     PARENTID,
                                     CUSTOMERID,
                                     CUSTOMER_NAME,
                                     HIERARCHYGROUPID,
                                     HIERARCHYGROUPNAME,
                                     --  DATE_PERIOD,
                                     --  GROUPBY,
                                     --  CREATE_DATE,
                                     --  DWL_DATE,
                                     --  LAST_UPDATE,
                                     --  ACTIVE,
                                     ATTRIBUTE1,
                                     ATTRIBUTE2,
                                     ATTRIBUTE3)
           VALUES (p_ROWSEQ,
                   p_SHOPPERTRAKID,
                   p_PARENTID,
                   p_CUSTOMERID,
                   p_CUSTOMER_NAME,
                   p_HIERARCHYGROUPID,
                   p_HIERARCHYGROUPNAME,
                   --  p_DATE_PERIOD,
                   --  p_GROUPBY,
                   --  p_CREATE_DATE,
                   --  p_DWL_DATE,
                   --  p_LAST_UPDATE,
                   --  p_ACTIVE,
                   p_ATTRIBUTE1,
                   p_ATTRIBUTE2,
                   p_ATTRIBUTE3);
   END P_Insert;

   PROCEDURE P_Delete (p_ROWSEQ IN SHOPPER_API_SHOPS.ROWSEQ%TYPE)
   IS
   BEGIN
      DELETE FROM SHOPPER_API_SHOPS
            WHERE ROWSEQ = p_ROWSEQ;
   END P_Delete;

   PROCEDURE P_DeleteAll
   AS
   BEGIN
      DELETE FROM SHOPPER_API_SHOPS;
   END;


   PROCEDURE P_KEYHOURLYEVENTS (
      P_APIPARAMETER_2   IN SHOPPER_API_EVENTS.APIPARAMETER_2%TYPE,
      P_APIPARAMETER_3   IN SHOPPER_API_EVENTS.APIPARAMETER_3%TYPE,
      P_APIPARAMETER_4   IN SHOPPER_API_EVENTS.APIPARAMETER_4%TYPE)
   AS
   BEGIN
      INSERT INTO SHOPPER_API_EVENTS (API_NAME,
                                      APIPARAMETER_1,
                                      APIPARAMETER_2,
                                      APIPARAMETER_3,
                                      APIPARAMETER_4)
         SELECT 'KeyHourlyPerformance',
                SHOPPERTRAKID,
                P_APIPARAMETER_2,
                P_APIPARAMETER_3,
                P_APIPARAMETER_4
           FROM SHOPPER_API_SHOPS
          WHERE ACTIVE = 'Y' AND HIERARCHYGROUPID = '67510001';
   END;

   PROCEDURE P_KEYBASICEVENTS (
      P_APIPARAMETER_2   IN SHOPPER_API_EVENTS.APIPARAMETER_2%TYPE,
      P_APIPARAMETER_3   IN SHOPPER_API_EVENTS.APIPARAMETER_3%TYPE)
   AS
   BEGIN
      INSERT INTO SHOPPER_API_EVENTS (API_NAME,
                                      APIPARAMETER_1,
                                      APIPARAMETER_2,
                                      APIPARAMETER_3)
         SELECT 'KeyPerformance',
                SHOPPERTRAKID,
                P_APIPARAMETER_2,
                P_APIPARAMETER_3
           FROM SHOPPER_API_SHOPS
          WHERE  HIERARCHYGROUPID = '67510001';
   END;
--   INSERT  INTO SHOPPER_API_EVENTS(API_NAME, APIPARAMETER_1, APIPARAMETER_2, APIPARAMETER_3)
--VALUES ( 'KeyPerformance' ,'80052405' , 'L1Y' ,  'D')

END PKG_SHOPPER_API_SHOPS;
/
