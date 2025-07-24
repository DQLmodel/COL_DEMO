-- Insert sample data into the source table: retail_sales
INSERT INTO DQLABS_QA.STAGING.RETAIL_SALES (
    RECORD_ID, "DATE", STORE_ID, PRODUCT_NAME, CATEGORY, 
    QUANTITY, UNIT_PRICE, TOTAL_AMOUNT, CUSTOMER_ID, SALES_REP, REGION
) VALUES
-- Electronics Category
('RS001', '2024-01-15', 'STORE001', 'MacBook Air M2', 'Electronics', 1, 1199.99, 1199.99, 'CUST001', 'John Smith', 'North'),
('RS002', '2024-01-16', 'STORE002', 'iPhone 15 Pro', 'Electronics', 2, 999.99, 1999.98, 'CUST002', 'Sarah Johnson', 'South'),
('RS003', '2024-01-17', 'STORE003', 'MacBook Air M1', 'Electronics', 1, 999.99, 999.99, 'CUST003', 'Mike Davis', 'West'),
('RS004', '2024-01-18', 'STORE001', 'iPad Pro', 'Electronics', 3, 799.99, 2399.97, 'CUST004', 'John Smith', 'North'),
('RS005', '2024-01-19', 'STORE002', 'MacBook Air M2', 'Electronics', 1, 1199.99, 1199.99, 'CUST005', 'Sarah Johnson', 'South'),
('RS006', '2024-01-20', 'STORE003', 'AirPods Pro', 'Electronics', 5, 249.99, 1249.95, 'CUST006', 'Mike Davis', 'West'),
('RS007', '2024-01-21', 'STORE001', 'MacBook Air M2', 'Electronics', 2, 1199.99, 2399.98, 'CUST007', 'John Smith', 'North'),
('RS008', '2024-01-22', 'STORE002', 'Apple Watch', 'Electronics', 1, 399.99, 399.99, 'CUST008', 'Sarah Johnson', 'South'),
('RS009', '2024-01-23', 'STORE003', 'MacBook Air M1', 'Electronics', 1, 999.99, 999.99, 'CUST009', 'Mike Davis', 'West'),
('RS010', '2024-01-24', 'STORE001', 'iPhone 15', 'Electronics', 4, 799.99, 3199.96, 'CUST010', 'John Smith', 'North'),

-- Clothing Category
('RS011', '2024-01-15', 'STORE001', 'Nike Running Shoes', 'Clothing', 2, 89.99, 179.98, 'CUST011', 'John Smith', 'North'),
('RS012', '2024-01-16', 'STORE002', 'Adidas Jacket', 'Clothing', 1, 129.99, 129.99, 'CUST012', 'Sarah Johnson', 'South'),
('RS013', '2024-01-17', 'STORE003', 'Levi Jeans', 'Clothing', 3, 59.99, 179.97, 'CUST013', 'Mike Davis', 'West'),
('RS014', '2024-01-18', 'STORE001', 'Puma T-Shirt', 'Clothing', 5, 29.99, 149.95, 'CUST014', 'John Smith', 'North'),
('RS015', '2024-01-19', 'STORE002', 'Under Armour Hoodie', 'Clothing', 2, 79.99, 159.98, 'CUST015', 'Sarah Johnson', 'South'),

-- Home & Garden Category
('RS016', '2024-01-15', 'STORE001', 'Coffee Maker', 'Home & Garden', 1, 199.99, 199.99, 'CUST016', 'John Smith', 'North'),
('RS017', '2024-01-16', 'STORE002', 'Garden Tools Set', 'Home & Garden', 1, 149.99, 149.99, 'CUST017', 'Sarah Johnson', 'South'),
('RS018', '2024-01-17', 'STORE003', 'Blender', 'Home & Garden', 2, 89.99, 179.98, 'CUST018', 'Mike Davis', 'West'),
('RS019', '2024-01-18', 'STORE001', 'Plant Pots Set', 'Home & Garden', 3, 39.99, 119.97, 'CUST019', 'John Smith', 'North'),
('RS020', '2024-01-19', 'STORE002', 'Kitchen Mixer', 'Home & Garden', 1, 299.99, 299.99, 'CUST020', 'Sarah Johnson', 'South'),

-- More Electronics (MacBook Air specific)
('RS021', '2024-01-25', 'STORE001', 'MacBook Air M2 13-inch', 'Electronics', 1, 1199.99, 1199.99, 'CUST021', 'John Smith', 'North'),
('RS022', '2024-01-26', 'STORE002', 'MacBook Air M2 15-inch', 'Electronics', 1, 1299.99, 1299.99, 'CUST022', 'Sarah Johnson', 'South'),
('RS023', '2024-01-27', 'STORE003', 'MacBook Air M1 13-inch', 'Electronics', 2, 999.99, 1999.98, 'CUST023', 'Mike Davis', 'West'),
('RS024', '2024-01-28', 'STORE001', 'MacBook Air M2 13-inch', 'Electronics', 1, 1199.99, 1199.99, 'CUST024', 'John Smith', 'North'),
('RS025', '2024-01-29', 'STORE002', 'MacBook Air M2 15-inch', 'Electronics', 3, 1299.99, 3899.97, 'CUST025', 'Sarah Johnson', 'South'),

-- Additional Electronics
('RS026', '2024-01-30', 'STORE003', 'Samsung Galaxy S24', 'Electronics', 1, 899.99, 899.99, 'CUST026', 'Mike Davis', 'West'),
('RS027', '2024-01-31', 'STORE001', 'Sony Headphones', 'Electronics', 2, 299.99, 599.98, 'CUST027', 'John Smith', 'North'),
('RS028', '2024-02-01', 'STORE002', 'Dell Laptop', 'Electronics', 1, 899.99, 899.99, 'CUST028', 'Sarah Johnson', 'South'),
('RS029', '2024-02-02', 'STORE003', 'MacBook Air M2', 'Electronics', 1, 1199.99, 1199.99, 'CUST029', 'Mike Davis', 'West'),
('RS030', '2024-02-03', 'STORE001', 'Gaming Console', 'Electronics', 1, 499.99, 499.99, 'CUST030', 'John Smith', 'North');

-- Verify the data was inserted
SELECT 
    CATEGORY,
    COUNT(*) as record_count,
    SUM(TOTAL_AMOUNT) as total_sales
FROM DQLABS_QA.STAGING.RETAIL_SALES
GROUP BY CATEGORY
ORDER BY total_sales DESC; 