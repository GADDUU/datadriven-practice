SELECT
  *
FROM users
WHERE EXTRACT(MONTH FROM signup_date) = 2
  AND user_id % 2 = 0
ORDER BY user_id
