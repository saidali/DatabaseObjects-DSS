BEGIN
  DBMS_SCHEDULER.DROP_PROGRAM
    (program_name          => 'DSS.PROC_INF_WARRANTY_MASTER');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_PROGRAM
    (
      program_name         => 'DSS.PROC_INF_WARRANTY_MASTER'
     ,program_type         => 'STORED_PROCEDURE'
     ,program_action       => 'PKG_INF_WARRANTY_MASTER.INF_START'
     ,number_of_arguments  => 0
     ,enabled              => FALSE
     ,comments             => NULL
    );

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'DSS.PROC_INF_WARRANTY_MASTER');
END;
/
