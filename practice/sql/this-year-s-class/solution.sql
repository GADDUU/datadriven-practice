SELECT
  COUNT(*) AS signup_count
FROM users
WHERE EXTRACT(YEAR FROM signup_date) = 2025
