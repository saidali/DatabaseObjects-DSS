BEGIN
  DBMS_SCHEDULER.DROP_PROGRAM
    (program_name          => 'DSS.PROC_SERVICE_MODEL_MAPPING');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_PROGRAM
    (
      program_name         => 'DSS.PROC_SERVICE_MODEL_MAPPING'
     ,program_type         => 'STORED_PROCEDURE'
     ,program_action       => 'DSS.PS_SERVICE_MODEL_MAPPING'
     ,number_of_arguments  => 0
     ,enabled              => FALSE
     ,comments             => NULL
    );

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'DSS.PROC_SERVICE_MODEL_MAPPING');
END;
/
