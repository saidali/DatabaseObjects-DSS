ALTER TABLE DSS.TK_ORG_ORDER_CONFIG
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.TK_ORG_ORDER_CONFIG CASCADE CONSTRAINTS;

CREATE TABLE DSS.TK_ORG_ORDER_CONFIG
(
  OPERATING_UNIT     NUMBER,
  ORGANIZATION_ID    NUMBER,
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
  CREATE_DATE        DATE                       DEFAULT SYSDATE,
  CREATE_BY          VARCHAR2(50 BYTE),
  MANIFEST_YN        CHAR(1 BYTE),
  ATTRIBUTE1         VARCHAR2(50 BYTE),
  ATTRIBUTE2         VARCHAR2(50 BYTE),
  ATTRIBUTE3         VARCHAR2(50 BYTE),
  ATTRIBUTE4         VARCHAR2(50 BYTE),
  ATTRIBUTE5         VARCHAR2(50 BYTE)
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


ALTER TABLE DSS.TK_ORG_ORDER_CONFIG ADD (
  CONSTRAINT TK_ORG_ORDER_CONFIG_PK
  PRIMARY KEY
  (LINE_SEQ, ORGANIZATION_ID)
  DISABLE NOVALIDATE);

GRANT SELECT ON DSS.TK_ORG_ORDER_CONFIG TO SELDATA;
