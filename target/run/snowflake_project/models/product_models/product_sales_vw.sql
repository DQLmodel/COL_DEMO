
  create or replace   view DQLABS_QA.DBT_CORE.product_sales_vw
  
   as (
    

with product_sales_vw as (
SELECT PRODUCTID, TOTAL_AMOUNT AS TOTAL_AMOUNT_SALES
FROM DQLABS_QA.STAGING.PRODUCT_SALES
)
select * from product_sales_vw
  );

