DROP SEQUENCE DSS.SEQ_ROW_DELIMITER_ID;

CREATE SEQUENCE DSS.SEQ_ROW_DELIMITER_ID
  START WITH 21
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;