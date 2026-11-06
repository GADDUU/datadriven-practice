SELECT
  age_bucket,
  COUNT(DISTINCT user_id) As user_count
FROM users
WHERE account_status = 'pending_verification'
  AND signup_date LIKE '2025-%'
GROUP BY age_bucket
HAVING COUNT(DISTINCT user_id) > 4
