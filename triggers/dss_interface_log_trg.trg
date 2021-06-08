DROP TRIGGER DSS.DSS_INTERFACE_LOG_TRG;

CREATE OR REPLACE TRIGGER DSS.DSS_INTERFACE_LOG_TRG
BEFORE INSERT
ON DSS.DSS_INTERFACE_LOG
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column LOGID
  :new.LOGID := SEQ_DSS_INTERFACE_LOG.nextval;
END DSS_INTERFACE_LOG_TRG;
/
