BEGIN
  DBMS_SCHEDULER.DROP_PROGRAM
    (program_name          => 'DSS.PROC_DSS_CLEAR_LOGS');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_PROGRAM
    (
      program_name         => 'DSS.PROC_DSS_CLEAR_LOGS'
     ,program_type         => 'STORED_PROCEDURE'
     ,program_action       => 'DSS.DSS_CLEAR_LOGS'
     ,number_of_arguments  => 1
     ,enabled              => FALSE
     ,comments             => NULL
    );

  SYS.DBMS_SCHEDULER.DEFINE_PROGRAM_ARGUMENT
    (
      program_name         => 'DSS.PROC_DSS_CLEAR_LOGS'
     ,argument_name        => 'P_DAYS'
     ,argument_position    => 1
     ,argument_type        => 'NUMBER'
     ,default_value        => '90'
    );

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'DSS.PROC_DSS_CLEAR_LOGS');
END;
/
