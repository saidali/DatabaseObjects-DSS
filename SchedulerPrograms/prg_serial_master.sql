BEGIN
  DBMS_SCHEDULER.DROP_PROGRAM
    (program_name          => 'DSS.PRG_SERIAL_MASTER');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_PROGRAM
    (
      program_name         => 'DSS.PRG_SERIAL_MASTER'
     ,program_type         => 'PLSQL_BLOCK'
     ,program_action       => 'DSS.PKG_SERIAL_MASTER3.START_SYNC;'
     ,number_of_arguments  => 0
     ,enabled              => FALSE
     ,comments             => NULL
    );

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'DSS.PRG_SERIAL_MASTER');
END;
/
