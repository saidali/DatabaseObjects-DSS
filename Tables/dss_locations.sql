ALTER TABLE DSS.DSS_LOCATIONS
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.DSS_LOCATIONS CASCADE CONSTRAINTS;

CREATE TABLE DSS.DSS_LOCATIONS
(
  OPERATING_UNIT   NUMBER                       NOT NULL,
  ORGANIZATION_ID  NUMBER                       NOT NULL,
  LOCATION_CODE    VARCHAR2(10 BYTE)            NOT NULL,
  STATUS           CHAR(1 BYTE)                 DEFAULT 'A',
  CREATE_DATE      DATE,
  CREATE_BY        VARCHAR2(200 BYTE),
  ATTRIBUTE1       VARCHAR2(200 BYTE),
  ATTRIBUTE2       VARCHAR2(200 BYTE),
  ATTRIBUTE3       VARCHAR2(200 BYTE),
  ATTRIBUTE4       VARCHAR2(200 BYTE),
  ATTRIBUTE5       VARCHAR2(200 BYTE),
  ATTRIBUTE6       VARCHAR2(200 BYTE),
  ATTRIBUTE7       VARCHAR2(200 BYTE),
  ATTRIBUTE8       VARCHAR2(200 BYTE),
  ATTRIBUTE9       VARCHAR2(200 BYTE),
  ATTRIBUTE10      VARCHAR2(200 BYTE)
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


CREATE UNIQUE INDEX DSS.DSS_LOCATION_MASTER_PK ON DSS.DSS_LOCATIONS
(LOCATION_CODE, ORGANIZATION_ID)
LOGGING
TABLESPACE AXM_TS_WMS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE DSS.DSS_LOCATIONS ADD (
  CONSTRAINT DSS_LOCATION_MASTER_PK
  PRIMARY KEY
  (LOCATION_CODE, ORGANIZATION_ID)
  USING INDEX DSS.DSS_LOCATION_MASTER_PK
  ENABLE VALIDATE);

GRANT SELECT ON DSS.DSS_LOCATIONS TO SELDATA;