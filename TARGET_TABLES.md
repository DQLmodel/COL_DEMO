# Target Table Names - Retail Sales Pipeline

## Overview
This document shows the exact target table names that will be created in Snowflake when you run the dbt models. The table names follow the pattern: `DATABASE.SCHEMA.MODEL_NAME`

## Environment Configuration

### All Environments (dev, stage, prod)
- **Account**: `tr68481.us-east-2.aws`
- **Database**: `DQLABS_QA`
- **Schema**: `ZTEST`
- **Warehouse**: `DQLABS_QA`
- **User**: `USER_QA`

## Target Table Names

### Level 1: Staging Models

#### 1. Clean Staging Table
```
DQLABS_QA.ZTEST.STG_RETAIL_SALES
```

**Description**: Clean staging model with no nulls or duplicates
**Source**: `DQLABS_QA.STAGING.RETAIL_SALES`
**Materialization**: Table
**Columns**: RECORD_ID, DATE, STORE_ID, PRODUCT_NAME, CATEGORY, QUANTITY, UNIT_PRICE, TOTAL_AMOUNT, CUSTOMER_ID, SALES_REP, REGION

### Level 2: Mart Models

#### 2. Electronics Sales Fact Table
```
DQLABS_QA.ZTEST.FCT_ELECTRONICS_SALES
```

**Description**: Fact table for Electronics category sales
**Source**: `DQLABS_QA.ZTEST.STG_RETAIL_SALES`
**Materialization**: Table
**Filter**: CATEGORY = 'Electronics'

**Additional Columns**:
- CALCULATED_TOTAL
- PRICE_VALIDATION
- SALE_YEAR, SALE_MONTH, SALE_DAY, SALE_QUARTER
- ORDER_SIZE
- ORDER_VALUE_CATEGORY
- LOADED_AT
- DBT_RUN_ID

#### 3. MacBook Air Sales Fact Table
```
DQLABS_QA.ZTEST.FCT_MACBOOK_AIR_SALES
```

**Description**: Specialized fact table for MacBook Air products
**Source**: `DQLABS_QA.ZTEST.STG_RETAIL_SALES`
**Materialization**: Table
**Filter**: PRODUCT_NAME LIKE '%macbook air%' AND CATEGORY = 'Electronics'

**Additional Columns**:
- PRODUCT_TYPE
- PRICE_TIER
- AVG_UNIT_PRICE
- CUSTOMER_SEGMENT
- REGION_GROUP
- SALE_YEAR, SALE_MONTH, SALE_DAY, SALE_QUARTER, SALE_DAY_OF_WEEK
- PURCHASE_TYPE
- ESTIMATED_PROFIT_MARGIN
- ESTIMATED_COMMISSION
- SALE_PERIOD
- SEASONAL_PERIOD
- LOADED_AT
- DBT_RUN_ID

## Running Commands and Expected Tables

### Development Run
```bash
cd snowflake_project
dbt run --target dev
```

**Tables Created**:
- `DQLABS_QA.ZTEST.STG_RETAIL_SALES`
- `DQLABS_QA.ZTEST.FCT_ELECTRONICS_SALES`
- `DQLABS_QA.ZTEST.FCT_MACBOOK_AIR_SALES`

### Staging Run
```bash
cd snowflake_project
dbt run --target stage
```

**Tables Created**:
- `DQLABS_QA.ZTEST.STG_RETAIL_SALES`
- `DQLABS_QA.ZTEST.FCT_ELECTRONICS_SALES`
- `DQLABS_QA.ZTEST.FCT_MACBOOK_AIR_SALES`

### Production Run
```bash
cd snowflake_project
dbt run --target prod
```

**Tables Created**:
- `DQLABS_QA.ZTEST.STG_RETAIL_SALES`
- `DQLABS_QA.ZTEST.FCT_ELECTRONICS_SALES`
- `DQLABS_QA.ZTEST.FCT_MACBOOK_AIR_SALES`

## Selective Runs

### Run Only Staging Models
```bash
dbt run --select tag:staging --target dev
```

**Tables Created**:
- `DQLABS_QA.ZTEST.STG_RETAIL_SALES`

### Run Only Mart Models
```bash
dbt run --select tag:marts --target dev
```

**Tables Created**:
- `DQLABS_QA.ZTEST.FCT_ELECTRONICS_SALES`
- `DQLABS_QA.ZTEST.FCT_MACBOOK_AIR_SALES`

### Run Specific Model
```bash
dbt run --select stg_retail_sales --target dev
```

**Tables Created**:
- `DQLABS_QA.ZTEST.STG_RETAIL_SALES`

## Verification Queries

### Check if Tables Exist
```sql
-- Check staging table
SELECT COUNT(*) as record_count 
FROM DQLABS_QA.ZTEST.STG_RETAIL_SALES;

-- Check electronics sales table
SELECT COUNT(*) as record_count 
FROM DQLABS_QA.ZTEST.FCT_ELECTRONICS_SALES;

-- Check MacBook Air sales table
SELECT COUNT(*) as record_count 
FROM DQLABS_QA.ZTEST.FCT_MACBOOK_AIR_SALES;
```

### Verify Data Quality
```sql
-- Check for nulls in staging
SELECT COUNT(*) as null_records
FROM DQLABS_QA.ZTEST.STG_RETAIL_SALES
WHERE RECORD_ID IS NULL OR DATE IS NULL OR STORE_ID IS NULL;

-- Check electronics category filter
SELECT DISTINCT CATEGORY 
FROM DQLABS_QA.ZTEST.FCT_ELECTRONICS_SALES;

-- Check MacBook Air product filter
SELECT DISTINCT PRODUCT_NAME 
FROM DQLABS_QA.ZTEST.FCT_MACBOOK_AIR_SALES;
```

## Connection Details

**Snowflake Configuration**:
- **Account**: `tr68481.us-east-2.aws`
- **User**: `USER_QA`
- **Password**: `Dql@bs2022`
- **Database**: `DQLABS_QA`
- **Warehouse**: `DQLABS_QA`
- **Schema**: `ZTEST`

## Quick Start Commands

### 1. First Time Setup
```bash
cd snowflake_project
dbt deps
dbt debug
```

### 2. Development Run
```bash
dbt run --target dev
```

### 3. Test Data Quality
```bash
dbt test --target dev
```

### 4. Generate Documentation
```bash
dbt docs generate
dbt docs serve
```

## Expected Results

After running the pipeline, you should see:

1. **3 tables created** in `DQLABS_QA.ZTEST` schema
2. **Clean data** with no nulls or duplicates
3. **Business logic applied** with calculated fields
4. **Data quality tests passing**
5. **Documentation generated**

## Troubleshooting

### Common Issues
1. **Permission Errors**: Ensure USER_QA has CREATE TABLE permissions on ZTEST schema
2. **Schema Not Found**: Verify the ZTEST schema exists in DQLABS_QA database
3. **Source Table Missing**: Check if `DQLABS_QA.STAGING.RETAIL_SALES` exists
4. **Warehouse Issues**: Ensure DQLABS_QA warehouse is active

### Debug Commands
```bash
# Check dbt configuration
dbt debug

# List all models
dbt ls

# Show model dependencies
dbt ls --select +model_name

# Compile models without running
dbt compile
```

---

*This document provides complete information about target table names and how to run the retail sales pipeline with the correct Snowflake connection details.* 