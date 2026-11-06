SELECT
  u.user_id,
  u.username,
  MIN(t.total_amount) AS min_amount
FROM users AS u
INNER JOIN transactions AS t
  ON u.user_id = t.user_id
GROUP BY u.user_id
ORDER BY min_amount
