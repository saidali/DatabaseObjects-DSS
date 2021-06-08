DROP INDEX DSS.DSS_SERVICE_BRANDS_U01;

CREATE UNIQUE INDEX DSS.DSS_SERVICE_BRANDS_U01 ON DSS.DSS_SERVICE_BRANDS
(BRAND_CODE)
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
