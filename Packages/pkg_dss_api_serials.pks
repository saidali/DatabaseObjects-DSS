DROP PACKAGE DSS.PKG_DSS_API_SERIALS;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_API_SERIALS  as 

PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur); 
PROCEDURE P_LoadByPrimaryKey (	p_SCANID IN DSS_API_SERIALS.SCANID%type,
  outCursor OUT DSS.MYGEN.sqlcur); 
PROCEDURE P_Update (	p_SCANID IN DSS_API_SERIALS.SCANID%type,
	p_BATCHID IN DSS_API_SERIALS.BATCHID%type,
	p_LINEID IN DSS_API_SERIALS.LINEID%type,
	p_SEQINDEX IN DSS_API_SERIALS.SEQINDEX%type,
	p_COLUMNINDEX IN DSS_API_SERIALS.COLUMNINDEX%type,
	p_CONFIGID IN DSS_API_SERIALS.CONFIGID%type,
	p_CONFIGTYPE IN DSS_API_SERIALS.CONFIGTYPE%type,
	p_SCANTYPE IN DSS_API_SERIALS.SCANTYPE%type,
	p_SCAN_SOURCE IN DSS_API_SERIALS.SCAN_SOURCE%type,
	p_SRC_TYPE IN DSS_API_SERIALS.SRC_TYPE%type,
	p_SRC_OPERATING_UNIT IN DSS_API_SERIALS.SRC_OPERATING_UNIT%type,
	p_SRC_ORGANIZATION_ID IN DSS_API_SERIALS.SRC_ORGANIZATION_ID%type,
	p_SRC_LOCATION_CODE IN DSS_API_SERIALS.SRC_LOCATION_CODE%type,
	p_DEST_TYPE IN DSS_API_SERIALS.DEST_TYPE%type,
	p_DEST_OPERATING_UNIT IN DSS_API_SERIALS.DEST_OPERATING_UNIT%type,
	p_DEST_ORGANIZATION_ID IN DSS_API_SERIALS.DEST_ORGANIZATION_ID%type,
	p_DEST_LOCATION_CODE IN DSS_API_SERIALS.DEST_LOCATION_CODE%type,
	p_ORDER_TYPE IN DSS_API_SERIALS.ORDER_TYPE%type,
	p_ORDER_NUMBER IN DSS_API_SERIALS.ORDER_NUMBER%type,
	p_ORDER_REF_NO1 IN DSS_API_SERIALS.ORDER_REF_NO1%type,
	p_ORDER_REF_NO2 IN DSS_API_SERIALS.ORDER_REF_NO2%type,
	p_ORDER_DATE IN DSS_API_SERIALS.ORDER_DATE%type,
	p_SERIALKEY IN DSS_API_SERIALS.SERIALKEY%type,
	p_SERIALKEY_REF1 IN DSS_API_SERIALS.SERIALKEY_REF1%type,
	p_SERIALKEY_REF2 IN DSS_API_SERIALS.SERIALKEY_REF2%type,
	p_INVENTORY_ITEM_ID IN DSS_API_SERIALS.INVENTORY_ITEM_ID%type,
	p_PRODUCT_CODE IN DSS_API_SERIALS.PRODUCT_CODE%type,
	p_PRODUCT_DESC IN DSS_API_SERIALS.PRODUCT_DESC%type,
	p_BRAND IN DSS_API_SERIALS.BRAND%type,
	p_CATEGORY_ID IN DSS_API_SERIALS.CATEGORY_ID%type,
	p_CATEGORY_CODE IN DSS_API_SERIALS.CATEGORY_CODE%type,
	p_CATEGORY_DESC IN DSS_API_SERIALS.CATEGORY_DESC%type,
	p_SUB_CATEGORY_CODE IN DSS_API_SERIALS.SUB_CATEGORY_CODE%type,
	p_SUB_CATEGORY_DESC IN DSS_API_SERIALS.SUB_CATEGORY_DESC%type,
	p_SUB_SUB_CATEGORY_CODE IN DSS_API_SERIALS.SUB_SUB_CATEGORY_CODE%type,
	p_SUB_SUB_CATEGORY_DESC IN DSS_API_SERIALS.SUB_SUB_CATEGORY_DESC%type,
	p_WARRANTY_YN IN DSS_API_SERIALS.WARRANTY_YN%type,
	p_WARRANTY_SEQ IN DSS_API_SERIALS.WARRANTY_SEQ%type,
	p_WARRANTY_CODE IN DSS_API_SERIALS.WARRANTY_CODE%type,
	p_WARRANTY_STARTDATE IN DSS_API_SERIALS.WARRANTY_STARTDATE%type,
	p_WARRANTY_ENDDATE IN DSS_API_SERIALS.WARRANTY_ENDDATE%type,
	p_ACTIVE_YN IN DSS_API_SERIALS.ACTIVE_YN%type,
	p_STATUS IN DSS_API_SERIALS.STATUS%type,
	p_INF_YN IN DSS_API_SERIALS.INF_YN%type,
	p_INF_DATE IN DSS_API_SERIALS.INF_DATE%type,
	p_REMARKS IN DSS_API_SERIALS.REMARKS%type,
	p_CREATE_BY IN DSS_API_SERIALS.CREATE_BY%type,
	p_CREATE_DATE IN DSS_API_SERIALS.CREATE_DATE%type,
	p_MODIFY_BY IN DSS_API_SERIALS.MODIFY_BY%type,
	p_MODIFY_DATE IN DSS_API_SERIALS.MODIFY_DATE%type,
	p_ALLOW_EDIT IN DSS_API_SERIALS.ALLOW_EDIT%type,
	p_ALLOW_INF IN DSS_API_SERIALS.ALLOW_INF%type,
	p_ATTRIBUTE1 IN DSS_API_SERIALS.ATTRIBUTE1%type,
	p_ATTRIBUTE2 IN DSS_API_SERIALS.ATTRIBUTE2%type,
	p_ATTRIBUTE3 IN DSS_API_SERIALS.ATTRIBUTE3%type,
	p_ATTRIBUTE4 IN DSS_API_SERIALS.ATTRIBUTE4%type,
	p_ATTRIBUTE5 IN DSS_API_SERIALS.ATTRIBUTE5%type,
	p_ATTRIBUTE6 IN DSS_API_SERIALS.ATTRIBUTE6%type,
	p_ATTRIBUTE7 IN DSS_API_SERIALS.ATTRIBUTE7%type,
	p_ATTRIBUTE8 IN DSS_API_SERIALS.ATTRIBUTE8%type,
	p_ATTRIBUTE9 IN DSS_API_SERIALS.ATTRIBUTE9%type,
	p_ATTRIBUTE10 IN DSS_API_SERIALS.ATTRIBUTE10%type); 
