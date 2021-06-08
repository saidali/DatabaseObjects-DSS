DROP PACKAGE DSS.PKG_DSS_SALES_UPLD_HEAD;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_SALES_UPLD_HEAD
AS
   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_HEADERSEQ   IN     DSS_SALES_UPLD_HEAD.HEADERSEQ%TYPE,
      outCursor        OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_HEADERSEQ           IN  DSS_SALES_UPLD_HEAD.HEADERSEQ%TYPE,
      p_OPERATING_UNIT      IN DSS_SALES_UPLD_HEAD.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID     IN DSS_SALES_UPLD_HEAD.ORGANIZATION_ID%TYPE,
      p_LOCATION_CODE       IN DSS_SALES_UPLD_HEAD.LOCATION_CODE%TYPE,
      p_TRANSACTION_NO      IN DSS_SALES_UPLD_HEAD.TRANSACTION_NO%TYPE,
      p_TRANSACTION_DATE    IN DSS_SALES_UPLD_HEAD.TRANSACTION_DATE%TYPE,
      p_TRANSACTION_TYPE    IN DSS_SALES_UPLD_HEAD.TRANSACTION_TYPE%TYPE,
      p_PARTY_CODE          IN DSS_SALES_UPLD_HEAD.PARTY_CODE%TYPE,
      p_PARTY_NAME          IN DSS_SALES_UPLD_HEAD.PARTY_NAME%TYPE,
      p_PARTY_SITE_NUMBER   IN DSS_SALES_UPLD_HEAD.PARTY_SITE_NUMBER%TYPE,
      p_REMARKS             IN DSS_SALES_UPLD_HEAD.REMARKS%TYPE,
      p_REF_NO1             IN DSS_SALES_UPLD_HEAD.REF_NO1%TYPE,
      p_REF_NO2             IN DSS_SALES_UPLD_HEAD.REF_NO2%TYPE,
      p_NET_AMOUNT          IN DSS_SALES_UPLD_HEAD.NET_AMOUNT%TYPE,
      p_STATUS              IN DSS_SALES_UPLD_HEAD.STATUS%TYPE,
      p_INTF_YN             IN DSS_SALES_UPLD_HEAD.INTF_YN%TYPE,
      p_CREATE_DATE         IN DSS_SALES_UPLD_HEAD.CREATE_DATE%TYPE,
      p_CREATE_BY           IN DSS_SALES_UPLD_HEAD.CREATE_BY%TYPE,
      p_MODIFY_DATE         IN DSS_SALES_UPLD_HEAD.MODIFY_DATE%TYPE,
      p_MODIFY_BY           IN DSS_SALES_UPLD_HEAD.MODIFY_BY%TYPE,
      p_ATTRIBUTE1          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE10%TYPE,
      p_ATTRIBUTE11         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE11%TYPE,
      p_ATTRIBUTE12         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE12%TYPE,
      p_ATTRIBUTE13         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE13%TYPE,
      p_ATTRIBUTE14         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE14%TYPE,
      p_ATTRIBUTE15         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE15%TYPE,
      p_RESATTRIBUTE1       IN DSS_SALES_UPLD_HEAD.RESATTRIBUTE1%TYPE,
      p_RESATTRIBUTE2       IN DSS_SALES_UPLD_HEAD.RESATTRIBUTE2%TYPE,
      p_RESATTRIBUTE3       IN DSS_SALES_UPLD_HEAD.RESATTRIBUTE3%TYPE);

   PROCEDURE P_Insert (
      p_HEADERSEQ           IN OUT DSS_SALES_UPLD_HEAD.HEADERSEQ%TYPE,
      p_OPERATING_UNIT      IN DSS_SALES_UPLD_HEAD.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID     IN DSS_SALES_UPLD_HEAD.ORGANIZATION_ID%TYPE,
      p_LOCATION_CODE       IN DSS_SALES_UPLD_HEAD.LOCATION_CODE%TYPE,
      p_TRANSACTION_NO      IN DSS_SALES_UPLD_HEAD.TRANSACTION_NO%TYPE,
      p_TRANSACTION_DATE    IN DSS_SALES_UPLD_HEAD.TRANSACTION_DATE%TYPE,
      p_TRANSACTION_TYPE    IN DSS_SALES_UPLD_HEAD.TRANSACTION_TYPE%TYPE,
      p_PARTY_CODE          IN DSS_SALES_UPLD_HEAD.PARTY_CODE%TYPE,
      p_PARTY_NAME          IN DSS_SALES_UPLD_HEAD.PARTY_NAME%TYPE,
      p_PARTY_SITE_NUMBER   IN DSS_SALES_UPLD_HEAD.PARTY_SITE_NUMBER%TYPE,
      p_REMARKS             IN DSS_SALES_UPLD_HEAD.REMARKS%TYPE,
      p_REF_NO1             IN DSS_SALES_UPLD_HEAD.REF_NO1%TYPE,
      p_REF_NO2             IN DSS_SALES_UPLD_HEAD.REF_NO2%TYPE,
      p_NET_AMOUNT          IN DSS_SALES_UPLD_HEAD.NET_AMOUNT%TYPE,
      p_STATUS              IN DSS_SALES_UPLD_HEAD.STATUS%TYPE,
      p_INTF_YN             IN DSS_SALES_UPLD_HEAD.INTF_YN%TYPE,
      p_CREATE_DATE         IN DSS_SALES_UPLD_HEAD.CREATE_DATE%TYPE,
      p_CREATE_BY           IN DSS_SALES_UPLD_HEAD.CREATE_BY%TYPE,
      p_MODIFY_DATE         IN DSS_SALES_UPLD_HEAD.MODIFY_DATE%TYPE,
      p_MODIFY_BY           IN DSS_SALES_UPLD_HEAD.MODIFY_BY%TYPE,
      p_ATTRIBUTE1          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE10%TYPE,
      p_ATTRIBUTE11         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE11%TYPE,
      p_ATTRIBUTE12         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE12%TYPE,
      p_ATTRIBUTE13         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE13%TYPE,
      p_ATTRIBUTE14         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE14%TYPE,
      p_ATTRIBUTE15         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE15%TYPE,
      p_RESATTRIBUTE1       IN DSS_SALES_UPLD_HEAD.RESATTRIBUTE1%TYPE,
      p_RESATTRIBUTE2       IN DSS_SALES_UPLD_HEAD.RESATTRIBUTE2%TYPE,
      p_RESATTRIBUTE3       IN DSS_SALES_UPLD_HEAD.RESATTRIBUTE3%TYPE);

   PROCEDURE P_Delete (p_HEADERSEQ IN DSS_SALES_UPLD_HEAD.HEADERSEQ%TYPE);
