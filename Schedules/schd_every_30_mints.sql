BEGIN
  SYS.DBMS_SCHEDULER.DROP_SCHEDULE
    (schedule_name  => 'DSS.SCHD_EVERY_30_MINTS');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_SCHEDULE
    (
      schedule_name    => 'DSS.SCHD_EVERY_30_MINTS'
     ,start_date       => NULL
     ,repeat_interval  => 'FREQ=MINUTELY;INTERVAL=30'
     ,end_date         => NULL
     ,comments         => NULL
    );
END;
/
