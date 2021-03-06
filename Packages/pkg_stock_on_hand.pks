DROP PACKAGE DSS.PKG_STOCK_ON_HAND;

CREATE OR REPLACE PACKAGE DSS.PKG_STOCK_ON_HAND
AS
   FUNCTION F_ONHANDQTY (
      P_INVENTORY_ITEM_ID   IN V_DSS_ONHAND_QUANTITIES_ALL.INVENTORY_ITEM_ID%TYPE,
      P_ORGANIZATION_ID     IN V_DSS_ONHAND_QUANTITIES_ALL.ORGANIZATION_ID%TYPE,
      P_LOCATION_CODE       IN V_DSS_ONHAND_QUANTITIES_ALL.LOCATION_CODE%TYPE)
      RETURN NUMBER;

   FUNCTION F_COMPONENTS_MAXQTY (P_BILL_SEQUENCE_ID    NUMBER,
                                 P_ORGANIZATION_ID     NUMBER,
                                 P_LOCATION_CODE       VARCHAR2)
      RETURN NUMBER;

   PROCEDURE P_BOM_COMPONENTS_ONHD (
      P_BILL_SEQUENCE_ID       NUMBER,
      P_ORGANIZATION_ID        NUMBER,
      P_LOCATION_CODE          VARCHAR2,
      outCursor            OUT DSS.MYGEN.sqlcur);

END PKG_STOCK_ON_HAND;
/


DROP PACKAGE BODY DSS.PKG_STOCK_ON_HAND;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_STOCK_ON_HAND
AS
   FUNCTION F_ONHANDQTY (
      P_INVENTORY_ITEM_ID   IN V_DSS_ONHAND_QUANTITIES_ALL.INVENTORY_ITEM_ID%TYPE,
      P_ORGANIZATION_ID     IN V_DSS_ONHAND_QUANTITIES_ALL.ORGANIZATION_ID%TYPE,
      P_LOCATION_CODE       IN V_DSS_ONHAND_QUANTITIES_ALL.LOCATION_CODE%TYPE)
      RETURN NUMBER
   AS
      V_STOCK_ON_HAND   NUMBER;
   BEGIN
      SELECT NVL (ON_HAND_QUANTITY, 0)
        INTO V_STOCK_ON_HAND
        FROM V_DSS_ONHAND_QUANTITIES OHD
       WHERE     OHD.ORGANIZATION_ID = P_ORGANIZATION_ID
             AND OHD.SUBINVENTORY_CODE = P_LOCATION_CODE
             AND OHD.INVENTORY_ITEM_ID = P_INVENTORY_ITEM_ID;

      RETURN NVL (V_STOCK_ON_HAND, 0);
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN 0;
   END F_ONHANDQTY;

   PROCEDURE P_BOM_COMPONENTS_ONHD (
      P_BILL_SEQUENCE_ID       NUMBER,
      P_ORGANIZATION_ID        NUMBER,
      P_LOCATION_CODE          VARCHAR2,
      outCursor            OUT DSS.MYGEN.sqlcur)
   AS
   BEGIN
      OPEN outCursor FOR
           SELECT ORGANIZATION_ID,
                  BILL_SEQUENCE_ID,
                  ASSEMBLY_ITEM_ID,
                  ASSEMBLY_PRODUCT_CODE,
                  P_LOCATION_CODE,
                  COMPONENT_SEQUENCE_ID,
                  ITEM_NUM,
                  COMPONENT_ITEM_ID,
                  COMPONENT_PRODUCT_CODE,
                  COMPONENT_DESCRIPTION,
                  COMPONENT_QUANTITY,
                  F_ONHANDQTY (COMPONENT_ITEM_ID,
                               P_ORGANIZATION_ID,
                               P_LOCATION_CODE)
                     STOCK_ON_HAND
             FROM V_DSS_BOM_COMPONENTS
            WHERE     BILL_SEQUENCE_ID = P_BILL_SEQUENCE_ID
                  AND ORGANIZATION_ID = P_ORGANIZATION_ID
         ORDER BY ITEM_NUM;
   END P_BOM_COMPONENTS_ONHD;


   FUNCTION F_COMPONENTS_MAXQTY (P_BILL_SEQUENCE_ID    NUMBER,
                                 P_ORGANIZATION_ID     NUMBER,
                                 P_LOCATION_CODE       VARCHAR2)
      RETURN NUMBER
   AS
      V_MIN_QTY   NUMBER;
   BEGIN
      SELECT MIN (
                  F_ONHANDQTY (COMPONENT_ITEM_ID,
                               ORGANIZATION_ID,
                               P_LOCATION_CODE)
                / COMPONENT_QUANTITY)
        INTO V_MIN_QTY
        FROM V_DSS_BOM_COMPONENTS
       WHERE     BILL_SEQUENCE_ID = P_BILL_SEQUENCE_ID
             AND ORGANIZATION_ID = P_ORGANIZATION_ID;

      RETURN NVL (V_MIN_QTY, 0);
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN 0;
   END F_COMPONENTS_MAXQTY;


 
END PKG_STOCK_ON_HAND;
/
