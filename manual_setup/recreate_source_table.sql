-- Recreate the source table with correct column names
-- This ensures the column names match what dbt expects

-- Step 1: Drop and recreate the table with correct structure
DROP TABLE IF EXISTS DQLABS_QA.STAGING.RETAIL_SALES;

CREATE TABLE DQLABS_QA.STAGING.RETAIL_SALES (
    RECORD_ID VARCHAR(50),
    "DATE" DATE,
    STORE_ID VARCHAR(20),
    PRODUCT_NAME VARCHAR(100),
    CATEGORY VARCHAR(50),
    QUANTITY INTEGER,
    UNIT_PRICE DECIMAL(10,2),
    TOTAL_AMOUNT DECIMAL(12,2),
    CUSTOMER_ID VARCHAR(20),
    SALES_REP VARCHAR(50),
    REGION VARCHAR(30),
    CREATED_AT TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

-- Step 2: Insert the data with correct column names
INSERT INTO DQLABS_QA.STAGING.RETAIL_SALES (
    RECORD_ID, "DATE", STORE_ID, PRODUCT_NAME, CATEGORY, 
    QUANTITY, UNIT_PRICE, TOTAL_AMOUNT, CUSTOMER_ID, SALES_REP, REGION
) VALUES
-- Electronics Category
(1, '2024-01-15', 'ST001', 'iPhone 15 Pro', 'Electronics', 2, 999.99, 1999.98, 'CUST001', 'John Smith', 'North'),
(2, '2024-01-16', 'ST002', 'Samsung Galaxy S24', 'Electronics', 1, 899.99, 899.99, 'CUST002', 'Sarah Johnson', 'South'),
(3, '2024-01-17', 'ST001', 'MacBook Air', 'Electronics', 1, 1299.99, 1299.99, 'CUST003', 'John Smith', 'North'),
(4, '2024-01-18', 'ST003', 'Dell XPS 13', 'Electronics', 3, 1199.99, 3599.97, 'CUST004', 'Mike Davis', 'West'),
(5, NULL, 'ST002', 'Nike Air Max', 'Footwear', 2, 120.00, 240.00, 'CUST005', 'Sarah Johnson', 'South'),
(6, '2024-01-20', 'ST001', 'Adidas Ultraboost', 'Footwear', 1, 180.00, 180.00, 'CUST006', 'John Smith', 'North'),
(7, '2024-01-21', 'ST004', 'Levi''s Jeans', 'Clothing', 4, 79.99, 319.96, 'CUST007', 'Lisa Wilson', 'East'),
(8, '2024-01-22', 'ST002', 'H&M T-Shirt', 'Clothing', 6, 19.99, 119.94, 'CUST008', 'Sarah Johnson', 'South'),
(9, '2024-01-23', 'ST003', 'Zara Dress', 'Clothing', 2, 89.99, 179.98, 'CUST009', 'Mike Davis', 'West'),
(10, '2024-01-24', 'ST001', 'Coffee Maker', 'Home & Kitchen', 1, 149.99, 149.99, 'CUST010', 'John Smith', 'North'),
(11, '2024-01-25', 'ST002', 'Blender', 'Home & Kitchen', 2, 79.99, 159.98, 'CUST011', 'Sarah Johnson', 'South'),
(12, '2024-01-26', 'ST004', 'Toaster', 'Home & Kitchen', 1, 49.99, 49.99, 'CUST012', 'Lisa Wilson', 'East'),
(13, '2024-01-27', 'ST003', 'Vacuum Cleaner', 'Home & Kitchen', 1, 299.99, 299.99, NULL, 'Mike Davis', 'West'),
(14, '2024-01-28', 'ST001', 'Dining Table', 'Furniture', 1, 599.99, 599.99, 'CUST014', 'John Smith', 'North'),
(15, '2024-01-29', 'ST002', 'Office Chair', 'Furniture', 3, 199.99, 599.97, 'CUST015', 'Sarah Johnson', 'South'),
(16, '2024-01-30', 'ST004', 'Bookshelf', 'Furniture', 2, 129.99, 259.98, 'CUST016', 'Lisa Wilson', 'East'),
(17, '2024-01-31', 'ST003', 'Sofa Set', 'Furniture', 1, 1299.99, 1299.99, 'CUST017', 'Mike Davis', 'West'),
(18, '2024-02-01', 'ST001', 'Protein Powder', 'Health & Beauty', 4, 39.99, 159.96, 'CUST018', 'John Smith', 'North'),
(19, '2024-02-02', 'ST002', 'Face Cream', 'Health & Beauty', 2, 24.99, 49.98, 'CUST019', 'Sarah Johnson', 'South'),
(20, '2024-02-03', 'ST004', 'Shampoo', 'Health & Beauty', 6, 12.99, 77.94, 'CUST020', 'Lisa Wilson', 'East'),
(21, '2024-02-04', 'ST003', 'Multivitamin', 'Health & Beauty', 3, 29.99, 89.97, 'CUST021', 'Mike Davis', 'West'),
(22, '2024-02-05', 'ST001', 'Basketball', 'Sports', 2, 49.99, 99.98, 'CUST022', 'John Smith', 'North'),
(23, '2024-02-06', 'ST002', 'Tennis Racket', 'Sports', 1, 129.99, 129.99, 'CUST023', 'Sarah Johnson', 'South'),
(24, '2024-02-07', 'ST004', 'Golf Clubs', 'Sports', 1, 599.99, 599.99, 'CUST024', 'Lisa Wilson', 'East'),
(25, '2024-02-08', 'ST003', 'Yoga Mat', 'Sports', 4, 29.99, 119.96, 'CUST025', 'Mike Davis', 'West'),
(26, NULL, 'ST001', 'iPhone 15 Pro', 'Electronics', -2, 999.99, -1999.98, 'CUST026', 'John Smith', 'North'),
(27, '2024-02-10', 'ST002', 'Samsung Galaxy S24', 'Electronics', 0, 899.99, 0.00, 'CUST027', 'Sarah Johnson', 'South'),
(28, '2024-02-11', 'ST004', 'iPad Pro', 'Electronics', 1, NULL, 1099.99, 'CUST028', 'Lisa Wilson', 'East'),
(29, '2024-02-12', 'ST003', 'MacBook Pro', 'Electronics', 1, 2499.99, 2499.99, 'CUST029', 'Mike Davis', 'West'),
(30, '2024-02-13', 'ST001', 'Apple Watch', 'Electronics', 50000, 399.99, 19999500.00, 'CUST030', 'John Smith', 'North'),
(31, '2024-02-14', 'ST002', NULL, 'Footwear', 1, 150.00, 150.00, 'CUST031', 'Sarah Johnson', 'South'),
(32, '2024-02-15', 'ST004', 'Converse Sneakers', 'Footwear', 3, 65.00, 195.00, 'CUST032', 'Lisa Wilson', 'East'),
(33, '2024-02-16', 'ST003', 'Puma Running Shoes', 'Footwear', 2, 110.00, 220.00, 'CUST033', 'Mike Davis', 'West'),
(34, '2024-02-17', 'ST001', 'Reebok CrossFit', 'Footwear', 1, 140.00, 140.00, 'CUST034', 'John Smith', 'North'),
(35, '2024-02-18', 'ST002', 'Gucci Handbag', 'Clothing', 1, 2500.00, 2500.00, 'CUST035', 'Sarah Johnson', 'South'),
(36, '2024-02-19', 'ST004', 'Calvin Klein Jeans', 'Clothing', 2, 89.99, 179.98, 'CUST036', 'Lisa Wilson', 'East'),
(37, '2024-02-20', 'ST003', 'Ralph Lauren Polo', 'Clothing', 4, 69.99, 279.96, 'CUST037', 'Mike Davis', 'West'),
(38, '2024-02-21', 'ST001', 'Tommy Hilfiger Shirt', 'Clothing', 3, 79.99, 239.97, 'CUST038', 'John Smith', 'North'),
(39, '2024-02-22', 'ST002', 'KitchenAid Mixer', 'Home & Kitchen', 1, 399.99, 399.99, 'CUST039', 'Sarah Johnson', 'South'),
(40, '2024-02-23', 'ST004', 'Instant Pot', 'Home & Kitchen', 2, 99.99, 199.98, 'CUST040', 'Lisa Wilson', 'East'),
(41, '2024-02-24', 'ST003', 'Air Fryer', 'Home & Kitchen', 3, 129.99, 389.97, 'CUST041', 'Mike Davis', 'West'),
(42, '2024-02-25', 'ST001', 'Food Processor', 'Home & Kitchen', 1, 199.99, 199.99, 'CUST042', 'John Smith', 'North'),
(43, '2024-02-26', 'ST002', 'Queen Bed Frame', 'Furniture', 1, 799.99, 799.99, 'CUST043', 'Sarah Johnson', 'South'),
(44, '2024-02-27', 'ST004', 'Dresser', 'Furniture', 2, 399.99, 799.98, 'CUST044', 'Lisa Wilson', 'East'),
(45, '2024-02-28', 'ST003', 'Nightstand', 'Furniture', 4, 149.99, 599.96, 'CUST045', 'Mike Davis', 'West'),
(46, '2024-02-29', 'ST001', 'Wardrobe', 'Furniture', 1, 999.99, 999.99, 'CUST046', 'John Smith', 'North'),
(47, '2024-03-01', 'ST002', 'Moisturizer', 'Health & Beauty', 3, 34.99, 104.97, 'CUST047', 'Sarah Johnson', 'South'),
(48, '2024-03-02', 'ST004', 'Sunscreen', 'Health & Beauty', 5, 18.99, 94.95, 'CUST048', 'Lisa Wilson', 'East'),
(49, '2024-03-03', 'ST003', 'Perfume', 'Health & Beauty', 2, 89.99, 179.98, 'CUST049', 'Mike Davis', 'West'),
(50, '2024-03-04', 'ST001', 'Hair Dryer', 'Health & Beauty', 1, 79.99, 79.99, 'CUST050', 'John Smith', 'North'),
(51, '2024-03-05', 'ST002', 'Football', 'Sports', 1, 29.99, 29.99, 'CUST051', 'Sarah Johnson', 'South'),
(52, '2024-03-06', 'ST004', 'Baseball Glove', 'Sports', 2, 79.99, 159.98, 'CUST052', 'Lisa Wilson', 'East'),
(53, '2024-03-07', 'ST003', 'Dumbbells', 'Sports', 1, 199.99, 199.99, 'CUST053', 'Mike Davis', 'West'),
(54, '2024-03-08', 'ST001', 'Treadmill', 'Sports', 1, 1299.99, 1299.99, 'CUST054', 'John Smith', 'North');

-- Step 3: Verify the table structure and data
SELECT '=== TABLE RECREATED SUCCESSFULLY ===' as status;
SELECT COUNT(*) as total_records FROM DQLABS_QA.STAGING.RETAIL_SALES;

-- Show the table structure
DESCRIBE TABLE DQLABS_QA.STAGING.RETAIL_SALES;

-- Show sample data
SELECT '=== SAMPLE DATA ===' as info;
SELECT RECORD_ID, "DATE", PRODUCT_NAME, CATEGORY, TOTAL_AMOUNT 
FROM DQLABS_QA.STAGING.RETAIL_SALES 
LIMIT 5; 