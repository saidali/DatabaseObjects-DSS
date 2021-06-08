ALTER TABLE DSS.LABEL_COUNTER
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.LABEL_COUNTER CASCADE CONSTRAINTS;

CREATE TABLE DSS.LABEL_COUNTER
(
  ROWSEQ         NUMBER,
  TYPE_ID        NUMBER(10)                     NOT NULL,
  TYPE_NAME      VARCHAR2(150 BYTE),
  LABEL_COUNT    NUMBER(10),
  PRINT_FORMAT   VARCHAR2(4000 BYTE),
  CREATE_DATE    DATE                           DEFAULT sysdate,
  MODIFY_DATE    DATE,
  LIMIT          NUMBER,
  CHAIN          CHAR(1 BYTE)                   DEFAULT 'N',
  CHAIN_SEQ      NUMBER(10),
  COUNTRY_CODE   VARCHAR2(150 BYTE),
  FACILITY_CODE  VARCHAR2(150 BYTE)
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


CREATE UNIQUE INDEX DSS.LABEL_COUNTER ON DSS.LABEL_COUNTER
(TYPE_ID)
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

CREATE OR REPLACE TRIGGER DSS.LABEL_COUNTER_TRG
BEFORE INSERT
ON DSS.LABEL_COUNTER
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column ROWSEQ
  :new.ROWSEQ := LABEL_COUNTER2_SEQ.nextval;
END LABEL_COUNTER_TRG;
/


ALTER TABLE DSS.LABEL_COUNTER ADD (
  CONSTRAINT LABEL_COUNTER
  PRIMARY KEY
  (TYPE_ID)
  USING INDEX DSS.LABEL_COUNTER
  ENABLE VALIDATE);

GRANT SELECT ON DSS.LABEL_COUNTER TO SELDATA;
