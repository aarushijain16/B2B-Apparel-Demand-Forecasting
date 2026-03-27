-- ==========================================
--   PRODUCTION CYCLE AND CAPACITY ANALYSIS 
-- ==========================================

-- What is the minimum, maximum and average production lead time per batch?

SELECT 
MIN(batch_completion_date::date - batch_start_date::date) AS min_lead_time,
MAX(batch_completion_date::date - batch_start_date::date) AS max_lead_time,
ROUND(AVG(batch_completion_date::date - batch_start_date::date),2) AS avg_lead_time
FROM (
      SELECT 
	  batch_id, 
	  batch_start_date,
	  batch_completion_date
	  FROM production_batches
	  GROUP BY batch_id, batch_start_date, batch_completion_date
) t;

-- How does production capacity vary across months?

SELECT
TO_CHAR(batch_completion_date::date, 'YYYY-MM') AS month,
CASE 
    WHEN EXTRACT(MONTH FROM batch_completion_date::date) >= 4
    THEN EXTRACT(YEAR FROM batch_completion_date::date)::text || '-' || (EXTRACT(YEAR FROM batch_completion_date::date)+1)::text
    ELSE (EXTRACT(YEAR FROM batch_completion_date::date)-1)::text || '-' || EXTRACT(YEAR FROM batch_completion_date::date)::text
END AS financial_year,
COUNT(DISTINCT batch_id) AS batches_completed,
SUM(quantity_produced) AS total_units_produced
FROM production_batches
GROUP BY month, financial_year
ORDER BY month;

-- How well does production align with demand over time?

WITH monthly_production AS (
    SELECT
    TO_CHAR(batch_completion_date::date, 'YYYY-MM') AS month,
    SUM(quantity_produced) AS production_units
    FROM production_batches
    GROUP BY month
),

monthly_demand AS (
    SELECT
    TO_CHAR(order_date::date, 'YYYY-MM') AS month,
    SUM(quantity) AS demand_units
    FROM orders o
    JOIN order_items oi
    ON o.order_id = oi.order_id
    WHERE status = 'completed'
    GROUP BY month
)

SELECT
COALESCE(p.month, d.month) AS month,
production_units,
demand_units,
production_units - demand_units AS production_demand_gap
FROM monthly_production p
FULL JOIN monthly_demand d
ON p.month = d.month
ORDER BY month;

