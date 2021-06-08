BEGIN
  DBMS_SCHEDULER.DROP_PROGRAM
    (program_name          => 'DSS.PROC_INF_PHONECARE_TO_VCARE');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_PROGRAM
    (
      program_name         => 'DSS.PROC_INF_PHONECARE_TO_VCARE'
     ,program_type         => 'STORED_PROCEDURE'
     ,program_action       => 'DSS.PKG_VCARE_WARRANTY.START_SYNC'
     ,number_of_arguments  => 0
     ,enabled              => FALSE
     ,comments             => NULL
    );

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'DSS.PROC_INF_PHONECARE_TO_VCARE');
END;
/