PROCEDURE P_Insert (	p_SCANID IN DSS_API_SERIALS.SCANID%type,
	p_BATCHID IN DSS_API_SERIALS.BATCHID%type,
	p_LINEID IN DSS_API_SERIALS.LINEID%type,
	p_SEQINDEX IN DSS_API_SERIALS.SEQINDEX%type,
	p_COLUMNINDEX IN DSS_API_SERIALS.COLUMNINDEX%type,
	p_CONFIGID IN DSS_API_SERIALS.CONFIGID%type,
	p_CONFIGTYPE IN DSS_API_SERIALS.CONFIGTYPE%type,
	p_SCANTYPE IN DSS_API_SERIALS.SCANTYPE%type,
	p_SCAN_SOURCE IN DSS_API_SERIALS.SCAN_SOURCE%type,
	p_SRC_TYPE IN DSS_API_SERIALS.SRC_TYPE%type,
	p_SRC_OPERATING_UNIT IN DSS_API_SERIALS.SRC_OPERATING_UNIT%type,
	p_SRC_ORGANIZATION_ID IN DSS_API_SERIALS.SRC_ORGANIZATION_ID%type,
	p_SRC_LOCATION_CODE IN DSS_API_SERIALS.SRC_LOCATION_CODE%type,
	p_DEST_TYPE IN DSS_API_SERIALS.DEST_TYPE%type,
	p_DEST_OPERATING_UNIT IN DSS_API_SERIALS.DEST_OPERATING_UNIT%type,
	p_DEST_ORGANIZATION_ID IN DSS_API_SERIALS.DEST_ORGANIZATION_ID%type,
	p_DEST_LOCATION_CODE IN DSS_API_SERIALS.DEST_LOCATION_CODE%type,
	p_ORDER_TYPE IN DSS_API_SERIALS.ORDER_TYPE%type,
	p_ORDER_NUMBER IN DSS_API_SERIALS.ORDER_NUMBER%type,
	p_ORDER_REF_NO1 IN DSS_API_SERIALS.ORDER_REF_NO1%type,
	p_ORDER_REF_NO2 IN DSS_API_SERIALS.ORDER_REF_NO2%type,
	p_ORDER_DATE IN DSS_API_SERIALS.ORDER_DATE%type,
	p_SERIALKEY IN DSS_API_SERIALS.SERIALKEY%type,
	p_SERIALKEY_REF1 IN DSS_API_SERIALS.SERIALKEY_REF1%type,
	p_SERIALKEY_REF2 IN DSS_API_SERIALS.SERIALKEY_REF2%type,
	p_INVENTORY_ITEM_ID IN DSS_API_SERIALS.INVENTORY_ITEM_ID%type,
	p_PRODUCT_CODE IN DSS_API_SERIALS.PRODUCT_CODE%type,
	p_PRODUCT_DESC IN DSS_API_SERIALS.PRODUCT_DESC%type,
	p_BRAND IN DSS_API_SERIALS.BRAND%type,
	p_CATEGORY_ID IN DSS_API_SERIALS.CATEGORY_ID%type,
	p_CATEGORY_CODE IN DSS_API_SERIALS.CATEGORY_CODE%type,
	p_CATEGORY_DESC IN DSS_API_SERIALS.CATEGORY_DESC%type,
	p_SUB_CATEGORY_CODE IN DSS_API_SERIALS.SUB_CATEGORY_CODE%type,
	p_SUB_CATEGORY_DESC IN DSS_API_SERIALS.SUB_CATEGORY_DESC%type,
	p_SUB_SUB_CATEGORY_CODE IN DSS_API_SERIALS.SUB_SUB_CATEGORY_CODE%type,
	p_SUB_SUB_CATEGORY_DESC IN DSS_API_SERIALS.SUB_SUB_CATEGORY_DESC%type,
	p_WARRANTY_YN IN DSS_API_SERIALS.WARRANTY_YN%type,
	p_WARRANTY_SEQ IN DSS_API_SERIALS.WARRANTY_SEQ%type,
	p_WARRANTY_CODE IN DSS_API_SERIALS.WARRANTY_CODE%type,
	p_WARRANTY_STARTDATE IN DSS_API_SERIALS.WARRANTY_STARTDATE%type,
	p_WARRANTY_ENDDATE IN DSS_API_SERIALS.WARRANTY_ENDDATE%type,
	p_ACTIVE_YN IN DSS_API_SERIALS.ACTIVE_YN%type,
	p_STATUS IN DSS_API_SERIALS.STATUS%type,
	p_INF_YN IN DSS_API_SERIALS.INF_YN%type,
	p_INF_DATE IN DSS_API_SERIALS.INF_DATE%type,
	p_REMARKS IN DSS_API_SERIALS.REMARKS%type,
	p_CREATE_BY IN DSS_API_SERIALS.CREATE_BY%type,
	p_CREATE_DATE IN DSS_API_SERIALS.CREATE_DATE%type,
	p_MODIFY_BY IN DSS_API_SERIALS.MODIFY_BY%type,
	p_MODIFY_DATE IN DSS_API_SERIALS.MODIFY_DATE%type,
	p_ALLOW_EDIT IN DSS_API_SERIALS.ALLOW_EDIT%type,
	p_ALLOW_INF IN DSS_API_SERIALS.ALLOW_INF%type,
	p_ATTRIBUTE1 IN DSS_API_SERIALS.ATTRIBUTE1%type,
	p_ATTRIBUTE2 IN DSS_API_SERIALS.ATTRIBUTE2%type,
	p_ATTRIBUTE3 IN DSS_API_SERIALS.ATTRIBUTE3%type,
	p_ATTRIBUTE4 IN DSS_API_SERIALS.ATTRIBUTE4%type,
	p_ATTRIBUTE5 IN DSS_API_SERIALS.ATTRIBUTE5%type,
	p_ATTRIBUTE6 IN DSS_API_SERIALS.ATTRIBUTE6%type,
	p_ATTRIBUTE7 IN DSS_API_SERIALS.ATTRIBUTE7%type,
	p_ATTRIBUTE8 IN DSS_API_SERIALS.ATTRIBUTE8%type,
	p_ATTRIBUTE9 IN DSS_API_SERIALS.ATTRIBUTE9%type,
	p_ATTRIBUTE10 IN DSS_API_SERIALS.ATTRIBUTE10%type); 
