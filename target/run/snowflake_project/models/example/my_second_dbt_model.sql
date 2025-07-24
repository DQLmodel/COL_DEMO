
  create or replace   view DQLABS_QA.DBT_CORE.my_second_dbt_model
  
   as (
    -- Use the `ref` function to select from other models

select *
from DQLABS_QA.DBT_CORE.my_first_dbt_model
where id = 1
  );

