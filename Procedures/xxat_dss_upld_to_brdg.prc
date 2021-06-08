DROP PROCEDURE DSS.XXAT_DSS_UPLD_TO_BRDG;

CREATE OR REPLACE PROCEDURE DSS.xxat_dss_upld_to_brdg
AS
   CURSOR c_sales_head
   IS
      SELECT CASE
                WHEN h.organization_id = 914   -- AND H.TRANSACTION_TYPE='CMO'
                                            THEN '01682'
                WHEN h.organization_id = 934   -- AND H.TRANSACTION_TYPE='CMO'
                                            THEN '02651'
                ELSE location_code
             END
                dest_location,
             CASE WHEN h.organization_id IN (914, 934) THEN 'Y' ELSE 'N' END
                van_sales_yn,
             h.*
        FROM dss_sales_upld_head h
       WHERE     1 = 1
             AND h.transaction_type NOT IN ('MI', 'MR')
             AND NVL (h.intf_yn, 'N') = 'N';

   CURSOR c_sales_detl (
      p_oboh_seq NUMBER)
   IS
      SELECT CASE
                WHEN d.organization_id = 914    --AND D.TRANSACTION_TYPE='CMO'
                                            THEN '01682'
                WHEN d.organization_id = 934    --AND D.TRANSACTION_TYPE='CMO'
                                            THEN '02651'
                ELSE location_code
             END
                dest_location,
             d.*
        FROM dss_sales_upld_dtl d
       WHERE     d.headerseq = p_oboh_seq
             AND d.transaction_type NOT IN ('MI', 'MR')
             AND NVL (d.intf_yn, 'N') = 'N';

   -- FOR SUBINVENTORY TRANSFERS--
   CURSOR c_sub_trf
   IS
      SELECT CASE
                WHEN ds.organization_id = 914 THEN '01682'
                WHEN ds.organization_id = 934 THEN '02651'
                ELSE location_code
             END
                dest_location,
             ds.*
        FROM dss_sales_upld_dtl ds
       WHERE     1 = 1
             AND ds.transaction_type NOT IN ('MI', 'MR', 'SR')
             AND NVL (ds.attribute14, 'N') = 'N'
             AND NVL (ds.intf_yn, 'N') = 'N'
             AND ds.organization_id IN (914,                           --  UPS
                                            934                       --   FPS
                                               );

   l_error_code          VARCHAR2 (20);
   l_error_mesg          VARCHAR2 (2000);
   l_error_message       VARCHAR2 (2000);
   l_error_status        NUMBER (2);
   -- FOR SUBINVENTORY TRANSFERS--
   l_source_header_id    NUMBER;
   l_source_line_id      NUMBER;
   l_inventory_item_id   NUMBER;
   l_dest_location       VARCHAR2 (30);
   lv_cnt                NUMBER := 0;
