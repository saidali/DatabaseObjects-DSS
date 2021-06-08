ALTER TABLE DSS.DSS_CONSIG_INV_LINES
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.DSS_CONSIG_INV_LINES CASCADE CONSTRAINTS;

CREATE TABLE DSS.DSS_CONSIG_INV_LINES
(
  INV_ID           NUMBER                       NOT NULL,
  LINE_NO          NUMBER,
  ORDER_TYPE       VARCHAR2(50 BYTE)            NOT NULL,
  ORDER_NUMBER     VARCHAR2(100 BYTE)           NOT NULL,
  ORDER_DATE       DATE,
  OPERATING_UNIT   NUMBER,
  ORGANIZATION_ID  NUMBER                       NOT NULL,
  ITEM_ID          NUMBER,
  PRODUCT_CODE     VARCHAR2(100 BYTE)           NOT NULL,
  PRODUCT_DESC     VARCHAR2(200 BYTE),
  MODEL            VARCHAR2(100 BYTE),
  QTY              NUMBER                       NOT NULL,
  ORIGINAL_PRICE   NUMBER,
  CUSTOM_PRICE     NUMBER,
  ORIGINAL_TOTAL   NUMBER,
  CUSTOM_TOTAL     NUMBER,
  CREATE_BY        VARCHAR2(50 BYTE),
  CREATE_DATE      DATE,
  MODIFY_BY        VARCHAR2(50 BYTE),
  MODIFY_DATE      DATE,
  ATTRIBUTE1       VARCHAR2(100 BYTE),
  ATTRIBUTE2       VARCHAR2(100 BYTE),
  ATTRIBUTE3       VARCHAR2(100 BYTE),
  ATTRIBUTE4       VARCHAR2(100 BYTE),
  ATTRIBUTE5       VARCHAR2(100 BYTE),
  ATTRIBUTE6       VARCHAR2(100 BYTE),
  ATTRIBUTE7       VARCHAR2(100 BYTE),
  ATTRIBUTE8       VARCHAR2(100 BYTE),
  ATTRIBUTE9       VARCHAR2(100 BYTE),
  ATTRIBUTE10      VARCHAR2(100 BYTE)
)
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
NOCOMPRESS 
NOCACHE
MONITORING;


CREATE UNIQUE INDEX DSS.DSS_CONSIG_INV_LINES_PK ON DSS.DSS_CONSIG_INV_LINES
(LINE_NO, ORDER_TYPE, ORDER_NUMBER, ORGANIZATION_ID)
LOGGING
TABLESPACE AXM_TS_WMS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE DSS.DSS_CONSIG_INV_LINES ADD (
  CONSTRAINT DSS_CONSIG_INV_LINES_PK
  PRIMARY KEY
  (LINE_NO, ORDER_TYPE, ORDER_NUMBER, ORGANIZATION_ID)
  USING INDEX DSS.DSS_CONSIG_INV_LINES_PK
  ENABLE VALIDATE);

GRANT SELECT ON DSS.DSS_CONSIG_INV_LINES TO SELDATA;