-- Check current user and role
SELECT 
    CURRENT_USER() as current_user,
    CURRENT_ROLE() as current_role,
    CURRENT_DATABASE() as current_database,
    CURRENT_SCHEMA() as current_schema;

-- Check available schemas in DQLABS_QA database
SHOW SCHEMAS IN DATABASE DQLABS_QA;

-- Check grants to current role
SHOW GRANTS TO ROLE PUBLIC;

-- Check if ZTEST schema exists and what permissions you have
SELECT 
    SCHEMA_NAME,
    SCHEMA_OWNER,
    IS_TRANSIENT,
    IS_MANAGED_ACCESS
FROM INFORMATION_SCHEMA.SCHEMATA 
WHERE SCHEMA_NAME = 'ZTEST' 
    AND CATALOG_NAME = 'DQLABS_QA';

-- Check your permissions on ZTEST schema (if it exists)
SELECT 
    PRIVILEGE_TYPE,
    IS_GRANTABLE
FROM INFORMATION_SCHEMA.SCHEMA_PRIVILEGES 
WHERE SCHEMA_NAME = 'ZTEST' 
    AND GRANTEE = CURRENT_USER(); 