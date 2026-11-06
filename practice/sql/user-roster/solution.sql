SELECT
  account_status,
  user_count,
  CAST (
    user_count * 100 / SUM(user_count) OVER()
    AS DECIMAL
  ) AS share_pct
FROM (
  SELECT
    account_status,
    COUNT(user_id) AS user_count
  FROM users
  GROUP BY account_status
)
