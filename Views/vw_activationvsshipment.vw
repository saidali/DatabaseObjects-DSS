DROP VIEW DSS.VW_ACTIVATIONVSSHIPMENT;

CREATE OR REPLACE FORCE VIEW DSS.VW_ACTIVATIONVSSHIPMENT
(
    FILE_SEQ
   ,FILE_NAME
   ,COUNTRY
   ,ACTIVATIONDATE
   ,HASNOPARENT
   ,HASPARENT
)
AS
    SELECT "FILE_SEQ"
          ,"FILE_NAME"
          ,"COUNTRY"
          ,"ACTIVATIONDATE"
          ,"HASNOPARENT"
          ,"HASPARENT"
    FROM (SELECT File_seq
                ,ds.FILE_NAME
                ,CASE
                     WHEN ds.ATTRIBUTE1 = '1000135354'
                     THEN
                         'UAE'
                     WHEN ds.ATTRIBUTE1 = '1000135374'
                     THEN
                         'KSA'
                     ELSE
                         'NA'
                 END
                     Country
                ,TO_DATE(SUBSTR(ds.ATTRIBUTE2, 0, 8), 'YYYYMMDD')
                     activationDate
                ,CASE WHEN parentkey IS NULL THEN 'No' ELSE 'Yes' END
                     HasPreant
                ,COUNT(*)
                     cnt
          FROM dss_activation_serial sn
               LEFT OUTER JOIN dss_files ds ON sn.file_seq = ds.rowseq
          WHERE ds.ROWSEQ = 2954
          GROUP BY File_seq
                  ,CASE WHEN parentkey IS NULL THEN 'No' ELSE 'Yes' END
                  ,ds.FILE_NAME
                  ,ds.ATTRIBUTE1
                  ,TO_DATE(SUBSTR(ds.ATTRIBUTE2, 0, 8), 'YYYYMMDD'))
         PIVOT (SUM(cnt)
               FOR HasPreant
               IN ('No' AS HasNoParent, 'Yes' AS HasParent));


GRANT SELECT ON DSS.VW_ACTIVATIONVSSHIPMENT TO SELDATA;
