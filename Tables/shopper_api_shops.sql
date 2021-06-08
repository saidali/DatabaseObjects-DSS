ALTER TABLE DSS.SHOPPER_API_SHOPS
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.SHOPPER_API_SHOPS CASCADE CONSTRAINTS;

CREATE TABLE DSS.SHOPPER_API_SHOPS
(
  ROWSEQ              NUMBER,
  SHOPPERTRAKID       NUMBER,
  PARENTID            NUMBER,
  CUSTOMERID          NUMBER,
  CUSTOMER_NAME       VARCHAR2(300 BYTE),
  HIERARCHYGROUPID    VARCHAR2(300 BYTE),
  HIERARCHYGROUPNAME  VARCHAR2(300 BYTE),
  DATE_PERIOD         VARCHAR2(10 BYTE)         DEFAULT 'L1W',
  GROUPBY             VARCHAR2(10 BYTE)         DEFAULT 'D',
  CREATE_DATE         DATE                      DEFAULT SYSDATE,
  DWL_DATE            DATE                      DEFAULT SYSDATE,
  LAST_UPDATE         DATE                      DEFAULT SYSDATE,
  ACTIVE              CHAR(1 BYTE)              DEFAULT 'Y',
  ATTRIBUTE1          VARCHAR2(100 BYTE),
  ATTRIBUTE2          VARCHAR2(100 BYTE),
  ATTRIBUTE3          VARCHAR2(100 BYTE)
)
TABLESPACE AXM_TS_WMS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING;


--  There is no statement for index DSS.SYS_C00710673.
--  The object is created when the parent object is created.

--  There is no statement for index DSS.SYS_C00710674.
--  The object is created when the parent object is created.

CREATE OR REPLACE TRIGGER DSS.SHOPPER_API_SHOPS_TRG
   BEFORE INSERT
   ON DSS.SHOPPER_API_SHOPS
   REFERENCING NEW AS New OLD AS Old
   FOR EACH ROW
BEGIN
   -- For Toad:  Highlight column ROWSEQ
   :new.ROWSEQ := SHOPPER_API_SHOPS_SEQ.NEXTVAL;
END SHOPPER_API_SHOPS_TRG;
/


ALTER TABLE DSS.SHOPPER_API_SHOPS ADD (
  PRIMARY KEY
  (ROWSEQ)
  USING INDEX
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                BUFFER_POOL      DEFAULT
               )
  ENABLE VALIDATE,
  UNIQUE (HIERARCHYGROUPID, SHOPPERTRAKID)
  USING INDEX
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                BUFFER_POOL      DEFAULT
               )
  ENABLE VALIDATE);

GRANT SELECT ON DSS.SHOPPER_API_SHOPS TO SELDATA;