PROCEDURE P_Delete (	p_SCANID IN DSS_API_SERIALS.SCANID%type); 

END PKG_DSS_API_SERIALS;
/


DROP PACKAGE BODY DSS.PKG_DSS_API_SERIALS;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_API_SERIALS  as 

PROCEDURE P_LoadByPrimaryKey (	p_SCANID IN DSS_API_SERIALS.SCANID%type,
  outCursor OUT DSS.MYGEN.sqlcur)
IS
BEGIN
    OPEN outCursor FOR
	SELECT
		SCANID,
		BATCHID,
		LINEID,
		SEQINDEX,
		COLUMNINDEX,
		CONFIGID,
		CONFIGTYPE,
		SCANTYPE,
		SCAN_SOURCE,
		SRC_TYPE,
		SRC_OPERATING_UNIT,
		SRC_ORGANIZATION_ID,
		SRC_LOCATION_CODE,
		DEST_TYPE,
		DEST_OPERATING_UNIT,
		DEST_ORGANIZATION_ID,
		DEST_LOCATION_CODE,
		ORDER_TYPE,
		ORDER_NUMBER,
		ORDER_REF_NO1,
		ORDER_REF_NO2,
		ORDER_DATE,
		SERIALKEY,
		SERIALKEY_REF1,
		SERIALKEY_REF2,
		INVENTORY_ITEM_ID,
		PRODUCT_CODE,
		PRODUCT_DESC,
		BRAND,
		CATEGORY_ID,
		CATEGORY_CODE,
		CATEGORY_DESC,
		SUB_CATEGORY_CODE,
		SUB_CATEGORY_DESC,
		SUB_SUB_CATEGORY_CODE,
		SUB_SUB_CATEGORY_DESC,
		WARRANTY_YN,
		WARRANTY_SEQ,
		WARRANTY_CODE,
		WARRANTY_STARTDATE,
		WARRANTY_ENDDATE,
		ACTIVE_YN,
		STATUS,
		INF_YN,
		INF_DATE,
		REMARKS,
		CREATE_BY,
		CREATE_DATE,
		MODIFY_BY,
		MODIFY_DATE,
		ALLOW_EDIT,
		ALLOW_INF,
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
	FROM DSS_API_SERIALS
	WHERE
		SCANID = p_SCANID
