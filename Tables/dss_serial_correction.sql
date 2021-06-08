DROP TABLE DSS.DSS_SERIAL_CORRECTION CASCADE CONSTRAINTS;

CREATE TABLE DSS.DSS_SERIAL_CORRECTION
(
  ROWSEQ        NUMBER                          NOT NULL,
  BRAND         VARCHAR2(100 BYTE),
  PARENTKEY     VARCHAR2(100 BYTE),
  ISPARENT      CHAR(1 BYTE),
  KEYID         NUMBER,
  SERIALKEY     VARCHAR2(100 BYTE),
  CREATED_DATE  DATE,
  DATA_SRC      VARCHAR2(100 BYTE)
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
