DROP PROCEDURE DSS.DSS_CLEAR_LOGS;

CREATE OR REPLACE PROCEDURE DSS.DSS_CLEAR_LOGS(p_days number)
IS
/******************************************************************************
   NAME:       DSS_CLEAR_LOGS
   PURPOSE:    To clear old logs
******************************************************************************/
BEGIN
   --clear login history
   DELETE FROM SEC_LOGIN_HISTORY
         WHERE TRUNC (LOGIN_DATE) < TRUNC (SYSDATE - p_days);
END DSS_CLEAR_LOGS;
/
