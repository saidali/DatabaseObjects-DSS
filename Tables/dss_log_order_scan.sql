ALTER TABLE DSS.DSS_LOG_ORDER_SCAN
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.DSS_LOG_ORDER_SCAN CASCADE CONSTRAINTS;

CREATE TABLE DSS.DSS_LOG_ORDER_SCAN
(
  LOGID         NUMBER,
  CHANGE_LEVEL  VARCHAR2(100 BYTE),
  TABLE_NAME    VARCHAR2(100 BYTE),
  COLUMN_NAME   VARCHAR2(100 BYTE),
  ROW_ID        NUMBER,
  OLD_VALUE     VARCHAR2(200 BYTE),
  NEW_VALUE     VARCHAR2(200 BYTE),
  STATUS        VARCHAR2(20 BYTE),
  REMARKS       VARCHAR2(200 BYTE),
  MODIFY_BY     VARCHAR2(50 BYTE),
  MODIFY_DATE   DATE,
  ATTRIBUTE1    VARCHAR2(100 BYTE),
  ATTRIBUTE2    VARCHAR2(100 BYTE),
  ATTRIBUTE3    VARCHAR2(100 BYTE),
  ATTRIBUTE4    VARCHAR2(100 BYTE),
  ATTRIBUTE5    VARCHAR2(100 BYTE),
  ATTRIBUTE6    VARCHAR2(100 BYTE),
  ATTRIBUTE7    VARCHAR2(100 BYTE),
  ATTRIBUTE8    VARCHAR2(100 BYTE),
  ATTRIBUTE9    VARCHAR2(100 BYTE),
  ATTRIBUTE10   VARCHAR2(100 BYTE)
)
NOCOMPRESS 
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
PARTITION BY RANGE (MODIFY_DATE)
(  
  PARTITION SCANLOG_2016_Q1 VALUES LESS THAN (TO_DATE(' 2016-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION SCANLOG_2016_Q2 VALUES LESS THAN (TO_DATE(' 2016-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION SCANLOG_2016_Q3 VALUES LESS THAN (TO_DATE(' 2016-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION SCANLOG_2016_Q4 VALUES LESS THAN (TO_DATE(' 2017-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION SCANLOG_2017_Q1 VALUES LESS THAN (TO_DATE(' 2017-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION SCANLOG_2017_Q2 VALUES LESS THAN (TO_DATE(' 2017-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION SCANLOG_2017_Q3 VALUES LESS THAN (TO_DATE(' 2017-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION SCANLOG_2017_Q4 VALUES LESS THAN (TO_DATE(' 2018-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               ),  
  PARTITION SCANLOG_MAX VALUES LESS THAN (MAXVALUE)
    LOGGING
    NOCOMPRESS 
    TABLESPACE AXM_TS_WMS
    PCTFREE    10
    INITRANS   1
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                BUFFER_POOL      DEFAULT
               )
)
NOCACHE
MONITORING;


CREATE UNIQUE INDEX DSS.DSS_LOG_ORDER_SCAN_PK ON DSS.DSS_LOG_ORDER_SCAN
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

ALTER TABLE DSS.DSS_LOG_ORDER_SCAN ADD (
  CONSTRAINT DSS_LOG_ORDER_SCAN_PK
  PRIMARY KEY
  (LOGID)
  USING INDEX DSS.DSS_LOG_ORDER_SCAN_PK
  ENABLE VALIDATE);

GRANT SELECT ON DSS.DSS_LOG_ORDER_SCAN TO SELDATA;
