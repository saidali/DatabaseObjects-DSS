DROP TRIGGER DSS.DSS_SERIALS_CHILD_TRG;

CREATE OR REPLACE TRIGGER DSS.DSS_SERIALS_CHILD_TRG
BEFORE INSERT
ON DSS.DSS_SERIALS_CHILD
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column ROWSEQ
  :new.ROWSEQ := SEQ_DSS_SERIALS_CHILD.nextval;
END DSS_SERIALS_CHILD_TRG;
/