;
END P_LoadByPrimaryKey;

PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur)
IS
BEGIN
    OPEN outCursor FOR
	SELECT
		SCANID,
		BATCHID,
		LINEID,
		SEQINDEX,
		COLUMNINDEX,
		CONFIGID,
		CONFIGTYPE,
		SCANTYPE,
		SCAN_SOURCE,
		SRC_TYPE,
		SRC_OPERATING_UNIT,
		SRC_ORGANIZATION_ID,
		SRC_LOCATION_CODE,
		DEST_TYPE,
		DEST_OPERATING_UNIT,
		DEST_ORGANIZATION_ID,
		DEST_LOCATION_CODE,
		ORDER_TYPE,
		ORDER_NUMBER,
		ORDER_REF_NO1,
		ORDER_REF_NO2,
		ORDER_DATE,
		SERIALKEY,
		SERIALKEY_REF1,
		SERIALKEY_REF2,
		INVENTORY_ITEM_ID,
		PRODUCT_CODE,
		PRODUCT_DESC,
		BRAND,
		CATEGORY_ID,
		CATEGORY_CODE,
		CATEGORY_DESC,
		SUB_CATEGORY_CODE,
		SUB_CATEGORY_DESC,
		SUB_SUB_CATEGORY_CODE,
		SUB_SUB_CATEGORY_DESC,
		WARRANTY_YN,
		WARRANTY_SEQ,
		WARRANTY_CODE,
		WARRANTY_STARTDATE,
		WARRANTY_ENDDATE,
		ACTIVE_YN,
		STATUS,
		INF_YN,
		INF_DATE,
		REMARKS,
		CREATE_BY,
		CREATE_DATE,
		MODIFY_BY,
		MODIFY_DATE,
		ALLOW_EDIT,
		ALLOW_INF,
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
	FROM DSS_API_SERIALS;
END P_LoadAll ;


