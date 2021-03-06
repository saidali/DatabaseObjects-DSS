DROP TRIGGER DSS.INTM_VALIDATION_RULES_TRG;

CREATE OR REPLACE TRIGGER DSS.INTM_VALIDATION_RULES_TRG
   BEFORE INSERT
   ON DSS.INTM_VALIDATION_RULES
   REFERENCING NEW AS New OLD AS Old
   FOR EACH ROW
BEGIN
   -- For Toad:  Highlight column RULEID
   :new.RULEID := SEQ_VALIDATION_RULES.NEXTVAL;
--- :new.RULE_PARAMETERS := CONCAT (:new.RULEID, ',' || :new.RULE_PARAMETERS);
END INTM_VALIDATION_RULES_TRG;
/
