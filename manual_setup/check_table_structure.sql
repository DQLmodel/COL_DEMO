-- Check the actual structure of your source table
-- This will show you the exact column names that exist

-- Check table structure
DESCRIBE TABLE DQLABS_QA.STAGING.RETAIL_SALES;

-- Show column information
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'STAGING' 
    AND TABLE_NAME = 'RETAIL_SALES'
    AND TABLE_CATALOG = 'DQLABS_QA'
ORDER BY ORDINAL_POSITION;

-- Show sample data to see actual column names
SELECT * FROM DQLABS_QA.STAGING.RETAIL_SALES LIMIT 3; 