SELECT
  u.user_id,
  COUNT(DISTINCT p.category) AS category_count
FROM users AS u
INNER JOIN transactions AS t
  ON u.user_id = t.user_id
INNER JOIN products AS p
  ON t.product_id = p.product_id
WHERE p.category IS NOT NULL
GROUP BY u.user_id
HAVING category_count > 1
ORDER BY category_count DESC, u.signup_date
