ALTER TABLE DSS.ERR_ORDER_SCAN_LINES
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.ERR_ORDER_SCAN_LINES CASCADE CONSTRAINTS;

CREATE TABLE DSS.ERR_ORDER_SCAN_LINES
(
  JOBID              NUMBER,
  LINEID             NUMBER,
  MERGED             VARCHAR2(1 BYTE),
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
  WMS_SYNC           VARCHAR2(1 BYTE),
  SCAN_YN            VARCHAR2(1 BYTE),
  WARRANTYPRINT_YN   VARCHAR2(1 BYTE),
  WARRANTY_YN        VARCHAR2(1 BYTE),
  WARRANTY_SEQ       NUMBER,
  WARRANTY_CODE      VARCHAR2(30 BYTE),
  CREATE_BY          VARCHAR2(30 BYTE),
  MODIFY_BY          VARCHAR2(30 BYTE),
  CREATE_DATE        DATE,
  MODIFY_DATE        DATE,
  EXPIRY_DATE        DATE,
  EXPIRY_DAYS        NUMBER,
  EDITABLE_YN        VARCHAR2(1 BYTE),
  ARCHIVED_YN        VARCHAR2(1 BYTE),
  ACTIVE_YN          VARCHAR2(1 BYTE),
  STATUS_YN          VARCHAR2(1 BYTE),
  HAS_SERIALS        VARCHAR2(1 BYTE),
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


--  There is no statement for index DSS.SYS_C00856057.
--  The object is created when the parent object is created.

ALTER TABLE DSS.ERR_ORDER_SCAN_LINES ADD (
  PRIMARY KEY
  (LINEID, JOBID)
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

GRANT SELECT ON DSS.ERR_ORDER_SCAN_LINES TO SELDATA;
