DROP VIEW DSS.WARRANTY_NOT_UPDATE;

CREATE OR REPLACE FORCE VIEW DSS.WARRANTY_NOT_UPDATE
(
    JOBID
   ,LINEID
   ,MERGED
   ,LINESEQ
   ,OPREATING_UNIT
   ,ORGANIZATION_ID
   ,ORDER_TYPE
   ,ORDER_NUMBER
   ,INVENTORY_ITEM_ID
   ,PRODUCT_CODE
   ,CAETGORY_ID
   ,ORDER_QTY
   ,DELIVERED_QTY
   ,PICKED_QTY
   ,SCANNED_QTY
   ,CUSTOM_QTY
   ,WMS_SYNC
   ,SCAN_YN
   ,WARRANTYPRINT_YN
   ,WARRANTY_YN
   ,WARRANTY_SEQ
   ,WARRANTY_CODE
   ,CREATE_BY
   ,MODIFY_BY
   ,CREATE_DATE
   ,MODIFY_DATE
   ,EXPIRY_DATE
   ,EXPIRY_DAYS
   ,EDITABLE_YN
   ,ARCHIVED_YN
   ,ACTIVE_YN
   ,STATUS_YN
   ,HAS_SERIALS
   ,BARCODES
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
)
AS
    SELECT sl."JOBID"
          ,sl."LINEID"
          ,sl."MERGED"
          ,sl."LINESEQ"
          ,sl."OPREATING_UNIT"
          ,sl."ORGANIZATION_ID"
          ,sl."ORDER_TYPE"
          ,sl."ORDER_NUMBER"
          ,sl."INVENTORY_ITEM_ID"
          ,sl."PRODUCT_CODE"
          ,sl."CAETGORY_ID"
          ,sl."ORDER_QTY"
          ,sl."DELIVERED_QTY"
          ,sl."PICKED_QTY"
          ,sl."SCANNED_QTY"
          ,sl."CUSTOM_QTY"
          ,sl."WMS_SYNC"
          ,sl."SCAN_YN"
          ,sl."WARRANTYPRINT_YN"
          ,sl."WARRANTY_YN"
          ,sl."WARRANTY_SEQ"
          ,sl."WARRANTY_CODE"
          ,sl."CREATE_BY"
          ,sl."MODIFY_BY"
          ,sl."CREATE_DATE"
          ,sl."MODIFY_DATE"
          ,sl."EXPIRY_DATE"
          ,sl."EXPIRY_DAYS"
          ,sl."EDITABLE_YN"
          ,sl."ARCHIVED_YN"
          ,sl."ACTIVE_YN"
          ,sl."STATUS_YN"
          ,sl."HAS_SERIALS"
          ,sl."BARCODES"
          ,sl."ATTRIBUTE1"
          ,sl."ATTRIBUTE2"
          ,sl."ATTRIBUTE3"
          ,sl."ATTRIBUTE4"
          ,sl."ATTRIBUTE5"
          ,sl."ATTRIBUTE6"
          ,sl."ATTRIBUTE7"
          ,sl."ATTRIBUTE8"
          ,sl."ATTRIBUTE9"
          ,sl."ATTRIBUTE10"
    FROM dss_order_scan_lines sl, dss_order_scan_header sh
    WHERE sh.order_number = sl.order_number
          AND NVL(SH.SCR_LOCATION_CODE, '0') != '01016'
          AND sl.warranty_yn = 'Y'
          AND sl.warranty_seq IS NULL
          AND sl.organization_id NOT IN (554, 1958, 255, 257, 303)
          --          AND sl.order_number NOT IN
          --                 ('18136951',
          --                  '18136963',
          --                  '18136946',
          --                  '18273649',
          --                  '21403884',
          --                  '18277485',
          --                  '18284186',
          --                  '18288343',
          --                  '18288344',
          --                  '18288345',
          --                  '18288346',
          --                  '18288349',
          --                  '18288359',
          --                  '18288361',
          --                  '18288375',
          --                  '18422673',
          --                  '18546702',
          --                  '21617722',
          --                  '18775662',
          --                  '18956724',
          --                  '18956723',
          --                  '18961682',
          --                  '18956662',
          --                  '18951667',
          --                  '18961767',
          --                  '18277485',
          --                  '18275038',
          --                  '18278959',
          --                  '21617496',
          --                  '18282254',
          --                  '18282256',
          --                  '18278788',
          --                  '18278846',
          --                  '18278892',
          --                  '18278892',
          --                  '18278892',
          --                  '18289095',
          --                  '18289100',
          --                  '18285681',
          --                  '18288405',
          --                  '18288818',
          --                  '18285686',
          --                  '18292756',
          --                  '18294445',
          --                  '18294362',
          --                  '18288818',
          --                  '18289064',
          --                  '18294402',
          --                  '18296175',
          --                  '18289075',
          --                  '18294402',
          --                  '18294402',
          --                  '18294410',
          --                  '18289067',
          --                  '18980668',
          --                  '19049718',
          --                  '19009678',
          --                  '18980667',
          --                  '19038704',
          --                  '19070878',
          --                  '19048732',
          --                  '19067781',
          --                  '19003662',
          --                  '18992662',
          --                  '18980670',
          --                  '18980667',
          --                  '18992662',
          --                  '19330162',
          --                  '21390392',
          --                  '21390397',
          --                  '19306629',
          --                  '19387161',
          --                  '19394937',
          --                  '26420978',
          --                  '26420978',
          --                  '19350675',
          --                  '21618576',
          --                  '21404471',
          --                  '19643961',
          --                  '19643968',
          --                  '19643971',
          --                  '19643967')
          AND product_code NOT IN ('FGSAMG935FDSGLD128MCSD'
                                  ,'MOGVIP6S64GBSGRYWFCTNOIR'
                                  ,'YASNKNCAMCOM6BLK'
                                  ,'OPDUCOMPAK152'
                                  ,'OPDUCOMDATSCC009'
                                  ,'OPDUCOMDATSCC010'
                                  ,'OPDUCOMDATSCC011'
                                  ,'OPDUCOMDATSCC012'
                                  ,'OPDUCOMPAK151'
                                  ,'MOGVGXS7E32GBPSME'
                                  ,'MOGVIP6S128GBSGRYWFCTPHTM'
                                  ,'MOGVIP6S128GBWFCTCRBN'
                                  ,'OPDUCOM-PAK-173'
                                  ,'OPDUCOM-PAK-173'
                                  ,'OPDUCOM-PAK-173'
                                  ,'OPDUCOMDATSCC002'
                                  ,'MOGVIP6S64GBSGRYWFCTJAUN'
                                  ,'MOGVIP6S128GBWFCTCMAL'
                                  ,'MOGVIP6S128GBWFCTCRBN'
                                  ,'MOGVIP6S128GBWFCTCHBTSTLA'
                                  ,'P2MISFITSHNTRCK'
                                  ,'P2JAWBONUPAWB'
                                  ,'P2IHEALTHWRISTBP7'
                                  ,'P2IHEALTHARMBP5'
                                  ,'P2CNSRTRGBDYSCAL'
                                  ,'OPDUCOMDATSCC008'
                                  ,'P2FITBITARISMTSCL'
                                  ,'ALSDKSDQM008G-B35A'
                                  ,'MONKA00014597'
                                  ,'MONKA00026887'
                                  ,'P2FITBITONEWASLPMON'
                                  ,'P2FITBITONEWASLPMON'
                                  ,'P2FITBITZIPWATRACK'
                                  ,'P2IBEATSHSBLK'
                                  ,'P2IBEATSHSWHT'
                                  ,'P2IHEALTHPULSEOXIMTR'
                                  ,'OPDUCOMSCC033'
                                  ,'YASSGH55JU6000BLK'
                                  ,'ALSDKSDSDQM008GB35'
                                  ,'FGOPDUPPSIMDSVOCH20VOCH'
                                  ,'YASAPLMD101')
          AND TRUNC(sl.create_date) >= TO_DATE('20/03/2016', 'DD/MM/YYYY');


GRANT SELECT ON DSS.WARRANTY_NOT_UPDATE TO SELDATA;
