ALTER TABLE DSS.DSS_PARSING_FUNCTIONS
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.DSS_PARSING_FUNCTIONS CASCADE CONSTRAINTS;

CREATE TABLE DSS.DSS_PARSING_FUNCTIONS
(
  FUNCTION_ID    NUMBER                         NOT NULL,
  FUNCTION_NAME  VARCHAR2(50 BYTE)              NOT NULL,
  DESCRIPTION    VARCHAR2(150 BYTE),
  IS_NUM_VAL     VARCHAR2(10 BYTE),
  STATUS         VARCHAR2(10 BYTE),
  CREATE_DATE    DATE,
  CREATE_BY      VARCHAR2(30 BYTE),
  ATTRIBUTE1     VARCHAR2(100 BYTE),
  ATTRIBUTE2     VARCHAR2(100 BYTE),
  ATTRIBUTE3     VARCHAR2(100 BYTE)
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


CREATE UNIQUE INDEX DSS.DSS_PARSING_FUNCTIONS_PK ON DSS.DSS_PARSING_FUNCTIONS
(FUNCTION_ID)
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

ALTER TABLE DSS.DSS_PARSING_FUNCTIONS ADD (
  CONSTRAINT DSS_PARSING_FUNCTIONS_PK
  PRIMARY KEY
  (FUNCTION_ID)
  USING INDEX DSS.DSS_PARSING_FUNCTIONS_PK
  ENABLE VALIDATE);

GRANT SELECT ON DSS.DSS_PARSING_FUNCTIONS TO SELDATA;
