ALTER TABLE DSS.DSS_OPERATING_UNITS
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.DSS_OPERATING_UNITS CASCADE CONSTRAINTS;

CREATE TABLE DSS.DSS_OPERATING_UNITS
(
  OPERATING_UNIT            NUMBER,
  STATUS                    CHAR(1 BYTE)        DEFAULT 'Y',
  COUNTRY_NAME              VARCHAR2(200 BYTE),
  COUNTRY_CODE              VARCHAR2(5 BYTE),
  TIMEZONE                  VARCHAR2(100 BYTE),
  ITEM_MASTER_ORGANIZATION  NUMBER,
  WMS_ENABLED               CHAR(1 BYTE)        DEFAULT 'N',
  WMS_CONFIG                VARCHAR2(200 BYTE),
  VCARE_ENABLED             CHAR(1 BYTE)        DEFAULT 'N',
  VCARE_CONFIG              VARCHAR2(200 BYTE),
  OPTIMIZA_ENABLED          CHAR(1 BYTE)        DEFAULT 'N',
  OPTIMIZA_CONFIG           VARCHAR2(200 BYTE),
  CREATE_BY                 VARCHAR2(200 BYTE),
  CREATE_DATE               DATE                DEFAULT SYSDATE,
  MODIFY_BY                 VARCHAR2(200 BYTE),
  MODIFY_DATE               DATE                DEFAULT SYSDATE,
  ATTRIBUTE1                VARCHAR2(200 BYTE),
  ATTRIBUTE2                VARCHAR2(200 BYTE),
  ATTRIBUTE3                VARCHAR2(200 BYTE),
  ATTRIBUTE4                VARCHAR2(200 BYTE),
  ATTRIBUTE5                VARCHAR2(200 BYTE),
  ATTRIBUTE6                VARCHAR2(200 BYTE),
  ATTRIBUTE7                VARCHAR2(200 BYTE),
  ATTRIBUTE8                VARCHAR2(200 BYTE),
  ATTRIBUTE9                VARCHAR2(200 BYTE),
  ATTRIBUTE10               VARCHAR2(200 BYTE)
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

COMMENT ON COLUMN DSS.DSS_OPERATING_UNITS.ATTRIBUTE1 IS 'Block scanning if warranty is not configured';

COMMENT ON COLUMN DSS.DSS_OPERATING_UNITS.ATTRIBUTE2 IS 'address1';

COMMENT ON COLUMN DSS.DSS_OPERATING_UNITS.ATTRIBUTE3 IS 'address2';

COMMENT ON COLUMN DSS.DSS_OPERATING_UNITS.ATTRIBUTE4 IS 'phone';

COMMENT ON COLUMN DSS.DSS_OPERATING_UNITS.ATTRIBUTE5 IS 'fax';

COMMENT ON COLUMN DSS.DSS_OPERATING_UNITS.ATTRIBUTE6 IS 'currency';


CREATE UNIQUE INDEX DSS.DSS_OPERATING_UNIT_MASTER_PK ON DSS.DSS_OPERATING_UNITS
(OPERATING_UNIT)
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

ALTER TABLE DSS.DSS_OPERATING_UNITS ADD (
  CONSTRAINT DSS_OPERATING_UNIT_MASTER_PK
  PRIMARY KEY
  (OPERATING_UNIT)
  USING INDEX DSS.DSS_OPERATING_UNIT_MASTER_PK
  ENABLE VALIDATE);

GRANT SELECT ON DSS.DSS_OPERATING_UNITS TO SELDATA;