PROCEDURE P_Update (	p_SCANID IN DSS_API_SERIALS.SCANID%type,
	p_BATCHID IN DSS_API_SERIALS.BATCHID%type,
	p_LINEID IN DSS_API_SERIALS.LINEID%type,
	p_SEQINDEX IN DSS_API_SERIALS.SEQINDEX%type,
	p_COLUMNINDEX IN DSS_API_SERIALS.COLUMNINDEX%type,
	p_CONFIGID IN DSS_API_SERIALS.CONFIGID%type,
	p_CONFIGTYPE IN DSS_API_SERIALS.CONFIGTYPE%type,
	p_SCANTYPE IN DSS_API_SERIALS.SCANTYPE%type,
	p_SCAN_SOURCE IN DSS_API_SERIALS.SCAN_SOURCE%type,
	p_SRC_TYPE IN DSS_API_SERIALS.SRC_TYPE%type,
	p_SRC_OPERATING_UNIT IN DSS_API_SERIALS.SRC_OPERATING_UNIT%type,
	p_SRC_ORGANIZATION_ID IN DSS_API_SERIALS.SRC_ORGANIZATION_ID%type,
	p_SRC_LOCATION_CODE IN DSS_API_SERIALS.SRC_LOCATION_CODE%type,
	p_DEST_TYPE IN DSS_API_SERIALS.DEST_TYPE%type,
	p_DEST_OPERATING_UNIT IN DSS_API_SERIALS.DEST_OPERATING_UNIT%type,
	p_DEST_ORGANIZATION_ID IN DSS_API_SERIALS.DEST_ORGANIZATION_ID%type,
	p_DEST_LOCATION_CODE IN DSS_API_SERIALS.DEST_LOCATION_CODE%type,
	p_ORDER_TYPE IN DSS_API_SERIALS.ORDER_TYPE%type,
	p_ORDER_NUMBER IN DSS_API_SERIALS.ORDER_NUMBER%type,
	p_ORDER_REF_NO1 IN DSS_API_SERIALS.ORDER_REF_NO1%type,
	p_ORDER_REF_NO2 IN DSS_API_SERIALS.ORDER_REF_NO2%type,
	p_ORDER_DATE IN DSS_API_SERIALS.ORDER_DATE%type,
	p_SERIALKEY IN DSS_API_SERIALS.SERIALKEY%type,
	p_SERIALKEY_REF1 IN DSS_API_SERIALS.SERIALKEY_REF1%type,
	p_SERIALKEY_REF2 IN DSS_API_SERIALS.SERIALKEY_REF2%type,
	p_INVENTORY_ITEM_ID IN DSS_API_SERIALS.INVENTORY_ITEM_ID%type,
	p_PRODUCT_CODE IN DSS_API_SERIALS.PRODUCT_CODE%type,
	p_PRODUCT_DESC IN DSS_API_SERIALS.PRODUCT_DESC%type,
	p_BRAND IN DSS_API_SERIALS.BRAND%type,
	p_CATEGORY_ID IN DSS_API_SERIALS.CATEGORY_ID%type,
	p_CATEGORY_CODE IN DSS_API_SERIALS.CATEGORY_CODE%type,
	p_CATEGORY_DESC IN DSS_API_SERIALS.CATEGORY_DESC%type,
	p_SUB_CATEGORY_CODE IN DSS_API_SERIALS.SUB_CATEGORY_CODE%type,
	p_SUB_CATEGORY_DESC IN DSS_API_SERIALS.SUB_CATEGORY_DESC%type,
	p_SUB_SUB_CATEGORY_CODE IN DSS_API_SERIALS.SUB_SUB_CATEGORY_CODE%type,
	p_SUB_SUB_CATEGORY_DESC IN DSS_API_SERIALS.SUB_SUB_CATEGORY_DESC%type,
	p_WARRANTY_YN IN DSS_API_SERIALS.WARRANTY_YN%type,
	p_WARRANTY_SEQ IN DSS_API_SERIALS.WARRANTY_SEQ%type,
	p_WARRANTY_CODE IN DSS_API_SERIALS.WARRANTY_CODE%type,
	p_WARRANTY_STARTDATE IN DSS_API_SERIALS.WARRANTY_STARTDATE%type,
	p_WARRANTY_ENDDATE IN DSS_API_SERIALS.WARRANTY_ENDDATE%type,
	p_ACTIVE_YN IN DSS_API_SERIALS.ACTIVE_YN%type,
	p_STATUS IN DSS_API_SERIALS.STATUS%type,
	p_INF_YN IN DSS_API_SERIALS.INF_YN%type,
	p_INF_DATE IN DSS_API_SERIALS.INF_DATE%type,
	p_REMARKS IN DSS_API_SERIALS.REMARKS%type,
	p_CREATE_BY IN DSS_API_SERIALS.CREATE_BY%type,
	p_CREATE_DATE IN DSS_API_SERIALS.CREATE_DATE%type,
	p_MODIFY_BY IN DSS_API_SERIALS.MODIFY_BY%type,
	p_MODIFY_DATE IN DSS_API_SERIALS.MODIFY_DATE%type,
	p_ALLOW_EDIT IN DSS_API_SERIALS.ALLOW_EDIT%type,
	p_ALLOW_INF IN DSS_API_SERIALS.ALLOW_INF%type,
	p_ATTRIBUTE1 IN DSS_API_SERIALS.ATTRIBUTE1%type,
	p_ATTRIBUTE2 IN DSS_API_SERIALS.ATTRIBUTE2%type,
	p_ATTRIBUTE3 IN DSS_API_SERIALS.ATTRIBUTE3%type,
	p_ATTRIBUTE4 IN DSS_API_SERIALS.ATTRIBUTE4%type,
	p_ATTRIBUTE5 IN DSS_API_SERIALS.ATTRIBUTE5%type,
	p_ATTRIBUTE6 IN DSS_API_SERIALS.ATTRIBUTE6%type,
	p_ATTRIBUTE7 IN DSS_API_SERIALS.ATTRIBUTE7%type,
	p_ATTRIBUTE8 IN DSS_API_SERIALS.ATTRIBUTE8%type,
	p_ATTRIBUTE9 IN DSS_API_SERIALS.ATTRIBUTE9%type,
	p_ATTRIBUTE10 IN DSS_API_SERIALS.ATTRIBUTE10%type)
