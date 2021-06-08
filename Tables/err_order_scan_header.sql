ALTER TABLE DSS.ERR_ORDER_SCAN_HEADER
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.ERR_ORDER_SCAN_HEADER CASCADE CONSTRAINTS;

CREATE TABLE DSS.ERR_ORDER_SCAN_HEADER
(
  JOBID                 NUMBER,
  APP_SOURCE            VARCHAR2(30 BYTE),
  ORDER_TYPE            VARCHAR2(20 BYTE),
  ORDER_NUMBER          VARCHAR2(100 BYTE),
  ORDER_REF_NO          NUMBER,
  ORDER_REF_NO2         VARCHAR2(100 BYTE),
  ORDER_DATE            DATE,
  ORDER_REMARKS         VARCHAR2(500 BYTE),
  WARRANTY_YN           VARCHAR2(1 BYTE),
  WMS_YN                VARCHAR2(1 BYTE),
  INTERNAL_YN           VARCHAR2(1 BYTE),
  SCR_TYPE              VARCHAR2(30 BYTE),
  SCR_REF_NUMBER        NUMBER,
  SCR_REF_CODE          VARCHAR2(100 BYTE),
  SCR_OPREATING_UNIT    NUMBER,
  SCR_ORGANIZATION_ID   NUMBER,
  SCR_LOCATION_CODE     VARCHAR2(30 BYTE),
  DEST_TYPE             VARCHAR2(30 BYTE),
  DEST_REF_NUMBER       NUMBER,
  DEST_REF_CODE         VARCHAR2(100 BYTE),
  DEST_OPREATING_UNIT   NUMBER,
  DEST_ORGANIZATION_ID  NUMBER,
  DEST_LOCATION_CODE    VARCHAR2(30 BYTE),
  CREATE_DATE           DATE,
  MODIFY_DATE           DATE,
  CREATE_BY             VARCHAR2(30 BYTE),
  MODIFY_BY             VARCHAR2(30 BYTE),
  EXPIRY_DATE           DATE,
  EXPIRY_AFTER          NUMBER,
  EDITABLE_YN           VARCHAR2(1 BYTE),
  ARCHIVED_YN           VARCHAR2(1 BYTE),
  ACTIVE_YN             VARCHAR2(1 BYTE),
  STATUS_YN             VARCHAR2(1 BYTE),
  ATTRIBUTE1            VARCHAR2(100 BYTE),
  ATTRIBUTE2            VARCHAR2(100 BYTE),
  ATTRIBUTE3            VARCHAR2(100 BYTE),
  ATTRIBUTE4            VARCHAR2(100 BYTE),
  ATTRIBUTE5            VARCHAR2(100 BYTE),
  ATTRIBUTE6            VARCHAR2(100 BYTE),
  ATTRIBUTE7            VARCHAR2(100 BYTE),
  ATTRIBUTE8            VARCHAR2(100 BYTE),
  ATTRIBUTE9            VARCHAR2(100 BYTE),
  ATTRIBUTE10           VARCHAR2(100 BYTE)
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


--  There is no statement for index DSS.SYS_C00856058.
--  The object is created when the parent object is created.

ALTER TABLE DSS.ERR_ORDER_SCAN_HEADER ADD (
  PRIMARY KEY
  (JOBID)
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

GRANT SELECT ON DSS.ERR_ORDER_SCAN_HEADER TO SELDATA;