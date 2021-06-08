DROP PACKAGE DSS.PKG_DSS_UPLOAD_HEADER;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_UPLOAD_HEADER  as 

PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur); 
PROCEDURE P_LoadByPrimaryKey (    p_HEADERID IN DSS_UPLOAD_HEADER.HEADERID%type,
  outCursor OUT DSS.MYGEN.sqlcur); 
PROCEDURE P_Update (    p_HEADERID IN DSS_UPLOAD_HEADER.HEADERID%type,
    p_HEADER_NAME IN DSS_UPLOAD_HEADER.HEADER_NAME%type,
    p_UPLD_TYPE IN DSS_UPLOAD_HEADER.UPLD_TYPE%type,
    p_CREATE_DATE IN DSS_UPLOAD_HEADER.CREATE_DATE%type,
    p_CREATE_BY IN DSS_UPLOAD_HEADER.CREATE_BY%type,
    p_FILE_NAME IN DSS_UPLOAD_HEADER.FILE_NAME%type,
    p_STATUS IN DSS_UPLOAD_HEADER.STATUS%type,
    p_ATTRIBUTE1 IN DSS_UPLOAD_HEADER.ATTRIBUTE1%type,
    p_ATTRIBUTE2 IN DSS_UPLOAD_HEADER.ATTRIBUTE2%type,
    p_ATTRIBUTE3 IN DSS_UPLOAD_HEADER.ATTRIBUTE3%type,
    p_ATTRIBUTE4 IN DSS_UPLOAD_HEADER.ATTRIBUTE4%type,
    p_ATTRIBUTE5 IN DSS_UPLOAD_HEADER.ATTRIBUTE5%type,
    p_ATTRIBUTE6 IN DSS_UPLOAD_HEADER.ATTRIBUTE6%type,
    p_ATTRIBUTE7 IN DSS_UPLOAD_HEADER.ATTRIBUTE7%type,
    p_ATTRIBUTE8 IN DSS_UPLOAD_HEADER.ATTRIBUTE8%type,
    p_ATTRIBUTE9 IN DSS_UPLOAD_HEADER.ATTRIBUTE9%type,
    p_ATTRIBUTE10 IN DSS_UPLOAD_HEADER.ATTRIBUTE10%type,
    p_ATTRIBUTE11 IN DSS_UPLOAD_HEADER.ATTRIBUTE11%type,
    p_ATTRIBUTE12 IN DSS_UPLOAD_HEADER.ATTRIBUTE12%type,
    p_ATTRIBUTE13 IN DSS_UPLOAD_HEADER.ATTRIBUTE13%type,
    p_ATTRIBUTE14 IN DSS_UPLOAD_HEADER.ATTRIBUTE14%type,
    p_ATTRIBUTE15 IN DSS_UPLOAD_HEADER.ATTRIBUTE15%type,
    p_RESATTRIBUTE1 IN DSS_UPLOAD_HEADER.RESATTRIBUTE1%type,
    p_RESATTRIBUTE2 IN DSS_UPLOAD_HEADER.RESATTRIBUTE2%type,
    p_RESATTRIBUTE3 IN DSS_UPLOAD_HEADER.RESATTRIBUTE3%type); 
