SELECT
  u.user_id,
  COUNT(DISTINCT e.event_type) AS event_type_count
FROM users AS u
LEFT JOIN event_data AS e
  ON u.user_id = e.user_id
GROUP BY u.user_id
