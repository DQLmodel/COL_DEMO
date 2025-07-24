-- Retail Sales Analysis Queries
-- This file contains sample queries to analyze the transformed retail sales data

-- 1. Electronics Sales Overview
SELECT 
    SALE_YEAR,
    SALE_MONTH,
    COUNT(*) as total_sales,
    SUM(TOTAL_AMOUNT) as total_revenue,
    AVG(TOTAL_AMOUNT) as avg_order_value,
    SUM(QUANTITY) as total_units_sold
FROM {{ ref('fct_electronics_sales') }}
GROUP BY SALE_YEAR, SALE_MONTH
ORDER BY SALE_YEAR DESC, SALE_MONTH DESC;

-- 2. MacBook Air Sales Performance by Region
SELECT 
    REGION_GROUP,
    COUNT(*) as total_sales,
    SUM(TOTAL_AMOUNT) as total_revenue,
    AVG(UNIT_PRICE) as avg_unit_price,
    SUM(ESTIMATED_PROFIT_MARGIN) as estimated_profit,
    SUM(ESTIMATED_COMMISSION) as estimated_commission
FROM {{ ref('fct_macbook_air_sales') }}
GROUP BY REGION_GROUP
ORDER BY total_revenue DESC;

-- 3. Customer Segmentation Analysis
SELECT 
    CUSTOMER_SEGMENT,
    COUNT(*) as customer_count,
    SUM(TOTAL_AMOUNT) as total_spent,
    AVG(TOTAL_AMOUNT) as avg_spend_per_customer,
    COUNT(DISTINCT CUSTOMER_ID) as unique_customers
FROM {{ ref('fct_macbook_air_sales') }}
GROUP BY CUSTOMER_SEGMENT
ORDER BY total_spent DESC;

-- 4. Seasonal Sales Trends
SELECT 
    SEASONAL_PERIOD,
    SALE_PERIOD,
    COUNT(*) as total_sales,
    SUM(TOTAL_AMOUNT) as total_revenue,
    AVG(TOTAL_AMOUNT) as avg_order_value
FROM {{ ref('fct_macbook_air_sales') }}
GROUP BY SEASONAL_PERIOD, SALE_PERIOD
ORDER BY total_revenue DESC;

-- 5. Price Tier Performance
SELECT 
    PRICE_TIER,
    COUNT(*) as units_sold,
    SUM(TOTAL_AMOUNT) as total_revenue,
    AVG(UNIT_PRICE) as avg_unit_price,
    SUM(ESTIMATED_PROFIT_MARGIN) as estimated_profit
FROM {{ ref('fct_macbook_air_sales') }}
GROUP BY PRICE_TIER
ORDER BY total_revenue DESC;

-- 6. Sales Representative Performance
SELECT 
    SALES_REP,
    COUNT(*) as total_sales,
    SUM(TOTAL_AMOUNT) as total_revenue,
    AVG(TOTAL_AMOUNT) as avg_order_value,
    SUM(ESTIMATED_COMMISSION) as estimated_commission
FROM {{ ref('fct_macbook_air_sales') }}
GROUP BY SALES_REP
ORDER BY total_revenue DESC
LIMIT 10;

-- 7. Data Quality Check - Price Validation
SELECT 
    PRICE_VALIDATION,
    COUNT(*) as record_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) as percentage
FROM {{ ref('fct_electronics_sales') }}
GROUP BY PRICE_VALIDATION;

-- 8. Order Size Distribution
SELECT 
    ORDER_SIZE,
    COUNT(*) as order_count,
    SUM(TOTAL_AMOUNT) as total_revenue,
    AVG(TOTAL_AMOUNT) as avg_order_value
FROM {{ ref('fct_electronics_sales') }}
GROUP BY ORDER_SIZE
ORDER BY total_revenue DESC;

-- 9. Monthly Growth Analysis
WITH monthly_sales AS (
    SELECT 
        SALE_YEAR,
        SALE_MONTH,
        SUM(TOTAL_AMOUNT) as monthly_revenue,
        LAG(SUM(TOTAL_AMOUNT)) OVER (ORDER BY SALE_YEAR, SALE_MONTH) as prev_month_revenue
    FROM {{ ref('fct_electronics_sales') }}
    GROUP BY SALE_YEAR, SALE_MONTH
)
SELECT 
    SALE_YEAR,
    SALE_MONTH,
    monthly_revenue,
    prev_month_revenue,
    ROUND((monthly_revenue - prev_month_revenue) * 100.0 / NULLIF(prev_month_revenue, 0), 2) as growth_percentage
FROM monthly_sales
ORDER BY SALE_YEAR DESC, SALE_MONTH DESC;

-- 10. Top Performing Products
SELECT 
    PRODUCT_NAME,
    COUNT(*) as total_sales,
    SUM(TOTAL_AMOUNT) as total_revenue,
    SUM(QUANTITY) as total_units_sold,
    AVG(UNIT_PRICE) as avg_unit_price
FROM {{ ref('fct_electronics_sales') }}
GROUP BY PRODUCT_NAME
ORDER BY total_revenue DESC
LIMIT 20; 