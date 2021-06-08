DROP INDEX DSS.DSS_CONSIG_INV_HEADER_PK;

CREATE UNIQUE INDEX DSS.DSS_CONSIG_INV_HEADER_PK ON DSS.DSS_CONSIG_INV_HEADER
(ORDER_TYPE, OPERATING_UNIT, ORDER_NUMBER, ORGANIZATION_ID)
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
