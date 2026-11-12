SELECT
  TO_CHAR(us.session_start, 'YYYY-MM') AS session_month,
  COUNT(DISTINCT us.user_id) AS non_converting_users
FROM user_sessions AS us
LEFT JOIN transactions AS t
  ON us.user_id = t.user_id
WHERE us.device_id IS NOT NULL
  AND t.user_id IS NULL
GROUP BY session_month
ORDER BY non_converting_users DESC, session_month ASC
LIMIT 1
