
  
    

        create or replace transient table DQLABS_QA.DBT_CORE.stg_customers
         as
        (select
    customer_id,
    first_name,
    last_name
from DQLABS_QA.DBT_CORE.customers
        );
      
  