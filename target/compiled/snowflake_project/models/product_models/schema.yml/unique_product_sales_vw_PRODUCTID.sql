
    
    

select
    PRODUCTID as unique_field,
    count(*) as n_records

from DQLABS_QA.DBT_CORE.product_sales_vw
where PRODUCTID is not null
group by PRODUCTID
having count(*) > 1


