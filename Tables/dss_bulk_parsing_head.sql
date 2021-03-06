ALTER TABLE DSS.DSS_BULK_PARSING_HEAD
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.DSS_BULK_PARSING_HEAD CASCADE CONSTRAINTS;

CREATE TABLE DSS.DSS_BULK_PARSING_HEAD
(
  CONFIG_ID    NUMBER                           NOT NULL,
  CONFIG_NAME  VARCHAR2(100 BYTE)               NOT NULL,
  ACTIVE_YN    CHAR(1 BYTE),
  STATUS       VARCHAR2(20 BYTE),
  CREATE_DATE  DATE                             NOT NULL,
  CREATE_BY    VARCHAR2(30 BYTE),
  MODIFY_DATE  DATE,
  MODIFY_BY    VARCHAR2(30 BYTE),
  ATTRIBUTE1   VARCHAR2(100 BYTE),
  ATTRIBUTE2   VARCHAR2(100 BYTE),
  ATTRIBUTE3   VARCHAR2(100 BYTE),
  ATTRIBUTE4   VARCHAR2(100 BYTE),
  ATTRIBUTE5   VARCHAR2(100 BYTE)
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


CREATE UNIQUE INDEX DSS.DSS_BULK_PARSING_HEAD_PK ON DSS.DSS_BULK_PARSING_HEAD
(CONFIG_ID)
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

ALTER TABLE DSS.DSS_BULK_PARSING_HEAD ADD (
  CONSTRAINT DSS_BULK_PARSING_HEAD_PK
  PRIMARY KEY
  (CONFIG_ID)
  USING INDEX DSS.DSS_BULK_PARSING_HEAD_PK
  ENABLE VALIDATE);

GRANT SELECT ON DSS.DSS_BULK_PARSING_HEAD TO SELDATA;
