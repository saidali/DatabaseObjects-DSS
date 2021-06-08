DROP PACKAGE DSS.PKG_SCAN_ORDERS;

CREATE OR REPLACE PACKAGE DSS.PKG_SCAN_ORDERS
AS
   PROCEDURE P_CREATE_ORDER (P_SCR_OPREATING_UNIT NUMBER,
                             P_SCR_ORGANIZATION_ID NUMBER,
                             P_ORDER_TYPE VARCHAR2,
                             P_ORDER_NUMBER VARCHAR2,
                             P_CREATE_BY VARCHAR2,
                             P_APP_SOURCE VARCHAR2,
                             P_EXPIRY_AFTER NUMBER,
                             P_DATA_FILTER            NUMBER  ,
                             P_JOBNO OUT NUMBER) ; 
END PKG_SCAN_ORDERS;
/


DROP PACKAGE BODY DSS.PKG_SCAN_ORDERS;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_SCAN_ORDERS
AS


   PROCEDURE P_CREATE_ORDER (P_SCR_OPREATING_UNIT        NUMBER,
                             P_SCR_ORGANIZATION_ID       NUMBER,
                             P_ORDER_TYPE                VARCHAR2,
                             P_ORDER_NUMBER              VARCHAR2,
                             P_CREATE_BY                 VARCHAR2,
                             P_APP_SOURCE                VARCHAR2,
                             P_EXPIRY_AFTER              NUMBER,
                             P_DATA_FILTER               NUMBER,
                             P_JOBNO                 OUT NUMBER)
   AS
   BEGIN
      CASE
         WHEN P_ORDER_TYPE = 'MO'
         THEN

            DSS.PKG_SCAN_MO.INS_HEADER (P_ORDER_NUMBER,
                                        P_ORDER_TYPE,
                                        P_SCR_OPREATING_UNIT,
                                        P_SCR_ORGANIZATION_ID,
                                        P_EXPIRY_AFTER,
                                        P_CREATE_BY,
                                        P_DATA_FILTER,
                                        P_JOBNO);
                                                                        
         WHEN P_ORDER_TYPE = 'SO'
         THEN

            DSS.PKG_SCAN_SO.INS_HEADER (P_ORDER_NUMBER,
                                        P_ORDER_TYPE,
                                        P_SCR_OPREATING_UNIT,
                                        P_SCR_ORGANIZATION_ID,
                                        P_EXPIRY_AFTER,
                                        P_CREATE_BY,
                                        P_DATA_FILTER,
                                        P_JOBNO);
 
                         
         WHEN P_ORDER_TYPE = 'SR'
         THEN
            DSS.PKG_SCAN_SO.INS_HEADER (P_ORDER_NUMBER,
                                        P_ORDER_TYPE,
                                        P_SCR_OPREATING_UNIT,
                                        P_SCR_ORGANIZATION_ID,
                                        P_EXPIRY_AFTER,
                                        P_CREATE_BY,
                                        P_DATA_FILTER,
                                        P_JOBNO);
         WHEN P_ORDER_TYPE = 'GRN'
         THEN


            DSS.PKG_SCAN_GRN.INS_HEADER (P_ORDER_NUMBER,
                                         P_ORDER_TYPE,
                                         P_SCR_OPREATING_UNIT,
                                         P_SCR_ORGANIZATION_ID,
                                         P_EXPIRY_AFTER,
                                         P_CREATE_BY,
                                         P_DATA_FILTER,
                                         P_JOBNO);
         WHEN P_ORDER_TYPE = 'IOT'
         THEN


             
    DSS.PKG_SCAN_IOT.INS_HEADER (P_ORDER_NUMBER,
                                     P_ORDER_TYPE,
                                     P_SCR_OPREATING_UNIT,
                                     P_SCR_ORGANIZATION_ID,
                                     P_EXPIRY_AFTER,
                                     P_CREATE_BY,
                                     P_DATA_FILTER,
                                     P_JOBNO);
                                     
                                
         ELSE
            P_JOBNO := 0;
               
      END CASE;
   END P_CREATE_ORDER;
END PKG_SCAN_ORDERS;
/
