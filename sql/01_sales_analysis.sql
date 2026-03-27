-- =====================================
-- DEMAND AND SALES INTELLIGENCE 
-- =====================================

-- What is the monthly revenue trend over the 3-year period (FY based)?

SELECT
CASE 
WHEN EXTRACT(MONTH FROM dispatch_date::date) >= 4
THEN EXTRACT(YEAR FROM dispatch_date::date):: text || '-' ||  (EXTRACT(YEAR FROM dispatch_date::date) + 1) ::text
ELSE (EXTRACT(YEAR FROM dispatch_date::date) - 1)::text || '-' || EXTRACT(YEAR FROM dispatch_date::date)::text
END AS financial_year,
TO_CHAR(dispatch_date::date, 'YYYY-MM') AS month,
SUM(revenue) AS monthly_revenue
FROM sales_base 
GROUP BY financial_year, month
ORDER BY financial_year, month;

-- What is the cumulative revenue withing each financial year?

WITH monthly_revenue AS(
SELECT
CASE 
WHEN EXTRACT(MONTH FROM order_date::date) >=4
THEN EXTRACT(YEAR FROM order_date::date)::text || '-' || (EXTRACT(YEAR FROM order_date::date)+1)::text
ELSE (EXTRACT(YEAR FROM order_date::date) - 1)::text || '-' || EXTRACT(YEAR FROM order_date::date)::text
END AS financial_year,
TO_CHAR(dispatch_date::date, 'YYYY-MM') AS month,
SUM(revenue)  AS month_revenue
FROM sales_base 
GROUP BY  financial_year, month
)

SELECT 
month, 
financial_year, 
month_revenue,
SUM(month_revenue) OVER(PARTITION BY financial_year ORDER BY month) AS cumulative_revenue
FROM monthly_revenue 
ORDER BY financial_year, month;

-- How do monthly production values compare with monthly sales demand?

WITH monthly_production AS (
SELECT 
TO_CHAR(batch_completion_date::date, 'YYYY-MM') AS month,
SUM(quantity_produced) AS production_units
FROM production_batches 
GROUP BY month
),

monthly_sales AS (
SELECT 
TO_CHAR(dispatch_date::date, 'YYYY-MM') AS month,
SUM(quantity) AS sales_units
FROM sales_base 
GROUP BY month
)

SELECT
p.month, 
production_units,
sales_units,
production_units - sales_units AS production_sales_gap

FROM monthly_production p
FULL JOIN monthly_sales s
on p.month = s.month
ORDER BY p.month;

-- What is the demand distribution across product sizes?

SELECT
size,
SUM(quantity) AS total_units_sold
FROM sales_base
GROUP BY size
ORDER BY total_units_sold DESC;

-- What is the average order size and order frequency for distributors?

WITH order_size AS(
SELECT 
order_id,
distributor_id,
SUM(quantity) AS order_units
FROM sales_base 
GROUP BY order_id, distributor_id
)

SELECT 
distributor_id,
COUNT(order_id) AS total_orders,
AVG(order_units)::int AS avg_order_size
FROM order_size 
GROUP BY distributor_id
ORDER BY total_orders DESC;

