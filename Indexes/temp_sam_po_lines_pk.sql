DROP INDEX DSS.TEMP_SAM_PO_LINES_PK;

CREATE UNIQUE INDEX DSS.TEMP_SAM_PO_LINES_PK ON DSS.TEMP_SAM_PO_LINES
(ROWSEQ)
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