ALTER TABLE DSS.DSS_MANUAL_SCAN_SERIALS
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.DSS_MANUAL_SCAN_SERIALS CASCADE CONSTRAINTS;

CREATE TABLE DSS.DSS_MANUAL_SCAN_SERIALS
(
  SCANID              NUMBER,
  JOBID               NUMBER,
  LINEID              NUMBER,
  SEQINDEX            NUMBER,
  COLUMNINDEX         NUMBER,
  CONFIGID            NUMBER,
  CONFIGTYPE          VARCHAR2(100 BYTE),
  TRANS_TYPE          VARCHAR2(30 BYTE),
  SCAN_SOURCE         VARCHAR2(30 BYTE),
  OPREATING_UNIT      NUMBER,
  ORGANIZATION_ID     NUMBER,
  LOCATION_CODE       VARCHAR2(30 BYTE),
  LOC_REF_CODE        VARCHAR2(100 BYTE),
  INVENTORY_ITEM_ID   NUMBER,
  PRODUCT_CODE        VARCHAR2(100 BYTE),
  SERIALKEY           VARCHAR2(100 BYTE),
  SERIALKEY_REF1      VARCHAR2(100 BYTE),
  SERIALKEY_REF2      VARCHAR2(100 BYTE),
  CAETGORY_ID         NUMBER,
  BRAND_SEQ           NUMBER,
  MODEL_SEQ           NUMBER,
  WARRANTYPRINT_YN    CHAR(1 BYTE),
  WARRANTY_YN         CHAR(1 BYTE),
  WARRANTY_SEQ        NUMBER,
  WARRANTY_CODE       VARCHAR2(30 BYTE),
  WARRANTY_STARTDATE  DATE,
  WARRANTY_ENDATE     DATE,
  ACTIVE_YN           CHAR(1 BYTE),
  STATUS_YN           CHAR(1 BYTE),
  SYNC_YN             CHAR(1 BYTE),
  INF_YN              CHAR(1 BYTE),
  INF_DATE            DATE,
  CREATE_DATE         DATE,
  CREATE_BY           VARCHAR2(30 BYTE),
  MODIFY_DATE         DATE,
  MODIFY_BY           VARCHAR2(30 BYTE),
  ALLOW_EDIT          CHAR(1 BYTE),
  ATTRIBUTE1          VARCHAR2(100 BYTE),
  ATTRIBUTE2          VARCHAR2(100 BYTE),
  ATTRIBUTE3          VARCHAR2(100 BYTE),
  ATTRIBUTE4          VARCHAR2(100 BYTE),
  ATTRIBUTE5          VARCHAR2(100 BYTE),
  ATTRIBUTE6          VARCHAR2(100 BYTE),
  ATTRIBUTE7          VARCHAR2(100 BYTE),
  ATTRIBUTE8          VARCHAR2(100 BYTE),
  ATTRIBUTE9          VARCHAR2(100 BYTE),
  ATTRIBUTE10         VARCHAR2(100 BYTE)
)
NOCOMPRESS 
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
PARTITION BY RANGE (CREATE_DATE)
(  
  PARTITION MSERIALS_2012 VALUES LESS THAN (TO_DATE(' 2013-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION MSERIALS_2013 VALUES LESS THAN (TO_DATE(' 2014-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION MSERIALS_2014 VALUES LESS THAN (TO_DATE(' 2015-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION MSERIALS_2015_Q1 VALUES LESS THAN (TO_DATE(' 2015-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION MSERIALS_2015_Q2 VALUES LESS THAN (TO_DATE(' 2015-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION MSERIALS_2015_Q3 VALUES LESS THAN (TO_DATE(' 2015-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION MSERIALS_2015_Q4 VALUES LESS THAN (TO_DATE(' 2016-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION MSERIALS_2016_Q1 VALUES LESS THAN (TO_DATE(' 2016-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION MSERIALS_2016_Q2 VALUES LESS THAN (TO_DATE(' 2016-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION MSERIALS_2016_Q3 VALUES LESS THAN (TO_DATE(' 2016-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION MSERIALS_2016_Q4 VALUES LESS THAN (TO_DATE(' 2017-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION MSERIALS_MAX VALUES LESS THAN (MAXVALUE)
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               )
)
NOCACHE
MONITORING;


CREATE UNIQUE INDEX DSS.DSS_MANUAL_SCAN_SERIALS_PK ON DSS.DSS_MANUAL_SCAN_SERIALS
(SCANID)
LOGGING
TABLESPACE AXM_TS_WMS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE DSS.DSS_MANUAL_SCAN_SERIALS ADD (
  CONSTRAINT DSS_MANUAL_SCAN_SERIALS_PK
  PRIMARY KEY
  (SCANID)
  USING INDEX DSS.DSS_MANUAL_SCAN_SERIALS_PK
  ENABLE VALIDATE);

GRANT SELECT ON DSS.DSS_MANUAL_SCAN_SERIALS TO SELDATA;
