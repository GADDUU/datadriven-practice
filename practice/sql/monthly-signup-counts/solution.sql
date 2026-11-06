SELECT
  TO_CHAR(signup_date, 'YYYY-MM') AS month,
  COUNT(user_id) AS signup_count,
  CAST(COUNT(user_id) AS FLOAT) AS signup_count_float
FROM users 
GROUP BY month
ORDER BY month
