DROP SEQUENCE DSS.REP_CONNECTIONS_SEQ;

CREATE SEQUENCE DSS.REP_CONNECTIONS_SEQ
  START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;
