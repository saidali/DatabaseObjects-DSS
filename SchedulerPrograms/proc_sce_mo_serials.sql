BEGIN
  DBMS_SCHEDULER.DROP_PROGRAM
    (program_name          => 'DSS.PROC_SCE_MO_SERIALS');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_PROGRAM
    (
      program_name         => 'DSS.PROC_SCE_MO_SERIALS'
     ,program_type         => 'STORED_PROCEDURE'
     ,program_action       => 'PKG_SCE_TRANSFER.START_SYNC '
     ,number_of_arguments  => 0
     ,enabled              => FALSE
     ,comments             => NULL
    );

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'DSS.PROC_SCE_MO_SERIALS');
END;
/
