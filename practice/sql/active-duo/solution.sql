SELECT DISTINCT
  u.username
FROM users AS u
INNER JOIN transactions AS t
  ON u.user_id = t.user_id
INNER JOIN user_sessions AS s
  ON u.user_id = s.user_id
ORDER BY username
