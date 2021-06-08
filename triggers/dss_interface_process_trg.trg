DROP TRIGGER DSS.DSS_INTERFACE_PROCESS_TRG;

CREATE OR REPLACE TRIGGER DSS.DSS_INTERFACE_PROCESS_TRG
BEFORE INSERT
ON DSS.DSS_INTERFACE_PROCESS
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column INTERFACEID
  :new.INTERFACEID := SEQ_DSS_INTERFACE_PROCESS.nextval;
END DSS_INTERFACE_PROCESS_TRG;
/
