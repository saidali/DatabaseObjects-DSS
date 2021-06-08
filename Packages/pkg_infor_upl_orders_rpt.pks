DROP PACKAGE DSS.PKG_INFOR_UPL_ORDERS_RPT;

CREATE OR REPLACE PACKAGE DSS.PKG_INFOR_UPL_ORDERS_RPT
AS
   PROCEDURE RPT_LOADBYORDER (P_ORDER_NUMBER   IN VARCHAR2,
                                 P_ORDER_TYPE     IN VARCHAR2,outCursor           OUT DSS.MYGEN.sqlcur);
                                   PROCEDURE RPT_LOADBYSKU ( P_SKU     IN     VARCHAR2,    
                               P_ORDER_TYPE IN VARCHAR2,
                              OUTCURSOR           OUT DSS.MYGEN.SQLCUR);
 END PKG_INFOR_UPL_ORDERS_RPT;
/


DROP PACKAGE BODY DSS.PKG_INFOR_UPL_ORDERS_RPT;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_INFOR_UPL_ORDERS_RPT
AS
   PROCEDURE RPT_LOADBYORDER (P_ORDER_NUMBER   IN     VARCHAR2,
                              P_ORDER_TYPE     IN     VARCHAR2,
                              OUTCURSOR           OUT DSS.MYGEN.SQLCUR)
   AS
   BEGIN
      IF UPPER (P_ORDER_TYPE) = 'PO'
      THEN
         BEGIN
            OPEN OUTCURSOR FOR
               SELECT ASN_NUMBER,
               PO_NUMBER,
               PO_HEADERID,
                      OPERATINGUNIT,
                      RECEIPT_DATE,
                      SUPPLIERID,
                      INF_STATUS,
                      INF_DATE,
                      INF_MESSAGE
                 FROM UPL_PO_ASN_HEADER@SCINTF
                WHERE PO_NUMBER = P_ORDER_NUMBER;
         END RPT_LOADBYORDER;
      ELSIF UPPER (P_ORDER_TYPE) IN ('MO', 'IOT')
      THEN
         BEGIN
            OPEN OUTCURSOR FOR
               SELECT ORDERNUMBER,
                      ORDERTYPE,
                      ORGANIZATIONID,
                      INF_STATUS,
                      CREATE_DATE,
                      INF_DATE,
                      INF_MESSGAE
                 FROM UPL_TRANSFER_HEADER@SCINTF
                WHERE     ORDERNUMBER = P_ORDER_NUMBER
                      AND UPPER (ORDERTYPE) = UPPER (P_ORDER_TYPE);
         END;
      ELSIF UPPER (P_ORDER_TYPE)='SR'
      THEN 
         BEGIN
            OPEN OUTCURSOR FOR
               SELECT RETURN_ID,
                      REF_NUMBER,
                      RETURN_KEY,
                      OPERATING_UNIT,
                      ORGANIZATION_ID,
                      SUPPLIER_ID,
                      INF_STATUS,
                      INF_MESSGAE,
                      'SR' AS ORDERTYPE, 
                      ATTRIBUTES2 AS REMARKS
                 FROM UPL_SUPPLIER_RETURN_HEADER@SCINTF
                WHERE     RETURN_ID = P_ORDER_NUMBER ;
                --      AND UPPER (ORDERTYPE) = UPPER (P_ORDER_TYPE);
                      END;         
      ELSIF UPPER (P_ORDER_TYPE) IN ( 'SO' ,'SR')
      THEN
         BEGIN
            OPEN OUTCURSOR FOR
               SELECT ORDERNUMBER,
                      ORDERTYPE,
                      INF_STATUS,
                      CREATE_DATE,
                      INF_DATE,
                      INF_MESSGAE
                 FROM UPL_SALES_ORDER_HEADER@SCINTF
                WHERE     ORDERNUMBER = P_ORDER_NUMBER
                      AND UPPER (ORDERTYPE) = UPPER (P_ORDER_TYPE);
         END;
      END IF;
   END RPT_LOADBYORDER;
   
    PROCEDURE RPT_LOADBYSKU ( P_SKU     IN     VARCHAR2,    
                               P_ORDER_TYPE IN VARCHAR2,
                              OUTCURSOR           OUT DSS.MYGEN.SQLCUR)
   AS
   BEGIN
      IF   UPPER(P_ORDER_TYPE)='OUT'
      THEN
         BEGIN
            OPEN OUTCURSOR FOR
    SELECT LT.SKU,
         LT.QTY,
         O.EXTERNORDERKEY "OrderNumber",
         O.ADDDATE "OrderDate"
    FROM PICKDETAIL@WMWHSE1_LIVE LT                                         --
         LEFT JOIN ORDERS@WMWHSE1_LIVE O ON O.ORDERKEY = LT.ORDERKEY
   WHERE     1 = 1
         AND LT.SKU IN (    SELECT REGEXP_SUBSTR ( P_SKU,
                                                  '[^,]+',
                                                  1,
                                                  LEVEL)
                              FROM DUAL
                        CONNECT BY REGEXP_SUBSTR ( P_SKU,
                                                  '[^,]+',
                                                  1,
                                                  LEVEL)
                                      IS NOT NULL)
         AND TO_DATE (TO_CHAR (O.ADDDATE, 'MM-dd-yyyy'), 'MM-DD-YYYY') BETWEEN TO_DATE (
                                                                                  TO_CHAR (
                                                                                     '12-19-2019'),
                                                                                  'MM-DD-YYYY')
                                                                           AND TO_DATE (
                                                                                  TO_CHAR (
                                                                                     SYSDATE,
                                                                                     'MM-dd-yyyy'),
                                                                                  'MM-DD-YYYY')
ORDER BY O.ADDDATE DESC;
END;
  ELSIF UPPER (P_ORDER_TYPE)='IN'
      THEN
         BEGIN
            OPEN OUTCURSOR FOR
SELECT LT.QTYRECEIVED,
       LT.SKU,
       LT.EXTERNRECEIPTKEY "OrderNumber",
       LT.ADDDATE "OrderDate"
  FROM RECEIPTDETAIL@WMWHSE1_LIVE LT                                       
       LEFT JOIN ORDERS@WMWHSE1_LIVE O
          ON O.ORDERKEY = LT.RECEIPTKEY   
 WHERE LT.QTYRECEIVED > 0 AND
 LT.SKU IN
           (    SELECT REGEXP_SUBSTR ( P_SKU,
                                                  '[^,]+',
                                                  1,
                                                  LEVEL)
                              FROM DUAL
                        CONNECT BY REGEXP_SUBSTR ( P_SKU,
                                                  '[^,]+',
                                                  1,
                                                  LEVEL)
                                      IS NOT NULL)
                                      AND TO_DATE (TO_CHAR (LT.ADDDATE, 'MM-dd-yyyy'), 'MM-DD-YYYY') BETWEEN TO_DATE (
                                                                                  TO_CHAR (
                                                                                     '12-19-2019'),
                                                                                  'MM-DD-YYYY')
                                                                           AND TO_DATE (
                                                                                  TO_CHAR (
                                                                                     SYSDATE,
                                                                                     'MM-dd-yyyy'),
                                                                                  'MM-DD-YYYY')
                                                                                  ORDER BY LT.ADDDATE;
 
 END;
END IF;
END RPT_LOADBYSKU;
END PKG_INFOR_UPL_ORDERS_RPT;
/