BEGIN
   -- FOR SUBINVENTORY TRANSFERS--
   BEGIN
      SELECT COUNT (*)
        INTO lv_cnt
        FROM dss_sales_upld_dtl
       WHERE     1 = 1
             AND transaction_type <> 'SR'
             AND NVL (attribute14, 'N') = 'N'
             AND organization_id IN (914,                              --  UPS
                                         934                          --   FPS
                                            );
   EXCEPTION
      WHEN OTHERS
      THEN
         lv_cnt := 0;
   END;

   IF lv_cnt > 0
   THEN
      SELECT source_header_s.NEXTVAL@axmapps
        INTO l_source_header_id
        FROM DUAL;

      SELECT source_line_s.NEXTVAL@axmapps INTO l_source_line_id FROM DUAL;

      FOR f_sub_trf IN c_sub_trf
      LOOP
         l_dest_location := NULL;

         BEGIN
            SELECT inventory_item_id
              INTO l_inventory_item_id
              FROM mtl_system_items@axmapps msi
             WHERE     msi.organization_id = 104 -- Item Master organization id is 104 (AIM)--
                   AND msi.segment1 = f_sub_trf.product_code;
         EXCEPTION
            WHEN OTHERS
            THEN
               l_inventory_item_id := 0;
         END;

         /*
                  IF f_sub_trf.organization_id = 914
                  THEN
                     l_dest_location := '01682';
                  ELSIF f_sub_trf.organization_id = 934
                  THEN
                     l_dest_location := '02651';
                  END IF;
         */
         BEGIN
            INSERT
              INTO mtl_transactions_interface@axmapps (
                      source_code,
                      source_line_id,
                      source_header_id,
                      process_flag,
                      transaction_mode,
                      last_update_date,
                      last_updated_by,
                      creation_date,
                      created_by,
                      inventory_item_id,
                      organization_id,
                      transaction_quantity,
                      primary_quantity,
                      transaction_uom,
                      transaction_date,
                      subinventory_code,
                      transaction_source_type_id,
                      transaction_type_id,
                      transfer_subinventory,
                      transfer_organization,
                      transaction_reference)
            VALUES (
                      'Subinventory Transfer',
                      l_source_line_id,
                      l_source_header_id,
                      1,
                      3,
                      SYSDATE,
                      1877,
                      SYSDATE,
                      1877,
                      l_inventory_item_id,
                      f_sub_trf.organization_id,
                      f_sub_trf.qty,
                      f_sub_trf.qty,
                      'Pcs',
                      f_sub_trf.transaction_date,
                      f_sub_trf.location_code,
                      13,                                      -- Inventory --
                      2,                           -- Subinventory Transfer --
                      f_sub_trf.dest_location,
                      f_sub_trf.organization_id,
                         'Auto Subinv transfers for DSS sequence - '
                      || f_sub_trf.lineseq);


            UPDATE dss_sales_upld_dtl
               SET attribute14 = 'Y'
             WHERE 1 = 1 AND lineseq = f_sub_trf.lineseq;
         EXCEPTION
            WHEN OTHERS
            THEN
               UPDATE dss_sales_upld_dtl
                  SET attribute14 = 'E'
                WHERE 1 = 1 AND lineseq = f_sub_trf.lineseq;
         END;
      END LOOP;
   END IF;

   FOR k IN c_sales_head
   LOOP
      l_error_status := 0;

      BEGIN
         INSERT
           INTO ax_om_sales_order_head@erpbridge (aosoh_org_id,
                                                  aosoh_trans_type,
                                                  aosoh_loc_code,
                                                  aosoh_doc_no,
                                                  aosoh_doc_dt,
                                                  aosoh_ref_no,
                                                  aosoh_cre_dt,
                                                  aosoh_van_sales_yn,
                                                  aosoh_party_code,
                                                  aosoh_party_name,
                                                  aosoh_age_range,
                                                  aosoh_gender,
                                                  aosoh_mobile,
                                                  aosoh_sman_code,
                                                  aosoh_remarks,
                                                  aosoh_net_amount,
                                                  aosoh_intf_yn,
                                                  aosoh_dwld_upld,
                                                  aosoh_organization_id,
                                                  attribute4,
                                                  attribute8,
                                                  aosoh_party_site_number)
         VALUES (k.operating_unit,
                 k.transaction_type,
                 k.dest_location,                         --  k.location_code,
                 k.transaction_no,
                 k.transaction_date,
                 k.ref_no1,
                 SYSDATE,
                 k.van_sales_yn,
                 k.party_code,
                 SUBSTR (k.party_name, 1, 40),
                 NULL,
                 NULL,
                 NULL,
                 NULL,
                 k.remarks,
                 k.net_amount,
                 'N',
                 'DWLD',
                 k.organization_id,
                 'DSS',
                 NULL,
                 k.party_site_number);
      EXCEPTION
         WHEN OTHERS
         THEN
            l_error_code := SQLCODE;
            l_error_mesg := SQLERRM;
            l_error_message := SQLCODE || '-' || SQLERRM;
            l_error_status := 1;
            ROLLBACK;
            /*
                        INSERT INTO agt_interface_error_log (aiel_srl_no,
                                                             aiel_intf_name,
                                                             aiel_module_name,
                                                             aiel_error_code,
                                                             aiel_error_details,
                                                             aiel_last_value,
                                                             aiel_remarks,
                                                             aiel_cre_user_init,
                                                             aiel_cre_dt)
                            VALUES (agt_interface_errors_s.NEXTVAL,
                                    'Direct Sales',
                                    'DSS',
                                    'DSS-10001',
                                    l_error_message,
                                    k.transaction_no,
                                    'Error while inserting into ax_om_SaleS_order_head',
                                    '-1',
                                    SYSDATE);
                                    */

            COMMIT;
      END;

      IF (l_error_status = 0)
      THEN
         FOR l IN c_sales_detl (k.headerseq)
         LOOP
            BEGIN
               INSERT
                 INTO ax_om_sales_order_detl@erpbridge (aosod_org_id,
                                                        aosod_trans_type,
                                                        aosod_loc_code,
                                                        aosod_doc_no,
                                                        aosod_srl_no,
                                                        aosod_prod_code,
                                                        aosod_uom,
                                                        aosod_qty,
                                                        aosod_lc_price,
                                                        aosod_intf_yn,
                                                        aosod_organization_id,
                                                        aosod_assembly_yn,
                                                        aosod_tax_flag,
                                                        aosod_tax_code,
                                                        aosod_tax_rate,
                                                        aosod_disc_perc,
                                                        aosod_cre_dt,
                                                        aosod_wac,
                                                        attribute1,
                                                        attribute4,
                                                        aosod_tax_id,
                                                        aosod_tax_value,
                                                        aosod_tax_percent)
               VALUES (l.operating_unit,
                       l.transaction_type,
                       l.dest_location,                    -- l.location_code,
                       l.transaction_no,
                       l.line_num,
                       l.product_code,
                       'PCS',
                       l.qty,
                       l.lc_price,
                       'N',
                       l.organization_id,
                       'N',
                       'N',
                       NULL,
                       NULL,
                       NULL,
                       SYSDATE,
                       l.lc_price,
                       NULL,
                       'DSS',
                       l.tax_rate_id,
                       l.tax_value,
                       l.tax_percentage);

               UPDATE dss_sales_upld_dtl
                  SET intf_yn = 'Y'
                WHERE headerseq = k.headerseq AND lineseq = l.lineseq;
            EXCEPTION
               WHEN OTHERS
               THEN
                  l_error_code := SQLCODE;
                  l_error_mesg := SQLERRM;
                  l_error_message := SQLCODE || '-' || SQLERRM;
                  l_error_status := 1;
                  ROLLBACK;

                  /*
                                    INSERT INTO agt_interface_error_log (aiel_srl_no,
                                                                         aiel_intf_name,
                                                                         aiel_module_name,
                                                                         aiel_error_code,
                                                                         aiel_error_details,
                                                                         aiel_last_value,
                                                                         aiel_remarks,
                                                                         aiel_cre_user_init,
                                                                         aiel_cre_dt)
                                        VALUES (agt_interface_errors_s.NEXTVAL,
                                                'Direct Sales',
                                                'DSS',
                                                'DSS-10002',
                                                l_error_message,
                                                k.transaction_no,
                                                'Error while inserting into Ax_Om_Sales_Order_Detl',
                                                '-1',
                                                SYSDATE);
                                                */

                  UPDATE dss_sales_upld_dtl
                     SET intf_yn = 'E' || '-' || SUBSTR (l_error_mesg, 1, 90)
                   WHERE headerseq = k.headerseq AND lineseq = l.lineseq;

                  COMMIT;
            END;
         END LOOP;                                              --C_SALES_DETL
      END IF;

      IF (l_error_status = 0)
      THEN
         UPDATE dss_sales_upld_head
            SET intf_yn = 'Y'
          WHERE headerseq = k.headerseq AND transaction_no = k.transaction_no;
      ELSE
         ROLLBACK;

         UPDATE dss_sales_upld_head
            SET intf_yn = 'E', attribute14 = SUBSTR (l_error_mesg, 1, 90)
          WHERE headerseq = k.headerseq AND transaction_no = k.transaction_no;
      END IF;

      COMMIT;
   END LOOP;                                                    --C_SALES_HEAD
END xxat_dss_upld_to_brdg;
/
