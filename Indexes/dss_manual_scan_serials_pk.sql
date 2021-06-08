DROP INDEX DSS.DSS_MANUAL_SCAN_SERIALS_PK;

CREATE UNIQUE INDEX DSS.DSS_MANUAL_SCAN_SERIALS_PK ON DSS.DSS_MANUAL_SCAN_SERIALS
(SCANID)
LOGGING
TABLESPACE AXM_TS_WMS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );