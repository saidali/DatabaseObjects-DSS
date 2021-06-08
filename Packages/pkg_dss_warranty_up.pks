DROP PACKAGE DSS.PKG_DSS_WARRANTY_UP;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_WARRANTY_UP
AS

PROCEDURE UPD_BYORDERNO (P_ORDERNUMBER   VARCHAR2,
                             P_ORDERTYPE     VARCHAR2,
                             WITH_SERIALS    VARCHAR2)  ; 
                             
PROCEDURE UPD_BYJOBID (P_JOBID NUMBER, WITH_SERIALS VARCHAR2)  ; 
                             
                                                          
END PKG_DSS_WARRANTY_UP;
/


DROP PACKAGE BODY DSS.PKG_DSS_WARRANTY_UP;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_WARRANTY_UP
AS
    PROCEDURE UPD_LINES (P_JOBID NUMBER)
    AS
    BEGIN
        UPDATE DSS_ORDER_SCAN_LINES LIN
        SET (WARRANTY_SEQ, WARRANTY_CODE) =
                (SELECT OWR.WARRANTY_SEQ, WS.WARRANTY_CODE
                 FROM TK_ORGANIZATION_WARRANTY OWR
                      LEFT OUTER JOIN DSS_SERVICE_WARRANTY WS
                          ON OWR.WARRANTY_SEQ = WS.WARRANTY_SEQ
                 WHERE     LIN.ORGANIZATION_ID = OWR.ORGANIZATION_ID
                       AND LIN.CAETGORY_ID = OWR.CATEGORY_ID)
        WHERE jobid = P_JOBID;
    EXCEPTION
        WHEN OTHERS
        THEN
            NULL;
    END;

    PROCEDURE UPD_SERIALS (P_JOBID NUMBER)
    AS
    BEGIN
        UPDATE DSS_ORDER_SCAN_SERIALS SR
        SET (WARRANTY_SEQ, WARRANTY_CODE) =
                (SELECT WARRANTY_SEQ, WARRANTY_CODE
                 FROM DSS_ORDER_SCAN_LINES LIN
                 WHERE LIN.JOBID = SR.JOBID AND LIN.LINEID = SR.LINEID)
        WHERE jobid = P_JOBID;
    EXCEPTION
        WHEN OTHERS
        THEN
            NULL;
    END;

    PROCEDURE UPD_BYJOBID (P_JOBID NUMBER, WITH_SERIALS VARCHAR2)
    AS
    BEGIN
        UPD_LINES (P_JOBID);

        IF WITH_SERIALS = 'Y'
        THEN
            UPD_SERIALS (P_JOBID);
        END IF;
    END UPD_BYJOBID;

    PROCEDURE UPD_BYORDERNO (P_ORDERNUMBER   VARCHAR2,
                             P_ORDERTYPE     VARCHAR2,
                             WITH_SERIALS    VARCHAR2)
    AS
        P_JOBID   NUMBER;
    BEGIN
        SELECT JOBID INTO P_JOBID
        FROM DSS_ORDER_SCAN_HEADER
        WHERE     ORDER_NUMBER = P_ORDERNUMBER
              AND ORDER_TYPE = P_ORDERTYPE
              AND ROWNUM = 1;
       IF   P_JOBID IS NOT NULL  THEN 
            UPD_BYJOBID ( P_JOBID  ,  WITH_SERIALS ) ;
       END IF ;    
              
    END;
END PKG_DSS_WARRANTY_UP;
/