PROCEDURE P_Insert (    p_HEADERID IN OUT  DSS_UPLOAD_HEADER.HEADERID%type,
    p_HEADER_NAME IN DSS_UPLOAD_HEADER.HEADER_NAME%type,
    p_UPLD_TYPE IN DSS_UPLOAD_HEADER.UPLD_TYPE%type,
    p_CREATE_DATE IN DSS_UPLOAD_HEADER.CREATE_DATE%type,
    p_CREATE_BY IN DSS_UPLOAD_HEADER.CREATE_BY%type,
    p_FILE_NAME IN DSS_UPLOAD_HEADER.FILE_NAME%type,
    p_STATUS IN DSS_UPLOAD_HEADER.STATUS%type,
    p_ATTRIBUTE1 IN DSS_UPLOAD_HEADER.ATTRIBUTE1%type,
    p_ATTRIBUTE2 IN DSS_UPLOAD_HEADER.ATTRIBUTE2%type,
    p_ATTRIBUTE3 IN DSS_UPLOAD_HEADER.ATTRIBUTE3%type,
    p_ATTRIBUTE4 IN DSS_UPLOAD_HEADER.ATTRIBUTE4%type,
    p_ATTRIBUTE5 IN DSS_UPLOAD_HEADER.ATTRIBUTE5%type,
    p_ATTRIBUTE6 IN DSS_UPLOAD_HEADER.ATTRIBUTE6%type,
    p_ATTRIBUTE7 IN DSS_UPLOAD_HEADER.ATTRIBUTE7%type,
    p_ATTRIBUTE8 IN DSS_UPLOAD_HEADER.ATTRIBUTE8%type,
    p_ATTRIBUTE9 IN DSS_UPLOAD_HEADER.ATTRIBUTE9%type,
    p_ATTRIBUTE10 IN DSS_UPLOAD_HEADER.ATTRIBUTE10%type,
    p_ATTRIBUTE11 IN DSS_UPLOAD_HEADER.ATTRIBUTE11%type,
    p_ATTRIBUTE12 IN DSS_UPLOAD_HEADER.ATTRIBUTE12%type,
    p_ATTRIBUTE13 IN DSS_UPLOAD_HEADER.ATTRIBUTE13%type,
    p_ATTRIBUTE14 IN DSS_UPLOAD_HEADER.ATTRIBUTE14%type,
    p_ATTRIBUTE15 IN DSS_UPLOAD_HEADER.ATTRIBUTE15%type,
    p_RESATTRIBUTE1 IN DSS_UPLOAD_HEADER.RESATTRIBUTE1%type,
    p_RESATTRIBUTE2 IN DSS_UPLOAD_HEADER.RESATTRIBUTE2%type,
    p_RESATTRIBUTE3 IN DSS_UPLOAD_HEADER.RESATTRIBUTE3%type); 
PROCEDURE P_Delete (    p_HEADERID IN DSS_UPLOAD_HEADER.HEADERID%type); 

END PKG_DSS_UPLOAD_HEADER;
/


DROP PACKAGE BODY DSS.PKG_DSS_UPLOAD_HEADER;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_UPLOAD_HEADER  as 

PROCEDURE P_LoadByPrimaryKey (    p_HEADERID IN DSS_UPLOAD_HEADER.HEADERID%type,
  outCursor OUT DSS.MYGEN.sqlcur)
IS
BEGIN
    OPEN outCursor FOR
    SELECT
        HEADERID,
        HEADER_NAME,
        UPLD_TYPE,
        CREATE_DATE,
        CREATE_BY,
        FILE_NAME,
        STATUS,
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
    FROM DSS_UPLOAD_HEADER
    WHERE
        HEADERID = p_HEADERID
;
END P_LoadByPrimaryKey;

PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur)
IS
BEGIN
    OPEN outCursor FOR
    SELECT
        HEADERID,
        HEADER_NAME,
        UPLD_TYPE,
        CREATE_DATE,
        CREATE_BY,
        FILE_NAME,
        STATUS,
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
    FROM DSS_UPLOAD_HEADER;
END P_LoadAll ;


