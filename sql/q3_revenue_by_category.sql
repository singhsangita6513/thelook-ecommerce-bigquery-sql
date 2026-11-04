#Question: How much do customers in each age group spend?

SELECT
  CASE
    WHEN u.age < 25 THEN 'Under 25'
    WHEN u.age < 45 THEN '25-44'
    ELSE '45+'
  END AS age_group,
  ROUND(SUM(oi.sale_price), 2) AS total_revenue,
  COUNT(DISTINCT oi.user_id) AS num_customers,
  ROUND(SUM(oi.sale_price) / COUNT(DISTINCT oi.user_id), 2) AS revenue_per_customer
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.users` AS u
  ON oi.user_id = u.id
WHERE oi.status = 'Complete'
GROUP BY age_group
ORDER BY revenue_per_customer DESC;
