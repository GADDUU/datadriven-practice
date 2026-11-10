SELECT
  age_bucket,
  COUNT(user_id) AS user_count
FROM users
WHERE signup_date >= '2026-04-01'
GROUP BY age_bucket
