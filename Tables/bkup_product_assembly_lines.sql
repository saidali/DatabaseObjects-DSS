DROP TABLE DSS.BKUP_PRODUCT_ASSEMBLY_LINES CASCADE CONSTRAINTS;

CREATE TABLE DSS.BKUP_PRODUCT_ASSEMBLY_LINES
(
  HEADERSEQ                 NUMBER              NOT NULL,
  ORGANIZATION_ID           NUMBER              NOT NULL,
  OPERATING_UNIT            NUMBER              NOT NULL,
  LOCATION_CODE             VARCHAR2(50 BYTE)   NOT NULL,
  LINESEQ                   NUMBER              NOT NULL,
  ITEM_NUM                  NUMBER,
  ASSEMBLY_TYPE             VARCHAR2(10 BYTE)   NOT NULL,
  BUNDLE_INVENTORY_ITEM_ID  NUMBER              NOT NULL,
  BUNDLE_PRODUCT_CODE       VARCHAR2(50 BYTE)   NOT NULL,
  BOM_ID                    NUMBER,
  QTY                       NUMBER              NOT NULL,
  CREATE_BY                 VARCHAR2(50 BYTE),
  CREATE_DATE               VARCHAR2(1 BYTE),
  STATUS                    CHAR(1 BYTE),
  LINE_REFE_NO              VARCHAR2(100 BYTE),
  ATTRIBUTE1                VARCHAR2(200 BYTE),
  ATTRIBUTE2                VARCHAR2(200 BYTE),
  ATTRIBUTE3                VARCHAR2(200 BYTE),
  ATTRIBUTE4                VARCHAR2(200 BYTE),
  ATTRIBUTE5                VARCHAR2(200 BYTE),
  ATTRIBUTE6                VARCHAR2(200 BYTE),
  ATTRIBUTE7                VARCHAR2(200 BYTE),
  ATTRIBUTE8                VARCHAR2(200 BYTE),
  ATTRIBUTE9                VARCHAR2(200 BYTE),
  ATTRIBUTE10               VARCHAR2(200 BYTE)
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


GRANT SELECT ON DSS.BKUP_PRODUCT_ASSEMBLY_LINES TO SELDATA;