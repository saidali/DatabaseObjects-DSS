DROP INDEX DSS.SEC_USERS_PK;

CREATE UNIQUE INDEX DSS.SEC_USERS_PK ON DSS.SEC_USERS
(USER_NAME)
LOGGING
TABLESPACE TS_ORABRIDGE
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
