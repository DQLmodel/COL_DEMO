

WITH total_sales_vw as (
SELECT 
    es.COMPANY_INFO,
    es.PRODUCTID,
    SUM(ps.TOTAL_AMOUNT_SALES) AS TOTAL_SALES_AMOUNT
FROM 
    DQLABS_QA.DBT_CORE.employee_sales_vw es
JOIN 
    DQLABS_QA.DBT_CORE.product_sales_vw ps
    ON es.PRODUCTID = ps.PRODUCTID
GROUP BY 
    es.COMPANY_INFO,
    es.PRODUCTID
)
SELECT * FROM total_sales_vw