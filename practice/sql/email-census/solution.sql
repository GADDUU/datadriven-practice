WITH CTE AS (
  SELECT
    user_id,
    account_status,
    CASE
      WHEN email IS NOT NULL THEN 'has email'
      ELSE 'no email'
    END AS email_status,
    COUNT(*) OVER () AS total_user
  FROM users
)

SELECT
  account_status,
  email_status,
  COUNT(user_id) AS user_count,
  ROUND(CAST(COUNT(user_id) * 100 AS DOUBLE) / total_user, 1) AS pct
FROM CTE
GROUP BY account_status, email_status
