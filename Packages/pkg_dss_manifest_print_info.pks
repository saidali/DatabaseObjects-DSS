DROP PACKAGE DSS.PKG_DSS_MANIFEST_PRINT_INFO;

CREATE OR REPLACE PACKAGE DSS.PKG_DSS_MANIFEST_PRINT_INFO
AS
   PROCEDURE rpt_loadbyorder (p_ORDER_NUMBER   IN     VARCHAR2,
                              outCursor           OUT DSS.MYGEN.sqlcur);


   PROCEDURE rpt_loadbylocation (p_ORGANIZATION_ID   IN     VARCHAR2,
                                 p_LOCATION_CODE     IN     VARCHAR2,
                                 outCursor              OUT DSS.MYGEN.sqlcur);

   PROCEDURE rpt_loadbydate (p_ORGANIZATION_ID   IN     VARCHAR2,
                             p_LOCATION_CODE     IN     VARCHAR2,
                             p_FROM_DATE         IN     DATE,
                             p_TO_DATE           IN     DATE,
                             outCursor              OUT DSS.MYGEN.sqlcur);


   PROCEDURE P_LOADBY_CONDITION (p_CONDITIONS   IN     VARCHAR2,
                                 OUTCURSOR         OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_UP_SEAL_COUNT (
      p_ORDER_NUMBER   IN DSS_MANIFEST_PRINT_INFO.ORDER_NUMBER%TYPE,
      p_BAG_COUNT      IN DSS_MANIFEST_PRINT_INFO.BAG_COUNT%TYPE);

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_LoadByPrimaryKey (
      p_SEQNO     IN     DSS_MANIFEST_PRINT_INFO.SEQNO%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur);

   PROCEDURE P_Update (
      p_SEQNO              IN DSS_MANIFEST_PRINT_INFO.SEQNO%TYPE,
      p_OPERATING_UNIT     IN DSS_MANIFEST_PRINT_INFO.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID    IN DSS_MANIFEST_PRINT_INFO.ORGANIZATION_ID%TYPE,
      p_LOCATION_CODE      IN DSS_MANIFEST_PRINT_INFO.LOCATION_CODE%TYPE,
      p_ORDER_TYPE         IN DSS_MANIFEST_PRINT_INFO.ORDER_TYPE%TYPE,
      p_ORDER_NUMBER       IN DSS_MANIFEST_PRINT_INFO.ORDER_NUMBER%TYPE,
      p_QUANTITY           IN DSS_MANIFEST_PRINT_INFO.QUANTITY%TYPE,
      p_ROUTE_NO           IN DSS_MANIFEST_PRINT_INFO.ROUTE_NO%TYPE,
      p_BAG_COUNT          IN DSS_MANIFEST_PRINT_INFO.BAG_COUNT%TYPE,
      p_BAG_NUMBER         IN DSS_MANIFEST_PRINT_INFO.BAG_NUMBER%TYPE,
      p_BAG_REFERENCE_NO   IN DSS_MANIFEST_PRINT_INFO.BAG_REFERENCE_NO%TYPE,
      p_SEAL_NUMBER        IN DSS_MANIFEST_PRINT_INFO.SEAL_NUMBER%TYPE,
      p_SEAL_NUMBER_REF1   IN DSS_MANIFEST_PRINT_INFO.SEAL_NUMBER_REF1%TYPE,
      p_SEAL_NUMBER_REF2   IN DSS_MANIFEST_PRINT_INFO.SEAL_NUMBER_REF2%TYPE,
      p_CREATE_BY          IN DSS_MANIFEST_PRINT_INFO.CREATE_BY%TYPE,
      p_CREATE_DATE        IN DSS_MANIFEST_PRINT_INFO.CREATE_DATE%TYPE,
      p_ATTRIBUTE1         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10        IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE10%TYPE);

   PROCEDURE P_Insert (
      p_SEQNO              IN DSS_MANIFEST_PRINT_INFO.SEQNO%TYPE,
      p_OPERATING_UNIT     IN DSS_MANIFEST_PRINT_INFO.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID    IN DSS_MANIFEST_PRINT_INFO.ORGANIZATION_ID%TYPE,
      p_LOCATION_CODE      IN DSS_MANIFEST_PRINT_INFO.LOCATION_CODE%TYPE,
      p_ORDER_TYPE         IN DSS_MANIFEST_PRINT_INFO.ORDER_TYPE%TYPE,
      p_ORDER_NUMBER       IN DSS_MANIFEST_PRINT_INFO.ORDER_NUMBER%TYPE,
      p_QUANTITY           IN DSS_MANIFEST_PRINT_INFO.QUANTITY%TYPE,
      p_ROUTE_NO           IN DSS_MANIFEST_PRINT_INFO.ROUTE_NO%TYPE,
      p_BAG_COUNT          IN DSS_MANIFEST_PRINT_INFO.BAG_COUNT%TYPE,
      p_BAG_NUMBER         IN DSS_MANIFEST_PRINT_INFO.BAG_NUMBER%TYPE,
      p_BAG_REFERENCE_NO   IN DSS_MANIFEST_PRINT_INFO.BAG_REFERENCE_NO%TYPE,
      p_SEAL_NUMBER        IN DSS_MANIFEST_PRINT_INFO.SEAL_NUMBER%TYPE,
      p_SEAL_NUMBER_REF1   IN DSS_MANIFEST_PRINT_INFO.SEAL_NUMBER_REF1%TYPE,
      p_SEAL_NUMBER_REF2   IN DSS_MANIFEST_PRINT_INFO.SEAL_NUMBER_REF2%TYPE,
      p_CREATE_BY          IN DSS_MANIFEST_PRINT_INFO.CREATE_BY%TYPE,
      p_CREATE_DATE        IN DSS_MANIFEST_PRINT_INFO.CREATE_DATE%TYPE,
      p_ATTRIBUTE1         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10        IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE10%TYPE);

   PROCEDURE P_Delete (p_SEQNO IN DSS_MANIFEST_PRINT_INFO.SEQNO%TYPE);
END PKG_DSS_MANIFEST_PRINT_INFO;
/


DROP PACKAGE BODY DSS.PKG_DSS_MANIFEST_PRINT_INFO;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_DSS_MANIFEST_PRINT_INFO
AS
   PROCEDURE rpt_loadbyorder (p_ORDER_NUMBER   IN     VARCHAR2,
                              outCursor           OUT DSS.MYGEN.sqlcur)
   AS
   BEGIN
      OPEN outCursor FOR
         SELECT SEQNO "Seq No",
                M.OPERATING_UNIT "Opr Unit",
                M.ORGANIZATION_ID "Channel",
                M.LOCATION_CODE "Location",
                ORDER_TYPE "Type",
                ORDER_NUMBER "Order #",
                QUANTITY "Qty",
                ROUTE_NO "Route",
                BAG_COUNT "Bag Count",
                BAG_NUMBER "Bag Number",
                SEAL_NUMBER "Seal #",
                DESCRIPTION "Description",
                CITY "City",
                REGION "Region",
                OUTLET_TYPE "Outlet Type",
                CREATE_BY "Created By",
                CREATE_DATE "Created Date"
           FROM DSS_MANIFEST_PRINT_INFO M
                LEFT JOIN
                V_LOCATIONS L
                   ON     M.ORGANIZATION_ID = l.ORGANIZATION_ID
                      AND M.LOCATION_CODE = L.LOCATION_CODE
          WHERE ORDER_NUMBER = p_ORDER_NUMBER;
   END rpt_loadbyorder;

   PROCEDURE rpt_loadbylocation (p_ORGANIZATION_ID   IN     VARCHAR2,
                                 p_LOCATION_CODE     IN     VARCHAR2,
                                 outCursor              OUT DSS.MYGEN.sqlcur)
   AS
   BEGIN
      OPEN outCursor FOR
         SELECT SEQNO "Seq No",
                M.OPERATING_UNIT "Opr Unit",
                M.ORGANIZATION_ID "Channel",
                M.LOCATION_CODE "Location",
                ORDER_TYPE "Type",
                ORDER_NUMBER "Order #",
                QUANTITY "Qty",
                ROUTE_NO "Route",
                BAG_COUNT "Bag Count",
                BAG_NUMBER "Bag Number",
                SEAL_NUMBER "Seal #",
                DESCRIPTION "Description",
                CITY "City",
                REGION "Region",
                OUTLET_TYPE "Outlet Type",
                CREATE_BY "Created By",
                CREATE_DATE "Created Date"
           FROM DSS_MANIFEST_PRINT_INFO M
                LEFT JOIN
                V_LOCATIONS L
                   ON     M.ORGANIZATION_ID = l.ORGANIZATION_ID
                      AND M.LOCATION_CODE = L.LOCATION_CODE
          WHERE     M.ORGANIZATION_ID LIKE '%' || p_ORGANIZATION_ID || '%'
                AND M.LOCATION_CODE LIKE '%' || p_LOCATION_CODE || '%';
   END rpt_loadbylocation;


   PROCEDURE rpt_loadbydate (p_ORGANIZATION_ID   IN     VARCHAR2,
                             p_LOCATION_CODE     IN     VARCHAR2,
                             p_FROM_DATE         IN     DATE,
                             p_TO_DATE           IN     DATE,
                             outCursor              OUT DSS.MYGEN.sqlcur)
   AS
   BEGIN
      OPEN outCursor FOR
         SELECT SEQNO "Seq No",
                M.OPERATING_UNIT "Opr Unit",
                M.ORGANIZATION_ID "Channel",
                M.LOCATION_CODE "Location",
                ORDER_TYPE "Type",
                ORDER_NUMBER "Order #",
                QUANTITY "Qty",
                ROUTE_NO "Route",
                BAG_COUNT "Bag Count",
                BAG_NUMBER "Bag Number",
                SEAL_NUMBER "Seal #",
                DESCRIPTION "Description",
                CITY "City",
                REGION "Region",
                OUTLET_TYPE "Outlet Type",
                CREATE_BY "Created By",
                CREATE_DATE "Created Date"
           FROM DSS_MANIFEST_PRINT_INFO M
                LEFT JOIN
                V_LOCATIONS L
                   ON     M.ORGANIZATION_ID = l.ORGANIZATION_ID
                      AND M.LOCATION_CODE = L.LOCATION_CODE
          WHERE     M.ORGANIZATION_ID LIKE '%' || p_ORGANIZATION_ID || '%'
                AND M.LOCATION_CODE LIKE '%' || p_LOCATION_CODE || '%'
                AND TRUNC (CREATE_DATE) >= TRUNC (p_FROM_DATE)
                AND TRUNC (CREATE_DATE) <= TRUNC (p_TO_DATE);
   END rpt_loadbydate;

   PROCEDURE P_LOADBY_CONDITION (p_CONDITIONS   IN     VARCHAR2,
                                 OUTCURSOR         OUT DSS.MYGEN.sqlcur)
   AS
      P_SQLQUERY   VARCHAR2 (1000);
   BEGIN
      P_SQLQUERY :=
         'SELECT * FROM DSS_MANIFEST_PRINT_INFO WHERE 1=1 ' || p_CONDITIONS;

      OPEN outCursor FOR P_SQLQUERY;
   END P_LOADBY_CONDITION;

   PROCEDURE P_UP_SEAL_COUNT (
      p_ORDER_NUMBER   IN DSS_MANIFEST_PRINT_INFO.ORDER_NUMBER%TYPE,
      p_BAG_COUNT      IN DSS_MANIFEST_PRINT_INFO.BAG_COUNT%TYPE)
   AS
   BEGIN
      UPDATE DSS_MANIFEST_PRINT_INFO
         SET BAG_COUNT = p_BAG_COUNT
       WHERE ORDER_NUMBER = p_ORDER_NUMBER;
   END P_UP_SEAL_COUNT;


   PROCEDURE P_LoadByPrimaryKey (
      p_SEQNO     IN     DSS_MANIFEST_PRINT_INFO.SEQNO%TYPE,
      outCursor      OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT SEQNO,
                OPERATING_UNIT,
                ORGANIZATION_ID,
                LOCATION_CODE,
                ORDER_TYPE,
                ORDER_NUMBER,
                QUANTITY,
                ROUTE_NO,
                BAG_COUNT,
                BAG_NUMBER,
                BAG_REFERENCE_NO,
                SEAL_NUMBER,
                SEAL_NUMBER_REF1,
                SEAL_NUMBER_REF2,
                CREATE_BY,
                CREATE_DATE,
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
           FROM DSS_MANIFEST_PRINT_INFO
          WHERE SEQNO = p_SEQNO;
   END P_LoadByPrimaryKey;

   PROCEDURE P_LoadAll (outCursor OUT DSS.MYGEN.sqlcur)
   IS
   BEGIN
      OPEN outCursor FOR
         SELECT SEQNO,
                OPERATING_UNIT,
                ORGANIZATION_ID,
                LOCATION_CODE,
                ORDER_TYPE,
                ORDER_NUMBER,
                QUANTITY,
                ROUTE_NO,
                BAG_COUNT,
                BAG_NUMBER,
                BAG_REFERENCE_NO,
                SEAL_NUMBER,
                SEAL_NUMBER_REF1,
                SEAL_NUMBER_REF2,
                CREATE_BY,
                CREATE_DATE,
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
           FROM DSS_MANIFEST_PRINT_INFO;
   END P_LoadAll;


   PROCEDURE P_Update (
      p_SEQNO              IN DSS_MANIFEST_PRINT_INFO.SEQNO%TYPE,
      p_OPERATING_UNIT     IN DSS_MANIFEST_PRINT_INFO.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID    IN DSS_MANIFEST_PRINT_INFO.ORGANIZATION_ID%TYPE,
      p_LOCATION_CODE      IN DSS_MANIFEST_PRINT_INFO.LOCATION_CODE%TYPE,
      p_ORDER_TYPE         IN DSS_MANIFEST_PRINT_INFO.ORDER_TYPE%TYPE,
      p_ORDER_NUMBER       IN DSS_MANIFEST_PRINT_INFO.ORDER_NUMBER%TYPE,
      p_QUANTITY           IN DSS_MANIFEST_PRINT_INFO.QUANTITY%TYPE,
      p_ROUTE_NO           IN DSS_MANIFEST_PRINT_INFO.ROUTE_NO%TYPE,
      p_BAG_COUNT          IN DSS_MANIFEST_PRINT_INFO.BAG_COUNT%TYPE,
      p_BAG_NUMBER         IN DSS_MANIFEST_PRINT_INFO.BAG_NUMBER%TYPE,
      p_BAG_REFERENCE_NO   IN DSS_MANIFEST_PRINT_INFO.BAG_REFERENCE_NO%TYPE,
      p_SEAL_NUMBER        IN DSS_MANIFEST_PRINT_INFO.SEAL_NUMBER%TYPE,
      p_SEAL_NUMBER_REF1   IN DSS_MANIFEST_PRINT_INFO.SEAL_NUMBER_REF1%TYPE,
      p_SEAL_NUMBER_REF2   IN DSS_MANIFEST_PRINT_INFO.SEAL_NUMBER_REF2%TYPE,
      p_CREATE_BY          IN DSS_MANIFEST_PRINT_INFO.CREATE_BY%TYPE,
      p_CREATE_DATE        IN DSS_MANIFEST_PRINT_INFO.CREATE_DATE%TYPE,
      p_ATTRIBUTE1         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10        IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE10%TYPE)
   IS
   BEGIN
      UPDATE DSS_MANIFEST_PRINT_INFO
         SET SEQNO = p_SEQNO,
             OPERATING_UNIT = p_OPERATING_UNIT,
             ORGANIZATION_ID = p_ORGANIZATION_ID,
             LOCATION_CODE = p_LOCATION_CODE,
             ORDER_TYPE = p_ORDER_TYPE,
             ORDER_NUMBER = p_ORDER_NUMBER,
             QUANTITY = p_QUANTITY,
             ROUTE_NO = p_ROUTE_NO,
             BAG_COUNT = p_BAG_COUNT,
             BAG_NUMBER = p_BAG_NUMBER,
             BAG_REFERENCE_NO = p_BAG_REFERENCE_NO,
             SEAL_NUMBER = p_SEAL_NUMBER,
             SEAL_NUMBER_REF1 = p_SEAL_NUMBER_REF1,
             SEAL_NUMBER_REF2 = p_SEAL_NUMBER_REF2,
             CREATE_BY = p_CREATE_BY,
             CREATE_DATE = p_CREATE_DATE,
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
       WHERE SEQNO = p_SEQNO;
   END P_Update;


   PROCEDURE P_Insert (
      p_SEQNO              IN DSS_MANIFEST_PRINT_INFO.SEQNO%TYPE,
      p_OPERATING_UNIT     IN DSS_MANIFEST_PRINT_INFO.OPERATING_UNIT%TYPE,
      p_ORGANIZATION_ID    IN DSS_MANIFEST_PRINT_INFO.ORGANIZATION_ID%TYPE,
      p_LOCATION_CODE      IN DSS_MANIFEST_PRINT_INFO.LOCATION_CODE%TYPE,
      p_ORDER_TYPE         IN DSS_MANIFEST_PRINT_INFO.ORDER_TYPE%TYPE,
      p_ORDER_NUMBER       IN DSS_MANIFEST_PRINT_INFO.ORDER_NUMBER%TYPE,
      p_QUANTITY           IN DSS_MANIFEST_PRINT_INFO.QUANTITY%TYPE,
      p_ROUTE_NO           IN DSS_MANIFEST_PRINT_INFO.ROUTE_NO%TYPE,
      p_BAG_COUNT          IN DSS_MANIFEST_PRINT_INFO.BAG_COUNT%TYPE,
      p_BAG_NUMBER         IN DSS_MANIFEST_PRINT_INFO.BAG_NUMBER%TYPE,
      p_BAG_REFERENCE_NO   IN DSS_MANIFEST_PRINT_INFO.BAG_REFERENCE_NO%TYPE,
      p_SEAL_NUMBER        IN DSS_MANIFEST_PRINT_INFO.SEAL_NUMBER%TYPE,
      p_SEAL_NUMBER_REF1   IN DSS_MANIFEST_PRINT_INFO.SEAL_NUMBER_REF1%TYPE,
      p_SEAL_NUMBER_REF2   IN DSS_MANIFEST_PRINT_INFO.SEAL_NUMBER_REF2%TYPE,
      p_CREATE_BY          IN DSS_MANIFEST_PRINT_INFO.CREATE_BY%TYPE,
      p_CREATE_DATE        IN DSS_MANIFEST_PRINT_INFO.CREATE_DATE%TYPE,
      p_ATTRIBUTE1         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE1%TYPE,
      p_ATTRIBUTE2         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE2%TYPE,
      p_ATTRIBUTE3         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE3%TYPE,
      p_ATTRIBUTE4         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE4%TYPE,
      p_ATTRIBUTE5         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE5%TYPE,
      p_ATTRIBUTE6         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE6%TYPE,
      p_ATTRIBUTE7         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE7%TYPE,
      p_ATTRIBUTE8         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE8%TYPE,
      p_ATTRIBUTE9         IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE9%TYPE,
      p_ATTRIBUTE10        IN DSS_MANIFEST_PRINT_INFO.ATTRIBUTE10%TYPE)
   IS
      v_seq   NUMBER;
   BEGIN
      SELECT NVL (MAX (seqno), 0) + 1 INTO v_seq FROM DSS_MANIFEST_PRINT_INFO;

      INSERT INTO DSS_MANIFEST_PRINT_INFO (SEQNO,
                                           OPERATING_UNIT,
                                           ORGANIZATION_ID,
                                           LOCATION_CODE,
                                           ORDER_TYPE,
                                           ORDER_NUMBER,
                                           QUANTITY,
                                           ROUTE_NO,
                                           BAG_COUNT,
                                           BAG_NUMBER,
                                           BAG_REFERENCE_NO,
                                           SEAL_NUMBER,
                                           SEAL_NUMBER_REF1,
                                           SEAL_NUMBER_REF2,
                                           CREATE_BY,
                                           CREATE_DATE,
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
           VALUES (v_seq,
                   p_OPERATING_UNIT,
                   p_ORGANIZATION_ID,
                   p_LOCATION_CODE,
                   p_ORDER_TYPE,
                   p_ORDER_NUMBER,
                   p_QUANTITY,
                   p_ROUTE_NO,
                   p_BAG_COUNT,
                   p_BAG_NUMBER,
                   p_BAG_REFERENCE_NO,
                   p_SEAL_NUMBER,
                   p_SEAL_NUMBER_REF1,
                   p_SEAL_NUMBER_REF2,
                   p_CREATE_BY,
                   SYSDATE,
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

      UPDATE dss_order_scan_header
         SET ATTRIBUTE8 = NVL (ATTRIBUTE8, 0) + 1
       WHERE jobid = p_ATTRIBUTE1;
   END P_Insert;

   PROCEDURE P_Delete (p_SEQNO IN DSS_MANIFEST_PRINT_INFO.SEQNO%TYPE)
   IS
   BEGIN
      DELETE FROM DSS_MANIFEST_PRINT_INFO
            WHERE SEQNO = p_SEQNO;
   END P_Delete;
END PKG_DSS_MANIFEST_PRINT_INFO;
/
