ALTER TABLE DSS.DWL_SCE_SERIALS
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.DWL_SCE_SERIALS CASCADE CONSTRAINTS;

CREATE TABLE DSS.DWL_SCE_SERIALS
(
  ROWSEQ              NUMBER,
  SCANTYPE            VARCHAR2(100 BYTE),
  SCAN_SOURCE         VARCHAR2(100 BYTE),
  SCE_SCAN_ID         NUMBER,
  SCE_LINE_ID         NUMBER,
  SCE_LINE_NO         NUMBER,
  SCE_ORDERKEY        VARCHAR2(100 BYTE),
  SCE_ORDERID         NUMBER,
  SCE_STATUS          NUMBER,
  SCE_ORDER_TYPE      VARCHAR2(30 BYTE),
  ERP_LINE_ID         NUMBER,
  ERP_HEADER_ID       NUMBER,
  ERP_ORDER_NUMBER    VARCHAR2(100 BYTE),
  ERP_ORDER_TYPE      VARCHAR2(30 BYTE),
  DSS_SCANID          NUMBER,
  DSS_JOBID           NUMBER,
  DSS_LINEID          NUMBER,
  ORGANIZATION_ID     NUMBER,
  OPREATING_UNIT      NUMBER,
  INVENTORY_ITEM_ID   NUMBER,
  PRODUCT_CODE        VARCHAR2(50 BYTE),
  CATEGORYID          NUMBER,
  BRANDCODE           VARCHAR2(50 BYTE),
  MODELCODE           VARCHAR2(50 BYTE),
  SERVICE_BRANDID     NUMBER,
  FACILITY_CODE       VARCHAR2(50 BYTE),
  FRM_LOCATION_CODE   VARCHAR2(100 BYTE),
  TO_LOCATION_CODE    VARCHAR2(100 BYTE),
  ROW_INDEX           NUMBER,
  COL_INDEX           NUMBER,
  SERIALKEY           VARCHAR2(100 BYTE),
  SERIALKEY_REF1      VARCHAR2(100 BYTE),
  SERIALKEY_REF2      VARCHAR2(100 BYTE),
  WARRANTY_YN         VARCHAR2(1 BYTE)          DEFAULT 'N',
  WARRANTY_SEQ        NUMBER,
  WARRANTY_CODE       VARCHAR2(50 BYTE),
  WARRANTY_STARTDATE  DATE                      DEFAULT SYSDATE,
  WARRANTY_ENDATE     DATE,
  ORDER_REF1          VARCHAR2(100 BYTE),
  ORDER_REF2          VARCHAR2(100 BYTE),
  ORDER_REF3          VARCHAR2(100 BYTE),
  ORDER_REF4          VARCHAR2(100 BYTE),
  ACTIVE_YN           VARCHAR2(1 BYTE)          DEFAULT 'N',
  INF_YN              VARCHAR2(1 BYTE)          DEFAULT 'N',
  INF_DATE            DATE,
  CREATE_BY           VARCHAR2(50 BYTE),
  CREATE_DATE         DATE                      DEFAULT SYSDATE,
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
            BUFFER_POOL      DEFAULT
           )
PARTITION BY RANGE (CREATE_DATE)
(  
  PARTITION SCES_2017 VALUES LESS THAN (TO_DATE(' 2017-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION SCES_2018 VALUES LESS THAN (TO_DATE(' 2019-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION SCES_2019 VALUES LESS THAN (TO_DATE(' 2020-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION SCES_2020 VALUES LESS THAN (TO_DATE(' 2021-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION SCES_2021 VALUES LESS THAN (TO_DATE(' 2022-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION SCES_MAX VALUES LESS THAN (MAXVALUE)
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


--  There is no statement for index DSS.SYS_C00759144.
--  The object is created when the parent object is created.

--  There is no statement for index DSS.SYS_C00759145.
--  The object is created when the parent object is created.

--  There is no statement for index DSS.SYS_C00759146.
--  The object is created when the parent object is created.

ALTER TABLE DSS.DWL_SCE_SERIALS ADD (
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
  UNIQUE (SCE_SCAN_ID)
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
  UNIQUE (ERP_ORDER_TYPE, ERP_ORDER_NUMBER, ERP_LINE_ID, COL_INDEX, ROW_INDEX)
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

GRANT SELECT ON DSS.DWL_SCE_SERIALS TO SELDATA;
