BEGIN
  DBMS_SCHEDULER.DROP_PROGRAM
    (program_name          => 'DSS.PROC_SALES_UPLD');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_PROGRAM
    (
      program_name         => 'DSS.PROC_SALES_UPLD'
     ,program_type         => 'STORED_PROCEDURE'
     ,program_action       => 'DSS.XXAT_DSS_UPLD_TO_BRDG'
     ,number_of_arguments  => 0
     ,enabled              => FALSE
     ,comments             => 'EXECUTING XXAT_DSS_UPLD_TO_BRDG [ ERP TEAM ]'
    );

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'DSS.PROC_SALES_UPLD');
END;
/
