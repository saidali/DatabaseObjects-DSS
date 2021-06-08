BEGIN
  DBMS_SCHEDULER.DROP_PROGRAM
    (program_name          => 'DSS.PROC_INF_SUB_SUB_CAT_INFO');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_PROGRAM
    (
      program_name         => 'DSS.PROC_INF_SUB_SUB_CAT_INFO'
     ,program_type         => 'STORED_PROCEDURE'
     ,program_action       => 'PKG_INF_SUB_SUB_CAT_INFO.INF_START'
     ,number_of_arguments  => 0
     ,enabled              => FALSE
     ,comments             => NULL
    );

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'DSS.PROC_INF_SUB_SUB_CAT_INFO');
END;
/
