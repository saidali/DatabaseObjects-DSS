BEGIN
  SYS.DBMS_SCHEDULER.DROP_JOB
    (job_name  => 'DSS.ARCHIVE_SCAN_ORDER');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB
    (
       job_name        => 'DSS.ARCHIVE_SCAN_ORDER'
      ,schedule_name   => 'DSS.SCHD_EVERY_1_DAY_NIGHT'
      ,job_class       => 'DEFAULT_JOB_CLASS'
      ,job_type        => 'STORED_PROCEDURE'
      ,job_action      => 'DSS.PKG_ARCH_SCAN_ORDERS.DATA_ARCHIVE'
      ,comments        => NULL
    );
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'DSS.ARCHIVE_SCAN_ORDER'
     ,attribute => 'RESTARTABLE'
     ,value     => FALSE);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'DSS.ARCHIVE_SCAN_ORDER'
     ,attribute => 'LOGGING_LEVEL'
     ,value     => SYS.DBMS_SCHEDULER.LOGGING_OFF);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'DSS.ARCHIVE_SCAN_ORDER'
     ,attribute => 'MAX_FAILURES');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'DSS.ARCHIVE_SCAN_ORDER'
     ,attribute => 'MAX_RUNS');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'DSS.ARCHIVE_SCAN_ORDER'
     ,attribute => 'STOP_ON_WINDOW_CLOSE'
     ,value     => FALSE);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'DSS.ARCHIVE_SCAN_ORDER'
     ,attribute => 'JOB_PRIORITY'
     ,value     => 3);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'DSS.ARCHIVE_SCAN_ORDER'
     ,attribute => 'SCHEDULE_LIMIT');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'DSS.ARCHIVE_SCAN_ORDER'
     ,attribute => 'AUTO_DROP'
     ,value     => FALSE);

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'DSS.ARCHIVE_SCAN_ORDER');
END;
/
