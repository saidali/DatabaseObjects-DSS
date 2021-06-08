DROP INDEX DSS.DSS_ORDER_SCAN_SERIALS_X5;

CREATE INDEX DSS.DSS_ORDER_SCAN_SERIALS_X5 ON DSS.DSS_ORDER_SCAN_SERIALS
(ORDER_NUMBER)
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
