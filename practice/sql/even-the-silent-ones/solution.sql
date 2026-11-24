SELECT
  u.username,
  COALESCE(s.session_count, 0) AS session_count,
  COALESCE(t.total_amount, 0) AS total_amount
FROM users AS u
LEFT JOIN (
  SELECT
    user_id,
    COUNT(*) AS session_count
  FROM user_sessions
  GROUP BY user_id
) AS s
  ON s.user_id = u.user_id
LEFT JOIN (
  SELECT
    user_id,
    SUM(total_amount) AS total_amount
  FROM transactions
  GROUP BY user_id
) AS t
  ON t.user_id = u.user_id
