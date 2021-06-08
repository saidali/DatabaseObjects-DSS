ALTER TABLE DSS.ITEM_BARCODES
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.ITEM_BARCODES CASCADE CONSTRAINTS;

CREATE TABLE DSS.ITEM_BARCODES
(
  INVENTORY_ITEM_ID  NUMBER                     NOT NULL,
  BARCODES           VARCHAR2(30 BYTE)          NOT NULL
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


--  There is no statement for index DSS.SYS_C00909387.
--  The object is created when the parent object is created.

ALTER TABLE DSS.ITEM_BARCODES ADD (
  PRIMARY KEY
  (BARCODES)
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
