#Question: How did revenue change from month to month over the last 12 months?

WITH monthly_revenue AS (
  SELECT
    DATE_TRUNC(DATE(created_at), MONTH) AS month,
    ROUND(SUM(sale_price), 2) AS revenue
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
  WHERE status = 'Complete'
    AND DATE(created_at) >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 12 MONTH)
    AND DATE(created_at) <  DATE_TRUNC(CURRENT_DATE(), MONTH)
  GROUP BY month
)
SELECT
  month,
  revenue,
  LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
  ROUND(SAFE_DIVIDE(revenue - LAG(revenue) OVER (ORDER BY month),
                    LAG(revenue) OVER (ORDER BY month)) * 100, 1) AS pct_change
FROM monthly_revenue
ORDER BY month;
