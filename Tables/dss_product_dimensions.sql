ALTER TABLE DSS.DSS_PRODUCT_DIMENSIONS
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.DSS_PRODUCT_DIMENSIONS CASCADE CONSTRAINTS;

CREATE TABLE DSS.DSS_PRODUCT_DIMENSIONS
(
  LINEID             NUMBER,
  OPERATING_UNIT     NUMBER,
  ORGANIZATION_ID    NUMBER,
  INVENTORY_ITEM_ID  NUMBER,
  PRODUCT_CODE       VARCHAR2(50 BYTE),
  DESCRIPTION        VARCHAR2(300 BYTE),
  ITEM_TYPE          VARCHAR2(50 BYTE),
  LENGTH1            NUMBER,
  WIDTH1             NUMBER,
  HEIGHT1            NUMBER,
  UOM1               VARCHAR2(20 BYTE),
  LENGTH2            NUMBER,
  WIDTH2             NUMBER,
  HEIGHT2            NUMBER,
  UOM2               VARCHAR2(20 BYTE),
  LENGTH3            NUMBER,
  WIDTH3             NUMBER,
  HEIGHT3            NUMBER,
  UOM3               VARCHAR2(20 BYTE),
  CATEGORY_ID        NUMBER,
  BRAND              VARCHAR2(50 BYTE),
  MODEL              VARCHAR2(50 BYTE),
  COLOR              VARCHAR2(50 BYTE),
  DENSITY            VARCHAR2(100 BYTE),
  HARDNESS           VARCHAR2(100 BYTE),
  THICKNESS          VARCHAR2(100 BYTE),
  TRANSPARANCY       VARCHAR2(100 BYTE),
  MATERIAL           VARCHAR2(100 BYTE),
  TEXTURE            VARCHAR2(100 BYTE),
  LAYER              VARCHAR2(100 BYTE),
  FEATURES           VARCHAR2(200 BYTE),
  STATUS             VARCHAR2(15 BYTE),
  ACTIVE             CHAR(1 BYTE),
  CREATE_DATE        DATE,
  CREATE_BY          VARCHAR2(50 BYTE),
  MODIFY_DATE        DATE,
  MODIFY_BY          VARCHAR2(50 BYTE),
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


CREATE UNIQUE INDEX DSS.DSS_PRODUCT_DIMENSIONS_PK ON DSS.DSS_PRODUCT_DIMENSIONS
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

ALTER TABLE DSS.DSS_PRODUCT_DIMENSIONS ADD (
  CONSTRAINT DSS_PRODUCT_DIMENSIONS_PK
  PRIMARY KEY
  (LINEID)
  USING INDEX DSS.DSS_PRODUCT_DIMENSIONS_PK
  ENABLE VALIDATE);

GRANT SELECT ON DSS.DSS_PRODUCT_DIMENSIONS TO SELDATA;