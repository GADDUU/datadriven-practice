SELECT
  ROW_NUMBER() OVER(ORDER BY total_value DESC) AS rnk,
  variant,
  user_id,
  total_value
FROM (
  SELECT
    variant,
    user_id,
    SUM(value) AS total_value
  FROM ab_results
  WHERE test_name = 'onboarding_v3'
  GROUP BY user_id
)
LIMIT 10
