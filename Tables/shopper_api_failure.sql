ALTER TABLE DSS.SHOPPER_API_FAILURE
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.SHOPPER_API_FAILURE CASCADE CONSTRAINTS;

CREATE TABLE DSS.SHOPPER_API_FAILURE
(
  ROWSEQ          NUMBER,
  API_NAME        VARCHAR2(200 BYTE),
  APIPARAMETER_1  VARCHAR2(200 BYTE),
  APIPARAMETER_2  VARCHAR2(200 BYTE),
  APIPARAMETER_3  VARCHAR2(200 BYTE),
  APIPARAMETER_4  VARCHAR2(200 BYTE),
  CREATE_DATE     DATE                          DEFAULT SYSDATE,
  LAST_RUNDATE    DATE                          DEFAULT SYSDATE,
  NORECORDS       NUMBER                        DEFAULT 0,
  STATUS          CHAR(1 BYTE)                  DEFAULT 'Y',
  ERROR_MESSAGE   VARCHAR2(500 BYTE)
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


--  There is no statement for index DSS.SYS_C00711436.
--  The object is created when the parent object is created.

CREATE OR REPLACE TRIGGER DSS.SHOPPER_API_FAILURE_TRG
BEFORE INSERT
ON DSS.SHOPPER_API_FAILURE
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column ROWSEQ
  :new.ROWSEQ := SHOPPER_API_FAILURE_SEQ.nextval;
END SHOPPER_API_FAILURE_TRG;
/


ALTER TABLE DSS.SHOPPER_API_FAILURE ADD (
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
  ENABLE VALIDATE);

GRANT SELECT ON DSS.SHOPPER_API_FAILURE TO SELDATA;
