# Task 3: Retail Orders Database – SQL Fundamentals

## 📌 Overview
This task applies **SQL querying fundamentals** on the Superstore dataset.  
The objective is to practice SELECT, WHERE, ORDER BY, GROUP BY, JOIN, and date functions to extract meaningful business insights.

## 📂 Dataset
- **Name:** Sample Superstore Dataset (Kaggle)
- **Columns:** Order ID, Date, Customer, Region, Category, Sub-Category, Sales, Profit, etc.
- **Rows:** ~10,000  

## 🛠️ Tools Used
- **SQLite ** (Workbench + SQL Server)  
- Dataset loaded into `orders` table in `superstore_db` database  

## 🔎 SQL Queries Performed
1. **View first 10 rows**  
 
   SELECT * FROM orders LIMIT 10;


2. **Filter by Region**

SELECT * FROM orders WHERE region = 'South';


3. **Top 5 Orders by Sales**

SELECT order_id, sales, profit
FROM orders
ORDER BY sales DESC
LIMIT 5;


4. **Total Sales & Profit by Region**

SELECT region, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM orders
GROUP BY region
ORDER BY total_sales DESC;


5. **Monthly Sales Trend**

SELECT MONTH(order_date) AS order_month, SUM(sales) AS monthly_sales
FROM orders
GROUP BY order_month
ORDER BY order_month;


6. **Orders per Payment Type (if column exists)**

SELECT payment, COUNT(*) AS orders_count
FROM orders
GROUP BY payment
ORDER BY orders_count DESC;


7. **JOIN Example (Orders + Returns Table)**

-- Returns table must be created separately
CREATE TABLE returns (
    return_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(50),
    reason VARCHAR(100)
);

SELECT o.order_id, o.sales, r.reason
FROM orders o
INNER JOIN returns r ON o.order_id = r.order_id;


📊 Key Insights (from queries)
- The West region generated the highest sales.
- Certain categories like Technology drive more profit compared to Furniture.
- Sales show a monthly trend with peaks near year-end.
- Profitability varies by region and category combination.

📁 Deliverables
- Sample - Superstore.csv → Raw dataset
- task3_retail_orders_queries.sql → SQL script with all queries
- README.md → This documentation

