DROP PACKAGE DSS.PKG_RPT_SCE_SOH;

CREATE OR REPLACE package DSS.pkg_rpt_sce_soh
as
procedure rpt_initial(outCursor           OUT DSS.MYGEN.sqlcur) ;
end pkg_rpt_sce_soh;
/


DROP PACKAGE BODY DSS.PKG_RPT_SCE_SOH;

CREATE OR REPLACE PACKAGE BODY DSS.pkg_rpt_sce_soh
AS
   PROCEDURE rpt_initial (outCursor OUT DSS.MYGEN.sqlcur)
   AS
   BEGIN
      OPEN outCursor FOR
           SELECT lotxlocxid.sku,
                  SKU.DESCR,
                  TO_CHAR (SKU.SKUGROUP) BRAND,
          TO_CHAR (SKU.FREIGHTCLASS) CATEGORY,
                  lotxlocxid.loc,
                  lotxlocxid.id,
                  lotxlocxid.lot,
                  lotxlocxid.QTY,
                  lotxlocxid.QTYALLOCATED,
                  lotxlocxid.QTYPICKED,
                  lotattribute.lottable01 Zone,
                  lotattribute.lottable02 Sub_inv,
                  lotattribute.lottable03 Seg_code,
                  to_char(lotattribute.lottable04,'dd-mm-yyyy') Ageing            
             FROM lotxlocxid@WMWHSE1_LIVE,
                  lotattribute@WMWHSE1_LIVE,
                  sku@WMWHSE1_LIVE
            WHERE     lotxlocxid.lot = lotattribute.lot
                  AND sku.sku = lotxlocxid.sku
                  AND QTY > '0'
         ORDER BY sku;
   END rpt_initial;
END pkg_rpt_sce_soh;
/
