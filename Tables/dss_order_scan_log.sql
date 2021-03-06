ALTER TABLE DSS.DSS_ORDER_SCAN_LOG
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.DSS_ORDER_SCAN_LOG CASCADE CONSTRAINTS;

CREATE TABLE DSS.DSS_ORDER_SCAN_LOG
(
  LOGID           NUMBER,
  JOBID           NUMBER,
  LINEID          NUMBER,
  PR_CREATE_DATE  DATE,
  DELETE_DATE     DATE                          DEFAULT SYSDATE,
  MAX_SCANID      NUMBER,
  MIN_SCANID      NUMBER
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


CREATE UNIQUE INDEX DSS.DSS_ORDER_SCAN_LOG_PK ON DSS.DSS_ORDER_SCAN_LOG
(LOGID)
LOGGING
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
           );

CREATE INDEX DSS.DSS_ORDER_SCAN_LOG_XIL ON DSS.DSS_ORDER_SCAN_LOG
(JOBID, LINEID)
LOGGING
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
           );

CREATE OR REPLACE TRIGGER DSS.DSS_ORDER_SCAN_LOG_TRG
BEFORE INSERT
ON DSS.DSS_ORDER_SCAN_LOG
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column LOGID
  :new.LOGID := DSS_ORDER_SCAN_LOG_SEQ.nextval;
END DSS_ORDER_SCAN_LOG_TRG;
/


ALTER TABLE DSS.DSS_ORDER_SCAN_LOG ADD (
  CONSTRAINT DSS_ORDER_SCAN_LOG_PK
  PRIMARY KEY
  (LOGID)
  USING INDEX DSS.DSS_ORDER_SCAN_LOG_PK
  ENABLE VALIDATE);

GRANT SELECT ON DSS.DSS_ORDER_SCAN_LOG TO SELDATA;
