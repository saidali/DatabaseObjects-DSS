BEGIN
  DBMS_SCHEDULER.DROP_PROGRAM
    (program_name          => 'DSS.PROC_INF_PHONECARE_MASTER');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_PROGRAM
    (
      program_name         => 'DSS.PROC_INF_PHONECARE_MASTER'
     ,program_type         => 'STORED_PROCEDURE'
     ,program_action       => 'DSS.PKG_MASTER_WARRANTY.START_SYNC'
     ,number_of_arguments  => 0
     ,enabled              => FALSE
     ,comments             => 'PKG_INF_PHONECARE.POPULATE_WARRANTY_MASTER; '
    );

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'DSS.PROC_INF_PHONECARE_MASTER');
END;
/
