DROP VIEW DSS.V_DSS_PENDING_PO_HEAD;

CREATE OR REPLACE FORCE VIEW DSS.V_DSS_PENDING_PO_HEAD
(
    ORDER_TYPE
   ,ORG_ID
   ,ORGANIZATION_ID
   ,DESTINATION_SUBINVENTORY
   ,ORDER_DATE
   ,PO_NUMBER
   ,ORDERNUMBER
   ,VENDOR_ID
   ,VENDOR_NAME
   ,QUANTITY_RECEIVED
   ,PENDING_QTY
   ,SHIPMENT_HEADER_ID
   ,SHIP_TO_LOCATION_ID
)
AS
    SELECT 'PO' ORDER_TYPE
          ,PHA.ORG_ID ORG_ID
          ,PDA.DESTINATION_ORGANIZATION_ID "ORGANIZATION_ID"
          ,PDA.DESTINATION_SUBINVENTORY
          ,TRUNC(PHA.CREATION_DATE) ORDER_DATE
          ,PHA.SEGMENT1 PO_NUMBER
          ,PHA.PO_HEADER_ID ORDERNUMBER
          ,PV.VENDOR_ID
          ,PV.VENDOR_NAME
          ,SUM(NVL(RSL.QUANTITY_RECEIVED, 0)) QUANTITY_RECEIVED
          ,SUM(NVL(PLA.QUANTITY - RSL.QUANTITY_RECEIVED, 0)) PENDING_QTY
          ,RSH.SHIPMENT_HEADER_ID
          ,RSH.SHIP_TO_LOCATION_ID
    FROM PO_HEADERS_ALL@AXMAPPS PHA
         LEFT OUTER JOIN PO_LINES_ALL@AXMAPPS PLA
             ON PHA.PO_HEADER_ID = PLA.PO_HEADER_ID
         LEFT OUTER JOIN SYN_PO_VENDORS PV ON PHA.VENDOR_ID = PV.VENDOR_ID
         LEFT OUTER JOIN RCV_SHIPMENT_LINES@AXMAPPS RSL
             ON RSL.PO_HEADER_ID = PHA.PO_HEADER_ID
                AND RSL.PO_LINE_ID = PLA.PO_LINE_ID
                AND RSL.ITEM_ID = PLA.ITEM_ID
         LEFT OUTER JOIN RCV_SHIPMENT_HEADERS@AXMAPPS RSH
             ON RSH.SHIPMENT_HEADER_ID = RSL.SHIPMENT_HEADER_ID
         LEFT OUTER JOIN PO_DISTRIBUTIONS_ALL@AXMAPPS PDA
             ON PDA.PO_LINE_ID = PLA.PO_LINE_ID
    WHERE TRUNC(PHA.CREATION_DATE) BETWEEN TRUNC(
                                                 LAST_DAY(
                                                     ADD_MONTHS(SYSDATE, -7))
                                               + 1)
                                       AND TRUNC(SYSDATE) + 2
    GROUP BY PHA.CREATION_DATE
            ,PHA.SEGMENT1
            ,PV.VENDOR_ID
            ,PV.VENDOR_NAME
            ,PHA.PO_HEADER_ID
            ,PDA.DESTINATION_SUBINVENTORY
            ,PHA.ORG_ID
            ,PDA.DESTINATION_ORGANIZATION_ID
            ,RSH.SHIPMENT_HEADER_ID
            ,RSH.SHIP_TO_LOCATION_ID;


GRANT SELECT ON DSS.V_DSS_PENDING_PO_HEAD TO SELDATA;
