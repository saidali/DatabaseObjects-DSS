DROP INDEX DSS.SEC_USER_COUNTRY_ACCESS_PK;

CREATE UNIQUE INDEX DSS.SEC_USER_COUNTRY_ACCESS_PK ON DSS.SEC_USER_COUNTRY_ACCESS
(OPERATING_UNIT, USER_NAME)
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