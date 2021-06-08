ALTER TABLE DSS.DSS_SERIALS_ANALYSIS
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.DSS_SERIALS_ANALYSIS CASCADE CONSTRAINTS;

CREATE TABLE DSS.DSS_SERIALS_ANALYSIS
(
  LINEID             NUMBER,
  INVENTORY_ITEM_ID  NUMBER,
  PRODUCT_CODE       VARCHAR2(100 BYTE),
  KEYNUMBER          NUMBER,
  ISLUHNKEY          INTEGER,
  ISNUMERIC          INTEGER,
  KEYLENGTH          NUMBER,
  HISTS              NUMBER,
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


CREATE UNIQUE INDEX DSS.DSS_SERIALS_ANALYSIS_PK ON DSS.DSS_SERIALS_ANALYSIS
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

CREATE INDEX DSS.DSS_SERIALS_ANALYSIS_XI1 ON DSS.DSS_SERIALS_ANALYSIS
(INVENTORY_ITEM_ID, PRODUCT_CODE)
LOGGING
TABLESPACE AXM_TS_WMS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

CREATE OR REPLACE TRIGGER DSS.DSS_SERIALS_ANALYSIS_TRG
BEFORE INSERT
ON DSS.DSS_SERIALS_ANALYSIS
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column LINEID
  :new.LINEID := DSS_SERIALS_ANALYSIS_SEQ.nextval;
END DSS_SERIALS_ANALYSIS_TRG;
/


ALTER TABLE DSS.DSS_SERIALS_ANALYSIS ADD (
  CONSTRAINT DSS_SERIALS_ANALYSIS_PK
  PRIMARY KEY
  (LINEID)
  USING INDEX DSS.DSS_SERIALS_ANALYSIS_PK
  ENABLE VALIDATE);

GRANT SELECT ON DSS.DSS_SERIALS_ANALYSIS TO SELDATA;
