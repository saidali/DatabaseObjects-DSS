DROP SEQUENCE DSS.TEMP_IMEI_SEQ;

CREATE SEQUENCE DSS.TEMP_IMEI_SEQ
  START WITH 34421
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;
