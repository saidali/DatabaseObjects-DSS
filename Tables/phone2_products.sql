DROP TABLE DSS.PHONE2_PRODUCTS CASCADE CONSTRAINTS;

CREATE TABLE DSS.PHONE2_PRODUCTS
(
  PRODUCT_CODE       VARCHAR2(200 BYTE),
  DESCRIPTION        VARCHAR2(500 BYTE),
  WARRANTY_DURATION  VARCHAR2(100 BYTE),
  BRAND              VARCHAR2(100 BYTE)
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


GRANT SELECT ON DSS.PHONE2_PRODUCTS TO SELDATA;