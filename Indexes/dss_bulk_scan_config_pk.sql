DROP INDEX DSS.DSS_BULK_SCAN_CONFIG_PK;

CREATE UNIQUE INDEX DSS.DSS_BULK_SCAN_CONFIG_PK ON DSS.DSS_BULK_SCAN_CONFIG
(SEQNO)
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
