BEGIN
  DBMS_SCHEDULER.DROP_PROGRAM
    (program_name          => 'DSS.PKG_SCE_SO_SERIALS');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_PROGRAM
    (
      program_name         => 'DSS.PKG_SCE_SO_SERIALS'
     ,program_type         => 'STORED_PROCEDURE'
     ,program_action       => 'PKG_SCE_SALESORDERS.START_SYNC '
     ,number_of_arguments  => 0
     ,enabled              => FALSE
     ,comments             => NULL
    );

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'DSS.PKG_SCE_SO_SERIALS');
END;
/
