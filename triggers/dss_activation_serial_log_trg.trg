DROP TRIGGER DSS.DSS_ACTIVATION_SERIAL_LOG_TRG;

CREATE OR REPLACE TRIGGER DSS.DSS_ACTIVATION_SERIAL_LOG_TRG
BEFORE INSERT
ON DSS.DSS_ACTIVATION_SERIAL_LOG
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column ROWSEQ
  :new.ROWSEQ := DSS_ACTIVATION_SERIAL_LOG_SEQ.nextval;
END DSS_ACTIVATION_SERIAL_LOG_TRG;
/
