ALTER TABLE DSS.TK_ORDER_SCAN_CONFIG
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.TK_ORDER_SCAN_CONFIG CASCADE CONSTRAINTS;

CREATE TABLE DSS.TK_ORDER_SCAN_CONFIG
(
  LINE_SEQ           NUMBER,
  ORDER_TYPE         VARCHAR2(20 BYTE),
  ORDER_DESCRIPTION  VARCHAR2(200 BYTE),
  ORDER_SHORT_CODE   VARCHAR2(4 BYTE),
  ORDER_EXPIRED      NUMBER                     DEFAULT 12,
  ORDER_FILTER       NUMBER                     DEFAULT 15,
  WMS_QTY_SYNC       CHAR(1 BYTE)               DEFAULT 'N',
  SCAN_ENABLED       CHAR(1 BYTE)               DEFAULT 'N',
  WARRANTY_ENABLED   CHAR(1 BYTE)               DEFAULT 'N',
  ISADVANCE          CHAR(1 BYTE)               DEFAULT 'N',
  PICK_RESTRICTION   CHAR(1 BYTE)               DEFAULT 'N',
  CREATE_DATE        DATE                       DEFAULT SYSDATE
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


CREATE UNIQUE INDEX DSS.TK_ORDER_SCAN_CONFIG_PK ON DSS.TK_ORDER_SCAN_CONFIG
(LINE_SEQ)
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

CREATE UNIQUE INDEX DSS.TK_ORDER_SCAN_CONFIG_U01 ON DSS.TK_ORDER_SCAN_CONFIG
(ORDER_TYPE)
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

CREATE OR REPLACE TRIGGER DSS.TK_ORDER_SCAN_CONFIG_TRG
BEFORE INSERT
ON DSS.TK_ORDER_SCAN_CONFIG
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column LINE_SEQ
  :new.LINE_SEQ := SEQ_ORDER_SCAN_CONFIG.nextval;
END TK_ORDER_SCAN_CONFIG_TRG;
/


ALTER TABLE DSS.TK_ORDER_SCAN_CONFIG ADD (
  CONSTRAINT TK_ORDER_SCAN_CONFIG_PK
  PRIMARY KEY
  (LINE_SEQ)
  USING INDEX DSS.TK_ORDER_SCAN_CONFIG_PK
  ENABLE VALIDATE,
  CONSTRAINT TK_ORDER_SCAN_CONFIG_U01
  UNIQUE (ORDER_TYPE)
  USING INDEX DSS.TK_ORDER_SCAN_CONFIG_U01
  ENABLE VALIDATE);

GRANT SELECT ON DSS.TK_ORDER_SCAN_CONFIG TO SELDATA;
