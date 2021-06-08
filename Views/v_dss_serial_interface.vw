DROP VIEW DSS.V_DSS_SERIAL_INTERFACE;

CREATE OR REPLACE FORCE VIEW DSS.V_DSS_SERIAL_INTERFACE
(
    LINEID
   ,IMEI_NUMBER
   ,IMEI_NUMBER2
   ,IMEI_NUMBER3
   ,IMEI_NUMBER4
   ,RFID_NUMBER
   ,INVENTORY_ITEM_ID
   ,PRODUCT_CODE
   ,PRODUCT_BRAND
   ,PRODUCT_MODEL
   ,BRAND_SEQ
   ,MODEL_SEQ
   ,WARRANTY_SEQ
   ,WARRANTY_CODE
   ,WARRANTY_END_DATE
   ,JOB_REF_NO
   ,JOB_REF_LINENO
   ,JOB_REF_SEQNO
   ,ORDER_TYPE
   ,ORDER_NUMBER
   ,ORDER_NUMBER2
   ,ORDER_NUMBER3
   ,ORDER_DATE
   ,OPERATION_UNIT
   ,COUNTRY_CODE
   ,ORGANIZATIONID
   ,CREATE_DATE
   ,MODIFY_DATE
   ,PRINTING_DATE
   ,ACTION_TYPE
   ,STATUS
   ,INF_YN
   ,INF_DATE
   ,ATTRIBUTE1
   ,ATTRIBUTE2
   ,ATTRIBUTE3
   ,ATTRIBUTE4
   ,ATTRIBUTE5
   ,ATTRIBUTE6
   ,ATTRIBUTE7
   ,ATTRIBUTE8
   ,ATTRIBUTE9
   ,ATTRIBUTE10
   ,VBRAND_SEQ
   ,VBRAND_CODE
   ,VMODEL_SEQ
   ,VMODEL_CODE
   ,BASE_BRAND_SEQ
   ,BASE_BRAND_CODE
   ,VBASE_BRAND_SEQ
   ,VBASE_BRAND_CODE
   ,BASE_MODEL_SEQ
   ,BASE_MODEL_CODE
   ,VBASE_MODEL_SEQ
   ,VBASE_MODEL_CODE
   ,WARRANTY_YEARS
   ,WARRANTY_MONTHS
   ,WARRANTY_DAYS
   ,WARRANTY_PERIOD
   ,CREATE_BY
)
AS
    SELECT NULL
               LINEID
          ,S.KEY1
               IMEI_NUMBER
          ,S.KEY2
               IMEI_NUMBER2
          ,S.KEY3
               IMEI_NUMBER3
          ,S.KEY4
               IMEI_NUMBER4
          ,NULL
               RFID_NUMBER
          ,S.INVENTORY_ITEM_ID
               INVENTORY_ITEM_ID
          ,S.PRODUCT_CODE
               PRODUCT_CODE
          ,P.BRAND_CODE
               PRODUCT_BRAND
          ,P.MODEL_CODE
               PRODUCT_MODEL
          ,BM.ITEM_BRD_SEQ
               BRAND_SEQ
          ,NVL(M.MODEL_SEQ, IIM.IIMS_MODEL_SEQ)
               MODEL_SEQ
          ,S.WARRANTY_SEQ
               WARRANTY_SEQ
          ,S.WARRANTY_CODE
               WARRANTY_CODE
          ,S.WARRANTY_ENDATE
               WARRANTY_END_DATE
          ,S.JOBID
               JOB_REF_NO
          ,S.LINEID
               JOB_REF_LINENO
          ,S.SEQINDEX
               JOB_REF_SEQNO
          ,S.ORDER_TYPE
               ORDER_TYPE
          ,S.ORDER_NUMBER
               ORDER_NUMBER
          ,S.ORDER_REF_NO
               ORDER_NUMBER2
          ,S.ORDER_REF_NO2
               ORDER_NUMBER3
          ,S.ORDER_DATE
               ORDER_DATE
          ,S.OPREATING_UNIT
               OPERATION_UNIT
          ,OU.COUNTRY_CODE
               COUNTRY_CODE
          ,S.DEST_ORGANIZATION_ID
               ORGANIZATIONID
          ,S.CREATE_DATE
               CREATE_DATE
          ,S.MODIFY_DATE
               MODIFY_DATE
          ,NULL
               PRINTING_DATE
          ,NULL
               ACTION_TYPE
          ,NULL
               STATUS
          ,S.INF_YN
               INF_YN
          ,S.INF_DATE
               INF_DATE
          ,NULL
               ATTRIBUTE1
          ,NULL
               ATTRIBUTE2
          ,NULL
               ATTRIBUTE3
          ,NULL
               ATTRIBUTE4
          ,NULL
               ATTRIBUTE5
          ,NULL
               ATTRIBUTE6
          ,NULL
               ATTRIBUTE7
          ,NULL
               ATTRIBUTE8
          ,NULL
               ATTRIBUTE9
          ,NULL
               ATTRIBUTE10
          ,SB.BRAND_SEQ
               VBRAND_SEQ
          ,SB.BRAND_CODE
               VBRAND_CODE
          ,M.VMODEL_SEQ
               VMODEL_SEQ
          ,M.VMODEL_CODE
               VMODEL_CODE
          ,BBM.ITEM_BRD_SEQ
               BASE_BRAND_SEQ
          ,BBM.ITEM_BRD_CODE
               BASE_BRAND_CODE
          ,M.VBASE_BRAND_SEQ
               VBASE_BRAND_SEQ
          ,BSB.BRAND_CODE
               VBASE_BRAND_CODE
          ,NULL
               BASE_MODEL_SEQ
          ,NULL
               BASE_MODEL_CODE
          ,NULL
               VBASE_MODEL_SEQ
          ,                                  -- BM.VMODEL_SEQ VBASE_MODEL_SEQ,
           M.VBASE_MODEL_CODE
          ,NVL(NO_YEARS, 0)
               WARRANTY_YEARS
          ,NVL(NO_MONTHS, 0)
               WARRANTY_MONTHS
          ,NVL(NO_DAYS, 0)
               WARRANTY_DAYS
          ,  (NVL(NO_YEARS, 0) * 12)
           + (NVL(NO_MONTHS, 0))
           + (NVL(NO_DAYS, 0) / 30)
               WARRANTY_PERIOD
          ,S.CREATE_BY
    FROM V_DSS_SERIAL_INTF S
         LEFT JOIN DSS_PRODUCTS P
             ON S.OPREATING_UNIT = P.OPERATING_UNIT
                AND S.ORGANIZATION_ID = P.ORGANIZATION_ID
                AND S.INVENTORY_ITEM_ID = P.INVENTORY_ITEM_ID
         LEFT JOIN DSS_OPERATING_UNITS OU
             ON S.OPREATING_UNIT = OU.OPERATING_UNIT
         LEFT OUTER JOIN DSS_BRAND_MAPPING BM
             ON P.BRAND_CODE = BM.ITEM_BRD_CODE
         LEFT OUTER JOIN DSS_SERVICE_BRANDS SB
             ON BM.ITEM_BRD_SEQ = SB.MAPPING_ID
         LEFT OUTER JOIN DSS_BRAND_MAPPING BBM
             ON NVL(P.ATTRIBUTE1, P.BRAND_CODE) = BBM.ITEM_BRD_CODE
         LEFT OUTER JOIN DSS_MODEL_MAPPING M ON P.MODEL_CODE = M.MODEL_CODE
         LEFT OUTER JOIN DSS_SERVICE_BRANDS BSB
             ON M.VBASE_BRAND_SEQ = BSB.BRAND_SEQ
         -- LEFT OUTER JOIN DSS_MODEL_MAPPING BM ON M.VBASE_MODEL_CODE = BM.VMODEL_CODE
         LEFT OUTER JOIN DSS_SERVICE_WARRANTY W
             ON S.WARRANTY_SEQ = W.WARRANTY_SEQ
         LEFT OUTER JOIN SYN_INT_ITEM_MODELS IIM
             ON P.MODEL_CODE = IIM.IIMS_MODEL_CODE;


GRANT SELECT ON DSS.V_DSS_SERIAL_INTERFACE TO SELDATA;
