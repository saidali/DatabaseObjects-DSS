BEGIN
  SYS.DBMS_SCHEDULER.DROP_SCHEDULE
    (schedule_name  => 'DSS.SCHD_EVERY_1_DAY_NIGHT');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_SCHEDULE
    (
      schedule_name    => 'DSS.SCHD_EVERY_1_DAY_NIGHT'
     ,start_date       => TO_TIMESTAMP_TZ('2018/01/21 00:00:00.000000 +04:00','yyyy/mm/dd hh24:mi:ss.ff tzh:tzm')
     ,repeat_interval  => 'FREQ=DAILY;INTERVAL=1'
     ,end_date         => NULL
     ,comments         => NULL
    );
END;
/
