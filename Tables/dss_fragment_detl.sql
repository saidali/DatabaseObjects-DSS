ALTER TABLE DSS.DSS_FRAGMENT_DETL
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.DSS_FRAGMENT_DETL CASCADE CONSTRAINTS;

CREATE TABLE DSS.DSS_FRAGMENT_DETL
(
  DETL_ID          NUMBER,
  HEADERSEQ        NUMBER                       NOT NULL,
  LINE_ID          NUMBER                       NOT NULL,
  ITEM_INDEX       NUMBER,
  OPERATING_UNIT   NUMBER,
  ORGANIZATION_ID  NUMBER,
  ITEM_TYPE        VARCHAR2(50 BYTE)            NOT NULL,
  PRODUCT_CODE     VARCHAR2(100 BYTE)           NOT NULL,
  ITEM_LENGTH      NUMBER,
  ITEM_WIDTH       NUMBER,
  ITEM_HEIGHT      NUMBER,
  ITEM_UOM         VARCHAR2(50 BYTE),
  QUANTITY         NUMBER                       NOT NULL,
  ISWASTED         CHAR(1 BYTE),
  ISDAMAGED        CHAR(1 BYTE),
  ITEM_PRICE       NUMBER,
  STATUS           VARCHAR2(10 BYTE),
  REFERENCE_1      VARCHAR2(100 BYTE),
  REFERENCE_2      VARCHAR2(100 BYTE),
  CREATE_DATE      DATE                         NOT NULL,
  CREATE_BY        VARCHAR2(50 BYTE)            NOT NULL,
  MODIFY_DATE      DATE,
  MODIFY_BY        VARCHAR2(50 BYTE),
  ATTRIBUTE1       VARCHAR2(100 BYTE),
  ATTRIBUTE2       VARCHAR2(100 BYTE),
  ATTRIBUTE3       VARCHAR2(100 BYTE),
  ATTRIBUTE4       VARCHAR2(100 BYTE),
  ATTRIBUTE5       VARCHAR2(100 BYTE),
  ATTRIBUTE6       VARCHAR2(100 BYTE),
  ATTRIBUTE7       VARCHAR2(100 BYTE),
  ATTRIBUTE8       VARCHAR2(100 BYTE),
  ATTRIBUTE9       VARCHAR2(100 BYTE),
  ATTRIBUTE10      VARCHAR2(100 BYTE)
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


CREATE UNIQUE INDEX DSS.DSS_FRAGMENT_DETL_PK ON DSS.DSS_FRAGMENT_DETL
(DETL_ID)
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

ALTER TABLE DSS.DSS_FRAGMENT_DETL ADD (
  CONSTRAINT DSS_FRAGMENT_DETL_PK
  PRIMARY KEY
  (DETL_ID)
  USING INDEX DSS.DSS_FRAGMENT_DETL_PK
  ENABLE VALIDATE);

ALTER TABLE DSS.DSS_FRAGMENT_DETL ADD (
  CONSTRAINT DSS_FRAGMENT_DETL_R01 
  FOREIGN KEY (HEADERSEQ) 
  REFERENCES DSS.DSS_FRAGMENT_HEADER (HEADERSEQ)
  ENABLE VALIDATE,
  CONSTRAINT DSS_FRAGMENT_DETL_R02 
  FOREIGN KEY (LINE_ID) 
  REFERENCES DSS.DSS_FRAGMENT_LINES (LINE_ID)
  ENABLE VALIDATE);

GRANT SELECT ON DSS.DSS_FRAGMENT_DETL TO SELDATA;
