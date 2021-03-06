DROP VIEW DSS.V_ERP_VC_MODELS;

CREATE OR REPLACE FORCE VIEW DSS.V_ERP_VC_MODELS
(
    IIMS_MODEL_SEQ
   ,IIBD_ITEM_BRD_SEQ
   ,IIMS_MODEL_NAME
   ,IIMS_MODEL_CODE
   ,IIMS_MODEL_SHORT_DESC
   ,IIMS_MODEL_LONG_DESC
   ,IIMS_MODEL_ACTIVE
   ,IIMS_CREATION_DATE
   ,ABUD_CREATION_USER_ID
   ,IIMS_LAST_UPDATE_DATE
   ,ABUD_LAST_UPDATE_USER_ID
   ,VMM_MODEL_SEQ
   ,VBM_BASE_BRAND_SEQ
   ,VBM_BRAND_SEQ
   ,VMM_BASE_MODEL_CODE
   ,VMM_MODEL_CODE
   ,VMM_MODEL_DESC
   ,VMM_MODEL_SHORT_DESC
   ,VMM_MODEL_ACTIVE
   ,VMM_REMARKS
   ,AGML_GENERAL_DETAIL_CODE
   ,VMM_MODEL_INFO_FOR_TECHNICIAN
   ,AUDS_CREATION_USER_ID
   ,VMM_CREATION_DATE
   ,AUDS_LAST_UPDATE_USER_ID
   ,VMM_LAST_UPDATE_DATE
)
AS
    SELECT IM.IIMS_MODEL_SEQ
          ,IM.IIBD_ITEM_BRD_SEQ
          ,IM.IIMS_MODEL_NAME
          ,IM.IIMS_MODEL_CODE
          ,IM.IIMS_MODEL_SHORT_DESC
          ,IM.IIMS_MODEL_LONG_DESC
          ,IM.IIMS_MODEL_ACTIVE
          ,IM.IIMS_CREATION_DATE
          ,IM.ABUD_CREATION_USER_ID
          ,IM.IIMS_LAST_UPDATE_DATE
          ,IM.ABUD_LAST_UPDATE_USER_ID
          ,MM.VMM_MODEL_SEQ
          ,MM.VBM_BASE_BRAND_SEQ
          ,MM.VBM_BRAND_SEQ
          ,MM.VMM_BASE_MODEL_CODE
          ,MM.VMM_MODEL_CODE
          ,MM.VMM_MODEL_DESC
          ,MM.VMM_MODEL_SHORT_DESC
          ,MM.VMM_MODEL_ACTIVE
          ,-- MM.IIMS_MODEL_SEQ,
           MM.VMM_REMARKS
          ,MM.AGML_GENERAL_DETAIL_CODE
          ,MM.VMM_MODEL_INFO_FOR_TECHNICIAN
          ,MM.AUDS_CREATION_USER_ID
          ,MM.VMM_CREATION_DATE
          ,MM.AUDS_LAST_UPDATE_USER_ID
          ,MM.VMM_LAST_UPDATE_DATE
    FROM SYN_INT_ITEM_MODELS IM
         LEFT OUTER JOIN SYN_VCM_MODEL_MASTER MM
             ON IM.IIMS_MODEL_SEQ = MM.IIMS_MODEL_SEQ;


GRANT SELECT ON DSS.V_ERP_VC_MODELS TO SELDATA;
