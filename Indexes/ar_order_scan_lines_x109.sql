DROP INDEX DSS.AR_ORDER_SCAN_LINES_X109;

CREATE INDEX DSS.AR_ORDER_SCAN_LINES_X109 ON DSS.AR_ORDER_SCAN_LINES
(JOBID)
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