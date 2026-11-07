SELECT
  COUNT(u.user_id) AS users_without_purchase
FROM users AS u
LEFT JOIN transactions AS t
  ON u.user_id = t.user_id
WHERE t.user_id IS NULL
