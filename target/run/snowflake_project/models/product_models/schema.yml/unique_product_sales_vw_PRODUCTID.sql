select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    PRODUCTID as unique_field,
    count(*) as n_records

from DQLABS_QA.DBT_CORE.product_sales_vw
where PRODUCTID is not null
group by PRODUCTID
having count(*) > 1



      
    ) dbt_internal_test