SELECT
  COUNT(*) AS signup_count
FROM users
WHERE signup_date BETWEEN '2026-01-01' AND '2026-07-31'
