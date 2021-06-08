DROP PACKAGE DSS.PKG_DATA_MAINTENANCE;

CREATE OR REPLACE PACKAGE DSS.PKG_DATA_MAINTENANCE
AS
PROCEDURE GET_DUPLICATED_BOMS ; 

END PKG_DATA_MAINTENANCE;
/


DROP PACKAGE BODY DSS.PKG_DATA_MAINTENANCE;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DATA_MAINTENANCE
AS
   PROCEDURE GET_DUPLICATED_BOMS
   AS
   BEGIN
      FOR I IN (  SELECT ORGANIZATION_ID, ASSEMBLY_ITEM_ID, COUNT (*) CNT
                    FROM V_DSS_BOMS
                GROUP BY ORGANIZATION_ID, ASSEMBLY_ITEM_ID
                  HAVING COUNT (*) > 1)
      LOOP
         INSERT INTO DSS_DUPLICATED_BOMS
              SELECT ORGANIZATION_ID,
                     BILL_SEQUENCE_ID,
                     ASSEMBLY_ITEM_ID,
                     SYSDATE
                FROM V_DSS_BOMS
               WHERE     ORGANIZATION_ID = I.ORGANIZATION_ID
                     AND ASSEMBLY_ITEM_ID = I.ASSEMBLY_ITEM_ID
                     AND ROWNUM <= I.CNT - 1
            ORDER BY BILL_SEQUENCE_ID;
      END LOOP;
   END GET_DUPLICATED_BOMS;
END PKG_DATA_MAINTENANCE;
/