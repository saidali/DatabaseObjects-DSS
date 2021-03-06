ALTER TABLE DSS.TEMP_SAM_PO_LINES
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.TEMP_SAM_PO_LINES CASCADE CONSTRAINTS;

CREATE TABLE DSS.TEMP_SAM_PO_LINES
(
  ROWSEQ             NUMBER,
  PO_HEADER_ID       NUMBER,
  PO_LINE_ID         NUMBER,
  LINE_SEQ           NUMBER,
  INVENTORY_ITEM_ID  NUMBER,
  PRODUCT_CODE       VARCHAR2(40 BYTE),
  QUANTITY           NUMBER,
  CNT_SERIALS        NUMBER,
  HASERROR           CHAR(1 BYTE)               DEFAULT 'N',
  ERRORCODES         VARCHAR2(100 BYTE)
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

CREATE OR REPLACE TRIGGER DSS.TEMP_SAM_PO_LINES_TRG
BEFORE INSERT
ON DSS.TEMP_SAM_PO_LINES
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column ROWSEQ
  :new.ROWSEQ := TEMP_SAM_PO_LINES_SEQ.nextval;
END TEMP_SAM_PO_LINES_TRG;
/


ALTER TABLE DSS.TEMP_SAM_PO_LINES ADD (
  CONSTRAINT TEMP_SAM_PO_LINES_PK
  PRIMARY KEY
  (ROWSEQ)
  USING INDEX DSS.TEMP_SAM_PO_LINES_PK
  ENABLE VALIDATE);
