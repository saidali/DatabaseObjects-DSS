DROP PACKAGE DSS.PKG_OER_CATEGORY_CONFIG;

CREATE OR REPLACE PACKAGE DSS.PKG_OER_CATEGORY_CONFIG
AS
   PROCEDURE p_Update (P_RULEID               NUMBER,
                       P_OPERATING_UNIT       NUMBER,
                       P_ORGANIZATION_ID      NUMBER,
                       P_CATEGORYCODE         VARCHAR,
                       P_CATEGORYCODE2        VARCHAR,
                       P_PURCHASETYPE         VARCHAR,
                       P_ORDER_SEQ_FLAG       VARCHAR,
                       P_SHOW_IGNORED         VARCHAR,
                       P_AUTOMATED            VARCHAR,
                       P_SALE_PERIOD_RANG     NUMBER,
                       P_NOSALESDAYSFILTER    NUMBER,
                       P_MAX_DAYS             NUMBER,
                       P_AGEING_LIMIT         NUMBER,
                       P_MODIFY_BY            VARCHAR);

   PROCEDURE p_Add (P_ORGANIZATION_ID      VARCHAR,
                    P_CATEGORY_CODE        VARCHAR,
                    P_SUB_CATEGORY_CODE    VARCHAR,
                    P_CREATE_BY            VARCHAR);

   PROCEDURE p_Delete (P_RULEID               NUMBER,
                       P_OPERATING_UNIT       NUMBER,
                       P_ORGANIZATION_ID      NUMBER,
                       P_CATEGORYCODE         VARCHAR,
                       P_CATEGORYCODE2        VARCHAR,
                       P_PURCHASETYPE         VARCHAR,
                       P_ORDER_SEQ_FLAG       VARCHAR,
                       P_SHOW_IGNORED         VARCHAR,
                       P_AUTOMATED            VARCHAR,
                       P_SALE_PERIOD_RANG     NUMBER,
                       P_NOSALESDAYSFILTER    NUMBER,
                       P_MAX_DAYS             NUMBER,
                       P_AGEING_LIMIT         NUMBER,
                       P_MODIFY_BY            VARCHAR);
END PKG_OER_CATEGORY_CONFIG;
/


