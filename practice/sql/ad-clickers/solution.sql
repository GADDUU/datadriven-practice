SELECT
  u.username,
  SUM(ai.revenue) AS total_revenue
FROM users AS u
INNER JOIN ad_impressions AS ai
  ON u.user_id = ai.user_id
GROUP BY u.username
HAVING SUM(ai.revenue) IS NOT NULL
ORDER BY total_revenue DESC
