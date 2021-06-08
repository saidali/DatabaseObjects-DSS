DROP TRIGGER DSS.CONF_VALIDATION_KEYS_TRG;

CREATE OR REPLACE TRIGGER DSS.CONF_VALIDATION_KEYS_TRG
BEFORE INSERT
ON DSS.CONF_VALIDATION_KEYS
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column ROWSEQ
  :new.ROWSEQ := CONF_VALIDATION_KEYS_SEQ.nextval;
END CONF_VALIDATION_KEYS_TRG;
/