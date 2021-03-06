DROP PROCEDURE DSS.PS_SERVICE_MODEL_MAPPING;

CREATE OR REPLACE PROCEDURE DSS.PS_SERVICE_MODEL_MAPPING AS 
BEGIN  

DELETE FROM  DSS_MODEL_MAPPING ;  

INSERT INTO DSS_MODEL_MAPPING
   SELECT IM.IIMS_MODEL_SEQ MODEL_SEQ,
          IM.IIBD_ITEM_BRD_SEQ ITEM_BRD_SEQ,
          IM.IIMS_MODEL_NAME MODEL_NAME,
          IM.IIMS_MODEL_CODE MODEL_CODE,
          IM.IIMS_MODEL_SHORT_DESC MODEL_SHORT_DESC,
          IM.IIMS_MODEL_ACTIVE MODEL_ACTIVE,
          IM.IIMS_CREATION_DATE CREATION_DATE,
          IM.IIMS_LAST_UPDATE_DATE LAST_UPDATE_DATE,
          MM.VMM_MODEL_SEQ VMODEL_SEQ,
          MM.VBM_BASE_BRAND_SEQ VBASE_BRAND_SEQ,
          MM.VBM_BRAND_SEQ VBRAND_SEQ,
          MM.VMM_BASE_MODEL_CODE VBASE_MODEL_CODE,
          MM.VMM_MODEL_CODE VMODEL_CODE,
          MM.VMM_MODEL_ACTIVE VMODEL_ACTIVE ,  'SYN_VCM_MODEL_MASTER'
     FROM SYN_INT_ITEM_MODELS IM
          LEFT OUTER JOIN SYN_VCM_MODEL_MASTER MM
             ON IM.IIMS_MODEL_SEQ = MM.IIMS_MODEL_SEQ
     LEFT OUTER  JOIN  DSS_MODEL_MAPPING MP ON  IM.IIMS_MODEL_SEQ = MP.MODEL_SEQ AND  MM.VMM_MODEL_SEQ = MP.VMODEL_SEQ
    WHERE MM.VMM_MODEL_SEQ IS NOT NULL AND   MP.MODEL_SEQ IS NULL AND MM.VMM_MODEL_ACTIVE ='Y' AND IM.IIMS_MODEL_ACTIVE = 'Y' ;



INSERT INTO DSS_MODEL_MAPPING
   SELECT IM.IIMS_MODEL_SEQ MODEL_SEQ,
          IM.IIBD_ITEM_BRD_SEQ ITEM_BRD_SEQ,
          IM.IIMS_MODEL_NAME MODEL_NAME,
          IM.IIMS_MODEL_CODE MODEL_CODE,
          IM.IIMS_MODEL_SHORT_DESC MODEL_SHORT_DESC,
          IM.IIMS_MODEL_ACTIVE MODEL_ACTIVE,
          IM.IIMS_CREATION_DATE CREATION_DATE,
          IM.IIMS_LAST_UPDATE_DATE LAST_UPDATE_DATE,
          MM.VMM_MODEL_SEQ VMODEL_SEQ,
          MM.VBM_BASE_BRAND_SEQ VBASE_BRAND_SEQ,
          MM.VBM_BRAND_SEQ VBRAND_SEQ,
          MM.VMM_BASE_MODEL_CODE VBASE_MODEL_CODE,
          MM.VMM_MODEL_CODE VMODEL_CODE,
          MM.VMM_MODEL_ACTIVE VMODEL_ACTIVE , 'VCM_SERVICE_RETAIL_MODEL_LNK'
     FROM SYN_INT_ITEM_MODELS IM
          LEFT OUTER JOIN VCM.VCM_SERVICE_RETAIL_MODEL_LNK@VCARE ML
             ON IM.IIMS_MODEL_SEQ = ML.IIMS_MODEL_SEQ
          LEFT OUTER JOIN SYN_VCM_MODEL_MASTER MM
             ON ML.VMM_MODEL_SEQ = MM.VMM_MODEL_SEQ
     LEFT OUTER  JOIN  DSS_MODEL_MAPPING MP ON  IM.IIMS_MODEL_SEQ = MP.MODEL_SEQ AND  MM.VMM_MODEL_SEQ = MP.VMODEL_SEQ
    WHERE ML.VMM_MODEL_SEQ IS NOT NULL  AND  MP.MODEL_SEQ IS NULL AND VCMSRML_ACTIVE  = 'Y' ;
    
END  ;
/
