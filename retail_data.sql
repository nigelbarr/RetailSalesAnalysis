-- !preview conn=DBI::dbConnect(RSQLite::SQLite(), "retail_data.sqlite")

-- Create a table with the top 3 product categories by total sales
CREATE TABLE category_total_sales AS 
SELECT 
    ProductCategory, 
    SUM(TotalAmount) AS total_sales
FROM retail_sales
GROUP BY ProductCategory
ORDER BY total_sales DESC
LIMIT 3;

-- Create a table with the average transaction amount per store
CREATE TABLE store_transactions AS
SELECT 
    StoreLocation,
    ROUND(AVG(TotalAmount), 2) AS avg_transaction
FROM retail_sales
GROUP BY StoreLocation
ORDER BY avg_transaction DESC;

-- Create a table showing the count of customers per payment method in each store
CREATE TABLE payment_method_dist AS
SELECT
    StoreLocation,
    PaymentMethod,
    COUNT(*) AS total_customers
FROM retail_sales
GROUP BY StoreLocation, PaymentMethod;

-- Create a table listing non-null transactions per category, ordered by amount
CREATE TABLE each_category_sale AS
SELECT 
    ProductCategory,
    TotalAmount  
FROM retail_sales
WHERE TotalAmount IS NOT NULL
ORDER BY TotalAmount DESC;












