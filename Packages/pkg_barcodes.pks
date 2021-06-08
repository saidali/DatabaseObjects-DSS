DROP PACKAGE DSS.PKG_BARCODES;

CREATE OR REPLACE PACKAGE DSS.PKG_BARCODES
AS
   PROCEDURE ADD_BARCODES (P_INVENTORY_ITEM_ID    number,
                           P_BARCODE              VARCHAR2,
                           P_BARCODE_TYPE         VARCHAR2,
                           P_REMARKS              VARCHAR2,
                           P_CREATED_BY           VARCHAR);

   PROCEDURE DELETE_BARCODES (P_INVENTORY_ITEM_ID    VARCHAR2,
                              P_BARCODE              VARCHAR2);
END PKG_BARCODES;
/


DROP PACKAGE BODY DSS.PKG_BARCODES;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_BARCODES
AS
   PROCEDURE ADD_BARCODES (P_INVENTORY_ITEM_ID    number,
                           P_BARCODE              VARCHAR2,
                           P_BARCODE_TYPE         VARCHAR2,
                           P_REMARKS              VARCHAR2,
                           P_CREATED_BY           VARCHAR)
   AS
       
   BEGIN
       
         INSERT INTO SYN_ITEM_BARCODE_DETAILS (AIBD_INVENTORY_ITEM_ID,
                                               AIBD_BAR_CODE,
                                               AIBD_BAR_CODE_TYPE,
                                               AIBD_REMARKS,
                                               CREATED_DATE ,LAST_UPDATED_DATE
                                               )
              VALUES (P_INVENTORY_ITEM_ID,
                      P_BARCODE,
                      P_BARCODE_TYPE,
                      P_REMARKS,
                      SYSDATE ,SYSDATE);
   END ADD_BARCODES;


   PROCEDURE DELETE_BARCODES (P_INVENTORY_ITEM_ID    VARCHAR2,
                              P_BARCODE              VARCHAR2)
   AS
      TEMP   VARCHAR2 (50);
   BEGIN
      SELECT 1 INTO TEMP FROM DUAL;
         DELETE FROM SYN_ITEM_BARCODE_DETAILS
               WHERE     AIBD_BAR_CODE = P_BARCODE
                     AND AIBD_INVENTORY_ITEM_ID = P_INVENTORY_ITEM_ID;
   END DELETE_BARCODES;
END PKG_BARCODES;
/
