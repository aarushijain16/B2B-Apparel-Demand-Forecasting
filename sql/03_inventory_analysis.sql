-- ===================================
--   INVENTORY AND WORKING CAPITAL
-- ===================================

-- What are the estimated inventory levels over time?

SELECT 
month, 
SUM(closing_stock) AS total_inventory_units
FROM inventory_monthly 
GROUP BY month
ORDER BY month;

-- What is the total inventory holding value?

SELECT 
month, 
SUM(inventory_value) AS total_inventory_value
FROM inventory_monthly 
GROUP BY month
ORDER  BY month;

-- Which products qualify as dead stock?

SELECT
sku_id, 
SUM(units_sold) AS total_units_sold,
SUM(closing_stock) AS remaining_stock
FROM inventory_monthly 
GROUP BY sku_id
HAVING SUM(units_sold) = 0
AND SUM(closing_stock) > 0; 

-- What is the Days Sales Outstanding (DSO)?

SELECT
AVG(payment_received_date::date - order_date::date)::int AS avg_dso
FROM orders 
WHERE status = 'completed';