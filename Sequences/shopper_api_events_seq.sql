DROP SEQUENCE DSS.SHOPPER_API_EVENTS_SEQ;

CREATE SEQUENCE DSS.SHOPPER_API_EVENTS_SEQ
  START WITH 2061
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;
