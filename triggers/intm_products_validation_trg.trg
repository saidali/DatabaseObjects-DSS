DROP TRIGGER DSS.INTM_PRODUCTS_VALIDATION_TRG;

CREATE OR REPLACE TRIGGER DSS.INTM_PRODUCTS_VALIDATION_TRG
BEFORE INSERT
ON DSS.INTM_PRODUCTS_VALIDATION
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column ROWSEQ
  :new.ROWSEQ := SEQ_PRODUCTS_VALIDATION.nextval;
END INTM_PRODUCTS_VALIDATION_TRG;
/
