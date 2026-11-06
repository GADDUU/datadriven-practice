WITH last_login AS (
  SELECT
    user_id,
    MAX(session_start) AS last_login_date
  FROM user_sessions
  GROUP BY user_id
),
lifetime_spend AS (
  SELECT
    user_id,
    SUM(total_amount) AS lifetime_spend
  FROM transactions
  GROUP BY user_id
)

SELECT
  u.username,
  u.account_status,
  l.last_login_date,
  COALESCE(sp.lifetime_spend, 0) AS lifetime_spend
FROM users AS u
LEFT JOIN last_login AS l
  ON u.user_id = l.user_id
LEFT JOIN lifetime_spend AS sp
  ON u.user_id = sp.user_id
WHERE u.account_status = 'active'
  AND (
    l.last_login_date IS NULL
    OR l.last_login_date < CURRENT_DATE - INTERVAL '90 days'
  )
ORDER BY u.username
