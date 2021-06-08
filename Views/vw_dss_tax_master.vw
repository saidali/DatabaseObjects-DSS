DROP VIEW DSS.VW_DSS_TAX_MASTER;

CREATE OR REPLACE FORCE VIEW DSS.VW_DSS_TAX_MASTER
(
    TAX_RATE_ID
   ,TAX_REGIME_NAME
   ,TAX_COUNTRY_CODE
   ,TAX_REGIME_CODE
   ,TAX_NAME
   ,TAX_TYPE
   ,TAX_PRECISION
   ,TAX_STATUS
   ,TAX_RATE_NAME
   ,TAX_RATE
   ,TAX_RATE_CODE
   ,TAX_JURISDICTION
   ,TAX_JURISDICTION_CODE
   ,COUNTRY
   ,TAX_CURRENCY_CODE1
)
AS
    (SELECT zbt.tax_rate_id
           ,zrt.tax_regime_name tax_regime_name
           ,zrb.country_code tax_country_code
           ,zrb.tax_regime_code tax_regime_code
           ,ztt.tax_full_name tax_name
           ,ztb.tax_type_code tax_type
           ,ztb.tax_precision tax_precision
           ,zst.tax_status_name tax_status
           ,zbt.tax_rate_name tax_rate_name
           ,zb.percentage_rate tax_rate
           ,zb.tax_rate_code tax_rate_code
           ,zjv.tax_jurisdiction_name tax_jurisdiction
           ,zjv.tax_jurisdiction_code tax_jurisdiction_code
           ,hg.geography_element1 country
           ,ztb.tax_currency_code tax_currency_code1
     FROM apps.zx_jurisdictions_vl@AXMAPPS zjv
         ,apps.zx_taxes_b@AXMAPPS ztb
         ,apps.zx_taxes_tl@AXMAPPS ztt
         ,apps.zx_regimes_b@AXMAPPS zrb
         ,apps.zx_regimes_tl@AXMAPPS zrt
         ,apps.zx_status_b@AXMAPPS zsb
         ,apps.zx_status_tl@AXMAPPS zst
         ,apps.zx_rates_b@AXMAPPS zb
         ,zx_rates_tl@AXMAPPS zbt
         ,--  apps.hz_relationships hzr         ,
          apps.hz_geographies@AXMAPPS hg
     WHERE zjv.tax = ztb.tax
           AND zjv.tax_regime_code = ztb.tax_regime_code
           AND zjv.tax_regime_code = zrb.tax_regime_code
           AND NVL(zrb.effective_to, SYSDATE) >= SYSDATE
           AND ztt.tax_id = ztb.tax_id
           AND ztt.language = 'US'
           AND zrb.tax_regime_id = zrt.tax_regime_id
           AND zrt.language = 'US'
           AND ztb.tax = zsb.tax
           AND ztb.tax_regime_code = zsb.tax_regime_code
           AND NVL(ztb.effective_to, SYSDATE) >= SYSDATE
           AND ztb.content_owner_id = zsb.content_owner_id
           AND NVL(zsb.effective_to, SYSDATE) >= SYSDATE
           AND zsb.tax_status_id = zst.tax_status_id
           AND zst.language = 'US'
           AND zb.tax_regime_code = zsb.tax_regime_code
           AND zb.tax = zsb.tax
           AND zb.tax_status_code = zsb.tax_status_code
           AND zb.content_owner_id = zsb.content_owner_id
           AND zb.active_flag = 'Y'
           AND NVL(zb.effective_to, SYSDATE) >= SYSDATE
           AND zb.tax_regime_code = zrb.tax_regime_code
           AND zb.tax = ztb.tax
           AND zb.tax_regime_code = ztb.tax_regime_code
           AND zb.content_owner_id = ztb.content_owner_id
           AND zb.active_flag = 'Y'
           -- AND zb.tax_jurisdiction_code = zjv.tax_jurisdiction_code
           AND zb.tax_rate_id = zbt.tax_rate_id
           AND zbt.language = 'US'
           AND zsb.tax_regime_code = zrb.tax_regime_code
           AND ztb.tax = zsb.tax
           AND zsb.tax_regime_code = ztb.tax_regime_code
           AND zsb.content_owner_id = ztb.content_owner_id
           AND ztb.source_tax_flag = 'Y'
           -- AND hg.geography_id                = hzr.subject_id
           --  AND hzr.subject_type               = hg.geography_type
           AND hg.geography_id = zjv.zone_geography_id);


GRANT SELECT ON DSS.VW_DSS_TAX_MASTER TO SELDATA;
