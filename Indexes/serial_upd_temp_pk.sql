DROP INDEX DSS.SERIAL_UPD_TEMP_PK;

CREATE UNIQUE INDEX DSS.SERIAL_UPD_TEMP_PK ON DSS.SERIAL_UPD_TEMP
(ROWSEQ, SERIALNUMBER)
LOGGING
TABLESPACE AXM_TS_WMS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );
