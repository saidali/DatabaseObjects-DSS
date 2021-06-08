DROP PROCEDURE DSS.USP_UPDATE_LABEL_COUNT;

CREATE OR REPLACE PROCEDURE DSS.usp_update_label_count(
p_type_Name varchar2,
p_label_count number,
p_country_code varchar2, 
p_facility_code varchar2
)
 IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       usp_update_label_count
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        1/18/2018   John       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     usp_update_label_count
      Sysdate:         1/18/2018
      Date and Time:   1/18/2018, 7:46:39 PM, and 1/18/2018 7:46:39 PM
      Username:        John (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)
      Modified  : on 21-Feb-2021, added County & Facility code

******************************************************************************/
BEGIN
    
   
update DSS.LABEL_COUNTER 
set Label_Count   = Label_Count + p_label_count
where TYPE_NAME   = p_type_Name
and COUNTRY_CODE  = p_country_code
and FACILITY_CODE = p_facility_code ;   
 
END usp_update_label_count;
/
