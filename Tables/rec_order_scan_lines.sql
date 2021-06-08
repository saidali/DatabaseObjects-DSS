ALTER TABLE DSS.REC_ORDER_SCAN_LINES
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.REC_ORDER_SCAN_LINES CASCADE CONSTRAINTS;

CREATE TABLE DSS.REC_ORDER_SCAN_LINES
(
  JOBID         NUMBER,
  LINEID        NUMBER,
  ORDER_TYPE    VARCHAR2(30 BYTE),
  ORDER_NUMBER  VARCHAR2(20 BYTE)
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


--  There is no statement for index DSS.SYS_C00864919.
--  The object is created when the parent object is created.

ALTER TABLE DSS.REC_ORDER_SCAN_LINES ADD (
  PRIMARY KEY
  (JOBID, LINEID)
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
