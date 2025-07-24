-- Detailed analysis to cross-check data quality and categories

-- 1. Check categories distribution in source
SELECT '=== CATEGORIES IN SOURCE ===' as analysis;
SELECT 
    CATEGORY,
    COUNT(*) as record_count,
    SUM(TOTAL_AMOUNT) as total_sales
FROM DQLABS_QA.STAGING.RETAIL_SALES
GROUP BY CATEGORY
ORDER BY record_count DESC;

-- 2. Check categories distribution in staging
SELECT '=== CATEGORIES IN STAGING ===' as analysis;
SELECT 
    CATEGORY,
    COUNT(*) as record_count,
    SUM(TOTAL_AMOUNT) as total_sales
FROM DQLABS_QA.DBT_MODELS.STG_RETAIL_SALES
GROUP BY CATEGORY
ORDER BY record_count DESC;

-- 3. Check electronics products specifically
SELECT '=== ELECTRONICS PRODUCTS DETAIL ===' as analysis;
SELECT 
    PRODUCT_NAME,
    CATEGORY,
    QUANTITY,
    UNIT_PRICE,
    TOTAL_AMOUNT,
    CASE 
        WHEN TOTAL_AMOUNT >= 1000 THEN 'HIGH_VALUE'
        WHEN TOTAL_AMOUNT >= 500 THEN 'MEDIUM_VALUE'
        ELSE 'LOW_VALUE'
    END as value_category
FROM DQLABS_QA.DBT_MODELS.STG_RETAIL_SALES
WHERE UPPER(CATEGORY) LIKE '%ELECTRONIC%'
   OR LOWER(PRODUCT_NAME) LIKE '%iphone%'
   OR LOWER(PRODUCT_NAME) LIKE '%macbook%'
   OR LOWER(PRODUCT_NAME) LIKE '%samsung%'
   OR LOWER(PRODUCT_NAME) LIKE '%dell%'
   OR LOWER(PRODUCT_NAME) LIKE '%ipad%'
   OR LOWER(PRODUCT_NAME) LIKE '%apple%'
ORDER BY TOTAL_AMOUNT DESC;

-- 4. Check MacBook products specifically
SELECT '=== MACBOOK PRODUCTS DETAIL ===' as analysis;
SELECT 
    PRODUCT_NAME,
    CATEGORY,
    QUANTITY,
    UNIT_PRICE,
    TOTAL_AMOUNT,
    CASE 
        WHEN LOWER(PRODUCT_NAME) LIKE '%macbook air%' THEN 'MACBOOK_AIR'
        WHEN LOWER(PRODUCT_NAME) LIKE '%macbook%' THEN 'OTHER_MACBOOK'
        ELSE 'NON_MACBOOK'
    END as product_type
FROM DQLABS_QA.DBT_MODELS.STG_RETAIL_SALES
WHERE LOWER(PRODUCT_NAME) LIKE '%macbook%'
ORDER BY TOTAL_AMOUNT DESC;

-- 5. Summary comparison
SELECT '=== SUMMARY COMPARISON ===' as analysis;
SELECT 
    'Source Table' as table_name,
    COUNT(*) as total_records,
    COUNT(CASE WHEN UPPER(CATEGORY) LIKE '%ELECTRONIC%' THEN 1 END) as electronics_count,
    COUNT(CASE WHEN LOWER(PRODUCT_NAME) LIKE '%macbook%' THEN 1 END) as macbook_count
FROM DQLABS_QA.STAGING.RETAIL_SALES
UNION ALL
SELECT 
    'Staging Table' as table_name,
    COUNT(*) as total_records,
    COUNT(CASE WHEN UPPER(CATEGORY) LIKE '%ELECTRONIC%' THEN 1 END) as electronics_count,
    COUNT(CASE WHEN LOWER(PRODUCT_NAME) LIKE '%macbook%' THEN 1 END) as macbook_count
FROM DQLABS_QA.DBT_MODELS.STG_RETAIL_SALES
UNION ALL
SELECT 
    'Electronics Sales' as table_name,
    COUNT(*) as total_records,
    COUNT(*) as electronics_count,
    0 as macbook_count
FROM DQLABS_QA.DBT_MODELS.FCT_ELECTRONICS_SALES
UNION ALL
SELECT 
    'MacBook Air Sales' as table_name,
    COUNT(*) as total_records,
    0 as electronics_count,
    COUNT(*) as macbook_count
FROM DQLABS_QA.DBT_MODELS.FCT_MACBOOK_AIR_SALES; 