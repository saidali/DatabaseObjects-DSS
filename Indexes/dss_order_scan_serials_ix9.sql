DROP INDEX DSS.DSS_ORDER_SCAN_SERIALS_IX9;

CREATE INDEX DSS.DSS_ORDER_SCAN_SERIALS_IX9 ON DSS.DSS_ORDER_SCAN_SERIALS
(CREATE_DATE)
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