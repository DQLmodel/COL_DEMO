select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select PRODUCTID
from DQLABS_QA.DBT_CORE.product_sales_vw
where PRODUCTID is null



      
    ) dbt_internal_test