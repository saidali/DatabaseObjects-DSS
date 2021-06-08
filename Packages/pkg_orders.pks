DROP PACKAGE DSS.PKG_ORDERS;

CREATE OR REPLACE PACKAGE DSS.PKG_ORDERS
AS
END PKG_ORDERS;
/


DROP PACKAGE BODY DSS.PKG_ORDERS;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_ORDERS
AS
   PROCEDURE INS_SO_HEADERS (P_ORDERNO         VARCHAR2,
                             P_HEADERID        NUMBER,
                             P_ORDERTYPE       VARCHAR2,
                             P_ORDERREF2       VARCHAR2,
                             P_JOBID       OUT NUMBER)
   AS
   BEGIN
      P_JOBID := SEQ_ORDER_SCAN_JOBNO.NEXTVAL;

      INSERT INTO DSS_ORDER_SCAN_HEADER (JOBID,
                                         APP_SOURCE,
                                         ORDER_TYPE,
                                         ORDER_NUMBER,
                                         ORDER_REF_NO,
                                         ORDER_REF_NO2,
                                         ORDER_DATE,
                                         WARRANTY_YN,
                                         WMS_YN,
                                         INTERNAL_YN,
                                         SCR_TYPE,
                                         SCR_OPREATING_UNIT,
                                         SCR_ORGANIZATION_ID,
                                         DEST_TYPE,
                                         DEST_REF_NUMBER,
                                         DEST_REF_CODE,
                                         DEST_LOCATION_CODE,
                                         MODIFY_DATE,
                                         CREATE_BY,
                                         MODIFY_BY,
                                         EXPIRY_DATE,
                                         STATUS_YN)
           SELECT P_JOBID,                                           ---JOBID,
                  'SCE',                                        ---APP_SOURCE,
                  'SO',                                         ---ORDER_TYPE,
                  ORDER_NUMBER,                               ---ORDER_NUMBER,
                  HEADER_ID,                                  ---ORDER_REF_NO,
                  P_ORDERREF2,                               ---ORDER_REF_NO2,
                  H.CREATION_DATE,                              ---ORDER_DATE,
                  NVL (H.ATTRIBUTE10, 'N'),                    ---WARRANTY_YN,
                  NVL (H.ATTRIBUTE10, 'N'),                         ---WMS_YN,
                  'N',                                         ---INTERNAL_YN,
                  'ORGANIZATION',                                 ---SCR_TYPE,
                  ORG_ID,                               ---SCR_OPREATING_UNIT,
                  SHIP_FROM_ORG_ID,                    ---SCR_ORGANIZATION_ID,
                  'CUSTOMER',                                    ---DEST_TYPE,
                  SOLD_TO_ORG_ID,                          ---DEST_REF_NUMBER,
                  CUSTOMER_NAME,                             ---DEST_REF_CODE,
                  CUSTOMER_NUMBER,                      ---DEST_LOCATION_CODE,
                  SYSDATE,                                     ---MODIFY_DATE,
                  'SCEADMIN',                                   ---CREATE_BY,
                  'SCEADMIN',                                   ---MODIFY_BY,
                  SYSDATE + 1,                                 ---EXPIRY_DATE,
                  'P'                                             ---STATUS_YN
             FROM SYN_OE_ORDER_HEADERS_ALL H 
             LEFT OUTER JOIN SYN_AR_CUSTOMERS C ON SOLD_TO_ORG_ID = CUSTOMER_ID
            WHERE  1=1  ---  SHIP_FROM_ORG_ID = P_SCR_ORGANIZATION_ID
                  AND HEADER_ID = P_HEADERID
                  AND REPLACE (H.ORDER_CATEGORY_CODE, 'MIXED', 'ORDER') =DECODE (P_ORDERTYPE,  'SR', 'RETURN',  'SO', 'ORDER')
                  AND ROWNUM = 1
         ORDER BY H.CREATION_DATE DESC;
   END;
END PKG_ORDERS;
/
