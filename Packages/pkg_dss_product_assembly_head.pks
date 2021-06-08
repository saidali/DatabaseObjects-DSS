DROP PACKAGE DSS.PKG_DSS_PRODUCT_ASSEMBLY_HEAD;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_PRODUCT_ASSEMBLY_HEAD
AS

   PROCEDURE P_POST (
      p_HEADERSEQ   IN     DSS_PRODUCT_ASSEMBLY_HEADER.HEADERSEQ%TYPE,
      outCursor        OUT DSS.MYGEN.sqlcur) ; 
      
   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_HEADERSEQ   IN     DSS_PRODUCT_ASSEMBLY_HEADER.HEADERSEQ%TYPE,
      outCursor        OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_HEADERSEQ         IN DSS_PRODUCT_ASSEMBLY_HEADER.HEADERSEQ%TYPE,
      p_OPERATING_UNIT    IN DSS_PRODUCT_ASSEMBLY_HEADER.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID   IN DSS_PRODUCT_ASSEMBLY_HEADER.ORGANIZATION_ID%TYPE,
      p_LOCATION_CODE     IN DSS_PRODUCT_ASSEMBLY_HEADER.LOCATION_CODE%TYPE,
      p_ASSEMBLY_TYPE     IN DSS_PRODUCT_ASSEMBLY_HEADER.ASSEMBLY_TYPE%TYPE,
      p_CREATE_BY         IN DSS_PRODUCT_ASSEMBLY_HEADER.CREATE_BY%TYPE,
      p_CREATE_DATE       IN DSS_PRODUCT_ASSEMBLY_HEADER.CREATE_DATE%TYPE,
      p_STATUS            IN DSS_PRODUCT_ASSEMBLY_HEADER.STATUS%TYPE,
      p_POSTED            IN DSS_PRODUCT_ASSEMBLY_HEADER.POSTED%TYPE,
      p_POST_DATE         IN DSS_PRODUCT_ASSEMBLY_HEADER.POST_DATE%TYPE,
      p_MODIFY_DATE       IN DSS_PRODUCT_ASSEMBLY_HEADER.MODIFY_DATE%TYPE,
      p_MODIFY_BY         IN DSS_PRODUCT_ASSEMBLY_HEADER.MODIFY_BY%TYPE,
      p_REMARKS           IN DSS_PRODUCT_ASSEMBLY_HEADER.REMARKS%TYPE,
      p_REF_NUMBER        IN DSS_PRODUCT_ASSEMBLY_HEADER.REF_NUMBER%TYPE,
      p_ATTRIBUTE1        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10       IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE10%TYPE);

   PROCEDURE P_Insert (
      p_HEADERSEQ         IN OUT DSS_PRODUCT_ASSEMBLY_HEADER.HEADERSEQ%TYPE,
      p_OPERATING_UNIT    IN DSS_PRODUCT_ASSEMBLY_HEADER.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID   IN DSS_PRODUCT_ASSEMBLY_HEADER.ORGANIZATION_ID%TYPE,
      p_LOCATION_CODE     IN DSS_PRODUCT_ASSEMBLY_HEADER.LOCATION_CODE%TYPE,
      p_ASSEMBLY_TYPE     IN DSS_PRODUCT_ASSEMBLY_HEADER.ASSEMBLY_TYPE%TYPE,
      p_CREATE_BY         IN DSS_PRODUCT_ASSEMBLY_HEADER.CREATE_BY%TYPE,
      p_CREATE_DATE       IN DSS_PRODUCT_ASSEMBLY_HEADER.CREATE_DATE%TYPE,
      p_STATUS            IN DSS_PRODUCT_ASSEMBLY_HEADER.STATUS%TYPE,
      p_POSTED            IN DSS_PRODUCT_ASSEMBLY_HEADER.POSTED%TYPE,
      p_POST_DATE         IN DSS_PRODUCT_ASSEMBLY_HEADER.POST_DATE%TYPE,
      p_MODIFY_DATE       IN DSS_PRODUCT_ASSEMBLY_HEADER.MODIFY_DATE%TYPE,
      p_MODIFY_BY         IN DSS_PRODUCT_ASSEMBLY_HEADER.MODIFY_BY%TYPE,
      p_REMARKS           IN DSS_PRODUCT_ASSEMBLY_HEADER.REMARKS%TYPE,
      p_REF_NUMBER        IN DSS_PRODUCT_ASSEMBLY_HEADER.REF_NUMBER%TYPE,
      p_ATTRIBUTE1        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10       IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE10%TYPE);

   PROCEDURE P_Delete (
      p_HEADERSEQ IN DSS_PRODUCT_ASSEMBLY_HEADER.HEADERSEQ%TYPE);
