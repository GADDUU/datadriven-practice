SELECT
  u.age_bucket,
  SUM(ai.revenue) AS total_revenue
FROM users AS u
INNER JOIN ad_impressions AS ai
  ON u.user_id = ai.user_id
WHERE u.age_bucket IS NOT NULL
GROUP BY u.age_bucket
ORDER BY total_revenue DESC
