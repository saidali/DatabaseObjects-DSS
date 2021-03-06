DROP INDEX DSS.TK_PRODUCT_WARRANTY_PK;

CREATE UNIQUE INDEX DSS.TK_PRODUCT_WARRANTY_PK ON DSS.TK_PRODUCT_WARRANTY
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
