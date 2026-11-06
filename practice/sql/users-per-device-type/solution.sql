SELECT
  d.device_type,
  COUNT(DISTINCT user_id) AS user_count
FROM user_sessions AS s
LEFT JOIN devices AS d
  ON d.device_id = s.device_id
GROUP BY device_type
