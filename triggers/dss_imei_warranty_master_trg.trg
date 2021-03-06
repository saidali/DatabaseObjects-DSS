DROP TRIGGER DSS.DSS_IMEI_WARRANTY_MASTER_TRG;

CREATE OR REPLACE TRIGGER DSS.DSS_IMEI_WARRANTY_MASTER_TRG
   BEFORE INSERT
   ON DSS.DSS_WARRANTY_MASTER
   REFERENCING NEW AS New OLD AS Old
   FOR EACH ROW
BEGIN
   -- For Toad:  Highlight column LINEID
   :new.LINEID := SEQ_WARRANTY_MASTER.NEXTVAL;
END DSS_IMEI_WARRANTY_MASTER_TRG;
/
