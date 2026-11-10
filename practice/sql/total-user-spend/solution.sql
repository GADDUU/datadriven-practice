SELECT
  u.user_id,
  u.username,
  SUM(t.total_amount) AS total_spend
FROM users AS u
INNER JOIN transactions AS t
  ON u.user_id = t.user_id
GROUP BY u.user_id
ORDER BY u.username ASC
