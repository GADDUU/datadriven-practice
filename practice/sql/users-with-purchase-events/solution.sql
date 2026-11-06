SELECT DISTINCT
  u.user_id
FROM users AS u
INNER JOIN event_data AS e
  ON u.user_id = e.user_id
WHERE event_type = 'purchase'
ORDER BY u.user_id
