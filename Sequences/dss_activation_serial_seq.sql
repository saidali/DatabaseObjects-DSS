DROP SEQUENCE DSS.DSS_ACTIVATION_SERIAL_SEQ;

CREATE SEQUENCE DSS.DSS_ACTIVATION_SERIAL_SEQ
  START WITH 4251721
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;
