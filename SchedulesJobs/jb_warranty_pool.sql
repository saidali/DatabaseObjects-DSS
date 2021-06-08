BEGIN
  SYS.DBMS_SCHEDULER.DROP_JOB
    (job_name  => 'DSS.JB_WARRANTY_POOL');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB
    (
       job_name        => 'DSS.JB_WARRANTY_POOL'
      ,schedule_name   => 'DSS.SCHD_EVERY_30_MINTS'
      ,job_class       => 'DEFAULT_JOB_CLASS'
      ,job_type        => 'CHAIN'
      ,job_action      => 'DSS.CHN_INT_WARRANTY'
      ,comments        => NULL
    );
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'DSS.JB_WARRANTY_POOL'
     ,attribute => 'RESTARTABLE'
     ,value     => FALSE);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'DSS.JB_WARRANTY_POOL'
     ,attribute => 'LOGGING_LEVEL'
     ,value     => SYS.DBMS_SCHEDULER.LOGGING_OFF);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'DSS.JB_WARRANTY_POOL'
     ,attribute => 'MAX_FAILURES');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'DSS.JB_WARRANTY_POOL'
     ,attribute => 'MAX_RUNS');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'DSS.JB_WARRANTY_POOL'
     ,attribute => 'STOP_ON_WINDOW_CLOSE'
     ,value     => FALSE);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'DSS.JB_WARRANTY_POOL'
     ,attribute => 'JOB_PRIORITY'
     ,value     => 3);
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL
    ( name      => 'DSS.JB_WARRANTY_POOL'
     ,attribute => 'SCHEDULE_LIMIT');
  SYS.DBMS_SCHEDULER.SET_ATTRIBUTE
    ( name      => 'DSS.JB_WARRANTY_POOL'
     ,attribute => 'AUTO_DROP'
     ,value     => FALSE);

  SYS.DBMS_SCHEDULER.ENABLE
    (name                  => 'DSS.JB_WARRANTY_POOL');
END;
/
