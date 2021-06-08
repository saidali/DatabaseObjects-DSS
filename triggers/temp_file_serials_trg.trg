DROP TRIGGER DSS.TEMP_FILE_SERIALS_TRG;

CREATE OR REPLACE TRIGGER DSS.TEMP_FILE_SERIALS_TRG
BEFORE INSERT
ON DSS.TEMP_FILE_SERIALS
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column ROWSEQ
  :new.ROWSEQ := TEMP_FILE_SERIALS_SEQ.nextval;
END TEMP_FILE_SERIALS_TRG;
/
