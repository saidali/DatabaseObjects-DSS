DROP SEQUENCE DSS.TST_BULK_INSERT_SEQ;

CREATE SEQUENCE DSS.TST_BULK_INSERT_SEQ
  START WITH 21
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;