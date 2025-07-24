# Retail Sales Data Transformation Pipeline

## Overview
This dbt project implements a two-level transformation model for retail sales data from the `DQLABS_QA.STAGING.RETAIL_SALES` table. The pipeline ensures data quality, removes duplicates and nulls, and creates specialized fact tables for business analysis.

## Architecture

### Data Flow
```
DQLABS_QA.STAGING.RETAIL_SALES (Source)
           ↓
    stg_retail_sales (Level 1 - Clean Staging)
           ↓
    ┌─────────────────┬─────────────────┐
    ↓                 ↓                 ↓
fct_electronics_   fct_macbook_air_   Other Fact
sales              sales              Tables
```

## Models

### Level 1: Staging Layer

#### `stg_retail_sales`
**Purpose**: Clean staging model that removes nulls and duplicates from source data

**Key Features**:
- Removes all records with null values in any column
- Deduplicates based on RECORD_ID (keeps most recent by date and highest amount)
- Selects only required columns from source
- Materialized as table for performance

**Columns**:
- `RECORD_ID` - Unique record identifier
- `DATE` - Date of sale
- `STORE_ID` - Store identifier
- `PRODUCT_NAME` - Product name
- `CATEGORY` - Product category
- `QUANTITY` - Quantity sold
- `UNIT_PRICE` - Price per unit
- `TOTAL_AMOUNT` - Total sale amount
- `CUSTOMER_ID` - Customer identifier
- `SALES_REP` - Sales representative
- `REGION` - Sales region

### Level 2: Marts Layer

#### `fct_electronics_sales`
**Purpose**: Fact table for Electronics category sales with business logic

**Key Features**:
- Filters for `CATEGORY = 'Electronics'`
- Adds calculated fields and business logic
- Includes data validation and quality checks
- Provides order size and value categorizations

**Additional Columns**:
- `CALCULATED_TOTAL` - Quantity * Unit_Price
- `PRICE_VALIDATION` - Validates price calculations
- `SALE_YEAR/MONTH/DAY/QUARTER` - Date dimensions
- `ORDER_SIZE` - Small/Medium/Bulk order classification
- `ORDER_VALUE_CATEGORY` - Low/Medium/High value classification

#### `fct_macbook_air_sales`
**Purpose**: Specialized fact table for MacBook Air products with detailed analysis

**Key Features**:
- Filters for MacBook Air products in Electronics category
- Advanced customer segmentation
- Regional analysis and seasonal patterns
- Revenue and profit margin calculations

**Additional Columns**:
- `PRODUCT_TYPE` - MacBook Air classification
- `PRICE_TIER` - Budget/Standard/Premium model classification
- `CUSTOMER_SEGMENT` - Standard/Premium/VIP customer classification
- `REGION_GROUP` - Geographic region grouping
- `PURCHASE_TYPE` - Single/Multiple/Bulk purchase classification
- `ESTIMATED_PROFIT_MARGIN` - 10% of total amount
- `ESTIMATED_COMMISSION` - 5% of total amount
- `SALE_PERIOD` - Weekend/Weekday classification
- `SEASONAL_PERIOD` - Holiday/Summer/Regular season classification

## Data Quality Features

### Staging Layer Quality Checks
- **Null Removal**: All records with null values are filtered out
- **Duplicate Handling**: Uses ROW_NUMBER() to keep most recent/highest value records
- **Data Validation**: Ensures all required fields are present

### Mart Layer Quality Checks
- **Business Logic Validation**: Price calculations and order classifications
- **Data Type Validation**: Ensures numeric fields are positive
- **Category Filtering**: Strict filtering for specific categories/products
- **Referential Integrity**: Maintains relationships between models

## Custom Tests

### `positive_values`
Custom test macro that validates numeric columns contain only positive values.

**Usage**:
```yaml
- name: QUANTITY
  tests:
    - positive_values
```

## Running the Pipeline

### Prerequisites
1. Configure Snowflake connection in `profiles.yml`
2. Ensure access to `DQLABS_QA.STAGING.RETAIL_SALES` table
3. Install dbt dependencies

### Commands

```bash
# Run all models
dbt run

# Run specific model
dbt run --select stg_retail_sales

# Run models with specific tags
dbt run --select tag:staging
dbt run --select tag:marts

# Run tests
dbt test

# Generate documentation
dbt docs generate
dbt docs serve
```

## Business Logic

### Order Size Classification
- **Small Order**: Quantity < 5
- **Medium Order**: Quantity 5-9
- **Bulk Order**: Quantity ≥ 10

### Order Value Classification
- **Low Value**: Total Amount < $500
- **Medium Value**: Total Amount $500-$999
- **High Value**: Total Amount ≥ $1000

### Customer Segmentation (MacBook Air)
- **Standard Customer**: Total Amount < $1000
- **Premium Customer**: Total Amount $1000-$1999
- **VIP Customer**: Total Amount ≥ $2000

### Price Tier Classification (MacBook Air)
- **Budget Model**: Unit Price < $900
- **Standard Model**: Unit Price $900-$1199
- **Premium Model**: Unit Price ≥ $1200

## Performance Considerations

### Materialization Strategy
- **Staging**: Tables for performance and data persistence
- **Marts**: Tables for analytical query performance

### Optimization Features
- **Incremental Processing**: Can be configured for large datasets
- **Partitioning**: Date-based partitioning for time-series data
- **Clustering**: RECORD_ID clustering for efficient lookups

## Monitoring and Alerting

### Key Metrics to Monitor
- **Data Volume**: Record counts at each transformation level
- **Data Quality**: Null/duplicate percentages
- **Processing Time**: Model execution duration
- **Business Metrics**: Sales trends, customer segments, regional performance

### Recommended Alerts
- Staging model record count drops
- Data quality test failures
- Processing time exceeds thresholds
- Business metric anomalies

## Future Enhancements

### Planned Features
1. **Incremental Processing**: For large datasets
2. **Data Lineage**: End-to-end data flow tracking
3. **Advanced Analytics**: ML-powered insights
4. **Real-time Processing**: Near real-time data updates
5. **Multi-region Support**: Global data processing

### Potential Extensions
- Customer lifetime value calculations
- Product recommendation engine
- Seasonal trend analysis
- Predictive sales forecasting
- Inventory optimization insights

## Troubleshooting

### Common Issues
1. **Source Data Changes**: Update source definitions in `sources.yml`
2. **Performance Issues**: Check materialization strategy and clustering
3. **Test Failures**: Review data quality and business logic
4. **Dependency Errors**: Ensure proper model references

### Debug Commands
```bash
# Check model dependencies
dbt ls --select +model_name

# Validate model syntax
dbt compile --select model_name

# Check source freshness
dbt source freshness

# Run specific tests
dbt test --select model_name
```

---

*This documentation provides a comprehensive guide to the retail sales transformation pipeline. For additional support, refer to the dbt documentation or contact the data engineering team.* 