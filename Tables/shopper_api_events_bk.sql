DROP TABLE DSS.SHOPPER_API_EVENTS_BK CASCADE CONSTRAINTS;

CREATE TABLE DSS.SHOPPER_API_EVENTS_BK
(
  ROWSEQ          NUMBER,
  EVENTID         NUMBER,
  API_NAME        VARCHAR2(200 BYTE),
  APIPARAMETER_1  VARCHAR2(200 BYTE),
  APIPARAMETER_2  VARCHAR2(200 BYTE),
  APIPARAMETER_3  VARCHAR2(200 BYTE),
  APIPARAMETER_4  VARCHAR2(200 BYTE),
  CREATE_DATE     DATE,
  LAST_RUNDATE    DATE,
  NORECORDS       NUMBER,
  STATUS          CHAR(1 BYTE),
  ERROR_MESSAGE   VARCHAR2(500 BYTE)
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


GRANT SELECT ON DSS.SHOPPER_API_EVENTS_BK TO SELDATA;
