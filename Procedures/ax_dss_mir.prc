DROP PROCEDURE DSS.AX_DSS_MIR;

CREATE OR REPLACE PROCEDURE DSS.ax_dss_mir
IS
   l_source_header_id   NUMBER;
   l_source_line_id     NUMBER;
   lv_error_flag        VARCHAR2 (1) := 'N';
   lv_ccid              NUMBER;

   CURSOR mir_cur
   IS
      SELECT h.headerseq,
             h.transaction_no,
             h.transaction_date,
             h.transaction_type,
             d.lineseq,
             d.line_num,
             d.product_code,
             (SELECT msi.inventory_item_id
                FROM mtl_system_items@axmapps msi
               WHERE msi.segment1 = d.product_code
                     AND msi.organization_id = h.organization_id)
                inventory_item_id,
             DECODE (h.transaction_type, 'MI', -1 * d.qty, 'MR', d.qty) qty,
             h.operating_unit,
             h.organization_id,
             h.location_code,
             DECODE (h.transaction_type,
                     'MI', 'Miscellaneous issue',
                     'MR', 'Miscellaneous receipt')
                source_code,
             DECODE (h.transaction_type, 'MI', 32, 'MR', 42) type_id,
             d.attribute3 code_combination
        FROM dss_sales_upld_head h, dss_sales_upld_dtl d
       WHERE     1 = 1
             AND h.headerseq = d.headerseq
             AND h.transaction_type IN ('MI', 'MR')
             AND NVL (d.intf_yn, 'N') = 'N';
BEGIN
   SELECT source_id.NEXTVAL INTO l_source_header_id FROM DUAL;

   FOR i IN mir_cur
   LOOP
      lv_error_flag := 'N';

      BEGIN
         SELECT code_combination_id
           INTO lv_ccid
           FROM gl_code_combinations_kfv@axmapps
          WHERE concatenated_segments = i.code_combination;
      EXCEPTION
         WHEN OTHERS
         THEN
            lv_error_flag := 'E';

            UPDATE dss_sales_upld_dtl
               SET intf_yn = 'E', attribute4 = 'Invalid code combination'
             WHERE lineseq = i.lineseq;
      END;

      IF lv_error_flag = 'N'
      THEN
         BEGIN
            INSERT INTO mtl_transactions_interface@axmapps (source_code,
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
                                                            transaction_reference,
                                                            distribution_account_id,
                                                            material_account)
                VALUES (i.source_code,                          -- source_code
                        l_source_header_id,                  -- source_line_id
                        l_source_header_id,                -- source_header_id
                        1,                                     -- process_flag
                        3,                                 -- transaction_mode
                        SYSDATE,                           -- last_update_date
                        1877,                               -- last_updated_by
                        SYSDATE,                              -- creation_date
                        1877,                                    -- created_by
                        i.inventory_item_id,              -- inventory_item_id
                        i.organization_id,                  -- organization_id
                        i.qty,                         -- transaction_quantity
                        i.qty,                             -- primary_quantity
                        'Pcs',                              -- transaction_uom
                        i.transaction_date,                -- transaction_date
                        i.location_code,                  -- subinventory_code
                        13,                      -- transaction_source_type_id
                        i.type_id,                      -- transaction_type_id
                        'DSS_' || i.transaction_no || '_' || i.line_num, -- transaction_reference
                        lv_ccid,                   --  DISTRIBUTION_ACCOUNT_id
                        lv_ccid                            -- MATERIAL_ACCOUNT
                               );
         END;

         UPDATE dss_sales_upld_dtl
            SET intf_yn = 'Y'
          WHERE lineseq = i.lineseq;
      END IF;
   END LOOP;

   COMMIT;
END ax_dss_mir;
/
