DROP PACKAGE DSS.PKG_INFOR_ORDERS_RPT;

CREATE OR REPLACE PACKAGE DSS.PKG_INFOR_ORDERS_RPT
AS
   PROCEDURE RPT_LOADBYORDER (P_ORDER_NUMBER   IN VARCHAR2,
                                 P_ORDER_TYPE     IN VARCHAR2,outCursor           OUT DSS.MYGEN.sqlcur);
 END PKG_INFOR_ORDERS_RPT;
/


DROP PACKAGE BODY DSS.PKG_INFOR_ORDERS_RPT;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_INFOR_ORDERS_RPT
AS
   PROCEDURE RPT_LOADBYORDER (P_ORDER_NUMBER   IN     VARCHAR2,
                              P_ORDER_TYPE     IN     VARCHAR2,
                              outCursor           OUT DSS.MYGEN.sqlcur)
   AS
   BEGIN
      IF UPPER(P_ORDER_TYPE) = 'PO'
      THEN
         BEGIN
            OPEN outCursor FOR
       SELECT PO_NUMBER "PO#",
                      OPERATINGUNIT "Operating Unit",
                      SUPPLIERID "SupplierID",
                      ORDER_STATUS "ERP Status",
                      INF_STATUS "Interface Status",
                      CREATE_DATE "Created Date",
                      INF_DATE "Interface Date",
                      nvl(INF_MESSGAE,'Interfaced Successfully') "Interface Message"                 
                  FROM DWL_PURCHASEORDERS_HEADER@SCINTF
                WHERE PO_NUMBER = P_ORDER_NUMBER;
         END RPT_LOADBYORDER;
      ELSIF  UPPER(P_ORDER_TYPE)  IN ('MO', 'IOT')
      THEN
         BEGIN
            OPEN outCursor FOR
SELECT  ORDERNUMBER "Order#",
                      ORDERTYPE "Order Type",
                      OPERATINGUNIT "Operating Unit",
                      ATTRIBUTES10 "Order Flow Type",
                      INF_STATUS "Interface Status",
                      CREATE_DATE "Created Date",
                      INF_DATE "Interface Date",
                      nvl(INF_MESSGAE,'Interfaced Successfully') "Interface Message"
                 FROM DWL_TRANSFER_HEADER@SCINTF
                WHERE     ORDERNUMBER = P_ORDER_NUMBER
                      AND UPPER (ORDERTYPE) = UPPER (P_ORDER_TYPE);
         END RPT_LOADBYORDER_MO;
      ELSIF  UPPER(P_ORDER_TYPE)  IN ('SO', 'SR')
      THEN
         BEGIN
            OPEN outCursor FOR
                  SELECT ORDERNUMBER "Order#",
                      ORDERTYPE "Order Type",
                      SUBINVENTORYCODE "Subinventorycode",
                      CUSTOMER_PO_REF "Customer Reference",
                      INF_STATUS "Interface Status",
                      CREATE_DATE "Create Date",
                      INF_DATE "Interface Date",
                      Nvl(INF_MESSGAE,'Interfaced Succesfully') "Interface Message"
                 FROM DWL_SALES_ORDER_HEADER@SCINTF
                WHERE     ORDERNUMBER = P_ORDER_NUMBER
                      AND UPPER (ORDERTYPE) = UPPER (P_ORDER_TYPE);
         END;
      END IF;
   END RPT_LOADBYORDER;
END PKG_INFOR_ORDERS_RPT;
/
