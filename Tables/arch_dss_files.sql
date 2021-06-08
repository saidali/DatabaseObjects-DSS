DROP TABLE DSS.ARCH_DSS_FILES CASCADE CONSTRAINTS;

CREATE TABLE DSS.ARCH_DSS_FILES
(
  ROWSEQ         NUMBER,
  FILE_NAME      VARCHAR2(500 BYTE),
  FILE_PATH      VARCHAR2(1000 BYTE),
  BRAND          VARCHAR2(100 BYTE),
  ISARCHIVED     CHAR(1 BYTE),
  ARCHIVED_NAME  VARCHAR2(500 BYTE),
  ARCHIVED_PATH  VARCHAR2(500 BYTE),
  HAS_ERROR      CHAR(1 BYTE),
  ERROR_MESSAGE  VARCHAR2(1000 BYTE),
  CREATE_DATE    DATE,
  UPL_COUNT      NUMBER,
  INS_COUNT      NUMBER,
  FILE_TYPE      VARCHAR2(200 BYTE),
  ATTRIBUTE1     VARCHAR2(100 BYTE),
  ATTRIBUTE2     VARCHAR2(100 BYTE),
  ATTRIBUTE3     VARCHAR2(100 BYTE),
  ATTRIBUTE4     VARCHAR2(100 BYTE)
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


GRANT SELECT ON DSS.ARCH_DSS_FILES TO SELDATA;