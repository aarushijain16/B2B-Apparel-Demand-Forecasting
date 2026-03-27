-- =============================================
--    PROFITABILITY AND SKU STRATEGY
-- =============================================

-- Which price bands generate the most revenue and margin?

SELECT 
price_band,
SUM(revenue) AS total_revenue,
SUM((selling_price - cost_price) * quantity) AS total_margin,
ROUND(SUM((selling_price::numeric - cost_price::numeric) * quantity::numeric) * 100.0 / SUM(revenue)::numeric, 2) AS margin_percent
FROM sales_base 
GROUP BY price_band
ORDER BY total_revenue DESC; 

-- Which designs are the Top 20 best-performing products?

SELECT
category,
design_id,
price_band,
SUM(quantity) AS total_units_sold,
SUM(revenue) AS total_revenue,
SUM((selling_price - cost_price) * quantity) AS total_margin,
ROUND(SUM((selling_price::numeric - cost_price::numeric) * quantity::numeric) * 100.0 / SUM(revenue)::numeric,2) AS margin_percent
FROM sales_base 
GROUP BY design_id, category, price_band
ORDER BY total_revenue DESC
LIMIT 20;