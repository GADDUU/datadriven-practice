SELECT
  *
FROM users
WHERE user_id % 2 = 0
  AND EXTRACT(MONTH FROM signup_date) = 6
ORDER BY user_id
