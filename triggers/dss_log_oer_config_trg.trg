DROP TRIGGER DSS.DSS_LOG_OER_CONFIG_TRG;

CREATE OR REPLACE TRIGGER DSS.DSS_LOG_OER_CONFIG_TRG
BEFORE INSERT
ON DSS.DSS_LOG_OER_CONFIG
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column LOGID
  :new.LOGID := DSS_LOG_OER_CONFIG_SEQ.nextval;
END DSS_LOG_OER_CONFIG_TRG;
/