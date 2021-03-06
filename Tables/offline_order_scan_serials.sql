ALTER TABLE DSS.OFFLINE_ORDER_SCAN_SERIALS
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.OFFLINE_ORDER_SCAN_SERIALS CASCADE CONSTRAINTS;

CREATE TABLE DSS.OFFLINE_ORDER_SCAN_SERIALS
(
  SCANID                 NUMBER                 NOT NULL,
  JOBID                  NUMBER,
  LINEID                 NUMBER,
  SEQINDEX               NUMBER,
  COLUMNINDEX            NUMBER,
  CONFIGID               NUMBER,
  CONFIGTYPE             VARCHAR2(100 BYTE),
  SCANTYPE               VARCHAR2(100 BYTE),
  SCAN_SOURCE            VARCHAR2(100 BYTE),
  OPREATING_UNIT         NUMBER,
  COUNTRY_CODE           VARCHAR2(100 BYTE),
  ORGANIZATION_ID        NUMBER,
  FRM_ORG_ID             NUMBER,
  FRM_ORGANIZATIONID     NUMBER,
  FRM_SUBINVENTORY_CODE  VARCHAR2(100 BYTE),
  TO_ORG_ID              NUMBER,
  TO_ORGANIZATIONID      NUMBER,
  TO_SUBINVENTORY_CODE   VARCHAR2(100 BYTE),
  CUSTOMER_ID            NUMBER,
  CUSTOMER_NUMBER        NUMBER,
  CUSTOMER_NAME          VARCHAR2(100 BYTE),
  ORDER_TYPE             VARCHAR2(100 BYTE),
  ORDER_DATE             DATE,
  ORDER_NUMBER           VARCHAR2(100 BYTE),
  IMEI_NUMBER            VARCHAR2(200 BYTE),
  INVENTORY_ITEM_ID      NUMBER,
  PRODUCT_CODE           VARCHAR2(100 BYTE),
  PRODUCT_DESC           VARCHAR2(800 BYTE),
  ERP_MODEL              VARCHAR2(100 BYTE),
  ERP_BRAND              VARCHAR2(100 BYTE),
  CATEGORYID             VARCHAR2(100 BYTE),
  CATEGORYNAME           VARCHAR2(200 BYTE),
  REPEATED               CHAR(1 BYTE),
  MAXLENGTH              NUMBER,
  MINLENGTH              NUMBER,
  ISDUAL                 CHAR(1 BYTE),
  SERVICE_BRANDID        NUMBER,
  SERVICE_MODEL          VARCHAR2(200 BYTE),
  SERVICE_BRAND          VARCHAR2(200 BYTE),
  SERVICE_WARRANTY       VARCHAR2(100 BYTE),
  SERIALKEY              VARCHAR2(100 BYTE),
  SERIALKEY_REF1         VARCHAR2(100 BYTE),
  SERIALKEY_REF2         VARCHAR2(100 BYTE),
  WARRANTYPRINT_YN       VARCHAR2(1 BYTE),
  WARRANTY_YN            VARCHAR2(1 BYTE),
  WARRANTY_SEQ           NUMBER,
  WARRANTY_CODE          VARCHAR2(30 BYTE),
  WARRANTY_STARTDATE     DATE,
  WARRANTY_ENDATE        DATE,
  WARRANTY_PERIOD        NUMBER,
  STATUS                 CHAR(1 BYTE),
  ACTIVE_YN              VARCHAR2(1 BYTE),
  INF_YN                 VARCHAR2(1 BYTE),
  INF_DATE               DATE,
  CREATE_BY              VARCHAR2(100 BYTE),
  CREATE_DATE            DATE,
  UPDATE_BY              VARCHAR2(20 BYTE),
  UPDATE_DATE            DATE,
  ALLOW_EDIT             CHAR(1 BYTE),
  ATTRIBUTE1             VARCHAR2(100 BYTE),
  ATTRIBUTE2             VARCHAR2(100 BYTE),
  ATTRIBUTE3             VARCHAR2(100 BYTE),
  ATTRIBUTE4             VARCHAR2(100 BYTE),
  ATTRIBUTE5             VARCHAR2(100 BYTE),
  ATTRIBUTE6             VARCHAR2(100 BYTE),
  ATTRIBUTE7             VARCHAR2(100 BYTE),
  ATTRIBUTE8             VARCHAR2(100 BYTE),
  ATTRIBUTE9             VARCHAR2(100 BYTE),
  ATTRIBUTE10            VARCHAR2(100 BYTE)
)
NOCOMPRESS 
TABLESPACE AXM_TS_WMS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            BUFFER_POOL      DEFAULT
           )
PARTITION BY RANGE (CREATE_DATE)
(  
  PARTITION AR1_SERIALS_2009 VALUES LESS THAN (TO_DATE(' 2009-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION AR1_SERIALS_2010 VALUES LESS THAN (TO_DATE(' 2010-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION AR1_SERIALS_2011 VALUES LESS THAN (TO_DATE(' 2011-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION AR1_SERIALS_2012 VALUES LESS THAN (TO_DATE(' 2012-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION AR1_SERIALS_2013 VALUES LESS THAN (TO_DATE(' 2013-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION AR1_SERIALS_MAX VALUES LESS THAN (MAXVALUE)
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          8M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               )
)
NOCACHE
MONITORING;


CREATE UNIQUE INDEX DSS.OFFLINE_ORDER_SCAN_SERIALS_U01 ON DSS.OFFLINE_ORDER_SCAN_SERIALS
(SCANID, JOBID)
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

CREATE INDEX DSS.OL_ORDER_SCAN_SERIALS_X2 ON DSS.OFFLINE_ORDER_SCAN_SERIALS
(SERIALKEY)
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

CREATE INDEX DSS.OL_ORDER_SCAN_SERIALS_X5 ON DSS.OFFLINE_ORDER_SCAN_SERIALS
(ORDER_NUMBER)
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

CREATE INDEX DSS.OL_ORDER_SCAN_SERIALS_X7 ON DSS.OFFLINE_ORDER_SCAN_SERIALS
(JOBID, LINEID)
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

CREATE UNIQUE INDEX DSS.PART_ORDER_SCAN_SERIALS_PK ON DSS.OFFLINE_ORDER_SCAN_SERIALS
(SCANID)
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

ALTER TABLE DSS.OFFLINE_ORDER_SCAN_SERIALS ADD (
  CONSTRAINT OFFLINE_ORDER_SCAN_SERIALS_PK
  PRIMARY KEY
  (SCANID)
  USING INDEX DSS.PART_ORDER_SCAN_SERIALS_PK
  ENABLE VALIDATE,
  CONSTRAINT OFFLINE_ORDER_SCAN_SERIALS_U01
  UNIQUE (SCANID, JOBID)
  USING INDEX DSS.OFFLINE_ORDER_SCAN_SERIALS_U01
  ENABLE VALIDATE);

GRANT SELECT ON DSS.OFFLINE_ORDER_SCAN_SERIALS TO SELDATA;
