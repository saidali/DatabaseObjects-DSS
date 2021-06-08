DROP INDEX DSS.DSS_STOCK_COUNT_PK;

CREATE UNIQUE INDEX DSS.DSS_STOCK_COUNT_PK ON DSS.DSS_STOCK_COUNT
(ROW_SEQ)
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
