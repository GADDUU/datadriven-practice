SELECT
  EXTRACT(YEAR FROM signup_date) AS signup_year,
  COUNT(*) AS signup_count
FROM users
WHERE EXTRACT(MONTH FROM signup_date) BETWEEN 1 AND 7
GROUP BY EXTRACT(YEAR FROM signup_date)
ORDER BY signup_year
