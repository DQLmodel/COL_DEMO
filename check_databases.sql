-- Check current user and role
SELECT 
    CURRENT_USER() as current_user,
    CURRENT_ROLE() as current_role;

-- Show all databases you have access to
SHOW DATABASES;

-- Check your grants on databases
SELECT 
    PRIVILEGE_TYPE,
    OBJECT_NAME as database_name,
    IS_GRANTABLE
FROM INFORMATION_SCHEMA.DATABASE_PRIVILEGES 
WHERE GRANTEE = CURRENT_USER();

-- Check if you can see DQLABS_QA database
SELECT 
    DATABASE_NAME,
    DATABASE_OWNER,
    IS_TRANSIENT,
    IS_MANAGED_ACCESS
FROM INFORMATION_SCHEMA.DATABASES 
WHERE DATABASE_NAME = 'DQLABS_QA'; 