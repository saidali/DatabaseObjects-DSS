DROP PACKAGE DSS.PKG_INTERFACE;

CREATE OR REPLACE PACKAGE DSS.PKG_INTERFACE
AS
   PROCEDURE UP_INTERFACE_HEADER (P_INTERFACEID    NUMBER,
                                  P_LAST_UPDATE    DATE,
                                  P_ROWCOUNT       NUMBER);

   PROCEDURE UP_INTERFACE_HEADER2 (P_INTERFACEID    NUMBER,
                                   P_LAST_UPDATE    DATE,
                                   P_ROWCOUNT       NUMBER,
                                   P_STARTDATE      DATE);

   PROCEDURE INS_INTERFACE_LOG (P_INTERFACEID    NUMBER,
                                P_LAST_UPDATE    DATE,
                                P_ROWCOUNT       NUMBER,
                                P_TYPE           VARCHAR2,
                                P_STATUS         VARCHAR2,
                                P_MESSAGE        VARCHAR2);

   PROCEDURE INS_INTERFACE_LOG2 (P_INTERFACEID    NUMBER,
                                 P_LAST_UPDATE    DATE,
                                 P_ROWCOUNT       NUMBER,
                                 P_TYPE           VARCHAR2,
                                 P_STATUS         VARCHAR2,
                                 P_MESSAGE        VARCHAR2,
                                 p_STARTDATE      DATE);

   PROCEDURE GET_LAST_RUN_DATE (P_INTERFACEID NUMBER, V_LAST_UPDATE OUT DATE);
END PKG_INTERFACE;
/


DROP PACKAGE BODY DSS.PKG_INTERFACE;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_INTERFACE
AS
   PROCEDURE UP_INTERFACE_HEADER (P_INTERFACEID    NUMBER,
                                  P_LAST_UPDATE    DATE,
                                  P_ROWCOUNT       NUMBER)
   AS
   BEGIN
      UPDATE DSS_INTERFACE_PROCESS
         SET LAST_RUN_DATE = P_LAST_UPDATE, ROW_COUNT = P_ROWCOUNT
       WHERE INTERFACEID = P_INTERFACEID;
   END UP_INTERFACE_HEADER;


   PROCEDURE UP_INTERFACE_HEADER2 (P_INTERFACEID    NUMBER,
                                   P_LAST_UPDATE    DATE,
                                   P_ROWCOUNT       NUMBER,
                                   P_STARTDATE      DATE)
   AS
   BEGIN
      UPDATE DSS_INTERFACE_PROCESS
         SET LAST_RUN_DATE = P_LAST_UPDATE,
             ROW_COUNT = P_ROWCOUNT,
             STARTDATE = P_STARTDATE,
             ENDDATE = SYSDATE
       WHERE INTERFACEID = P_INTERFACEID;
   END UP_INTERFACE_HEADER2;


   PROCEDURE INS_INTERFACE_LOG (P_INTERFACEID    NUMBER,
                                P_LAST_UPDATE    DATE,
                                P_ROWCOUNT       NUMBER,
                                P_TYPE           VARCHAR2,
                                P_STATUS         VARCHAR2,
                                P_MESSAGE        VARCHAR2)
   AS
   BEGIN
      INSERT INTO DSS_INTERFACE_LOG (INTERFACEID,
                                     TRANSACTION_TYPE,
                                     RUN_DATE,
                                     ROW_COUNT,
                                     STATUS,
                                     ERROR_MESSAGE)
           VALUES (P_INTERFACEID,
                   P_TYPE,
                   P_LAST_UPDATE,
                   P_ROWCOUNT,
                   P_STATUS,
                   P_MESSAGE);
   END INS_INTERFACE_LOG;

   PROCEDURE INS_INTERFACE_LOG2 (P_INTERFACEID    NUMBER,
                                 P_LAST_UPDATE    DATE,
                                 P_ROWCOUNT       NUMBER,
                                 P_TYPE           VARCHAR2,
                                 P_STATUS         VARCHAR2,
                                 P_MESSAGE        VARCHAR2,
                                 p_STARTDATE      DATE)
   AS
   BEGIN
      INSERT INTO DSS_INTERFACE_LOG (INTERFACEID,
                                     TRANSACTION_TYPE,
                                     RUN_DATE,
                                     ROW_COUNT,
                                     STATUS,
                                     ERROR_MESSAGE,
                                     STARTDATE,
                                     ENDATE)
           VALUES (P_INTERFACEID,
                   P_TYPE,
                   P_LAST_UPDATE,
                   P_ROWCOUNT,
                   P_STATUS,
                   P_MESSAGE,
                   p_STARTDATE,
                   SYSDATE);
   END INS_INTERFACE_LOG2;


   PROCEDURE GET_LAST_RUN_DATE (P_INTERFACEID NUMBER, V_LAST_UPDATE OUT DATE)
   AS
   BEGIN
      SELECT LAST_RUN_DATE
        INTO V_LAST_UPDATE
        FROM DSS_INTERFACE_PROCESS
       WHERE INTERFACEID = P_INTERFACEID;
   END GET_LAST_RUN_DATE;
END PKG_INTERFACE;
/
