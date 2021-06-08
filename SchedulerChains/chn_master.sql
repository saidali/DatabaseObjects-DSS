BEGIN
  SYS.DBMS_SCHEDULER.DROP_CHAIN
    (chain_name => 'DSS.CHN_MASTER');
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_CHAIN (
     chain_name          => 'DSS.CHN_MASTER'
    ,rule_set_name       => NULL
    ,evaluation_interval => NULL
    ,comments            => 'Data Master Integration with ERP');

  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_STEP (
     chain_name          => 'DSS.CHN_MASTER'
    ,step_name           => 'INF_BRANDS_INFO'
    ,program_name        => 'DSS.PROC_INF_BRANDS_INFO2');
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_STEP (
     chain_name          => 'DSS.CHN_MASTER'
    ,step_name           => 'INF_BRAND_MAPPING'
    ,program_name        => 'DSS.PROC_INF_BRAND_MAPPING');
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_STEP (
     chain_name          => 'DSS.CHN_MASTER'
    ,step_name           => 'INF_CATEGORIES'
    ,program_name        => 'DSS.PROC_INF_CATEGORIES');
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_STEP (
     chain_name          => 'DSS.CHN_MASTER'
    ,step_name           => 'INF_CAT_INFO'
    ,program_name        => 'DSS.PROC_CAT_INFO');
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_STEP (
     chain_name          => 'DSS.CHN_MASTER'
    ,step_name           => 'INF_ITEM_CATEGORY'
    ,program_name        => 'DSS.PROC_INF_ITEM_CATEGORY');
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_STEP (
     chain_name          => 'DSS.CHN_MASTER'
    ,step_name           => 'INF_MODEL_INFO'
    ,program_name        => 'DSS.PROC_INF_MODEL_INFO');
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_STEP (
     chain_name          => 'DSS.CHN_MASTER'
    ,step_name           => 'INF_ORGANIZATION'
    ,program_name        => 'DSS.PROC_INF_ORGANIZATIONS');
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_STEP (
     chain_name          => 'DSS.CHN_MASTER'
    ,step_name           => 'INF_PRODUCTS'
    ,program_name        => 'DSS.PROC_INF_PRODUCTS');
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_STEP (
     chain_name          => 'DSS.CHN_MASTER'
    ,step_name           => 'INF_SERVICE_BRAND'
    ,program_name        => 'DSS.PROC_INF_SERVICE_BRAND');
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_STEP (
     chain_name          => 'DSS.CHN_MASTER'
    ,step_name           => 'INF_SUB_CAT_INFO'
    ,program_name        => 'DSS.PROC_SUB_CAT_INFO');
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_STEP (
     chain_name          => 'DSS.CHN_MASTER'
    ,step_name           => 'INF_SUB_SUB_CAT_INFO'
    ,program_name        => 'DSS.PROC_INF_SUB_SUB_CAT_INFO');
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_STEP (
     chain_name          => 'DSS.CHN_MASTER'
    ,step_name           => 'INF_WARRANTY_LINKING'
    ,program_name        => 'DSS.PROC_INF_WARRANTY_LINKING');
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_STEP (
     chain_name          => 'DSS.CHN_MASTER'
    ,step_name           => 'INF_WARRANTY_MASTER'
    ,program_name        => 'DSS.PROC_INF_WARRANTY_MASTER');
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_STEP (
     chain_name          => 'DSS.CHN_MASTER'
    ,step_name           => 'SERVICE_MODEL_MAPPING'
    ,program_name        => 'DSS.PROC_SERVICE_MODEL_MAPPING');

  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_RULE (
     chain_name          => 'DSS.CHN_MASTER'
    ,condition           => '"INF_WARRANTY_LINKING" COMPLETED'
    ,action              => 'END '
    ,rule_name           => 'DSS.CHN_MASTER_LAST'
    ,comments            => NULL);
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_RULE (
     chain_name          => 'DSS.CHN_MASTER'
    ,condition           => '"INF_ORGANIZATION" COMPLETED'
    ,action              => 'START "INF_SERVICE_BRAND"'
    ,rule_name           => 'DSS.CHN_MASTER_RL10'
    ,comments            => NULL);
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_RULE (
     chain_name          => 'DSS.CHN_MASTER'
    ,condition           => '"INF_SERVICE_BRAND" COMPLETED'
    ,action              => 'START "SERVICE_MODEL_MAPPING"'
    ,rule_name           => 'DSS.CHN_MASTER_RL11'
    ,comments            => NULL);
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_RULE (
     chain_name          => 'DSS.CHN_MASTER'
    ,condition           => '"SERVICE_MODEL_MAPPING" COMPLETED'
    ,action              => 'START "INF_WARRANTY_MASTER"'
    ,rule_name           => 'DSS.CHN_MASTER_RL12'
    ,comments            => NULL);
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_RULE (
     chain_name          => 'DSS.CHN_MASTER'
    ,condition           => '"INF_BRAND_MAPPING" COMPLETED'
    ,action              => 'START "INF_WARRANTY_LINKING"'
    ,rule_name           => 'DSS.CHN_MASTER_RL13'
    ,comments            => NULL);
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_RULE (
     chain_name          => 'DSS.CHN_MASTER'
    ,condition           => '"INF_PRODUCTS" COMPLETED'
    ,action              => 'START "INF_SUB_SUB_CAT_INFO"'
    ,rule_name           => 'DSS.CHN_MASTER_RL2'
    ,comments            => NULL);
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_RULE (
     chain_name          => 'DSS.CHN_MASTER'
    ,condition           => '"INF_SUB_SUB_CAT_INFO" COMPLETED'
    ,action              => 'START "INF_SUB_CAT_INFO"'
    ,rule_name           => 'DSS.CHN_MASTER_RL3'
    ,comments            => NULL);
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_RULE (
     chain_name          => 'DSS.CHN_MASTER'
    ,condition           => '"INF_SUB_CAT_INFO" COMPLETED'
    ,action              => 'START "INF_CAT_INFO"'
    ,rule_name           => 'DSS.CHN_MASTER_RL4'
    ,comments            => NULL);
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_RULE (
     chain_name          => 'DSS.CHN_MASTER'
    ,condition           => '"INF_CAT_INFO" COMPLETED'
    ,action              => 'START "INF_CATEGORIES"'
    ,rule_name           => 'DSS.CHN_MASTER_RL5'
    ,comments            => NULL);
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_RULE (
     chain_name          => 'DSS.CHN_MASTER'
    ,condition           => '"INF_CATEGORIES" COMPLETED'
    ,action              => 'START "INF_ITEM_CATEGORY"'
    ,rule_name           => 'DSS.CHN_MASTER_RL6'
    ,comments            => NULL);
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_RULE (
     chain_name          => 'DSS.CHN_MASTER'
    ,condition           => '"INF_ITEM_CATEGORY" COMPLETED'
    ,action              => 'START "INF_BRANDS_INFO"'
    ,rule_name           => 'DSS.CHN_MASTER_RL7'
    ,comments            => NULL);
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_RULE (
     chain_name          => 'DSS.CHN_MASTER'
    ,condition           => '"INF_BRANDS_INFO" COMPLETED'
    ,action              => 'START "INF_MODEL_INFO"'
    ,rule_name           => 'DSS.CHN_MASTER_RL8'
    ,comments            => NULL);
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_RULE (
     chain_name          => 'DSS.CHN_MASTER'
    ,condition           => '"INF_MODEL_INFO" COMPLETED'
    ,action              => 'START "INF_ORGANIZATION"'
    ,rule_name           => 'DSS.CHN_MASTER_RL9'
    ,comments            => NULL);
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_RULE (
     chain_name          => 'DSS.CHN_MASTER'
    ,condition           => 'TRUE'
    ,action              => 'START "INF_PRODUCTS"'
    ,rule_name           => 'DSS.CHN_MASTER_RULE1'
    ,comments            => NULL);
  SYS.DBMS_SCHEDULER.DEFINE_CHAIN_RULE (
     chain_name          => 'DSS.CHN_MASTER'
    ,condition           => '"INF_WARRANTY_MASTER" COMPLETED'
    ,action              => 'START "INF_BRAND_MAPPING"'
    ,rule_name           => 'DSS.SCHED_RULE$2'
    ,comments            => NULL);

  SYS.DBMS_SCHEDULER.ENABLE
    (name                => 'DSS.CHN_MASTER');
END;
/
