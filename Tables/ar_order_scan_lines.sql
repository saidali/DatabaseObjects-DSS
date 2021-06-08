ALTER TABLE DSS.AR_ORDER_SCAN_LINES
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.AR_ORDER_SCAN_LINES CASCADE CONSTRAINTS;

CREATE TABLE DSS.AR_ORDER_SCAN_LINES
(
  JOBID              NUMBER,
  LINEID             NUMBER,
  MERGED             VARCHAR2(1 BYTE)           DEFAULT 'Y',
  LINESEQ            NUMBER,
  OPREATING_UNIT     NUMBER,
  ORGANIZATION_ID    NUMBER,
  ORDER_TYPE         VARCHAR2(30 BYTE),
  ORDER_NUMBER       VARCHAR2(20 BYTE),
  INVENTORY_ITEM_ID  NUMBER,
  PRODUCT_CODE       VARCHAR2(30 BYTE),
  CAETGORY_ID        NUMBER,
  ORDER_QTY          NUMBER,
  DELIVERED_QTY      NUMBER,
  PICKED_QTY         NUMBER,
  SCANNED_QTY        NUMBER,
  CUSTOM_QTY         NUMBER,
  WMS_SYNC           VARCHAR2(1 BYTE)           DEFAULT 'N',
  SCAN_YN            VARCHAR2(1 BYTE)           DEFAULT 'N',
  WARRANTYPRINT_YN   VARCHAR2(1 BYTE)           DEFAULT 'N',
  WARRANTY_YN        VARCHAR2(1 BYTE)           DEFAULT 'N',
  WARRANTY_SEQ       NUMBER,
  WARRANTY_CODE      VARCHAR2(30 BYTE),
  CREATE_BY          VARCHAR2(30 BYTE),
  MODIFY_BY          VARCHAR2(30 BYTE),
  CREATE_DATE        DATE                       DEFAULT SYSDATE,
  MODIFY_DATE        DATE                       DEFAULT SYSDATE,
  EXPIRY_DATE        DATE                       DEFAULT SYSDATE,
  EXPIRY_DAYS        NUMBER                     DEFAULT 0,
  EDITABLE_YN        VARCHAR2(1 BYTE)           DEFAULT 'Y',
  ARCHIVED_YN        VARCHAR2(1 BYTE)           DEFAULT 'N',
  ACTIVE_YN          VARCHAR2(1 BYTE)           DEFAULT 'N',
  STATUS_YN          VARCHAR2(1 BYTE)           DEFAULT 'N',
  HAS_SERIALS        VARCHAR2(1 BYTE)           DEFAULT 'N',
  BARCODES           VARCHAR2(1000 BYTE),
  ATTRIBUTE1         VARCHAR2(100 BYTE),
  ATTRIBUTE2         VARCHAR2(100 BYTE),
  ATTRIBUTE3         VARCHAR2(100 BYTE),
  ATTRIBUTE4         VARCHAR2(100 BYTE),
  ATTRIBUTE5         VARCHAR2(100 BYTE),
  ATTRIBUTE6         VARCHAR2(100 BYTE),
  ATTRIBUTE7         VARCHAR2(100 BYTE),
  ATTRIBUTE8         VARCHAR2(100 BYTE),
  ATTRIBUTE9         VARCHAR2(100 BYTE),
  ATTRIBUTE10        VARCHAR2(100 BYTE)
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
  PARTITION AR_ORDERLINE_2009 VALUES LESS THAN (TO_DATE(' 2010-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION AR_ORDERLINE_2010 VALUES LESS THAN (TO_DATE(' 2011-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION AR_ORDERLINE_2011 VALUES LESS THAN (TO_DATE(' 2012-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION AR_ORDERLINE_2012 VALUES LESS THAN (TO_DATE(' 2013-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION AR_ORDERLINE_2013 VALUES LESS THAN (TO_DATE(' 2014-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION AR_ORDERLINE_2014 VALUES LESS THAN (TO_DATE(' 2015-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION AR_ORDERLINE_2015 VALUES LESS THAN (TO_DATE(' 2016-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION AR_ORDERLINE_2016 VALUES LESS THAN (TO_DATE(' 2017-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION AR_ORDERLINE_2017 VALUES LESS THAN (TO_DATE(' 2018-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION AR_ORDERLINE_2018 VALUES LESS THAN (TO_DATE(' 2019-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION AR_ORDERLINE_2019 VALUES LESS THAN (TO_DATE(' 2020-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION AR_ORDERLINE_2020 VALUES LESS THAN (TO_DATE(' 2021-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION AR_ORDERLINE_2021 VALUES LESS THAN (TO_DATE(' 2022-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION AR_ORDERLINE_MAX VALUES LESS THAN (MAXVALUE)
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


CREATE UNIQUE INDEX DSS.AR_ORDER_SCAN_LINES_PK ON DSS.AR_ORDER_SCAN_LINES
(LINEID)
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

CREATE UNIQUE INDEX DSS.AR_ORDER_SCAN_LINES_U01 ON DSS.AR_ORDER_SCAN_LINES
(INVENTORY_ITEM_ID, JOBID)
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

CREATE INDEX DSS.AR_ORDER_SCAN_LINES_X01 ON DSS.AR_ORDER_SCAN_LINES
(ORDER_TYPE, ORDER_NUMBER, ORGANIZATION_ID)
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

CREATE INDEX DSS.AR_ORDER_SCAN_LINES_X109 ON DSS.AR_ORDER_SCAN_LINES
(JOBID)
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

CREATE INDEX DSS.AR_ORDER_SCAN_LINES_X5 ON DSS.AR_ORDER_SCAN_LINES
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

ALTER TABLE DSS.AR_ORDER_SCAN_LINES ADD (
  CONSTRAINT AR_ORDER_SCAN_LINES_PK
  PRIMARY KEY
  (LINEID)
  USING INDEX DSS.AR_ORDER_SCAN_LINES_PK
  ENABLE VALIDATE,
  CONSTRAINT AR_ORDER_SCAN_LINES_U01
  UNIQUE (INVENTORY_ITEM_ID, JOBID)
  USING INDEX DSS.AR_ORDER_SCAN_LINES_U01
  ENABLE VALIDATE);

GRANT SELECT ON DSS.AR_ORDER_SCAN_LINES TO SELDATA;

GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON DSS.AR_ORDER_SCAN_LINES TO XXWMS;