IS
BEGIN
	UPDATE DSS_API_SERIALS
	SET
		SCANID	= p_SCANID,
		BATCHID	= p_BATCHID,
		LINEID	= p_LINEID,
		SEQINDEX	= p_SEQINDEX,
		COLUMNINDEX	= p_COLUMNINDEX,
		CONFIGID	= p_CONFIGID,
		CONFIGTYPE	= p_CONFIGTYPE,
		SCANTYPE	= p_SCANTYPE,
		SCAN_SOURCE	= p_SCAN_SOURCE,
		SRC_TYPE	= p_SRC_TYPE,
		SRC_OPERATING_UNIT	= p_SRC_OPERATING_UNIT,
		SRC_ORGANIZATION_ID	= p_SRC_ORGANIZATION_ID,
		SRC_LOCATION_CODE	= p_SRC_LOCATION_CODE,
		DEST_TYPE	= p_DEST_TYPE,
		DEST_OPERATING_UNIT	= p_DEST_OPERATING_UNIT,
		DEST_ORGANIZATION_ID	= p_DEST_ORGANIZATION_ID,
		DEST_LOCATION_CODE	= p_DEST_LOCATION_CODE,
		ORDER_TYPE	= p_ORDER_TYPE,
		ORDER_NUMBER	= p_ORDER_NUMBER,
		ORDER_REF_NO1	= p_ORDER_REF_NO1,
		ORDER_REF_NO2	= p_ORDER_REF_NO2,
		ORDER_DATE	= p_ORDER_DATE,
		SERIALKEY	= p_SERIALKEY,
		SERIALKEY_REF1	= p_SERIALKEY_REF1,
		SERIALKEY_REF2	= p_SERIALKEY_REF2,
		INVENTORY_ITEM_ID	= p_INVENTORY_ITEM_ID,
		PRODUCT_CODE	= p_PRODUCT_CODE,
		PRODUCT_DESC	= p_PRODUCT_DESC,
		BRAND	= p_BRAND,
		CATEGORY_ID	= p_CATEGORY_ID,
		CATEGORY_CODE	= p_CATEGORY_CODE,
		CATEGORY_DESC	= p_CATEGORY_DESC,
		SUB_CATEGORY_CODE	= p_SUB_CATEGORY_CODE,
		SUB_CATEGORY_DESC	= p_SUB_CATEGORY_DESC,
		SUB_SUB_CATEGORY_CODE	= p_SUB_SUB_CATEGORY_CODE,
		SUB_SUB_CATEGORY_DESC	= p_SUB_SUB_CATEGORY_DESC,
		WARRANTY_YN	= p_WARRANTY_YN,
		WARRANTY_SEQ	= p_WARRANTY_SEQ,
		WARRANTY_CODE	= p_WARRANTY_CODE,
		WARRANTY_STARTDATE	= p_WARRANTY_STARTDATE,
		WARRANTY_ENDDATE	= p_WARRANTY_ENDDATE,
		ACTIVE_YN	= p_ACTIVE_YN,
		STATUS	= p_STATUS,
		INF_YN	= p_INF_YN,
		INF_DATE	= p_INF_DATE,
		REMARKS	= p_REMARKS,
		CREATE_BY	= p_CREATE_BY,
		CREATE_DATE	= p_CREATE_DATE,
		MODIFY_BY	= p_MODIFY_BY,
		MODIFY_DATE	= p_MODIFY_DATE,
		ALLOW_EDIT	= p_ALLOW_EDIT,
		ALLOW_INF	= p_ALLOW_INF,
		ATTRIBUTE1	= p_ATTRIBUTE1,
		ATTRIBUTE2	= p_ATTRIBUTE2,
		ATTRIBUTE3	= p_ATTRIBUTE3,
		ATTRIBUTE4	= p_ATTRIBUTE4,
		ATTRIBUTE5	= p_ATTRIBUTE5,
		ATTRIBUTE6	= p_ATTRIBUTE6,
		ATTRIBUTE7	= p_ATTRIBUTE7,
		ATTRIBUTE8	= p_ATTRIBUTE8,
		ATTRIBUTE9	= p_ATTRIBUTE9,
		ATTRIBUTE10	= p_ATTRIBUTE10
	WHERE
		SCANID = p_SCANID
;
	
