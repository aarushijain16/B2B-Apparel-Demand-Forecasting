-- ========================
--    DECISION MODELLING
-- ========================


-- What happens to working capital if DSO improves by 20%?

WITH payment_days AS (

SELECT
ROUND(AVG(o.payment_received_date::date - o.dispatch_date::date),2) AS avg_dso
FROM orders o
WHERE o.status = 'completed'

),

revenue_stats AS (

SELECT
SUM(revenue) AS total_revenue,
ROUND(SUM(revenue)::numeric / COUNT(DISTINCT order_date)::numeric,2) AS daily_revenue
FROM sales_base

),

scenario AS (

SELECT
p.avg_dso AS current_dso,

p.avg_dso * 0.8 AS improved_dso,

r.daily_revenue,

ROUND((r.daily_revenue::numeric * p.avg_dso::numeric),2) AS current_receivables,

ROUND((r.daily_revenue::numeric * (p.avg_dso * 0.8)::numeric),2) AS improved_receivables

FROM payment_days p
CROSS JOIN revenue_stats r

)

SELECT
current_dso,
improved_dso,
current_receivables,
improved_receivables,

(current_receivables - improved_receivables)
AS working_capital_released

FROM scenario;