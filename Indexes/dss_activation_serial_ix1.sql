DROP INDEX DSS.DSS_ACTIVATION_SERIAL_IX1;

CREATE INDEX DSS.DSS_ACTIVATION_SERIAL_IX1 ON DSS.DSS_ACTIVATION_SERIAL
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
