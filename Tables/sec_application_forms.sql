ALTER TABLE DSS.SEC_APPLICATION_FORMS
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.SEC_APPLICATION_FORMS CASCADE CONSTRAINTS;

CREATE TABLE DSS.SEC_APPLICATION_FORMS
(
  FORM_ID         NUMBER,
  FORM_NAME       VARCHAR2(200 BYTE),
  TEXT            VARCHAR2(200 BYTE),
  FORM_NAMESPACE  VARCHAR2(200 BYTE),
  FULL_NAME       VARCHAR2(200 BYTE),
  STYLE           VARCHAR2(200 BYTE),
  FORM_TYPE       VARCHAR2(50 BYTE),
  HELP_URL        VARCHAR2(400 BYTE),
  WINDOW_STATE    VARCHAR2(200 BYTE),
  ALLOW_MULTIPLE  CHAR(1 BYTE)                  DEFAULT 'N',
  INDEX_POSITION  NUMBER                        DEFAULT 0,
  TAB_ID          VARCHAR2(200 BYTE),
  STATUS          CHAR(1 BYTE)                  DEFAULT 'A',
  ENABLED         CHAR(1 BYTE)                  DEFAULT 'Y',
  ICON            BLOB,
  MENUICON        BLOB,
  CREATEDATE      DATE,
  CREATEBY        VARCHAR2(50 BYTE),
  ATTRIBUTE1      VARCHAR2(100 BYTE),
  ATTRIBUTE2      VARCHAR2(100 BYTE),
  ATTRIBUTE3      VARCHAR2(100 BYTE),
  ATTRIBUTE4      VARCHAR2(100 BYTE),
  ATTRIBUTE5      VARCHAR2(100 BYTE),
  ATTRIBUTE6      VARCHAR2(100 BYTE)
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
LOB (MENUICON) STORE AS BASICFILE (
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


CREATE UNIQUE INDEX DSS.SEC_APPLICATION_FORMS_PK ON DSS.SEC_APPLICATION_FORMS
(FORM_ID)
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

CREATE UNIQUE INDEX DSS.SEC_APPLICATION_FORMS_U01 ON DSS.SEC_APPLICATION_FORMS
(FULL_NAME)
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

ALTER TABLE DSS.SEC_APPLICATION_FORMS ADD (
  CONSTRAINT SEC_APPLICATION_FORMS_PK
  PRIMARY KEY
  (FORM_ID)
  USING INDEX DSS.SEC_APPLICATION_FORMS_PK
  ENABLE VALIDATE,
  CONSTRAINT SEC_APPLICATION_FORMS_U01
  UNIQUE (FULL_NAME)
  USING INDEX DSS.SEC_APPLICATION_FORMS_U01
  ENABLE VALIDATE);

GRANT SELECT ON DSS.SEC_APPLICATION_FORMS TO SELDATA;
