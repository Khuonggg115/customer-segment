-- Customer Segmentation Analysis - SQL Queries
-- Database: SQLite (retail.db)
-- Tables: transactions (data_final.csv), customer_segment (rfm_final.csv)

-- 1. Tổng doanh thu theo từng phân khúc khách hàng
SELECT c.segment, SUM(t.totalprice) AS total_revenue
FROM transactions t
JOIN customer_segment c ON t.customerID = c.customerID
GROUP BY c.segment;

-- 2. Số khách hàng riêng biệt theo từng phân khúc và quốc gia
SELECT c.segment, t.Country, COUNT(DISTINCT c.customerID) AS num_customers
FROM transactions t
JOIN customer_segment c ON t.customerID = c.customerID
GROUP BY c.segment, t.Country;

-- 3. Top 10 sản phẩm bán chạy nhất của nhóm "Champions"
SELECT t.description, SUM(t.quantity) AS total_qty
FROM transactions t
JOIN customer_segment c ON t.customerID = c.customerID
WHERE c.segment = 'Champions'
GROUP BY t.description
ORDER BY total_qty DESC
LIMIT 10;
