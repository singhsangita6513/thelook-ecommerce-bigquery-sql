#Question: How many customers are in each age group?

SELECT
  CASE
    WHEN age < 25 THEN 'Under 25'
    WHEN age < 45 THEN '25-44'
    ELSE '45+'
  END AS age_group,
  COUNT(*) AS num_customers
FROM `bigquery-public-data.thelook_ecommerce.users`
GROUP BY age_group
ORDER BY age_group;