PROCEDURE P_Update (    p_HEADERID IN DSS_UPLOAD_HEADER.HEADERID%type,
    p_HEADER_NAME IN DSS_UPLOAD_HEADER.HEADER_NAME%type,
    p_UPLD_TYPE IN DSS_UPLOAD_HEADER.UPLD_TYPE%type,
    p_CREATE_DATE IN DSS_UPLOAD_HEADER.CREATE_DATE%type,
    p_CREATE_BY IN DSS_UPLOAD_HEADER.CREATE_BY%type,
    p_FILE_NAME IN DSS_UPLOAD_HEADER.FILE_NAME%type,
    p_STATUS IN DSS_UPLOAD_HEADER.STATUS%type,
    p_ATTRIBUTE1 IN DSS_UPLOAD_HEADER.ATTRIBUTE1%type,
    p_ATTRIBUTE2 IN DSS_UPLOAD_HEADER.ATTRIBUTE2%type,
    p_ATTRIBUTE3 IN DSS_UPLOAD_HEADER.ATTRIBUTE3%type,
    p_ATTRIBUTE4 IN DSS_UPLOAD_HEADER.ATTRIBUTE4%type,
    p_ATTRIBUTE5 IN DSS_UPLOAD_HEADER.ATTRIBUTE5%type,
    p_ATTRIBUTE6 IN DSS_UPLOAD_HEADER.ATTRIBUTE6%type,
    p_ATTRIBUTE7 IN DSS_UPLOAD_HEADER.ATTRIBUTE7%type,
    p_ATTRIBUTE8 IN DSS_UPLOAD_HEADER.ATTRIBUTE8%type,
    p_ATTRIBUTE9 IN DSS_UPLOAD_HEADER.ATTRIBUTE9%type,
    p_ATTRIBUTE10 IN DSS_UPLOAD_HEADER.ATTRIBUTE10%type,
    p_ATTRIBUTE11 IN DSS_UPLOAD_HEADER.ATTRIBUTE11%type,
    p_ATTRIBUTE12 IN DSS_UPLOAD_HEADER.ATTRIBUTE12%type,
    p_ATTRIBUTE13 IN DSS_UPLOAD_HEADER.ATTRIBUTE13%type,
    p_ATTRIBUTE14 IN DSS_UPLOAD_HEADER.ATTRIBUTE14%type,
    p_ATTRIBUTE15 IN DSS_UPLOAD_HEADER.ATTRIBUTE15%type,
    p_RESATTRIBUTE1 IN DSS_UPLOAD_HEADER.RESATTRIBUTE1%type,
    p_RESATTRIBUTE2 IN DSS_UPLOAD_HEADER.RESATTRIBUTE2%type,
    p_RESATTRIBUTE3 IN DSS_UPLOAD_HEADER.RESATTRIBUTE3%type)
IS
BEGIN
    UPDATE DSS_UPLOAD_HEADER
    SET
        HEADERID    = p_HEADERID,
        HEADER_NAME    = p_HEADER_NAME,
        UPLD_TYPE    = p_UPLD_TYPE,
        CREATE_DATE    = p_CREATE_DATE,
        CREATE_BY    = p_CREATE_BY,
        FILE_NAME    = p_FILE_NAME,
        STATUS    = p_STATUS,
        ATTRIBUTE1    = p_ATTRIBUTE1,
        ATTRIBUTE2    = p_ATTRIBUTE2,
        ATTRIBUTE3    = p_ATTRIBUTE3,
        ATTRIBUTE4    = p_ATTRIBUTE4,
        ATTRIBUTE5    = p_ATTRIBUTE5,
        ATTRIBUTE6    = p_ATTRIBUTE6,
        ATTRIBUTE7    = p_ATTRIBUTE7,
        ATTRIBUTE8    = p_ATTRIBUTE8,
        ATTRIBUTE9    = p_ATTRIBUTE9,
        ATTRIBUTE10    = p_ATTRIBUTE10,
        ATTRIBUTE11    = p_ATTRIBUTE11,
        ATTRIBUTE12    = p_ATTRIBUTE12,
        ATTRIBUTE13    = p_ATTRIBUTE13,
        ATTRIBUTE14    = p_ATTRIBUTE14,
        ATTRIBUTE15    = p_ATTRIBUTE15,
        RESATTRIBUTE1    = p_RESATTRIBUTE1,
        RESATTRIBUTE2    = p_RESATTRIBUTE2,
        RESATTRIBUTE3    = p_RESATTRIBUTE3
    WHERE
        HEADERID = p_HEADERID
