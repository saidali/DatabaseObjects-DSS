ALTER TABLE DSS.ARCH_ACTIVATION_SERIAL
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.ARCH_ACTIVATION_SERIAL CASCADE CONSTRAINTS;

CREATE TABLE DSS.ARCH_ACTIVATION_SERIAL
(
  ROWSEQ           NUMBER                       NOT NULL,
  FILE_SEQ         NUMBER,
  FILE_NAME        VARCHAR2(500 BYTE),
  ACTIVE_CNT       NUMBER,
  COUNTRY_CODE     VARCHAR2(50 BYTE),
  BRAND            VARCHAR2(50 BYTE),
  COUNTRY_ID       VARCHAR2(50 BYTE),
  PARENTKEY        VARCHAR2(100 BYTE),
  KEYID            NUMBER,
  SERIALKEY        VARCHAR2(100 BYTE),
  ACTIVATION_DATE  DATE,
  CREATE_DATE      DATE,
  STATUS           CHAR(1 BYTE),
  INTF_STATUS      CHAR(1 BYTE),
  ATTRIBUTE2       VARCHAR2(100 BYTE),
  ATTRIBUTE3       VARCHAR2(100 BYTE),
  ATTRIBUTE4       VARCHAR2(100 BYTE),
  ATTRIBUTE5       VARCHAR2(100 BYTE)
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


--  There is no statement for index DSS.SYS_C00829715.
--  The object is created when the parent object is created.

--  There is no statement for index DSS.SYS_C00829716.
--  The object is created when the parent object is created.

ALTER TABLE DSS.ARCH_ACTIVATION_SERIAL ADD (
  PRIMARY KEY
  (ROWSEQ)
  USING INDEX
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
               )
  ENABLE VALIDATE,
  UNIQUE (SERIALKEY)
  USING INDEX
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
               )
  ENABLE VALIDATE);

GRANT SELECT ON DSS.ARCH_ACTIVATION_SERIAL TO SELDATA;
