ALTER TABLE DSS.REC_ORDER_SCAN_SERIALS
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.REC_ORDER_SCAN_SERIALS CASCADE CONSTRAINTS;

CREATE TABLE DSS.REC_ORDER_SCAN_SERIALS
(
  SCANID              NUMBER                    NOT NULL,
  JOBID               NUMBER,
  LINEID              NUMBER,
  SEQINDEX            NUMBER,
  COLUMNINDEX         NUMBER,
  CONFIGID            NUMBER,
  CONFIGTYPE          VARCHAR2(100 BYTE),
  SCANTYPE            VARCHAR2(100 BYTE),
  SCAN_SOURCE         VARCHAR2(100 BYTE),
  OPREATING_UNIT      NUMBER,
  ORGANIZATION_ID     NUMBER,
  ORDER_TYPE          VARCHAR2(30 BYTE),
  ORDER_NUMBER        VARCHAR2(20 BYTE),
  INVENTORY_ITEM_ID   NUMBER,
  PRODUCT_CODE        VARCHAR2(30 BYTE),
  SERVICE_BRANDID     NUMBER,
  SERIALKEY           VARCHAR2(100 BYTE),
  SERIALKEY_REF1      VARCHAR2(100 BYTE),
  SERIALKEY_REF2      VARCHAR2(100 BYTE),
  WARRANTYPRINT_YN    VARCHAR2(1 BYTE),
  WARRANTY_YN         VARCHAR2(1 BYTE),
  WARRANTY_SEQ        NUMBER,
  WARRANTY_CODE       VARCHAR2(30 BYTE),
  WARRANTY_STARTDATE  DATE,
  WARRANTY_ENDATE     DATE,
  ACTIVE_YN           VARCHAR2(1 BYTE),
  INF_YN              VARCHAR2(1 BYTE),
  INF_DATE            DATE,
  CREATE_BY           VARCHAR2(20 BYTE),
  CREATE_DATE         DATE,
  UPDATE_BY           VARCHAR2(20 BYTE),
  UPDATE_DATE         DATE,
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


CREATE INDEX DSS.REC_ORDER_SCAN_SERIALS_X1 ON DSS.REC_ORDER_SCAN_SERIALS
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

CREATE INDEX DSS.REC_ORDER_SCAN_SERIALS_X2 ON DSS.REC_ORDER_SCAN_SERIALS
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

--  There is no statement for index DSS.SYS_C00864918.
--  The object is created when the parent object is created.

ALTER TABLE DSS.REC_ORDER_SCAN_SERIALS ADD (
  PRIMARY KEY
  (SCANID)
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