END PKG_DSS_PRODUCT_ASSEMBLY_HEAD;
/


DROP PACKAGE BODY DSS.PKG_DSS_PRODUCT_ASSEMBLY_HEAD;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_PRODUCT_ASSEMBLY_HEAD
AS
   PROCEDURE P_LoadByPrimaryKey (
      p_HEADERSEQ   IN     DSS_PRODUCT_ASSEMBLY_HEADER.HEADERSEQ%TYPE,
      outCursor        OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT HEADERSEQ,
                OPERATING_UNIT,
                ORGANIZATION_ID,
                LOCATION_CODE,
                ASSEMBLY_TYPE,
                CREATE_BY,
                CREATE_DATE,
                STATUS,
                POSTED,
                POST_DATE,
                MODIFY_DATE,
                MODIFY_BY,
                REMARKS,
                REF_NUMBER,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6,
                ATTRIBUTE7,
                ATTRIBUTE8,
                ATTRIBUTE9,
                ATTRIBUTE10
           FROM DSS_PRODUCT_ASSEMBLY_HEADER
          WHERE HEADERSEQ = p_HEADERSEQ;
   END P_LoadByPrimaryKey;

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT HEADERSEQ,
                OPERATING_UNIT,
                ORGANIZATION_ID,
                LOCATION_CODE,
                ASSEMBLY_TYPE,
                CREATE_BY,
                CREATE_DATE,
                STATUS,
                POSTED,
                POST_DATE,
                MODIFY_DATE,
                MODIFY_BY,
                REMARKS,
                REF_NUMBER,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6,
                ATTRIBUTE7,
                ATTRIBUTE8,
                ATTRIBUTE9,
                ATTRIBUTE10
           FROM DSS_PRODUCT_ASSEMBLY_HEADER;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_HEADERSEQ         IN DSS_PRODUCT_ASSEMBLY_HEADER.HEADERSEQ%TYPE,
      p_OPERATING_UNIT    IN DSS_PRODUCT_ASSEMBLY_HEADER.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID   IN DSS_PRODUCT_ASSEMBLY_HEADER.ORGANIZATION_ID%TYPE,
      p_LOCATION_CODE     IN DSS_PRODUCT_ASSEMBLY_HEADER.LOCATION_CODE%TYPE,
      p_ASSEMBLY_TYPE     IN DSS_PRODUCT_ASSEMBLY_HEADER.ASSEMBLY_TYPE%TYPE,
      p_CREATE_BY         IN DSS_PRODUCT_ASSEMBLY_HEADER.CREATE_BY%TYPE,
      p_CREATE_DATE       IN DSS_PRODUCT_ASSEMBLY_HEADER.CREATE_DATE%TYPE,
      p_STATUS            IN DSS_PRODUCT_ASSEMBLY_HEADER.STATUS%TYPE,
      p_POSTED            IN DSS_PRODUCT_ASSEMBLY_HEADER.POSTED%TYPE,
      p_POST_DATE         IN DSS_PRODUCT_ASSEMBLY_HEADER.POST_DATE%TYPE,
      p_MODIFY_DATE       IN DSS_PRODUCT_ASSEMBLY_HEADER.MODIFY_DATE%TYPE,
      p_MODIFY_BY         IN DSS_PRODUCT_ASSEMBLY_HEADER.MODIFY_BY%TYPE,
      p_REMARKS           IN DSS_PRODUCT_ASSEMBLY_HEADER.REMARKS%TYPE,
      p_REF_NUMBER        IN DSS_PRODUCT_ASSEMBLY_HEADER.REF_NUMBER%TYPE,
      p_ATTRIBUTE1        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9        IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10       IN DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      UPDATE DSS_PRODUCT_ASSEMBLY_HEADER
         SET HEADERSEQ = p_HEADERSEQ,
             OPERATING_UNIT = p_OPERATING_UNIT,
             ORGANIZATION_ID = p_ORGANIZATION_ID,
             LOCATION_CODE = p_LOCATION_CODE,
             ASSEMBLY_TYPE = p_ASSEMBLY_TYPE,
             CREATE_BY = p_CREATE_BY,
             CREATE_DATE = p_CREATE_DATE,
             STATUS = p_STATUS,
             POSTED = p_POSTED,
             POST_DATE = p_POST_DATE,
             MODIFY_DATE = SYSDATE,
             MODIFY_BY = p_MODIFY_BY,
             REMARKS = p_REMARKS,
             REF_NUMBER = p_REF_NUMBER,
             ATTRIBUTE1 = p_ATTRIBUTE1,
             ATTRIBUTE2 = p_ATTRIBUTE2,
             ATTRIBUTE3 = p_ATTRIBUTE3,
             ATTRIBUTE4 = p_ATTRIBUTE4,
             ATTRIBUTE5 = p_ATTRIBUTE5,
             ATTRIBUTE6 = p_ATTRIBUTE6,
             ATTRIBUTE7 = p_ATTRIBUTE7,
             ATTRIBUTE8 = p_ATTRIBUTE8,
             ATTRIBUTE9 = p_ATTRIBUTE9,
             ATTRIBUTE10 = p_ATTRIBUTE10
       WHERE HEADERSEQ = p_HEADERSEQ;
   END P_Update;


   PROCEDURE P_Insert (
      p_HEADERSEQ         IN OUT DSS_PRODUCT_ASSEMBLY_HEADER.HEADERSEQ%TYPE,
      p_OPERATING_UNIT    IN     DSS_PRODUCT_ASSEMBLY_HEADER.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID   IN     DSS_PRODUCT_ASSEMBLY_HEADER.ORGANIZATION_ID%TYPE,
      p_LOCATION_CODE     IN     DSS_PRODUCT_ASSEMBLY_HEADER.LOCATION_CODE%TYPE,
      p_ASSEMBLY_TYPE     IN     DSS_PRODUCT_ASSEMBLY_HEADER.ASSEMBLY_TYPE%TYPE,
      p_CREATE_BY         IN     DSS_PRODUCT_ASSEMBLY_HEADER.CREATE_BY%TYPE,
      p_CREATE_DATE       IN     DSS_PRODUCT_ASSEMBLY_HEADER.CREATE_DATE%TYPE,
      p_STATUS            IN     DSS_PRODUCT_ASSEMBLY_HEADER.STATUS%TYPE,
      p_POSTED            IN     DSS_PRODUCT_ASSEMBLY_HEADER.POSTED%TYPE,
      p_POST_DATE         IN     DSS_PRODUCT_ASSEMBLY_HEADER.POST_DATE%TYPE,
      p_MODIFY_DATE       IN     DSS_PRODUCT_ASSEMBLY_HEADER.MODIFY_DATE%TYPE,
      p_MODIFY_BY         IN     DSS_PRODUCT_ASSEMBLY_HEADER.MODIFY_BY%TYPE,
      p_REMARKS           IN     DSS_PRODUCT_ASSEMBLY_HEADER.REMARKS%TYPE,
      p_REF_NUMBER        IN     DSS_PRODUCT_ASSEMBLY_HEADER.REF_NUMBER%TYPE,
      p_ATTRIBUTE1        IN     DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2        IN     DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3        IN     DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4        IN     DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5        IN     DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6        IN     DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7        IN     DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8        IN     DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9        IN     DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10       IN     DSS_PRODUCT_ASSEMBLY_HEADER.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      p_HEADERSEQ := SEQ_PRODUCT_ASSEMBLY_HEAD.NEXTVAL;

      INSERT INTO DSS_PRODUCT_ASSEMBLY_HEADER (HEADERSEQ,
                                               OPERATING_UNIT,
                                               ORGANIZATION_ID,
                                               LOCATION_CODE,
                                               ASSEMBLY_TYPE,
                                               CREATE_BY,
                                               CREATE_DATE,
                                               STATUS,
                                               POSTED,
                                               POST_DATE,
                                               MODIFY_DATE,
                                               MODIFY_BY,
                                               REMARKS,
                                               REF_NUMBER,
                                               ATTRIBUTE1,
                                               ATTRIBUTE2,
                                               ATTRIBUTE3,
                                               ATTRIBUTE4,
                                               ATTRIBUTE5,
                                               ATTRIBUTE6,
                                               ATTRIBUTE7,
                                               ATTRIBUTE8,
                                               ATTRIBUTE9,
                                               ATTRIBUTE10)
           VALUES (p_HEADERSEQ,
                   p_OPERATING_UNIT,
                   p_ORGANIZATION_ID,
                   p_LOCATION_CODE,
                   p_ASSEMBLY_TYPE,
                   p_CREATE_BY,
                   SYSDATE,
                   p_STATUS,
                   p_POSTED,
                   p_POST_DATE,
                   SYSDATE,
                   p_MODIFY_BY,
                   p_REMARKS,
                   p_REF_NUMBER,
                   p_ATTRIBUTE1,
                   p_ATTRIBUTE2,
                   p_ATTRIBUTE3,
                   p_ATTRIBUTE4,
                   p_ATTRIBUTE5,
                   p_ATTRIBUTE6,
                   p_ATTRIBUTE7,
                   p_ATTRIBUTE8,
                   p_ATTRIBUTE9,
                   p_ATTRIBUTE10);
   END P_Insert;

   PROCEDURE P_Delete (
      p_HEADERSEQ IN DSS_PRODUCT_ASSEMBLY_HEADER.HEADERSEQ%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_PRODUCT_ASSEMBLY_HEADER
            WHERE HEADERSEQ = p_HEADERSEQ;
   END P_Delete;

   PROCEDURE P_POST (
      p_HEADERSEQ   IN     DSS_PRODUCT_ASSEMBLY_HEADER.HEADERSEQ%TYPE,
      outCursor        OUT DSS.MYGEN.sqlcur)
   AS
      V_VBI_TRN_PRN_REF   NUMBER;
      V_SEQ_NO            NUMBER;
      V_REF_NUMBERS       VARCHAR2 (500);
      V_CREATE_DATE DATE;
   BEGIN
      V_REF_NUMBERS := ' ';

      FOR HD IN (SELECT *
                   FROM DSS_PRODUCT_ASSEMBLY_LINES
                  WHERE HEADERSEQ = p_HEADERSEQ)
      LOOP
        V_VBI_TRN_PRN_REF := SYN_SEQ_VBI_TRN_PRN_REF.NEXTVAL;
        
         
         SELECT NVL (MAX (VTNH_SEQ_NO), 0) + 1
           INTO V_SEQ_NO
           FROM SYN_VBI_TRN_PRN_HEAD;  
           
           SELECT CREATE_DATE INTO V_CREATE_DATE FROM DSS_PRODUCT_ASSEMBLY_header WHERE headerseq=p_HEADERSEQ;
            
           UPDATE DSS_PRODUCT_ASSEMBLY_lines SET ATTRIBUTE1='EXT' || V_VBI_TRN_PRN_REF WHERE HEADERSEQ=p_HEADERSEQ;     

         V_REF_NUMBERS := V_REF_NUMBERS || ',' || V_SEQ_NO;

         INSERT INTO SYN_VBI_TRN_PRN_HEAD (VTNH_SEQ_NO,
                                           VTNH_DB_INST_CODE,
                                           VTNH_ORGANIZATION_ID,
                                           VTNH_LOC_CODE,
                                           VTNH_REF_NO,
                                           VTNH_BUNDLE_PROD_CODE,
                                           VTNH_QTY,
                                           VTNH_DOC_DATE,
                                           VTNH_TRF_YN,
                                           VTNH_INTF_MESSAGE,
                                           VTNH_INTF_INSERT_DT,
                                           VTNH_TRANSACTION_TYPE)

       
              VALUES (
                        V_SEQ_NO,
                        HD.OPERATING_UNIT,
                        HD.ORGANIZATION_ID,
                        HD.LOCATION_CODE,
                        'EXT' || V_VBI_TRN_PRN_REF,
                        HD.BUNDLE_PRODUCT_CODE,
                        HD.QTY,
                        V_CREATE_DATE,
                        'N',
                           'DSS Tools - '
                        || HD.CREATE_BY
                        || '- Header No: '
                        || p_HEADERSEQ,
                        SYSDATE,
                        HD.ASSEMBLY_TYPE);

         FOR COMP
            IN (SELECT ORGANIZATION_ID,
                       BILL_SEQUENCE_ID,
                       ASSEMBLY_ITEM_ID,
                       ASSEMBLY_PRODUCT_CODE,
                       COMPONENT_SEQUENCE_ID,
                       ITEM_NUM,
                       COMPONENT_ITEM_ID,
                       COMPONENT_PRODUCT_CODE,
                       COMPONENT_DESCRIPTION,
                       COMPONENT_QUANTITY
                  FROM V_DSS_BOM_COMPONENTS
                 WHERE     BILL_SEQUENCE_ID = HD.BOM_ID
                       AND ORGANIZATION_ID = HD.ORGANIZATION_ID)
  LOOP    
            INSERT INTO SYN_VBI_TRN_PRN_DETL (VTND_SEQ_NO,
                                              VTND_DB_INST_CODE,
                                              VTND_LOC_CODE,
                                              VTND_REF_SRL_NO,
                                              VTND_COMPNT_PROD_CODE,
                                              VTND_QTY)

         
                 VALUES (V_SEQ_NO,
                         HD.ORGANIZATION_ID,
                         HD.LOCATION_CODE,
                         COMP.ITEM_NUM,
                         COMP.COMPONENT_PRODUCT_CODE,
                         HD.QTY * COMP.COMPONENT_QUANTITY);

            UPDATE DSS_PRODUCT_ASSEMBLY_LINES
               SET LINE_REFE_NO = V_SEQ_NO
             WHERE LINESEQ = HD.LINESEQ;
         END LOOP;
      END LOOP;

      UPDATE DSS_PRODUCT_ASSEMBLY_HEADER
         SET STATUS = 'C', POSTED = 'Y', POST_DATE = SYSDATE , REMARKS = V_REF_NUMBERS
       WHERE HEADERSEQ = P_HEADERSEQ;
       
     OPEN outCursor FOR
         SELECT HEADERSEQ,
                OPERATING_UNIT,
                ORGANIZATION_ID,
                LOCATION_CODE,
                ASSEMBLY_TYPE,
                CREATE_BY,
                CREATE_DATE,
                STATUS,
                POSTED,
                POST_DATE,
                MODIFY_DATE,
                MODIFY_BY,
                REMARKS,
                REF_NUMBER,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6,
                ATTRIBUTE7,
                ATTRIBUTE8,
                ATTRIBUTE9,
                ATTRIBUTE10
           FROM DSS_PRODUCT_ASSEMBLY_HEADER
          WHERE HEADERSEQ = p_HEADERSEQ;
                 
   END P_POST;
END PKG_DSS_PRODUCT_ASSEMBLY_HEAD;
/
