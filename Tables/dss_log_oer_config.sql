ALTER TABLE DSS.DSS_LOG_OER_CONFIG
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.DSS_LOG_OER_CONFIG CASCADE CONSTRAINTS;

CREATE TABLE DSS.DSS_LOG_OER_CONFIG
(
  LOGID         NUMBER,
  CHANGE_LEVEL  VARCHAR2(100 BYTE),
  TABLE_NAME    VARCHAR2(100 BYTE),
  COLUMN_NAME   VARCHAR2(100 BYTE),
  ROW_ID        VARCHAR2(100 BYTE),
  OLD_VALUE     VARCHAR2(250 BYTE),
  NEW_VALUE     VARCHAR2(250 BYTE),
  STATUS        VARCHAR2(10 BYTE),
  REMARKS       VARCHAR2(250 BYTE),
  MODIFY_BY     VARCHAR2(50 BYTE),
  MODIFY_DATE   DATE,
  ATTRIBUTE1    VARCHAR2(100 BYTE),
  ATTRIBUTE2    VARCHAR2(100 BYTE),
  ATTRIBUTE3    VARCHAR2(100 BYTE),
  ATTRIBUTE4    VARCHAR2(100 BYTE),
  ATTRIBUTE5    VARCHAR2(100 BYTE)
)
TABLESPACE AXM_TS_WMS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING;


CREATE UNIQUE INDEX DSS.DSS_LOG_OER_CONFIG_PK ON DSS.DSS_LOG_OER_CONFIG
(LOGID)
LOGGING
TABLESPACE AXM_TS_WMS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

CREATE OR REPLACE TRIGGER DSS.DSS_LOG_OER_CONFIG_TRG
BEFORE INSERT
ON DSS.DSS_LOG_OER_CONFIG
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column LOGID
  :new.LOGID := DSS_LOG_OER_CONFIG_SEQ.nextval;
END DSS_LOG_OER_CONFIG_TRG;
/


ALTER TABLE DSS.DSS_LOG_OER_CONFIG ADD (
  CONSTRAINT DSS_LOG_OER_CONFIG_PK
  PRIMARY KEY
  (LOGID)
  USING INDEX DSS.DSS_LOG_OER_CONFIG_PK
  ENABLE VALIDATE);

GRANT SELECT ON DSS.DSS_LOG_OER_CONFIG TO SELDATA;
