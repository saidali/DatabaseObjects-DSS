ALTER TABLE DSS.DSS_MODEL_INFO
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.DSS_MODEL_INFO CASCADE CONSTRAINTS;

CREATE TABLE DSS.DSS_MODEL_INFO
(
  SETID             NUMBER,
  CODEID            NUMBER,
  CODEVALUE         VARCHAR2(150 BYTE),
  SHOTCODE          VARCHAR2(5 BYTE),
  CODE_DESCRIPTION  VARCHAR2(200 BYTE),
  CREATE_DATE       DATE,
  LAST_UPDATE_DATE  DATE,
  ENABLED           CHAR(1 BYTE),
  STATUS            CHAR(1 BYTE)                DEFAULT 'A'
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


CREATE UNIQUE INDEX DSS.DSS_MODEL_INFO_PK ON DSS.DSS_MODEL_INFO
(CODEID, SETID)
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

ALTER TABLE DSS.DSS_MODEL_INFO ADD (
  CONSTRAINT DSS_MODEL_INFO_PK
  PRIMARY KEY
  (CODEID, SETID)
  USING INDEX DSS.DSS_MODEL_INFO_PK
  ENABLE VALIDATE);

GRANT SELECT ON DSS.DSS_MODEL_INFO TO SELDATA;