-- Cross-check all records in Snowflake tables
-- This will show you exactly what data is in each table

-- 1. Check source table records
SELECT '=== SOURCE TABLE (RETAIL_SALES) ===' as table_info;
SELECT COUNT(*) as total_records FROM DQLABS_QA.STAGING.RETAIL_SALES;

-- 2. Check staging table records
SELECT '=== STAGING TABLE (STG_RETAIL_SALES) ===' as table_info;
SELECT COUNT(*) as total_records FROM DQLABS_QA.DBT_MODELS.STG_RETAIL_SALES;

-- 3. Check electronics sales table records
SELECT '=== ELECTRONICS SALES (FCT_ELECTRONICS_SALES) ===' as table_info;
SELECT COUNT(*) as total_records FROM DQLABS_QA.DBT_MODELS.FCT_ELECTRONICS_SALES;

-- 4. Check MacBook Air sales table records
SELECT '=== MACBOOK AIR SALES (FCT_MACBOOK_AIR_SALES) ===' as table_info;
SELECT COUNT(*) as total_records FROM DQLABS_QA.DBT_MODELS.FCT_MACBOOK_AIR_SALES; 