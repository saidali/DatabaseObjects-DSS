DROP INDEX DSS.DSS_PRODUCTS_IXCP;

CREATE INDEX DSS.DSS_PRODUCTS_IXCP ON DSS.DSS_PRODUCTS
(CATEGORY_CODE, PRODUCT_CODE)
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
