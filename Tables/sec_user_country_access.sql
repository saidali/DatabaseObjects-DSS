ALTER TABLE DSS.SEC_USER_COUNTRY_ACCESS
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.SEC_USER_COUNTRY_ACCESS CASCADE CONSTRAINTS;

CREATE TABLE DSS.SEC_USER_COUNTRY_ACCESS
(
  USER_NAME       VARCHAR2(100 BYTE),
  OPERATING_UNIT  NUMBER,
  COUNTRY_CODE    VARCHAR2(5 BYTE),
  MODIFY_DATE     DATE,
  EXPIRY_DATE     DATE                          DEFAULT SYSDATE + 100,
  CREATE_BY       VARCHAR2(100 BYTE),
  CREATE_DATE     DATE                          DEFAULT SYSDATE,
  ENABLED         CHAR(1 BYTE)                  DEFAULT 'Y',
  ATTRIBUTE1      VARCHAR2(100 BYTE),
  ATTRIBUTE2      VARCHAR2(100 BYTE),
  ATTRIBUTE3      VARCHAR2(100 BYTE),
  ATTRIBUTE4      VARCHAR2(100 BYTE),
  ATTRIBUTE5      VARCHAR2(100 BYTE),
  ATTRIBUTE6      VARCHAR2(100 BYTE)
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


CREATE UNIQUE INDEX DSS.SEC_USER_COUNTRY_ACCESS_PK ON DSS.SEC_USER_COUNTRY_ACCESS
(OPERATING_UNIT, USER_NAME)
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

ALTER TABLE DSS.SEC_USER_COUNTRY_ACCESS ADD (
  CONSTRAINT SEC_USER_COUNTRY_ACCESS_PK
  PRIMARY KEY
  (OPERATING_UNIT, USER_NAME)
  USING INDEX DSS.SEC_USER_COUNTRY_ACCESS_PK
  ENABLE VALIDATE);

GRANT SELECT ON DSS.SEC_USER_COUNTRY_ACCESS TO SELDATA;
