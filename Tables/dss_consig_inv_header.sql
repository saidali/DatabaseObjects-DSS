ALTER TABLE DSS.DSS_CONSIG_INV_HEADER
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.DSS_CONSIG_INV_HEADER CASCADE CONSTRAINTS;

CREATE TABLE DSS.DSS_CONSIG_INV_HEADER
(
  INV_ID             NUMBER                     NOT NULL,
  HEADER_ID          NUMBER                     NOT NULL,
  ORDER_TYPE         VARCHAR2(50 BYTE)          NOT NULL,
  OPERATING_UNIT     NUMBER                     NOT NULL,
  ORGANIZATION_ID    NUMBER                     NOT NULL,
  ORDER_NUMBER       VARCHAR2(100 BYTE)         NOT NULL,
  REFERENCE_NUMBER   VARCHAR2(100 BYTE),
  ORDER_DATE         DATE,
  REFERENCE_DATE     DATE,
  FRM_LOCATION_CODE  VARCHAR2(100 BYTE),
  FRM_LOCATION_DESC  VARCHAR2(100 BYTE),
  TO_LOCATION_CODE   VARCHAR2(100 BYTE),
  TO_LOCATION_DESC   VARCHAR2(100 BYTE),
  CUSTOMER_CODE      VARCHAR2(100 BYTE),
  CUSTOMER_NAME      VARCHAR2(200 BYTE),
  REMARKS            VARCHAR2(500 BYTE),
  NO_LINES           NUMBER,
  TOTAL_QTY          NUMBER,
  TOTAL_AMOUNT       NUMBER,
  DISCOUNT           NUMBER,
  NET_AMOUNT         NUMBER,
  PAYMENT_TERMS      VARCHAR2(200 BYTE),
  CREATED_BY         VARCHAR2(50 BYTE),
  CREATED_DATE       DATE,
  MODIFY_BY          VARCHAR2(50 BYTE),
  MODIFY_DATE        DATE,
  ATTRIBUTE1         VARCHAR2(100 BYTE),
  ATTRIBUTE2         VARCHAR2(100 BYTE),
  ATTRIBUTE3         VARCHAR2(100 BYTE),
  ATTRIBUTE4         VARCHAR2(100 BYTE),
  ATTRIBUTE5         VARCHAR2(100 BYTE),
  ATTRIBUTE6         VARCHAR2(100 BYTE),
  ATTRIBUTE7         VARCHAR2(100 BYTE),
  ATTRIBUTE8         VARCHAR2(100 BYTE),
  ATTRIBUTE9         VARCHAR2(100 BYTE),
  ATTRIBUTE10        VARCHAR2(100 BYTE)
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


CREATE UNIQUE INDEX DSS.DSS_CONSIG_INV_HEADER_PK ON DSS.DSS_CONSIG_INV_HEADER
(ORDER_TYPE, OPERATING_UNIT, ORDER_NUMBER, ORGANIZATION_ID)
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

ALTER TABLE DSS.DSS_CONSIG_INV_HEADER ADD (
  CONSTRAINT DSS_CONSIG_INV_HEADER_PK
  PRIMARY KEY
  (ORDER_TYPE, OPERATING_UNIT, ORDER_NUMBER, ORGANIZATION_ID)
  USING INDEX DSS.DSS_CONSIG_INV_HEADER_PK
  ENABLE VALIDATE);

GRANT SELECT ON DSS.DSS_CONSIG_INV_HEADER TO SELDATA;
