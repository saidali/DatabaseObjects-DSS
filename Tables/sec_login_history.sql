ALTER TABLE DSS.SEC_LOGIN_HISTORY
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.SEC_LOGIN_HISTORY CASCADE CONSTRAINTS;

CREATE TABLE DSS.SEC_LOGIN_HISTORY
(
  LOGID             NUMBER,
  USER_NAME         VARCHAR2(50 BYTE),
  PC_NAME           VARCHAR2(50 BYTE),
  IP_LOCAL          VARCHAR2(30 BYTE),
  IP_PUBLIC         VARCHAR2(30 BYTE),
  IP_REMOTE         VARCHAR2(30 BYTE),
  DOMAIN_NAME       VARCHAR2(50 BYTE),
  PC_DATE_TIME      DATE,
  SERVER_DATE_TIME  DATE,
  TIME_DIFF         NUMBER,
  LOGIN_TYPE        VARCHAR2(30 BYTE),
  LOGIN_DATE        DATE,
  ATTRIBUTE1        VARCHAR2(50 BYTE),
  ATTRIBUTE2        VARCHAR2(50 BYTE),
  ATTRIBUTE3        VARCHAR2(50 BYTE),
  ATTRIBUTE4        VARCHAR2(50 BYTE),
  ATTRIBUTE5        VARCHAR2(50 BYTE),
  ATTRIBUTE6        VARCHAR2(50 BYTE)
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


CREATE UNIQUE INDEX DSS.SEC_LOGIN_HISTORY_PK ON DSS.SEC_LOGIN_HISTORY
(LOGID)
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

ALTER TABLE DSS.SEC_LOGIN_HISTORY ADD (
  CONSTRAINT SEC_LOGIN_HISTORY_PK
  PRIMARY KEY
  (LOGID)
  USING INDEX DSS.SEC_LOGIN_HISTORY_PK
  ENABLE VALIDATE);

GRANT SELECT ON DSS.SEC_LOGIN_HISTORY TO SELDATA;