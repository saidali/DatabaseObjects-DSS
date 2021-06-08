DROP PACKAGE DSS.PKG_CNT_HANY_RPT;

CREATE OR REPLACE PACKAGE DSS.PKG_CNT_HANY_RPT
AS
   PROCEDURE RPT_INITIAL ( P_TYPE     IN VARCHAR2,outCursor  OUT DSS.MYGEN.sqlcur);
 END PKG_CNT_HANY_RPT;
/


DROP PACKAGE BODY DSS.PKG_CNT_HANY_RPT;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_CNT_HANY_RPT
AS
   PROCEDURE RPT_INITIAL (P_TYPE IN VARCHAR2, OUTCURSOR OUT DSS.MYGEN.SQLCUR)
   AS
   BEGIN
      IF UPPER (P_TYPE) = 'IOT'
      THEN
      BEGIN
         OPEN outCursor FOR
            SELECT *
              FROM (SELECT 'IOT' ORDERTYPE,
                           XIHA_HEADER_ID HEADER_ID,
                           TO_CHAR (XIHA_HEADER_ID) REQUEST_NUMBER,
                           XIHA_ORG_ID OPERATING_UNIT,
                           XIHA_SRC_ORGANIZATION_ID ORGANIZATION_ID,
                           XIHA_CREATION_DATE DATE_REQUIRED,
                           XIHA_SRC_LOCATION FROM_SUBINVENTORY_CODE,
                           SRC_LOC.ATTRIBUTE1 FROM_SUBINV_TYPE,
                           XIHA_DEST_LOCATION TO_SUBINVENTORY_CODE,
                           DST_LOC.ATTRIBUTE1 TO_SUBINV_TYPE,
                           XIHA_REMARKS DESCRIPTION,
                           XIHA_CREATION_DATE CREATION_DATE,
                           XIHA_LAST_UPDATE_DATE LAST_UPDATE_DATE,
                           XIHA_ATTRIBUTE15,
                              XIHA_ORG_ID
                           || '-'
                           || XIHA_SRC_ORGANIZATION_ID
                           || '-'
                           || XIHA_SRC_LOCATION
                              FROM_WMS_SUBINVENTORY,
                              XIHA_ORG_ID
                           || '-'
                           || XIHA_DEST_ORGANIZATION_ID
                           || '-'
                           || XIHA_DEST_LOCATION
                              TO_WMS_SUBINVENTORY,
                           'N' WARRANTY_SCAN,
                           SRC_LOC.ATTRIBUTE5 SRC_LOC_TYPE,
                           DST_LOC.ATTRIBUTE5 DST_LOC_TYPE
                      FROM XXPOS.XXAT_IOT_HEADERS_ALL@AXMAPPS H,
                           APPS.MTL_SECONDARY_INVENTORIES@AXMAPPS SRC_LOC,
                           APPS.MTL_SECONDARY_INVENTORIES@AXMAPPS DST_LOC
                     WHERE     1 = 1
                           AND XIHA_INTF_YN != 'P'
                           -- AND h.xiha_intf_yn = 'C'
                           AND XIHA_ATTRIBUTE15 NOT IN ('SUCCESS')
                           AND SRC_LOC.ORGANIZATION_ID =
                                  H.XIHA_SRC_ORGANIZATION_ID
                           AND SRC_LOC.SECONDARY_INVENTORY_NAME =
                                  H.XIHA_SRC_LOCATION
                           AND DST_LOC.ORGANIZATION_ID =
                                  H.XIHA_DEST_ORGANIZATION_ID
                           AND DST_LOC.SECONDARY_INVENTORY_NAME =
                                  H.XIHA_DEST_LOCATION) HL
             WHERE (   HL.FROM_SUBINV_TYPE = 'Warehouse Barloworld'
                    OR HL.TO_SUBINV_TYPE = 'Warehouse Barloworld');
                    END;
      ELSIF UPPER (P_TYPE) = 'SO'
      THEN
      BEGIN
         OPEN outCursor FOR
              SELECT OEL.ORG_ID,
                     (SELECT OEH.ORDER_NUMBER
                        FROM OE_ORDER_HEADERS_ALL@AXMAPPS OEH
                       WHERE OEH.HEADER_ID = OEL.HEADER_ID)
                        ORDER_NUMBER,
                     OEL.LINE_NUMBER,
                     OEL.ORDERED_ITEM,
                     OEL.ORDERED_QUANTITY,
                     OEL.SHIPPED_QUANTITY,
                     OEL.FULFILLED_QUANTITY,
                     (SELECT ORG.ORGANIZATION_CODE
                        FROM ORG_ORGANIZATION_DEFINITIONS@AXMAPPS ORG
                       WHERE ORG.ORGANIZATION_ID = OEL.SHIP_FROM_ORG_ID)
                        ORGANIZATION_CODE,
                     OEL.CUST_PO_NUMBER,
                     OEL.CREATION_DATE,
                     OEL.FLOW_STATUS_CODE,
                     OEL.SUBINVENTORY
                FROM OE_ORDER_LINES_ALL@AXMAPPS OEL
               WHERE     1 = 1                 --oel.org_id IN (103, 211, 213)
                     AND EXISTS
                            (SELECT SECONDARY_INVENTORY_NAME
                               FROM MTL_SECONDARY_INVENTORIES@AXMAPPS MSI
                              WHERE     MSI.ATTRIBUTE1 = 'Warehouse Barloworld'
                                    AND MSI.ORGANIZATION_ID =
                                           OEL.SHIP_FROM_ORG_ID
                                    AND MSI.SECONDARY_INVENTORY_NAME =
                                           OEL.SUBINVENTORY)
                     AND OEL.FLOW_STATUS_CODE NOT IN ('CLOSED', 'CANCELLED')
            --AND oeh.header_id = oel.header_id)
            ORDER BY ORG_ID, CREATION_DATE, LINE_NUMBER;
            END;
      ELSIF UPPER (P_TYPE) = 'MO'
      THEN
      BEGIN
         OPEN outCursor FOR
              SELECT L.CREATION_DATE CREATION_DATE,
                     ROUND ( (SYSDATE - L.CREATION_DATE), 0) AS NOOFDAYS,
                     DECODE (HEADER_STATUS,
                             1, 'Incomplete',
                             2, 'Pending Approval',
                             3, 'Approved',
                             4, 'Not Approved',
                             5, 'Closed',
                             6, 'Canceled',
                             7, 'Pre Approved',
                             8, 'Partially Approved')
                        HEADER_STATUS,
                     DECODE (LINE_STATUS,
                             1, 'Incomplete',
                             2, 'Pending Approval',
                             3, 'Approved',
                             4, 'Not Approved',
                             5, 'Closed',
                             6, 'Canceled',
                             7, 'Pre Approved',
                             8, 'Partially Approved')
                        LINE_STATUS,
                     H.HEADER_ID,
                     L.ORGANIZATION_ID,
                     (SELECT ORGANIZATION_NAME
                        FROM ORG_ORGANIZATION_DEFINITIONS@AXMAPPS A
                       WHERE L.ORGANIZATION_ID = A.ORGANIZATION_ID)
                        ORGNAME,
                     H.DESCRIPTION MOVEORDERREMARKS,
                     L.FROM_SUBINVENTORY_CODE,
                     L.TO_SUBINVENTORY_CODE,
                     MSI.INVENTORY_ITEM_ID,
                     SEGMENT1,
                     LINE_NUMBER,
                     QUANTITY,
                     QUANTITY_DELIVERED,
                     MSI.DESCRIPTION,
                     L.ATTRIBUTE9 RESERVATIONSTATUS,
                     H.ATTRIBUTE10 WMSDOWNLOADSTATUS,
                     H.ATTRIBUTE11 POS_CF_DWLDSTATUS,
                     H.ATTRIBUTE15 WMSCONFIRMEDSTATUS
                FROM MTL_TXN_REQUEST_HEADERS@AXMAPPS H,
                     MTL_TXN_REQUEST_LINES@AXMAPPS L,
                     MTL_SYSTEM_ITEMS@AXMAPPS MSI
               WHERE     H.HEADER_ID = L.HEADER_ID
                     AND H.TRANSACTION_TYPE_ID = '64'
                     AND MSI.INVENTORY_ITEM_ID = L.INVENTORY_ITEM_ID
                     AND MSI.ORGANIZATION_ID = L.ORGANIZATION_ID
                     AND H.ORGANIZATION_ID IN
                            (SELECT ORGANIZATION_ID
                               FROM ORG_ORGANIZATION_DEFINITIONS@AXMAPPS
                              WHERE OPERATING_UNIT NOT IN ('219', '282'))
                     AND H.DATE_REQUIRED >= '01-jan-2018'
                     AND H.HEADER_STATUS NOT IN (5, 6)
                     AND ( (   H.FROM_SUBINVENTORY_CODE IN
                                  (SELECT MS.SECONDARY_INVENTORY_NAME
                                     FROM MTL_SECONDARY_INVENTORIES@AXMAPPS MS
                                    WHERE     MS.ATTRIBUTE1 =
                                                 'Warehouse Barloworld'
                                          AND MS.ORGANIZATION_ID =
                                                 H.ORGANIZATION_ID)
                            OR H.TO_SUBINVENTORY_CODE IN
                                  (SELECT MS.SECONDARY_INVENTORY_NAME
                                     FROM MTL_SECONDARY_INVENTORIES@AXMAPPS MS
                                    WHERE     MS.ATTRIBUTE1 =
                                                 'Warehouse Barloworld'
                                          AND MS.ORGANIZATION_ID =
                                                 H.ORGANIZATION_ID)))
            ORDER BY CREATION_DATE;
            END;
      ELSIF UPPER (P_TYPE) = 'RES'
      THEN
      BEGIN
         OPEN outCursor FOR
              SELECT MR.ORGANIZATION_ID,
                     SUBINVENTORY_CODE,
                     MR.INVENTORY_ITEM_ID,
                     SEGMENT1,
                     SEGMENT2,
                     REQUIREMENT_DATE,
                     DEMAND_SOURCE_NAME,
                     SUBSTR (DEMAND_SOURCE_NAME,
                             3,
                             INSTR (DEMAND_SOURCE_NAME, '-') - 3)
                        MOVEORDERREF,
                     DECODE (
                        SUBSTR (DEMAND_SOURCE_NAME, 1, 2),
                        'MO', (SELECT DECODE (HEADER_STATUS,
                                              1, 'Incomplete',
                                              2, 'Pending Approval',
                                              3, 'Approved',
                                              4, 'Not Approved',
                                              5, 'Closed',
                                              6, 'Canceled',
                                              7, 'Pre Approved',
                                              8, 'Partially Approved')
                                         HEADER_STATUS
                                 FROM MTL_TXN_REQUEST_HEADERS@AXMAPPS MTRH
                                WHERE MTRH.HEADER_ID =
                                         SUBSTR (
                                            DEMAND_SOURCE_NAME,
                                            3,
                                            INSTR (DEMAND_SOURCE_NAME, '-') - 3)),
                        NULL)
                        HEADSTATUS,
                     RESERVATION_QUANTITY,
                     DESCRIPTION,
                     RESERVATION_ID,
                     (SELECT TRANSACTION_SOURCE_TYPE_NAME
                        FROM MTL_TXN_SOURCE_TYPES@AXMAPPS MTST
                       WHERE MTST.TRANSACTION_SOURCE_TYPE_ID =
                                DEMAND_SOURCE_TYPE_ID)
                        SUPPLY_SOURCE_TYPE_ID,
                     DECODE (
                        NVL (DEMAND_SOURCE_NAME, 'x'),
                        'x', (SELECT ORDER_NUMBER
                                FROM OE_ORDER_HEADERS_ALL@AXMAPPS
                               WHERE HEADER_ID =
                                        (SELECT HEADER_ID
                                           FROM OE_ORDER_LINES_ALL@AXMAPPS
                                          WHERE LINE_ID = DEMAND_SOURCE_LINE_ID)))
                        SONUMBER
                FROM MTL_RESERVATIONS@AXMAPPS MR, MTL_SYSTEM_ITEMS@AXMAPPS MSI
               WHERE     MR.ORGANIZATION_ID = MSI.ORGANIZATION_ID
                     AND MR.INVENTORY_ITEM_ID = MSI.INVENTORY_ITEM_ID
                     AND REQUIREMENT_DATE >= '01-jan-2018'
            ORDER BY REQUIREMENT_DATE;
            END;
      ELSIF UPPER (P_TYPE) = 'MO'
      THEN
      BEGIN
         OPEN outCursor FOR
              SELECT L.CREATION_DATE CREATION_DATE,
                     ROUND ( (SYSDATE - L.CREATION_DATE), 0) AS NOOFDAYS,
                     DECODE (HEADER_STATUS,
                             1, 'Incomplete',
                             2, 'Pending Approval',
                             3, 'Approved',
                             4, 'Not Approved',
                             5, 'Closed',
                             6, 'Canceled',
                             7, 'Pre Approved',
                             8, 'Partially Approved')
                        HEADER_STATUS,
                     DECODE (LINE_STATUS,
                             1, 'Incomplete',
                             2, 'Pending Approval',
                             3, 'Approved',
                             4, 'Not Approved',
                             5, 'Closed',
                             6, 'Canceled',
                             7, 'Pre Approved',
                             8, 'Partially Approved')
                        LINE_STATUS,
                     H.HEADER_ID,
                     L.ORGANIZATION_ID,
                     (SELECT ORGANIZATION_NAME
                        FROM ORG_ORGANIZATION_DEFINITIONS@AXMAPPS A
                       WHERE L.ORGANIZATION_ID = A.ORGANIZATION_ID)
                        ORGNAME,
                     H.DESCRIPTION MOVEORDERREMARKS,
                     L.FROM_SUBINVENTORY_CODE,
                     L.TO_SUBINVENTORY_CODE,
                     MSI.INVENTORY_ITEM_ID,
                     SEGMENT1,
                     LINE_NUMBER,
                     QUANTITY,
                     QUANTITY_DELIVERED,
                     MSI.DESCRIPTION,
                     L.ATTRIBUTE9 RESERVATIONSTATUS,
                     H.ATTRIBUTE10 WMSDOWNLOADSTATUS,
                     H.ATTRIBUTE11 POS_CF_DWLDSTATUS,
                     H.ATTRIBUTE15 WMSCONFIRMEDSTATUS
                FROM MTL_TXN_REQUEST_HEADERS@AXMAPPS H,
                     MTL_TXN_REQUEST_LINES@AXMAPPS L,
                     MTL_SYSTEM_ITEMS@AXMAPPS MSI
               WHERE     H.HEADER_ID = L.HEADER_ID
                     AND H.TRANSACTION_TYPE_ID = '64'
                     AND MSI.INVENTORY_ITEM_ID = L.INVENTORY_ITEM_ID
                     AND MSI.ORGANIZATION_ID = L.ORGANIZATION_ID
                     AND H.ORGANIZATION_ID IN
                            (SELECT ORGANIZATION_ID
                               FROM ORG_ORGANIZATION_DEFINITIONS@AXMAPPS
                              WHERE OPERATING_UNIT NOT IN ('219', '282'))
                     AND H.DATE_REQUIRED >= '01-jan-2018'
                     AND H.HEADER_STATUS NOT IN (5, 6)
                     AND ( (   H.FROM_SUBINVENTORY_CODE IN
                                  (SELECT MS.SECONDARY_INVENTORY_NAME
                                     FROM MTL_SECONDARY_INVENTORIES@AXMAPPS MS
                                    WHERE     MS.ATTRIBUTE1 =
                                                 'Warehouse Barloworld'
                                          AND MS.ORGANIZATION_ID =
                                                 H.ORGANIZATION_ID)
                            OR H.TO_SUBINVENTORY_CODE IN
                                  (SELECT MS.SECONDARY_INVENTORY_NAME
                                     FROM MTL_SECONDARY_INVENTORIES@AXMAPPS MS
                                    WHERE     MS.ATTRIBUTE1 =
                                                 'Warehouse Barloworld'
                                          AND MS.ORGANIZATION_ID =
                                                 H.ORGANIZATION_ID)))
            ORDER BY CREATION_DATE;
            END;
      ELSIF UPPER (P_TYPE) = 'CFM'
      THEN
      BEGIN
       OPEN outCursor FOR
           SELECT L.CREATION_DATE as  CREATION_DATE,
                  DECODE (HEADER_STATUS,
                          1, 'Incomplete',
                          2, 'Pending Approval',
                          3, 'Approved',
                          4, 'Not Approved',
                          5, 'Closed',
                          6, 'Canceled',
                          7, 'Pre Approved',
                          8, 'Partially Approved')
                     HEADER_STATUS,
                  DECODE (LINE_STATUS,
                          1, 'Incomplete',
                          2, 'Pending Approval',
                          3, 'Approved',
                          4, 'Not Approved',
                          5, 'Closed',
                          6, 'Canceled',
                          7, 'Pre Approved',
                          8, 'Partially Approved')
                     LINE_STATUS,
                  H.HEADER_ID,
                  L.ORGANIZATION_ID,
                  (SELECT ORGANIZATION_NAME
                     FROM ORG_ORGANIZATION_DEFINITIONS@AXMAPPS A
                    WHERE L.ORGANIZATION_ID = A.ORGANIZATION_ID)
                     ORGNAME,
                  H.DESCRIPTION MOVEORDERREMARKS,
                  L.FROM_SUBINVENTORY_CODE,
                  L.TO_SUBINVENTORY_CODE,
                  MSI.INVENTORY_ITEM_ID,
                  SEGMENT1,
                  LINE_NUMBER,
                  QUANTITY,
                  QUANTITY_DELIVERED,
                  MSI.DESCRIPTION,
                  L.ATTRIBUTE9 RESERVATIONSTATUS,
                  H.ATTRIBUTE10 WMSDOWNLOADSTATUS,
                  H.ATTRIBUTE11 POS_CF_DWLDSTATUS,
                  H.ATTRIBUTE15 WMSCONFIRMEDSTATUS
             FROM APPS.MTL_TXN_REQUEST_HEADERS@AXMAPPS H,
                  APPS.MTL_TXN_REQUEST_LINES@AXMAPPS L,
                  APPS.MTL_SYSTEM_ITEMS@AXMAPPS MSI,
                  ERPBRIDGE.AX_CF_ENABLED_LOCATIONS@ERPBRIDGE CFL
            WHERE     H.HEADER_ID = L.HEADER_ID
                  AND H.TRANSACTION_TYPE_ID = '64'
                  AND MSI.INVENTORY_ITEM_ID = L.INVENTORY_ITEM_ID
                  AND MSI.ORGANIZATION_ID = L.ORGANIZATION_ID
                  AND CFL.ACEL_ORGANIZATION_CODE = L.ORGANIZATION_ID
                  AND (   (CFL.ACEL_SUB_INVENTORY_CODE =
                              H.FROM_SUBINVENTORY_CODE)
                       OR (CFL.ACEL_SUB_INVENTORY_CODE = H.TO_SUBINVENTORY_CODE))
                  AND H.ORGANIZATION_ID IN
                         (SELECT ORGANIZATION_ID
                            FROM ORG_ORGANIZATION_DEFINITIONS@AXMAPPS
                           WHERE OPERATING_UNIT NOT IN ('219', '282'))
                  AND H.DATE_REQUIRED >= '01-jan-2018'
                  AND H.HEADER_STATUS NOT IN (5, 6)
                  AND ( (   H.FROM_SUBINVENTORY_CODE IN
                               (SELECT MS.SECONDARY_INVENTORY_NAME
                                  FROM APPS.MTL_SECONDARY_INVENTORIES@AXMAPPS MS
                                 WHERE     MS.ATTRIBUTE1 =
                                              'Warehouse Barloworld'
                                       AND MS.ORGANIZATION_ID =
                                              H.ORGANIZATION_ID)
                         OR H.TO_SUBINVENTORY_CODE IN
                               (SELECT MS.SECONDARY_INVENTORY_NAME
                                  FROM APPS.MTL_SECONDARY_INVENTORIES@AXMAPPS MS
                                 WHERE     MS.ATTRIBUTE1 =
                                              'Warehouse Barloworld'
                                       AND MS.ORGANIZATION_ID =
                                              H.ORGANIZATION_ID)))
         ORDER BY L.CREATION_DATE;
         END;
      END IF;
   END RPT_INITIAL;
END PKG_CNT_HANY_RPT;
/