;
    
END P_Update;
 
 
 PROCEDURE P_Insert (    p_HEADERID IN OUT DSS_UPLOAD_HEADER.HEADERID%type,
    p_HEADER_NAME IN DSS_UPLOAD_HEADER.HEADER_NAME%type,
    p_UPLD_TYPE IN DSS_UPLOAD_HEADER.UPLD_TYPE%type,
    p_CREATE_DATE IN DSS_UPLOAD_HEADER.CREATE_DATE%type,
    p_CREATE_BY IN DSS_UPLOAD_HEADER.CREATE_BY%type,
    p_FILE_NAME IN DSS_UPLOAD_HEADER.FILE_NAME%type,
    p_STATUS IN DSS_UPLOAD_HEADER.STATUS%type,
    p_ATTRIBUTE1 IN DSS_UPLOAD_HEADER.ATTRIBUTE1%type,
    p_ATTRIBUTE2 IN DSS_UPLOAD_HEADER.ATTRIBUTE2%type,
    p_ATTRIBUTE3 IN DSS_UPLOAD_HEADER.ATTRIBUTE3%type,
    p_ATTRIBUTE4 IN DSS_UPLOAD_HEADER.ATTRIBUTE4%type,
    p_ATTRIBUTE5 IN DSS_UPLOAD_HEADER.ATTRIBUTE5%type,
    p_ATTRIBUTE6 IN DSS_UPLOAD_HEADER.ATTRIBUTE6%type,
    p_ATTRIBUTE7 IN DSS_UPLOAD_HEADER.ATTRIBUTE7%type,
    p_ATTRIBUTE8 IN DSS_UPLOAD_HEADER.ATTRIBUTE8%type,
    p_ATTRIBUTE9 IN DSS_UPLOAD_HEADER.ATTRIBUTE9%type,
    p_ATTRIBUTE10 IN DSS_UPLOAD_HEADER.ATTRIBUTE10%type,
    p_ATTRIBUTE11 IN DSS_UPLOAD_HEADER.ATTRIBUTE11%type,
    p_ATTRIBUTE12 IN DSS_UPLOAD_HEADER.ATTRIBUTE12%type,
    p_ATTRIBUTE13 IN DSS_UPLOAD_HEADER.ATTRIBUTE13%type,
    p_ATTRIBUTE14 IN DSS_UPLOAD_HEADER.ATTRIBUTE14%type,
    p_ATTRIBUTE15 IN DSS_UPLOAD_HEADER.ATTRIBUTE15%type,
    p_RESATTRIBUTE1 IN DSS_UPLOAD_HEADER.RESATTRIBUTE1%type,
    p_RESATTRIBUTE2 IN DSS_UPLOAD_HEADER.RESATTRIBUTE2%type,
    p_RESATTRIBUTE3 IN DSS_UPLOAD_HEADER.RESATTRIBUTE3%type)
 IS
BEGIN

p_HEADERID := SEQ_UPLD_HEADER.NEXTVAL;

    INSERT
    INTO DSS_UPLOAD_HEADER
    (
        HEADERID,
        HEADER_NAME,
        UPLD_TYPE,
        CREATE_DATE,
        CREATE_BY,
        FILE_NAME,
        STATUS,
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
    )
    VALUES
    (
        p_HEADERID,
        p_HEADER_NAME,
        p_UPLD_TYPE,
        SYSDATE,
        p_CREATE_BY,
        p_FILE_NAME,
        p_STATUS,
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
        p_RESATTRIBUTE3
    );
END P_Insert ;

PROCEDURE P_Delete (    p_HEADERID IN DSS_UPLOAD_HEADER.HEADERID%type)
IS
BEGIN
    DELETE    FROM DSS_UPLOAD_HEADER
    WHERE
        HEADERID = p_HEADERID;
END P_Delete;




END PKG_DSS_UPLOAD_HEADER;
/
