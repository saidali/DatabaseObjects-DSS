DROP TRIGGER DSS.DSS_ORDER_SCAN_LOG_TRG;

CREATE OR REPLACE TRIGGER DSS.DSS_ORDER_SCAN_LOG_TRG
BEFORE INSERT
ON DSS.DSS_ORDER_SCAN_LOG
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column LOGID
  :new.LOGID := DSS_ORDER_SCAN_LOG_SEQ.nextval;
END DSS_ORDER_SCAN_LOG_TRG;
/