END PKG_DSS_SALES_UPLD_HEAD;
/


DROP PACKAGE BODY DSS.PKG_DSS_SALES_UPLD_HEAD;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_SALES_UPLD_HEAD
AS
   PROCEDURE P_LoadByPrimaryKey (
      p_HEADERSEQ   IN     DSS_SALES_UPLD_HEAD.HEADERSEQ%TYPE,
      outCursor        OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT HEADERSEQ,
                OPERATING_UNIT,
                ORGANIZATION_ID,
                LOCATION_CODE,
                TRANSACTION_NO,
                TRANSACTION_DATE,
                TRANSACTION_TYPE,
                PARTY_CODE,
                PARTY_NAME,
                PARTY_SITE_NUMBER,
                REMARKS,
                REF_NO1,
                REF_NO2,
                NET_AMOUNT,
                STATUS,
                INTF_YN,
                CREATE_DATE,
                CREATE_BY,
                MODIFY_DATE,
                MODIFY_BY,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6,
                ATTRIBUTE7,
                ATTRIBUTE8,
                ATTRIBUTE9,
                ATTRIBUTE10,
                ATTRIBUTE11,
                ATTRIBUTE12,
                ATTRIBUTE13,
                ATTRIBUTE14,
                ATTRIBUTE15,
                RESATTRIBUTE1,
                RESATTRIBUTE2,
                RESATTRIBUTE3
           FROM DSS_SALES_UPLD_HEAD
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
                TRANSACTION_NO,
                TRANSACTION_DATE,
                TRANSACTION_TYPE,
                PARTY_CODE,
                PARTY_NAME,
                PARTY_SITE_NUMBER,
                REMARKS,
                REF_NO1,
                REF_NO2,
                NET_AMOUNT,
                STATUS,
                INTF_YN,
                CREATE_DATE,
                CREATE_BY,
                MODIFY_DATE,
                MODIFY_BY,
                ATTRIBUTE1,
                ATTRIBUTE2,
                ATTRIBUTE3,
                ATTRIBUTE4,
                ATTRIBUTE5,
                ATTRIBUTE6,
                ATTRIBUTE7,
                ATTRIBUTE8,
                ATTRIBUTE9,
                ATTRIBUTE10,
                ATTRIBUTE11,
                ATTRIBUTE12,
                ATTRIBUTE13,
                ATTRIBUTE14,
                ATTRIBUTE15,
                RESATTRIBUTE1,
                RESATTRIBUTE2,
                RESATTRIBUTE3
           FROM DSS_SALES_UPLD_HEAD;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_HEADERSEQ           IN DSS_SALES_UPLD_HEAD.HEADERSEQ%TYPE,
      p_OPERATING_UNIT      IN DSS_SALES_UPLD_HEAD.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID     IN DSS_SALES_UPLD_HEAD.ORGANIZATION_ID%TYPE,
      p_LOCATION_CODE       IN DSS_SALES_UPLD_HEAD.LOCATION_CODE%TYPE,
      p_TRANSACTION_NO      IN DSS_SALES_UPLD_HEAD.TRANSACTION_NO%TYPE,
      p_TRANSACTION_DATE    IN DSS_SALES_UPLD_HEAD.TRANSACTION_DATE%TYPE,
      p_TRANSACTION_TYPE    IN DSS_SALES_UPLD_HEAD.TRANSACTION_TYPE%TYPE,
      p_PARTY_CODE          IN DSS_SALES_UPLD_HEAD.PARTY_CODE%TYPE,
      p_PARTY_NAME          IN DSS_SALES_UPLD_HEAD.PARTY_NAME%TYPE,
      p_PARTY_SITE_NUMBER   IN DSS_SALES_UPLD_HEAD.PARTY_SITE_NUMBER%TYPE,
      p_REMARKS             IN DSS_SALES_UPLD_HEAD.REMARKS%TYPE,
      p_REF_NO1             IN DSS_SALES_UPLD_HEAD.REF_NO1%TYPE,
      p_REF_NO2             IN DSS_SALES_UPLD_HEAD.REF_NO2%TYPE,
      p_NET_AMOUNT          IN DSS_SALES_UPLD_HEAD.NET_AMOUNT%TYPE,
      p_STATUS              IN DSS_SALES_UPLD_HEAD.STATUS%TYPE,
      p_INTF_YN             IN DSS_SALES_UPLD_HEAD.INTF_YN%TYPE,
      p_CREATE_DATE         IN DSS_SALES_UPLD_HEAD.CREATE_DATE%TYPE,
      p_CREATE_BY           IN DSS_SALES_UPLD_HEAD.CREATE_BY%TYPE,
      p_MODIFY_DATE         IN DSS_SALES_UPLD_HEAD.MODIFY_DATE%TYPE,
      p_MODIFY_BY           IN DSS_SALES_UPLD_HEAD.MODIFY_BY%TYPE,
      p_ATTRIBUTE1          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE10%TYPE,
      p_ATTRIBUTE11         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE11%TYPE,
      p_ATTRIBUTE12         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE12%TYPE,
      p_ATTRIBUTE13         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE13%TYPE,
      p_ATTRIBUTE14         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE14%TYPE,
      p_ATTRIBUTE15         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE15%TYPE,
      p_RESATTRIBUTE1       IN DSS_SALES_UPLD_HEAD.RESATTRIBUTE1%TYPE,
      p_RESATTRIBUTE2       IN DSS_SALES_UPLD_HEAD.RESATTRIBUTE2%TYPE,
      p_RESATTRIBUTE3       IN DSS_SALES_UPLD_HEAD.RESATTRIBUTE3%TYPE)
   IS
   BEGIN
      UPDATE DSS_SALES_UPLD_HEAD
         SET HEADERSEQ = p_HEADERSEQ,
             OPERATING_UNIT = p_OPERATING_UNIT,
             ORGANIZATION_ID = p_ORGANIZATION_ID,
             LOCATION_CODE = p_LOCATION_CODE,
             TRANSACTION_NO = p_TRANSACTION_NO,
             TRANSACTION_DATE = p_TRANSACTION_DATE,
             TRANSACTION_TYPE = p_TRANSACTION_TYPE,
             PARTY_CODE = p_PARTY_CODE,
             PARTY_NAME = p_PARTY_NAME,
             PARTY_SITE_NUMBER = p_PARTY_SITE_NUMBER,
             REMARKS = p_REMARKS,
             REF_NO1 = p_REF_NO1,
             REF_NO2 = p_REF_NO2,
             NET_AMOUNT = p_NET_AMOUNT,
             STATUS = p_STATUS,
             INTF_YN = p_INTF_YN,
             CREATE_DATE = p_CREATE_DATE,
             CREATE_BY = p_CREATE_BY,
             MODIFY_DATE = p_MODIFY_DATE,
             MODIFY_BY = p_MODIFY_BY,
             ATTRIBUTE1 = p_ATTRIBUTE1,
             ATTRIBUTE2 = p_ATTRIBUTE2,
             ATTRIBUTE3 = p_ATTRIBUTE3,
             ATTRIBUTE4 = p_ATTRIBUTE4,
             ATTRIBUTE5 = p_ATTRIBUTE5,
             ATTRIBUTE6 = p_ATTRIBUTE6,
             ATTRIBUTE7 = p_ATTRIBUTE7,
             ATTRIBUTE8 = p_ATTRIBUTE8,
             ATTRIBUTE9 = p_ATTRIBUTE9,
             ATTRIBUTE10 = p_ATTRIBUTE10,
             ATTRIBUTE11 = p_ATTRIBUTE11,
             ATTRIBUTE12 = p_ATTRIBUTE12,
             ATTRIBUTE13 = p_ATTRIBUTE13,
             ATTRIBUTE14 = p_ATTRIBUTE14,
             ATTRIBUTE15 = p_ATTRIBUTE15,
             RESATTRIBUTE1 = p_RESATTRIBUTE1,
             RESATTRIBUTE2 = p_RESATTRIBUTE2,
             RESATTRIBUTE3 = p_RESATTRIBUTE3
       WHERE HEADERSEQ = p_HEADERSEQ;
   END P_Update;


   PROCEDURE P_Insert (
      p_HEADERSEQ           IN OUT DSS_SALES_UPLD_HEAD.HEADERSEQ%TYPE,
      p_OPERATING_UNIT      IN DSS_SALES_UPLD_HEAD.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID     IN DSS_SALES_UPLD_HEAD.ORGANIZATION_ID%TYPE,
      p_LOCATION_CODE       IN DSS_SALES_UPLD_HEAD.LOCATION_CODE%TYPE,
      p_TRANSACTION_NO      IN DSS_SALES_UPLD_HEAD.TRANSACTION_NO%TYPE,
      p_TRANSACTION_DATE    IN DSS_SALES_UPLD_HEAD.TRANSACTION_DATE%TYPE,
      p_TRANSACTION_TYPE    IN DSS_SALES_UPLD_HEAD.TRANSACTION_TYPE%TYPE,
      p_PARTY_CODE          IN DSS_SALES_UPLD_HEAD.PARTY_CODE%TYPE,
      p_PARTY_NAME          IN DSS_SALES_UPLD_HEAD.PARTY_NAME%TYPE,
      p_PARTY_SITE_NUMBER   IN DSS_SALES_UPLD_HEAD.PARTY_SITE_NUMBER%TYPE,
      p_REMARKS             IN DSS_SALES_UPLD_HEAD.REMARKS%TYPE,
      p_REF_NO1             IN DSS_SALES_UPLD_HEAD.REF_NO1%TYPE,
      p_REF_NO2             IN DSS_SALES_UPLD_HEAD.REF_NO2%TYPE,
      p_NET_AMOUNT          IN DSS_SALES_UPLD_HEAD.NET_AMOUNT%TYPE,
      p_STATUS              IN DSS_SALES_UPLD_HEAD.STATUS%TYPE,
      p_INTF_YN             IN DSS_SALES_UPLD_HEAD.INTF_YN%TYPE,
      p_CREATE_DATE         IN DSS_SALES_UPLD_HEAD.CREATE_DATE%TYPE,
      p_CREATE_BY           IN DSS_SALES_UPLD_HEAD.CREATE_BY%TYPE,
      p_MODIFY_DATE         IN DSS_SALES_UPLD_HEAD.MODIFY_DATE%TYPE,
      p_MODIFY_BY           IN DSS_SALES_UPLD_HEAD.MODIFY_BY%TYPE,
      p_ATTRIBUTE1          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9          IN DSS_SALES_UPLD_HEAD.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE10%TYPE,
      p_ATTRIBUTE11         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE11%TYPE,
      p_ATTRIBUTE12         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE12%TYPE,
      p_ATTRIBUTE13         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE13%TYPE,
      p_ATTRIBUTE14         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE14%TYPE,
      p_ATTRIBUTE15         IN DSS_SALES_UPLD_HEAD.ATTRIBUTE15%TYPE,
      p_RESATTRIBUTE1       IN DSS_SALES_UPLD_HEAD.RESATTRIBUTE1%TYPE,
      p_RESATTRIBUTE2       IN DSS_SALES_UPLD_HEAD.RESATTRIBUTE2%TYPE,
      p_RESATTRIBUTE3       IN DSS_SALES_UPLD_HEAD.RESATTRIBUTE3%TYPE)
   IS
   BEGIN
   
   
       p_HEADERSEQ:= SEQ_SALES_UPLD_HEAD.NEXTVAL ; 
        
      INSERT INTO DSS_SALES_UPLD_HEAD (HEADERSEQ,
                                       OPERATING_UNIT,
                                       ORGANIZATION_ID,
                                       LOCATION_CODE,
                                       TRANSACTION_NO,
                                       TRANSACTION_DATE,
                                       TRANSACTION_TYPE,
                                       PARTY_CODE,
                                       PARTY_NAME,
                                       PARTY_SITE_NUMBER,
                                       REMARKS,
                                       REF_NO1,
                                       REF_NO2,
                                       NET_AMOUNT,
                                       STATUS,
                                       INTF_YN,
                                       CREATE_DATE,
                                       CREATE_BY,
                                       MODIFY_DATE,
                                       MODIFY_BY,
                                       ATTRIBUTE1,
                                       ATTRIBUTE2,
                                       ATTRIBUTE3,
                                       ATTRIBUTE4,
                                       ATTRIBUTE5,
                                       ATTRIBUTE6,
                                       ATTRIBUTE7,
                                       ATTRIBUTE8,
                                       ATTRIBUTE9,
                                       ATTRIBUTE10,
                                       ATTRIBUTE11,
                                       ATTRIBUTE12,
                                       ATTRIBUTE13,
                                       ATTRIBUTE14,
                                       ATTRIBUTE15,
                                       RESATTRIBUTE1,
                                       RESATTRIBUTE2,
                                       RESATTRIBUTE3)
           VALUES (p_HEADERSEQ,
                   p_OPERATING_UNIT,
                   p_ORGANIZATION_ID,
                   p_LOCATION_CODE,
                   p_TRANSACTION_NO,
                   p_TRANSACTION_DATE,
                   p_TRANSACTION_TYPE,
                   p_PARTY_CODE,
                   p_PARTY_NAME,
                   p_PARTY_SITE_NUMBER,
                   p_REMARKS,
                   p_REF_NO1,
                   p_REF_NO2,
                   p_NET_AMOUNT,
                   p_STATUS,
                   p_INTF_YN,
                   p_CREATE_DATE,
                   p_CREATE_BY,
                   p_MODIFY_DATE,
                   p_MODIFY_BY,
                   p_ATTRIBUTE1,
                   p_ATTRIBUTE2,
                   p_ATTRIBUTE3,
                   p_ATTRIBUTE4,
                   p_ATTRIBUTE5,
                   p_ATTRIBUTE6,
                   p_ATTRIBUTE7,
                   p_ATTRIBUTE8,
                   p_ATTRIBUTE9,
                   p_ATTRIBUTE10,
                   p_ATTRIBUTE11,
                   p_ATTRIBUTE12,
                   p_ATTRIBUTE13,
                   p_ATTRIBUTE14,
                   p_ATTRIBUTE15,
                   p_RESATTRIBUTE1,
                   p_RESATTRIBUTE2,
                   p_RESATTRIBUTE3);
   END P_Insert;

   PROCEDURE P_Delete (p_HEADERSEQ IN DSS_SALES_UPLD_HEAD.HEADERSEQ%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_SALES_UPLD_HEAD
            WHERE HEADERSEQ = p_HEADERSEQ;
   END P_Delete;
END PKG_DSS_SALES_UPLD_HEAD;
/
