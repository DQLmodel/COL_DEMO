-- Simple fix for zero records - Run each section separately

-- SECTION 1: Check source data (run this first)
SELECT COUNT(*) as source_records FROM DQLABS_QA.STAGING.RETAIL_SALES; 