END P_Update;
 
 
 PROCEDURE P_Insert (	p_SCANID IN DSS_API_SERIALS.SCANID%type,
	p_BATCHID IN DSS_API_SERIALS.BATCHID%type,
	p_LINEID IN DSS_API_SERIALS.LINEID%type,
	p_SEQINDEX IN DSS_API_SERIALS.SEQINDEX%type,
	p_COLUMNINDEX IN DSS_API_SERIALS.COLUMNINDEX%type,
	p_CONFIGID IN DSS_API_SERIALS.CONFIGID%type,
	p_CONFIGTYPE IN DSS_API_SERIALS.CONFIGTYPE%type,
	p_SCANTYPE IN DSS_API_SERIALS.SCANTYPE%type,
	p_SCAN_SOURCE IN DSS_API_SERIALS.SCAN_SOURCE%type,
	p_SRC_TYPE IN DSS_API_SERIALS.SRC_TYPE%type,
	p_SRC_OPERATING_UNIT IN DSS_API_SERIALS.SRC_OPERATING_UNIT%type,
	p_SRC_ORGANIZATION_ID IN DSS_API_SERIALS.SRC_ORGANIZATION_ID%type,
	p_SRC_LOCATION_CODE IN DSS_API_SERIALS.SRC_LOCATION_CODE%type,
	p_DEST_TYPE IN DSS_API_SERIALS.DEST_TYPE%type,
	p_DEST_OPERATING_UNIT IN DSS_API_SERIALS.DEST_OPERATING_UNIT%type,
	p_DEST_ORGANIZATION_ID IN DSS_API_SERIALS.DEST_ORGANIZATION_ID%type,
	p_DEST_LOCATION_CODE IN DSS_API_SERIALS.DEST_LOCATION_CODE%type,
	p_ORDER_TYPE IN DSS_API_SERIALS.ORDER_TYPE%type,
	p_ORDER_NUMBER IN DSS_API_SERIALS.ORDER_NUMBER%type,
	p_ORDER_REF_NO1 IN DSS_API_SERIALS.ORDER_REF_NO1%type,
	p_ORDER_REF_NO2 IN DSS_API_SERIALS.ORDER_REF_NO2%type,
	p_ORDER_DATE IN DSS_API_SERIALS.ORDER_DATE%type,
	p_SERIALKEY IN DSS_API_SERIALS.SERIALKEY%type,
	p_SERIALKEY_REF1 IN DSS_API_SERIALS.SERIALKEY_REF1%type,
	p_SERIALKEY_REF2 IN DSS_API_SERIALS.SERIALKEY_REF2%type,
	p_INVENTORY_ITEM_ID IN DSS_API_SERIALS.INVENTORY_ITEM_ID%type,
	p_PRODUCT_CODE IN DSS_API_SERIALS.PRODUCT_CODE%type,
	p_PRODUCT_DESC IN DSS_API_SERIALS.PRODUCT_DESC%type,
	p_BRAND IN DSS_API_SERIALS.BRAND%type,
	p_CATEGORY_ID IN DSS_API_SERIALS.CATEGORY_ID%type,
	p_CATEGORY_CODE IN DSS_API_SERIALS.CATEGORY_CODE%type,
	p_CATEGORY_DESC IN DSS_API_SERIALS.CATEGORY_DESC%type,
	p_SUB_CATEGORY_CODE IN DSS_API_SERIALS.SUB_CATEGORY_CODE%type,
	p_SUB_CATEGORY_DESC IN DSS_API_SERIALS.SUB_CATEGORY_DESC%type,
	p_SUB_SUB_CATEGORY_CODE IN DSS_API_SERIALS.SUB_SUB_CATEGORY_CODE%type,
	p_SUB_SUB_CATEGORY_DESC IN DSS_API_SERIALS.SUB_SUB_CATEGORY_DESC%type,
	p_WARRANTY_YN IN DSS_API_SERIALS.WARRANTY_YN%type,
	p_WARRANTY_SEQ IN DSS_API_SERIALS.WARRANTY_SEQ%type,
	p_WARRANTY_CODE IN DSS_API_SERIALS.WARRANTY_CODE%type,
	p_WARRANTY_STARTDATE IN DSS_API_SERIALS.WARRANTY_STARTDATE%type,
	p_WARRANTY_ENDDATE IN DSS_API_SERIALS.WARRANTY_ENDDATE%type,
	p_ACTIVE_YN IN DSS_API_SERIALS.ACTIVE_YN%type,
	p_STATUS IN DSS_API_SERIALS.STATUS%type,
	p_INF_YN IN DSS_API_SERIALS.INF_YN%type,
	p_INF_DATE IN DSS_API_SERIALS.INF_DATE%type,
	p_REMARKS IN DSS_API_SERIALS.REMARKS%type,
	p_CREATE_BY IN DSS_API_SERIALS.CREATE_BY%type,
	p_CREATE_DATE IN DSS_API_SERIALS.CREATE_DATE%type,
	p_MODIFY_BY IN DSS_API_SERIALS.MODIFY_BY%type,
	p_MODIFY_DATE IN DSS_API_SERIALS.MODIFY_DATE%type,
	p_ALLOW_EDIT IN DSS_API_SERIALS.ALLOW_EDIT%type,
	p_ALLOW_INF IN DSS_API_SERIALS.ALLOW_INF%type,
	p_ATTRIBUTE1 IN DSS_API_SERIALS.ATTRIBUTE1%type,
	p_ATTRIBUTE2 IN DSS_API_SERIALS.ATTRIBUTE2%type,
	p_ATTRIBUTE3 IN DSS_API_SERIALS.ATTRIBUTE3%type,
	p_ATTRIBUTE4 IN DSS_API_SERIALS.ATTRIBUTE4%type,
	p_ATTRIBUTE5 IN DSS_API_SERIALS.ATTRIBUTE5%type,
	p_ATTRIBUTE6 IN DSS_API_SERIALS.ATTRIBUTE6%type,
	p_ATTRIBUTE7 IN DSS_API_SERIALS.ATTRIBUTE7%type,
	p_ATTRIBUTE8 IN DSS_API_SERIALS.ATTRIBUTE8%type,
	p_ATTRIBUTE9 IN DSS_API_SERIALS.ATTRIBUTE9%type,
	p_ATTRIBUTE10 IN DSS_API_SERIALS.ATTRIBUTE10%type)
 IS
