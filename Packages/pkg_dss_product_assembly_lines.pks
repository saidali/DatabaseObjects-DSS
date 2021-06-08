DROP PACKAGE DSS.PKG_DSS_PRODUCT_ASSEMBLY_LINES;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_PRODUCT_ASSEMBLY_LINES
AS

   PROCEDURE P_VLoadByHeaderSeq (
      p_HEADERSEQ   IN     DSS_PRODUCT_ASSEMBLY_LINES.HEADERSEQ%TYPE,
      outCursor        OUT DSS.MYGEN.sqlcur) ; 
      
   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_LINESEQ   IN     DSS_PRODUCT_ASSEMBLY_LINES.LINESEQ%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_HEADERSEQ                  IN DSS_PRODUCT_ASSEMBLY_LINES.HEADERSEQ%TYPE,
      p_ORGANIZATION_ID            IN DSS_PRODUCT_ASSEMBLY_LINES.ORGANIZATION_ID%TYPE,
      p_OPERATING_UNIT             IN DSS_PRODUCT_ASSEMBLY_LINES.OPERATING_UNIT%TYPE,
      p_LOCATION_CODE              IN DSS_PRODUCT_ASSEMBLY_LINES.LOCATION_CODE%TYPE,
      p_LINESEQ                    IN DSS_PRODUCT_ASSEMBLY_LINES.LINESEQ%TYPE,
      p_ITEM_NUM                   IN DSS_PRODUCT_ASSEMBLY_LINES.ITEM_NUM%TYPE,
      p_ASSEMBLY_TYPE              IN DSS_PRODUCT_ASSEMBLY_LINES.ASSEMBLY_TYPE%TYPE,
      p_BUNDLE_INVENTORY_ITEM_ID   IN DSS_PRODUCT_ASSEMBLY_LINES.BUNDLE_INVENTORY_ITEM_ID%TYPE,
      p_BUNDLE_PRODUCT_CODE        IN DSS_PRODUCT_ASSEMBLY_LINES.BUNDLE_PRODUCT_CODE%TYPE,
      p_BOM_ID                     IN DSS_PRODUCT_ASSEMBLY_LINES.BOM_ID%TYPE,
      p_QTY                        IN DSS_PRODUCT_ASSEMBLY_LINES.QTY%TYPE,
      p_CREATE_BY                  IN DSS_PRODUCT_ASSEMBLY_LINES.CREATE_BY%TYPE,
      p_CREATE_DATE                IN DSS_PRODUCT_ASSEMBLY_LINES.CREATE_DATE%TYPE,
      p_STATUS                     IN DSS_PRODUCT_ASSEMBLY_LINES.STATUS%TYPE,
      p_LINE_REFE_NO               IN DSS_PRODUCT_ASSEMBLY_LINES.LINE_REFE_NO%TYPE,
      p_ATTRIBUTE1                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10                IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE10%TYPE);

   PROCEDURE P_Insert (
      p_HEADERSEQ                  IN DSS_PRODUCT_ASSEMBLY_LINES.HEADERSEQ%TYPE,
      p_ORGANIZATION_ID            IN DSS_PRODUCT_ASSEMBLY_LINES.ORGANIZATION_ID%TYPE,
      p_OPERATING_UNIT             IN DSS_PRODUCT_ASSEMBLY_LINES.OPERATING_UNIT%TYPE,
      p_LOCATION_CODE              IN DSS_PRODUCT_ASSEMBLY_LINES.LOCATION_CODE%TYPE,
      p_LINESEQ                    IN OUT DSS_PRODUCT_ASSEMBLY_LINES.LINESEQ%TYPE,
      p_ITEM_NUM                   IN DSS_PRODUCT_ASSEMBLY_LINES.ITEM_NUM%TYPE,
      p_ASSEMBLY_TYPE              IN DSS_PRODUCT_ASSEMBLY_LINES.ASSEMBLY_TYPE%TYPE,
      p_BUNDLE_INVENTORY_ITEM_ID   IN DSS_PRODUCT_ASSEMBLY_LINES.BUNDLE_INVENTORY_ITEM_ID%TYPE,
      p_BUNDLE_PRODUCT_CODE        IN DSS_PRODUCT_ASSEMBLY_LINES.BUNDLE_PRODUCT_CODE%TYPE,
      p_BOM_ID                     IN DSS_PRODUCT_ASSEMBLY_LINES.BOM_ID%TYPE,
      p_QTY                        IN DSS_PRODUCT_ASSEMBLY_LINES.QTY%TYPE,
      p_CREATE_BY                  IN DSS_PRODUCT_ASSEMBLY_LINES.CREATE_BY%TYPE,
      p_CREATE_DATE                IN DSS_PRODUCT_ASSEMBLY_LINES.CREATE_DATE%TYPE,
      p_STATUS                     IN DSS_PRODUCT_ASSEMBLY_LINES.STATUS%TYPE,
      p_LINE_REFE_NO               IN DSS_PRODUCT_ASSEMBLY_LINES.LINE_REFE_NO%TYPE,
      p_ATTRIBUTE1                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10                IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE10%TYPE);

   PROCEDURE P_Delete (p_LINESEQ IN DSS_PRODUCT_ASSEMBLY_LINES.LINESEQ%TYPE);
