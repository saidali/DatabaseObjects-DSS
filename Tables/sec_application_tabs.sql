ALTER TABLE DSS.SEC_APPLICATION_TABS
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.SEC_APPLICATION_TABS CASCADE CONSTRAINTS;

CREATE TABLE DSS.SEC_APPLICATION_TABS
(
  TAB_ID         NUMBER,
  POSTION_INDEX  NUMBER                         DEFAULT 0,
  TAB_NAME       VARCHAR2(200 BYTE),
  TEXT           VARCHAR2(200 BYTE),
  HELP_URL       VARCHAR2(200 BYTE),
  CREATE_DATE    DATE,
  ENABLED        CHAR(1 BYTE)                   DEFAULT 'Y',
  HIDDEN         CHAR(1 BYTE)                   DEFAULT 'N',
  ICON           BLOB,
  CREATE_BY      VARCHAR2(200 BYTE),
  ATTRIBUTE1     VARCHAR2(200 BYTE),
  ATTRIBUTE2     VARCHAR2(200 BYTE),
  ATTRIBUTE3     VARCHAR2(200 BYTE),
  ATTRIBUTE4     VARCHAR2(200 BYTE),
  ATTRIBUTE5     VARCHAR2(200 BYTE),
  ATTRIBUTE6     VARCHAR2(200 BYTE),
  ATTRIBUTE7     VARCHAR2(200 BYTE),
  ATTRIBUTE8     VARCHAR2(200 BYTE),
  ATTRIBUTE9     VARCHAR2(200 BYTE),
  ATTRIBUTE10    VARCHAR2(200 BYTE)
)
LOB (ICON) STORE AS BASICFILE (
  TABLESPACE  TS_ORABRIDGE
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING
      STORAGE    (
                  INITIAL          64K
                  NEXT             1M
                  MINEXTENTS       1
                  MAXEXTENTS       UNLIMITED
                  PCTINCREASE      0
                  BUFFER_POOL      DEFAULT
                 ))
TABLESPACE TS_ORABRIDGE
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


CREATE UNIQUE INDEX DSS.SEC_APPLICATION_TABS_PK ON DSS.SEC_APPLICATION_TABS
(TAB_ID)
LOGGING
TABLESPACE TS_ORABRIDGE
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

ALTER TABLE DSS.SEC_APPLICATION_TABS ADD (
  CONSTRAINT SEC_APPLICATION_TABS_PK
  PRIMARY KEY
  (TAB_ID)
  USING INDEX DSS.SEC_APPLICATION_TABS_PK
  ENABLE VALIDATE);

GRANT SELECT ON DSS.SEC_APPLICATION_TABS TO SELDATA;