DROP PACKAGE BODY DSS.PKG_OER_CATEGORY_CONFIG;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_OER_CATEGORY_CONFIG
AS
   PROCEDURE p_Update (P_RULEID               NUMBER,
                       P_OPERATING_UNIT       NUMBER,
                       P_ORGANIZATION_ID      NUMBER,
                       P_CATEGORYCODE         VARCHAR,
                       P_CATEGORYCODE2        VARCHAR,
                       P_PURCHASETYPE         VARCHAR,
                       P_ORDER_SEQ_FLAG       VARCHAR,
                       P_SHOW_IGNORED         VARCHAR,
                       P_AUTOMATED            VARCHAR,
                       P_SALE_PERIOD_RANG     NUMBER,
                       P_NOSALESDAYSFILTER    NUMBER,
                       P_MAX_DAYS             NUMBER,
                       P_AGEING_LIMIT         NUMBER,
                       P_MODIFY_BY            VARCHAR)
   AS
   BEGIN
      --      UPDATE OER_CATEGORY_CONFIG@ERPBRIDGE
      --         SET MODIFY_BY = P_MODIFY_BY,
      --             LAST_MODIFY_DATE = SYSDATE,
      --             ISACTIVE = 'N',
      --             STATUS = 'D'                                           -- DELETED
      --       WHERE RULEID = P_RULEID;

      UPDATE OER_CATEGORY_CONFIG@ERPBRIDGE
         SET ORDER_SEQ_FLAG = P_ORDER_SEQ_FLAG,
             SHOW_IGNORED = P_SHOW_IGNORED,
             AUTOMATED = P_AUTOMATED,
             SALE_PERIOD_RANG = P_SALE_PERIOD_RANG,
             NOSALESDAYSFILTER = P_NOSALESDAYSFILTER,
             MAX_DAYS = P_MAX_DAYS,
             AGEING_LIMIT = P_AGEING_LIMIT,
             MODIFY_BY = P_MODIFY_BY,
             LAST_MODIFY_DATE = SYSDATE
       WHERE RULEID = P_RULEID;

      INSERT INTO OER_CATEGORY_CONFIG_HISTORY@ERPBRIDGE (OPERATING_UNIT,
                                                         ORGANIZATION_ID,
                                                         CATEGORYCODE,
                                                         CATEGORYCODE2,
                                                         PURCHASETYPE,
                                                         ORDER_SEQ_FLAG,
                                                         SHOW_IGNORED,
                                                         AUTOMATED,
                                                         SALE_PERIOD_RANG,
                                                         NOSALESDAYSFILTER,
                                                         LAST_MODIFY_DATE,
                                                         MODIFY_BY,
                                                         MAX_DAYS,
                                                         AGEING_LIMIT,
                                                         ISACTIVE,
                                                         REMARKS,
                                                         ATTRIBUTE1)
           VALUES (P_OPERATING_UNIT,
                   P_ORGANIZATION_ID,
                   P_CATEGORYCODE,
                   P_CATEGORYCODE2,
                   P_PURCHASETYPE,
                   P_ORDER_SEQ_FLAG,                         --ORDER_SEQ_FLAG,
                   P_SHOW_IGNORED,                             --SHOW_IGNORED,
                   P_AUTOMATED,                                   --AUTOMATED,
                   P_SALE_PERIOD_RANG,                     --SALE_PERIOD_RANG,
                   P_NOSALESDAYSFILTER,                   --NOSALESDAYSFILTER,
                   SYSDATE,                                     --CREATE_DATE,
                   P_MODIFY_BY,
                   P_MAX_DAYS,                                    -- MAX_DAYS,
                   P_AGEING_LIMIT,                             --AGEING_LIMIT,
                   'Y',                                             --ISACTIVE
                   'Updated - Ref# ' || P_RULEID,
                   P_RULEID);
   END p_Update;

   PROCEDURE p_Add (P_ORGANIZATION_ID      VARCHAR,
                    P_CATEGORY_CODE        VARCHAR,
                    P_SUB_CATEGORY_CODE    VARCHAR,
                    P_CREATE_BY            VARCHAR)
   AS
      V_EXISTS   NUMBER;
   BEGIN
      FOR I
         IN (SELECT DISTINCT OPERATING_UNIT,
                             C.ORGANIZATION_ID,
                             CATEGORY_CODE,
                             SUB_CATEGORY_CODE,
                             PURCHASETYPE
               FROM V_DSS_ORGANIZATION_CATEGORIES C
                    LEFT JOIN V_DSS_ORGANIZATIONS O
                       ON C.ORGANIZATION_ID = O.ORGANIZATION_ID
              WHERE     C.ORGANIZATION_ID = P_ORGANIZATION_ID
                    AND CATEGORY_CODE = P_CATEGORY_CODE
                    AND SUB_CATEGORY_CODE = P_SUB_CATEGORY_CODE)
      LOOP
         SELECT COUNT (*)
           INTO V_EXISTS
           FROM OER_CATEGORY_CONFIG@ERPBRIDGE
          WHERE     OPERATING_UNIT = I.OPERATING_UNIT
                AND ORGANIZATION_ID = I.ORGANIZATION_ID
                AND CATEGORYCODE = I.CATEGORY_CODE
                AND CATEGORYCODE2 = I.SUB_CATEGORY_CODE
                AND PURCHASETYPE = I.PURCHASETYPE;

         IF (V_EXISTS = 0)
         THEN
            INSERT INTO OER_CATEGORY_CONFIG@ERPBRIDGE (OPERATING_UNIT,
                                                       ORGANIZATION_ID,
                                                       CATEGORYCODE,
                                                       CATEGORYCODE2,
                                                       PURCHASETYPE,
                                                       ORDER_SEQ_FLAG,
                                                       SHOW_IGNORED,
                                                       AUTOMATED,
                                                       SALE_PERIOD_RANG,
                                                       NOSALESDAYSFILTER,
                                                       CREATE_DATE,
                                                       CREATE_BY,
                                                       MAX_DAYS,
                                                       AGEING_LIMIT,
                                                       ISACTIVE)
                 VALUES (I.OPERATING_UNIT,
                         I.ORGANIZATION_ID,
                         I.CATEGORY_CODE,
                         I.SUB_CATEGORY_CODE,
                         I.PURCHASETYPE,
                         NULL,                               --ORDER_SEQ_FLAG,
                         'N',                                  --SHOW_IGNORED,
                         'N',                                     --AUTOMATED,
                         0,                                --SALE_PERIOD_RANG,
                         0,                               --NOSALESDAYSFILTER,
                         SYSDATE,                               --CREATE_DATE,
                         P_CREATE_BY,
                         0,                                       -- MAX_DAYS,
                         0,                                    --AGEING_LIMIT,
                         'N');                                      --ISACTIVE
         END IF;
      END LOOP;
   END p_Add;

   PROCEDURE p_Delete (P_RULEID               NUMBER,
                       P_OPERATING_UNIT       NUMBER,
                       P_ORGANIZATION_ID      NUMBER,
                       P_CATEGORYCODE         VARCHAR,
                       P_CATEGORYCODE2        VARCHAR,
                       P_PURCHASETYPE         VARCHAR,
                       P_ORDER_SEQ_FLAG       VARCHAR,
                       P_SHOW_IGNORED         VARCHAR,
                       P_AUTOMATED            VARCHAR,
                       P_SALE_PERIOD_RANG     NUMBER,
                       P_NOSALESDAYSFILTER    NUMBER,
                       P_MAX_DAYS             NUMBER,
                       P_AGEING_LIMIT         NUMBER,
                       P_MODIFY_BY            VARCHAR)
   AS
   BEGIN
      --      UPDATE OER_CATEGORY_CONFIG@ERPBRIDGE
      --         SET MODIFY_BY = P_MODIFY_BY,
      --             LAST_MODIFY_DATE = SYSDATE,
      --             ISACTIVE = 'N',
      --             STATUS = 'D',                                          -- DELETED
      --             REMARKS = 'Deleted by ' || MODIFY_BY || ' on ' || SYSDATE
      --       WHERE RULEID = P_RULEID;

      DELETE FROM OER_CATEGORY_CONFIG@ERPBRIDGE
            WHERE RULEID = P_RULEID;

      INSERT INTO OER_CATEGORY_CONFIG_HISTORY@ERPBRIDGE (OPERATING_UNIT,
                                                         ORGANIZATION_ID,
                                                         CATEGORYCODE,
                                                         CATEGORYCODE2,
                                                         PURCHASETYPE,
                                                         ORDER_SEQ_FLAG,
                                                         SHOW_IGNORED,
                                                         AUTOMATED,
                                                         SALE_PERIOD_RANG,
                                                         NOSALESDAYSFILTER,
                                                         LAST_MODIFY_DATE,
                                                         MODIFY_BY,
                                                         MAX_DAYS,
                                                         AGEING_LIMIT,
                                                         ISACTIVE,
                                                         REMARKS,
                                                         ATTRIBUTE1)
           VALUES (P_OPERATING_UNIT,
                   P_ORGANIZATION_ID,
                   P_CATEGORYCODE,
                   P_CATEGORYCODE2,
                   P_PURCHASETYPE,
                   P_ORDER_SEQ_FLAG,                         --ORDER_SEQ_FLAG,
                   P_SHOW_IGNORED,                             --SHOW_IGNORED,
                   P_AUTOMATED,                                   --AUTOMATED,
                   P_SALE_PERIOD_RANG,                     --SALE_PERIOD_RANG,
                   P_NOSALESDAYSFILTER,                   --NOSALESDAYSFILTER,
                   SYSDATE,                                     --CREATE_DATE,
                   P_MODIFY_BY,
                   P_MAX_DAYS,                                    -- MAX_DAYS,
                   P_AGEING_LIMIT,                             --AGEING_LIMIT,
                   'Y',                                             --ISACTIVE
                   'Deleted - Ref# ' || P_RULEID,
                   P_RULEID);
   END p_Delete;
END PKG_OER_CATEGORY_CONFIG;
/
