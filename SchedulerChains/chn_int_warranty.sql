BEGIN
  SYS.DBMS_SCHEDULER.DROP_CHAIN
    (chain_name => 'DSS.CHN_INT_WARRANTY');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_CHAIN (
     chain_name          => 'DSS.CHN_INT_WARRANTY'
    ,rule_set_name       => NULL
    ,evaluation_interval => NULL
    ,comments            => NULL);

  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_STEP (
     chain_name          => 'DSS.CHN_INT_WARRANTY'
    ,step_name           => 'INT_PHONECARE'
    ,program_name        => 'DSS.PROC_INF_PHONECARE_MASTER');
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_STEP (
     chain_name          => 'DSS.CHN_INT_WARRANTY'
    ,step_name           => 'INT_VCARE'
    ,program_name        => 'DSS.PROC_INF_PHONECARE_TO_VCARE');

  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_RULE (
     chain_name          => 'DSS.CHN_INT_WARRANTY'
    ,condition           => 'TRUE'
    ,action              => 'START "INT_PHONECARE"'
    ,rule_name           => 'DSS.CHN_WARRANTY_RL1'
    ,comments            => NULL);
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_RULE (
     chain_name          => 'DSS.CHN_INT_WARRANTY'
    ,condition           => '"INT_PHONECARE" COMPLETED'
    ,action              => 'START "INT_VCARE"'
    ,rule_name           => 'DSS.CHN_WARRANTY_RL2'
    ,comments            => NULL);
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_RULE (
     chain_name          => 'DSS.CHN_INT_WARRANTY'
    ,condition           => '"INT_VCARE" COMPLETED'
    ,action              => 'END '
    ,rule_name           => 'DSS.CHN_WARRANTY_RL3'
    ,comments            => NULL);

  SYS.DBMS_SCHEDULER.ENABLE
    (name                => 'DSS.CHN_INT_WARRANTY');
END;
/
