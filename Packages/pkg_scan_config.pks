DROP PACKAGE DSS.PKG_SCAN_CONFIG;

CREATE OR REPLACE PACKAGE DSS.PKG_SCAN_CONFIG
AS
    PROCEDURE SET_SCANNABLE (P_INVENTORY_ITEM_ID   NUMBER,
                                             P_CATEGORY_ID         NUMBER,
                                             P_ORGANIZATION_ID     NUMBER,
                                             P_PRODUCT_CODE        VARCHAR2,
                                             P_OPERATING_UNIT      NUMBER);
END PKG_SCAN_CONFIG;
/


DROP PACKAGE BODY DSS.PKG_SCAN_CONFIG;

CREATE OR REPLACE PACKAGE BODY DSS.PKG_SCAN_CONFIG
AS
    PROCEDURE SET_SCANNABLE (P_INVENTORY_ITEM_ID   NUMBER,
                             P_CATEGORY_ID         NUMBER,
                             P_ORGANIZATION_ID     NUMBER,
                             P_PRODUCT_CODE        VARCHAR2,
                             P_OPERATING_UNIT      NUMBER)
    AS
        CATEGORYCOUNT   NUMBER;
        PRODUCTCOUNT    NUMBER;
        p_ERROR VARCHAR2(32000);
        p_lineid number  ; 
    BEGIN
        SELECT COUNT (*)
        INTO CATEGORYCOUNT
        FROM TK_CATEGORIES_CONFIG
        WHERE CATEGORY_ID = P_CATEGORY_ID AND UNIQUE_KEY = 'Y';

        IF NVL (CATEGORYCOUNT, 0) = 0
        THEN
            SELECT COUNT (*)
            INTO PRODUCTCOUNT
            FROM TK_PRODUCTS_CONFIG
            WHERE     INVENTORY_ITEM_ID = P_INVENTORY_ITEM_ID
                  AND ORGANIZATION_ID = P_ORGANIZATION_ID;

            IF NVL (PRODUCTCOUNT, 0) = 0
            THEN
            
               p_lineid := SEQ_PRODUCTS_CONFIG.NEXTVAL;
            
                INSERT INTO TK_PRODUCTS_CONFIG (LINEID , CONFIGID,
                                                CONFIG_NAME,
                                                OPERATING_UNIT,
                                                ORGANIZATION_ID,
                                                INVENTORY_ITEM_ID,
                                                PRODUCT_CODE,
                                                UNIQUE_KEY,
                                                NUMERIC_KEY,
                                                CHECK_BARCODE,
                                                IMEI_KEY,
                                                ALLOW_SPECIALCHAR,
                                                IMEI_LENGTH_MAX,
                                                IMEI_LENGTH_MIN,
                                                SCAN_REQUIRED,
                                                STATUS,
                                                ENABLED,
                                                ATTRIBUTE9)
                VALUES (p_lineid , 1,
                        'Key(1)',
                        P_OPERATING_UNIT,
                        P_ORGANIZATION_ID,
                        P_INVENTORY_ITEM_ID,
                        P_PRODUCT_CODE,
                        'Y',                                    ---UNIQUE_KEY,
                        'N',                                   ---NUMERIC_KEY,
                        'Y',                                  --CHECK_BARCODE,
                        'N',                                      ---IMEI_KEY,
                        'Y',                              --ALLOW_SPECIALCHAR,
                        20,                                ---IMEI_LENGTH_MAX,
                        10,                                 --IMEI_LENGTH_MIN,
                        'Y',                                 ---SCAN_REQUIRED,
                        'Y',                                        ---STATUS,
                        'Y',                                        ---ENABLED
                        'HYKE_DF');
            END IF;
        END IF;
    EXCEPTION
        WHEN OTHERS
        THEN
        p_ERROR := SQLERRM;
            DBMS_OUTPUT.put_line (p_ERROR);
             
    END;
END PKG_SCAN_CONFIG;

---AXKACHUA55025201
/
