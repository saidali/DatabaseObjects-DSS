DROP INDEX DSS.UDX_FLS_PARENT_KEY_ID;

CREATE UNIQUE INDEX DSS.UDX_FLS_PARENT_KEY_ID ON DSS.DSS_FILE_SERIALS
(PARENTKEY, KEYID)
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
