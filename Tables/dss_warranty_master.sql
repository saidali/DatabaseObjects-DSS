ALTER TABLE DSS.DSS_WARRANTY_MASTER
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.DSS_WARRANTY_MASTER CASCADE CONSTRAINTS;

CREATE TABLE DSS.DSS_WARRANTY_MASTER
(
  LINEID             NUMBER,
  IMEI_NUMBER        VARCHAR2(100 BYTE),
  IMEI_NUMBER2       VARCHAR2(100 BYTE),
  IMEI_NUMBER3       VARCHAR2(100 BYTE),
  IMEI_NUMBER4       VARCHAR2(100 BYTE),
  RFID_NUMBER        VARCHAR2(100 BYTE),
  INVENTORY_ITEM_ID  NUMBER,
  PRODUCT_CODE       VARCHAR2(50 BYTE),
  PRODUCT_BRAND      VARCHAR2(50 BYTE),
  PRODUCT_MODEL      VARCHAR2(50 BYTE),
  BRAND_SEQ          NUMBER,
  MODEL_SEQ          NUMBER,
  WARRANTY_SEQ       NUMBER,
  WARRANTY_CODE      VARCHAR2(50 BYTE),
  WARRANTY_END_DATE  DATE,
  JOB_REF_NO         NUMBER,
  JOB_REF_LINENO     NUMBER,
  JOB_REF_SEQNO      NUMBER,
  ORDER_TYPE         VARCHAR2(30 BYTE),
  ORDER_NUMBER       NUMBER,
  ORDER_NUMBER2      NUMBER,
  ORDER_NUMBER3      NUMBER,
  ORDER_DATE         DATE,
  OPERATION_UNIT     NUMBER,
  COUNTRY_CODE       VARCHAR2(30 BYTE),
  ORGANIZATIONID     NUMBER,
  CREATE_DATE        DATE,
  MODIFY_DATE        DATE,
  PRINTING_DATE      DATE,
  ACTION_TYPE        VARCHAR2(30 BYTE),
  STATUS             VARCHAR2(30 BYTE),
  INF_YN             VARCHAR2(15 BYTE),
  INF_DATE           DATE,
  ATTRIBUTE1         VARCHAR2(100 BYTE),
  ATTRIBUTE2         VARCHAR2(100 BYTE),
  ATTRIBUTE3         VARCHAR2(100 BYTE),
  ATTRIBUTE4         VARCHAR2(100 BYTE),
  ATTRIBUTE5         VARCHAR2(100 BYTE),
  ATTRIBUTE6         VARCHAR2(100 BYTE),
  ATTRIBUTE7         VARCHAR2(100 BYTE),
  ATTRIBUTE8         VARCHAR2(100 BYTE),
  ATTRIBUTE9         VARCHAR2(100 BYTE),
  ATTRIBUTE10        VARCHAR2(100 BYTE),
  VBRAND_SEQ         NUMBER,
  VBRAND_CODE        VARCHAR2(50 BYTE),
  VMODEL_SEQ         NUMBER,
  VMODEL_CODE        VARCHAR2(50 BYTE),
  BASE_BRAND_SEQ     NUMBER,
  BASE_BRAND_CODE    VARCHAR2(50 BYTE),
  VBASE_BRAND_SEQ    NUMBER,
  VBASE_BRAND_CODE   VARCHAR2(50 BYTE),
  BASE_MODEL_SEQ     NUMBER,
  BASE_MODEL_CODE    VARCHAR2(50 BYTE),
  VBASE_MODEL_SEQ    NUMBER,
  VBASE_MODEL_CODE   VARCHAR2(50 BYTE),
  WARRANTY_YEARS     NUMBER,
  WARRANTY_MONTHS    NUMBER,
  WARRANTY_DAYS      NUMBER,
  ACTION_COUNT       NUMBER,
  CREATE_BY          VARCHAR2(50 BYTE),
  MODIFY_BY          VARCHAR2(50 BYTE)
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
PARTITION BY RANGE (ORDER_DATE)
(  
  PARTITION WARRANTY_2014_Q1 VALUES LESS THAN (TO_DATE(' 2014-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION WARRANTY_2014_Q2 VALUES LESS THAN (TO_DATE(' 2014-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION WARRANTY_2014_Q3 VALUES LESS THAN (TO_DATE(' 2014-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION WARRANTY_2014_Q4 VALUES LESS THAN (TO_DATE(' 2015-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION WARRANTY_2015_Q1 VALUES LESS THAN (TO_DATE(' 2015-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION WARRANTY_2015_Q2 VALUES LESS THAN (TO_DATE(' 2015-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION WARRANTY_2015_Q3 VALUES LESS THAN (TO_DATE(' 2015-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION WARRANTY_2015_Q4 VALUES LESS THAN (TO_DATE(' 2016-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION WARRANTY_2016_Q1 VALUES LESS THAN (TO_DATE(' 2016-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION WARRANTY_2016_Q2 VALUES LESS THAN (TO_DATE(' 2016-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION WARRANTY_2016_Q3 VALUES LESS THAN (TO_DATE(' 2016-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION WARRANTY_2016_Q4 VALUES LESS THAN (TO_DATE(' 2017-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
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
  PARTITION WARRANTY_MAX VALUES LESS THAN (MAXVALUE)
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

COMMENT ON COLUMN DSS.DSS_WARRANTY_MASTER.ATTRIBUTE7 IS 'SOURCE - XXWMS/DSS';

COMMENT ON COLUMN DSS.DSS_WARRANTY_MASTER.ATTRIBUTE8 IS 'ORDER DATE - ONLY IF LINE IS UPDATED';


CREATE UNIQUE INDEX DSS.DSS_IMEI_WARRANTY_MASTER_PK ON DSS.DSS_WARRANTY_MASTER
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

CREATE INDEX DSS.DSS_WARRANTY_MASTER_X01 ON DSS.DSS_WARRANTY_MASTER
(IMEI_NUMBER)
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

CREATE INDEX DSS.DSS_WARRANTY_MASTER_X03 ON DSS.DSS_WARRANTY_MASTER
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

CREATE INDEX DSS.DSS_WARRANTY_MASTER_X05 ON DSS.DSS_WARRANTY_MASTER
(OPERATION_UNIT, INF_YN)
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

CREATE OR REPLACE TRIGGER DSS.DSS_IMEI_WARRANTY_MASTER_TRG
   BEFORE INSERT
   ON DSS.DSS_WARRANTY_MASTER
   REFERENCING NEW AS New OLD AS Old
   FOR EACH ROW
BEGIN
   -- For Toad:  Highlight column LINEID
   :new.LINEID := SEQ_WARRANTY_MASTER.NEXTVAL;
END DSS_IMEI_WARRANTY_MASTER_TRG;
/


CREATE OR REPLACE SYNONYM VCT.DSS_WARRANTY_MASTER FOR DSS.DSS_WARRANTY_MASTER;


ALTER TABLE DSS.DSS_WARRANTY_MASTER ADD (
  CONSTRAINT DSS_IMEI_WARRANTY_MASTER_PK
  PRIMARY KEY
  (LINEID)
  USING INDEX DSS.DSS_IMEI_WARRANTY_MASTER_PK
  ENABLE VALIDATE);

GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON DSS.DSS_WARRANTY_MASTER TO AGT;

GRANT SELECT ON DSS.DSS_WARRANTY_MASTER TO SELDATA;

GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON DSS.DSS_WARRANTY_MASTER TO VCM;

GRANT SELECT ON DSS.DSS_WARRANTY_MASTER TO VCT;
