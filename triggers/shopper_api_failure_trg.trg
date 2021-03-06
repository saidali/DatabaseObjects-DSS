DROP TRIGGER DSS.SHOPPER_API_FAILURE_TRG;

CREATE OR REPLACE TRIGGER DSS.SHOPPER_API_FAILURE_TRG
BEFORE INSERT
ON DSS.SHOPPER_API_FAILURE
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column ROWSEQ
  :new.ROWSEQ := SHOPPER_API_FAILURE_SEQ.nextval;
END SHOPPER_API_FAILURE_TRG;
/
