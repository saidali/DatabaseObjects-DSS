BEGIN
  DBMS_SCHEDULER.DROP_PROGRAM
    (program_name          => 'DSS.PR_SYNC_WARRANTY');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_PROGRAM
    (
      program_name         => 'DSS.PR_SYNC_WARRANTY'
     ,program_type         => 'PLSQL_BLOCK'
     ,program_action       => 'DSS.PKG_MASTER_WARRANTY.START_SYNC ;'
     ,number_of_arguments  => 0
     ,enabled              => FALSE
     ,comments             => NULL
    );

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'DSS.PR_SYNC_WARRANTY');
END;
/
