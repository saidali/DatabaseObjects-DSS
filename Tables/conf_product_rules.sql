ALTER TABLE DSS.CONF_PRODUCT_RULES
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.CONF_PRODUCT_RULES CASCADE CONSTRAINTS;

CREATE TABLE DSS.CONF_PRODUCT_RULES
(
  ROWSEQ             NUMBER,
  ORGANIZATION_ID    NUMBER                     NOT NULL,
  INVENTORY_ITEM_ID  NUMBER                     NOT NULL,
  RULEID             NUMBER,
  CREATE_DATE        DATE                       DEFAULT sysdate,
  CREATE_BY          VARCHAR2(100 BYTE)         DEFAULT 'SYS',
  MODIFY_DATE        DATE                       DEFAULT sysdate
)
TABLESPACE AXM_TS_WMS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING;


--  There is no statement for index DSS.SYS_C00901051.
--  The object is created when the parent object is created.

--  There is no statement for index DSS.SYS_C00901052.
--  The object is created when the parent object is created.

CREATE OR REPLACE TRIGGER DSS.CONF_PRODUCT_RULES_TRG
BEFORE INSERT
ON DSS.CONF_PRODUCT_RULES
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column ROWSEQ
  :new.ROWSEQ := CONF_PRODUCT_RULES_SEQ.nextval;
END CONF_PRODUCT_RULES_TRG;
/


ALTER TABLE DSS.CONF_PRODUCT_RULES ADD (
  PRIMARY KEY
  (ROWSEQ)
  USING INDEX
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
               )
  ENABLE VALIDATE,
  UNIQUE (INVENTORY_ITEM_ID, ORGANIZATION_ID)
  USING INDEX
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
               )
  ENABLE VALIDATE);
