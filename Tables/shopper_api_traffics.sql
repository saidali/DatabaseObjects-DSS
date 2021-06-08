ALTER TABLE DSS.SHOPPER_API_TRAFFICS
 DROP PRIMARY KEY CASCADE;

DROP TABLE DSS.SHOPPER_API_TRAFFICS CASCADE CONSTRAINTS;

CREATE TABLE DSS.SHOPPER_API_TRAFFICS
(
  ROWSEQ              NUMBER,
  EVENTID             NUMBER,
  SHOPPERTRAKID       NUMBER,
  CUSTOMERID          NUMBER,
  GROUPBYCODE         VARCHAR2(10 BYTE),
  PERIOD_CODE         VARCHAR2(10 BYTE),
  STARTDATE           NUMBER,
  ENDDATE             NUMBER,
  TRAFFIC_EXITS       NUMBER,
  TRAFFIC_ENTERS      NUMBER,
  CONVERSION          NUMBER,
  STAR_DATA           NUMBER,
  SALES               NUMBER,
  AVGTRANSACTIONSIZE  NUMBER,
  DWL_DATE            DATE                      DEFAULT SYSDATE
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


--  There is no statement for index DSS.SYS_C00710677.
--  The object is created when the parent object is created.

--  There is no statement for index DSS.SYS_C00710678.
--  The object is created when the parent object is created.

CREATE OR REPLACE TRIGGER DSS.SHOPPER_API_TRAFFICS_TRG
BEFORE INSERT
ON DSS.SHOPPER_API_TRAFFICS
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column ROWSEQ
  :new.ROWSEQ := SHOPPER_API_TRAFFICS_SEQ.nextval;
END SHOPPER_API_TRAFFICS_TRG;
/


ALTER TABLE DSS.SHOPPER_API_TRAFFICS ADD (
  PRIMARY KEY
  (ROWSEQ)
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
  ENABLE VALIDATE,
  UNIQUE (ENDDATE, STARTDATE, SHOPPERTRAKID)
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

GRANT SELECT ON DSS.SHOPPER_API_TRAFFICS TO SELDATA;