END PKG_DSS_PRODUCT_ASSEMBLY_LINES;
/


DROP PACKAGE BODY DSS.PKG_DSS_PRODUCT_ASSEMBLY_LINES;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_PRODUCT_ASSEMBLY_LINES
AS
   PROCEDURE P_LoadByPrimaryKey (
      p_LINESEQ   IN     DSS_PRODUCT_ASSEMBLY_LINES.LINESEQ%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT HEADERSEQ,
                ORGANIZATION_ID,
                OPERATING_UNIT,
                LOCATION_CODE,
                LINESEQ,
                ITEM_NUM,
                ASSEMBLY_TYPE,
                BUNDLE_INVENTORY_ITEM_ID,
                BUNDLE_PRODUCT_CODE,
                BOM_ID,
                QTY,
                CREATE_BY,
                CREATE_DATE,
                STATUS,
                LINE_REFE_NO,
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
           FROM DSS_PRODUCT_ASSEMBLY_LINES
          WHERE LINESEQ = p_LINESEQ;
   END P_LoadByPrimaryKey;


   PROCEDURE P_VLoadByHeaderSeq (
      p_HEADERSEQ   IN     DSS_PRODUCT_ASSEMBLY_LINES.HEADERSEQ%TYPE,
      outCursor        OUT DSS.MYGEN.sqlcur)
   AS
   BEGIN
      OPEN outCursor FOR
         SELECT HEADERSEQ,
                ORGANIZATION_ID,
                OPERATING_UNIT,
                LOCATION_CODE,
                LINESEQ,
                ITEM_NUM,
                ASSEMBLY_TYPE,
                BOM_ID,
                BUNDLE_INVENTORY_ITEM_ID,
                BUNDLE_PRODUCT_CODE,
                DESCRIPTION,
                ON_HAND_QUANTITY,
                QTY,
                CREATE_BY,
                CREATE_DATE,
                STATUS,
                LINE_REFE_NO,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6,
                ATTRIBUTE7,
                ATTRIBUTE8,
                ATTRIBUTE9,
                ATTRIBUTE10 , 
                PKG_STOCK_ON_HAND.F_COMPONENTS_MAXQTY(BOM_ID , ORGANIZATION_ID , LOCATION_CODE ) MAXQTY
           FROM V_DSS_PRODUCT_ASSEMBLY
          WHERE HEADERSEQ = p_HEADERSEQ ORDER BY LINESEQ ;
   END P_VLoadByHeaderSeq;



   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT HEADERSEQ,
                ORGANIZATION_ID,
                OPERATING_UNIT,
                LOCATION_CODE,
                LINESEQ,
                ITEM_NUM,
                ASSEMBLY_TYPE,
                BUNDLE_INVENTORY_ITEM_ID,
                BUNDLE_PRODUCT_CODE,
                BOM_ID,
                QTY,
                CREATE_BY,
                CREATE_DATE,
                STATUS,
                LINE_REFE_NO,
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
           FROM DSS_PRODUCT_ASSEMBLY_LINES;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_HEADERSEQ                  IN DSS_PRODUCT_ASSEMBLY_LINES.HEADERSEQ%TYPE,
      p_ORGANIZATION_ID            IN DSS_PRODUCT_ASSEMBLY_LINES.ORGANIZATION_ID%TYPE,
      p_OPERATING_UNIT             IN DSS_PRODUCT_ASSEMBLY_LINES.OPERATING_UNIT%TYPE,
      p_LOCATION_CODE              IN DSS_PRODUCT_ASSEMBLY_LINES.LOCATION_CODE%TYPE,
      p_LINESEQ                    IN DSS_PRODUCT_ASSEMBLY_LINES.LINESEQ%TYPE,
      p_ITEM_NUM                   IN DSS_PRODUCT_ASSEMBLY_LINES.ITEM_NUM%TYPE,
      p_ASSEMBLY_TYPE              IN DSS_PRODUCT_ASSEMBLY_LINES.ASSEMBLY_TYPE%TYPE,
      p_BUNDLE_INVENTORY_ITEM_ID   IN DSS_PRODUCT_ASSEMBLY_LINES.BUNDLE_INVENTORY_ITEM_ID%TYPE,
      p_BUNDLE_PRODUCT_CODE        IN DSS_PRODUCT_ASSEMBLY_LINES.BUNDLE_PRODUCT_CODE%TYPE,
      p_BOM_ID                     IN DSS_PRODUCT_ASSEMBLY_LINES.BOM_ID%TYPE,
      p_QTY                        IN DSS_PRODUCT_ASSEMBLY_LINES.QTY%TYPE,
      p_CREATE_BY                  IN DSS_PRODUCT_ASSEMBLY_LINES.CREATE_BY%TYPE,
      p_CREATE_DATE                IN DSS_PRODUCT_ASSEMBLY_LINES.CREATE_DATE%TYPE,
      p_STATUS                     IN DSS_PRODUCT_ASSEMBLY_LINES.STATUS%TYPE,
      p_LINE_REFE_NO               IN DSS_PRODUCT_ASSEMBLY_LINES.LINE_REFE_NO%TYPE,
      p_ATTRIBUTE1                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9                 IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10                IN DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      UPDATE DSS_PRODUCT_ASSEMBLY_LINES
         SET HEADERSEQ = p_HEADERSEQ,
             ORGANIZATION_ID = p_ORGANIZATION_ID,
             OPERATING_UNIT = p_OPERATING_UNIT,
             LOCATION_CODE = p_LOCATION_CODE,
             LINESEQ = p_LINESEQ,
             ITEM_NUM = p_ITEM_NUM,
             ASSEMBLY_TYPE = p_ASSEMBLY_TYPE,
             BUNDLE_INVENTORY_ITEM_ID = p_BUNDLE_INVENTORY_ITEM_ID,
             BUNDLE_PRODUCT_CODE = p_BUNDLE_PRODUCT_CODE,
             BOM_ID = p_BOM_ID,
             QTY = p_QTY,
             CREATE_BY = p_CREATE_BY,
             CREATE_DATE = p_CREATE_DATE,
             STATUS = p_STATUS,
             LINE_REFE_NO = p_LINE_REFE_NO,
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
       WHERE LINESEQ = p_LINESEQ;
   END P_Update;


   PROCEDURE P_Insert (
      p_HEADERSEQ                  IN     DSS_PRODUCT_ASSEMBLY_LINES.HEADERSEQ%TYPE,
      p_ORGANIZATION_ID            IN     DSS_PRODUCT_ASSEMBLY_LINES.ORGANIZATION_ID%TYPE,
      p_OPERATING_UNIT             IN     DSS_PRODUCT_ASSEMBLY_LINES.OPERATING_UNIT%TYPE,
      p_LOCATION_CODE              IN     DSS_PRODUCT_ASSEMBLY_LINES.LOCATION_CODE%TYPE,
      p_LINESEQ                    IN OUT DSS_PRODUCT_ASSEMBLY_LINES.LINESEQ%TYPE,
      p_ITEM_NUM                   IN     DSS_PRODUCT_ASSEMBLY_LINES.ITEM_NUM%TYPE,
      p_ASSEMBLY_TYPE              IN     DSS_PRODUCT_ASSEMBLY_LINES.ASSEMBLY_TYPE%TYPE,
      p_BUNDLE_INVENTORY_ITEM_ID   IN     DSS_PRODUCT_ASSEMBLY_LINES.BUNDLE_INVENTORY_ITEM_ID%TYPE,
      p_BUNDLE_PRODUCT_CODE        IN     DSS_PRODUCT_ASSEMBLY_LINES.BUNDLE_PRODUCT_CODE%TYPE,
      p_BOM_ID                     IN     DSS_PRODUCT_ASSEMBLY_LINES.BOM_ID%TYPE,
      p_QTY                        IN     DSS_PRODUCT_ASSEMBLY_LINES.QTY%TYPE,
      p_CREATE_BY                  IN     DSS_PRODUCT_ASSEMBLY_LINES.CREATE_BY%TYPE,
      p_CREATE_DATE                IN     DSS_PRODUCT_ASSEMBLY_LINES.CREATE_DATE%TYPE,
      p_STATUS                     IN     DSS_PRODUCT_ASSEMBLY_LINES.STATUS%TYPE,
      p_LINE_REFE_NO               IN     DSS_PRODUCT_ASSEMBLY_LINES.LINE_REFE_NO%TYPE,
      p_ATTRIBUTE1                 IN     DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2                 IN     DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3                 IN     DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4                 IN     DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5                 IN     DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6                 IN     DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7                 IN     DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8                 IN     DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9                 IN     DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10                IN     DSS_PRODUCT_ASSEMBLY_LINES.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      p_LINESEQ := SEQ_PRODUCT_ASSEMBLY_LINES.NEXTVAL;

      INSERT INTO DSS_PRODUCT_ASSEMBLY_LINES (HEADERSEQ,
                                              ORGANIZATION_ID,
                                              OPERATING_UNIT,
                                              LOCATION_CODE,
                                              LINESEQ,
                                              ITEM_NUM,
                                              ASSEMBLY_TYPE,
                                              BUNDLE_INVENTORY_ITEM_ID,
                                              BUNDLE_PRODUCT_CODE,
                                              BOM_ID,
                                              QTY,
                                              CREATE_BY,
                                              CREATE_DATE,
                                              STATUS,
                                              LINE_REFE_NO,
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
                   p_ORGANIZATION_ID,
                   p_OPERATING_UNIT,
                   p_LOCATION_CODE,
                   p_LINESEQ,
                   p_ITEM_NUM,
                   p_ASSEMBLY_TYPE,
                   p_BUNDLE_INVENTORY_ITEM_ID,
                   p_BUNDLE_PRODUCT_CODE,
                   p_BOM_ID,
                   p_QTY,
                   p_CREATE_BY,
                   p_CREATE_DATE,
                   p_STATUS,
                   p_LINE_REFE_NO,
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

   PROCEDURE P_Delete (p_LINESEQ IN DSS_PRODUCT_ASSEMBLY_LINES.LINESEQ%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_PRODUCT_ASSEMBLY_LINES
            WHERE LINESEQ = p_LINESEQ;
   END P_Delete;
END PKG_DSS_PRODUCT_ASSEMBLY_LINES;
/
