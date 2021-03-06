DROP TABLE DSS.TK_CATEGORIES_CONFIG_HNR CASCADE CONSTRAINTS;

CREATE TABLE DSS.TK_CATEGORIES_CONFIG_HNR
(
  CATEGORY_ID            NUMBER                 NOT NULL,
  BRAND                  VARCHAR2(40 BYTE),
  CATEGORY_CODE          VARCHAR2(40 BYTE),
  SUB_CATEGORY_CODE      VARCHAR2(40 BYTE),
  SUB_SUB_CATEGORY_CODE  VARCHAR2(40 BYTE),
  PURCHASETYPE           VARCHAR2(40 BYTE),
  CATEGORY_CONCAT_SEGS   VARCHAR2(204 BYTE),
  UNIQUE_KEY             CHAR(1 BYTE),
  NUMERIC_KEY            CHAR(1 BYTE),
  CHECK_BARCODE          CHAR(1 BYTE),
  IMEI_KEY               CHAR(1 BYTE),
  ALLOW_SPECIALCHAR      CHAR(1 BYTE),
  IMEI_LENGTH_MAX        NUMBER,
  IMEI_LENGTH_MIN        NUMBER,
  SCAN_REQUIRED          CHAR(1 BYTE),
  ENABLED                CHAR(1 BYTE),
  LAST_UPDATE_DATE       DATE                   NOT NULL,
  CREATION_DATE          DATE                   NOT NULL,
  ATTRIBUTE1             VARCHAR2(200 BYTE),
  ATTRIBUTE2             VARCHAR2(200 BYTE),
  ATTRIBUTE3             VARCHAR2(200 BYTE),
  ATTRIBUTE4             VARCHAR2(200 BYTE),
  ATTRIBUTE5             VARCHAR2(200 BYTE),
  ATTRIBUTE6             VARCHAR2(200 BYTE),
  ATTRIBUTE7             VARCHAR2(200 BYTE),
  ATTRIBUTE8             VARCHAR2(200 BYTE),
  ATTRIBUTE9             VARCHAR2(200 BYTE),
  ATTRIBUTE10            VARCHAR2(200 BYTE),
  ALLOWNULL              CHAR(1 BYTE)
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


GRANT SELECT ON DSS.TK_CATEGORIES_CONFIG_HNR TO SELDATA;
