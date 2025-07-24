
  
    

        create or replace transient table DQLABS_QA.DBT_CORE.stg_orders
         as
        (select
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from DQLABS_QA.DBT_CORE.orders
        );
      
  