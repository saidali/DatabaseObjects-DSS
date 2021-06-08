BEGIN
  DBMS_SCHEDULER.DROP_PROGRAM
    (program_name          => 'DSS.MASTER_PARENT_FIX');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_PROGRAM
    (
      program_name         => 'DSS.MASTER_PARENT_FIX'
     ,program_type         => 'STORED_PROCEDURE'
     ,program_action       => 'DSS.PKG_DSS_SERIAL_FIX2.START_FIX'
     ,number_of_arguments  => 0
     ,enabled              => FALSE
     ,comments             => NULL
    );

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'DSS.MASTER_PARENT_FIX');
END;
/