BEGIN


	INSERT
	INTO DSS_API_SERIALS
	(
		SCANID,
		BATCHID,
		LINEID,
		SEQINDEX,
		COLUMNINDEX,
		CONFIGID,
		CONFIGTYPE,
		SCANTYPE,
		SCAN_SOURCE,
		SRC_TYPE,
		SRC_OPERATING_UNIT,
		SRC_ORGANIZATION_ID,
		SRC_LOCATION_CODE,
		DEST_TYPE,
		DEST_OPERATING_UNIT,
		DEST_ORGANIZATION_ID,
		DEST_LOCATION_CODE,
		ORDER_TYPE,
		ORDER_NUMBER,
		ORDER_REF_NO1,
		ORDER_REF_NO2,
		ORDER_DATE,
		SERIALKEY,
		SERIALKEY_REF1,
		SERIALKEY_REF2,
		INVENTORY_ITEM_ID,
		PRODUCT_CODE,
		PRODUCT_DESC,
		BRAND,
		CATEGORY_ID,
		CATEGORY_CODE,
		CATEGORY_DESC,
		SUB_CATEGORY_CODE,
		SUB_CATEGORY_DESC,
		SUB_SUB_CATEGORY_CODE,
		SUB_SUB_CATEGORY_DESC,
		WARRANTY_YN,
		WARRANTY_SEQ,
		WARRANTY_CODE,
		WARRANTY_STARTDATE,
		WARRANTY_ENDDATE,
		ACTIVE_YN,
		STATUS,
		INF_YN,
		INF_DATE,
		REMARKS,
		CREATE_BY,
		CREATE_DATE,
		MODIFY_BY,
		MODIFY_DATE,
		ALLOW_EDIT,
		ALLOW_INF,
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
	)
	VALUES
	(
		p_SCANID,
		p_BATCHID,
		p_LINEID,
		p_SEQINDEX,
		p_COLUMNINDEX,
		p_CONFIGID,
		p_CONFIGTYPE,
		p_SCANTYPE,
		p_SCAN_SOURCE,
		p_SRC_TYPE,
		p_SRC_OPERATING_UNIT,
		p_SRC_ORGANIZATION_ID,
		p_SRC_LOCATION_CODE,
		p_DEST_TYPE,
		p_DEST_OPERATING_UNIT,
		p_DEST_ORGANIZATION_ID,
		p_DEST_LOCATION_CODE,
		p_ORDER_TYPE,
		p_ORDER_NUMBER,
		p_ORDER_REF_NO1,
		p_ORDER_REF_NO2,
		p_ORDER_DATE,
		p_SERIALKEY,
		p_SERIALKEY_REF1,
		p_SERIALKEY_REF2,
		p_INVENTORY_ITEM_ID,
		p_PRODUCT_CODE,
		p_PRODUCT_DESC,
		p_BRAND,
		p_CATEGORY_ID,
		p_CATEGORY_CODE,
		p_CATEGORY_DESC,
		p_SUB_CATEGORY_CODE,
		p_SUB_CATEGORY_DESC,
		p_SUB_SUB_CATEGORY_CODE,
		p_SUB_SUB_CATEGORY_DESC,
		p_WARRANTY_YN,
		p_WARRANTY_SEQ,
		p_WARRANTY_CODE,
		p_WARRANTY_STARTDATE,
		p_WARRANTY_ENDDATE,
		p_ACTIVE_YN,
		p_STATUS,
		p_INF_YN,
		p_INF_DATE,
		p_REMARKS,
		p_CREATE_BY,
		p_CREATE_DATE,
		p_MODIFY_BY,
		p_MODIFY_DATE,
		p_ALLOW_EDIT,
		p_ALLOW_INF,
		p_ATTRIBUTE1,
		p_ATTRIBUTE2,
		p_ATTRIBUTE3,
		p_ATTRIBUTE4,
		p_ATTRIBUTE5,
		p_ATTRIBUTE6,
		p_ATTRIBUTE7,
		p_ATTRIBUTE8,
		p_ATTRIBUTE9,
		p_ATTRIBUTE10
	);
END P_Insert ;

PROCEDURE P_Delete (	p_SCANID IN DSS_API_SERIALS.SCANID%type)
IS
BEGIN
	DELETE	FROM DSS_API_SERIALS
	WHERE
		SCANID = p_SCANID;
END P_Delete;




END PKG_DSS_API_SERIALS;
/