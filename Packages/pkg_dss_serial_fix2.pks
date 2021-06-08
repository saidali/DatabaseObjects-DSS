DROP PACKAGE DSS.PKG_DSS_SERIAL_FIX2;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_SERIAL_FIX2
AS
   PROCEDURE START_FIX  ;

   CURSOR CR_NonIMEI_ParentKey  
       
   IS
      SELECT MS.rowseq, CSN.PARENTKEY PARENTKEY
        FROM DSS_SERIALS_MASTER MS
             LEFT OUTER JOIN DSS_SERIALS_CHILD CSN
                ON MS.SERIALKEY = CSN.SERIALKEY
       WHERE     CSN.PARENTKEY != MS.PARENTKEY
             AND CSN.PARENTKEY IS NOT NULL
             AND NOT REGEXP_LIKE (MS.PARENTKEY, '^[[:digit:]]+$')
             AND REGEXP_LIKE (MS.SERIALKEY, '^[[:digit:]]+$')
             AND REGEXP_LIKE (CSN.PARENTKEY, '^[[:digit:]]+$');

   TYPE RW_NonIMEI_ParentKey IS TABLE OF CR_NonIMEI_ParentKey%ROWTYPE;
END PKG_DSS_SERIAL_FIX2;
/


DROP PACKAGE BODY DSS.PKG_DSS_SERIAL_FIX2;

CREATE OR REPLACE PACKAGE BODY DSS.pkg_dss_serial_fix2 AS

    PROCEDURE start_fix AS
        temp_rw rw_nonimei_parentkey;
    BEGIN
        IF ( cr_nonimei_parentkey%isopen ) THEN
            CLOSE cr_nonimei_parentkey;
        END IF;
        OPEN cr_nonimei_parentkey;
        LOOP
            FETCH cr_nonimei_parentkey BULK COLLECT INTO temp_rw LIMIT 1000;
            FORALL rw IN 1..temp_rw.count
                UPDATE dss_serials_master
                SET
                    parentkey = temp_rw(rw).parentkey
                WHERE
                    rowseq = temp_rw(rw).rowseq;

            EXIT WHEN cr_nonimei_parentkey%notfound;
        END LOOP;

        CLOSE cr_nonimei_parentkey;
    END start_fix;

END pkg_dss_serial_fix2;
/
