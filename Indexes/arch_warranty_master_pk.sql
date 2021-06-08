DROP INDEX DSS.ARCH_WARRANTY_MASTER_PK;

CREATE UNIQUE INDEX DSS.ARCH_WARRANTY_MASTER_PK ON DSS.ARCH_WARRANTY_MASTER
(LINEID)
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