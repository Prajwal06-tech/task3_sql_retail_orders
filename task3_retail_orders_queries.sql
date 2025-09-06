-- Task 3: Retail Orders Database - Sample Queries

-- 1) View first 10 rows
SELECT row_id, * FROM orders LIMIT 10;

-- 2) Filter orders (example: by region)
SELECT * FROM orders WHERE region = 'South' LIMIT 20;

-- 3) Top 5 orders by sales
SELECT row_id, sales FROM orders ORDER BY sales DESC LIMIT 5;

-- 4) Total sales and profit by region
SELECT region AS region, SUM(sales) AS total_sales, SUM(profit) AS total_profit FROM orders GROUP BY region ORDER BY total_sales DESC;

-- 5) Monthly sales (SQLite strftime; requires a parsable date column)
SELECT strftime('%m', order_date) AS month, SUM(sales) AS monthly_sales FROM orders WHERE order_date IS NOT NULL GROUP BY month ORDER BY month;

-- 6) Count orders per payment type
-- Payment column not found

-- 7) Example JOIN placeholder (requires another table like 'returns')
-- CREATE TABLE returns(return_id, order_id, reason);
-- SELECT o.*, r.reason FROM orders o INNER JOIN returns r ON o.order_id = r.order_id;