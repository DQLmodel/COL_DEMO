
    
    

with all_values as (

    select
        status as value_field,
        count(*) as n_records

    from DQLABS_QA.DBT_CORE.stg_orders
    group by status

)

select *
from all_values
where value_field not in (
    'placed','shipped','completed','return_pending','returned'
)


