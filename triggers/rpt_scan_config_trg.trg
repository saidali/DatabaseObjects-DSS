DROP TRIGGER DSS.RPT_SCAN_CONFIG_TRG;

CREATE OR REPLACE TRIGGER DSS.RPT_SCAN_CONFIG_TRG
BEFORE INSERT
ON DSS.RPT_SCAN_CONFIG
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column ROWSEQ
  :new.ROWSEQ := RPT_SCAN_CONFIG_SEQ.nextval;
END RPT_SCAN_CONFIG_TRG;
/