SELECT
  d.device_type,
  COUNT(us.session_id) AS session_count
FROM devices AS d
INNER JOIN user_sessions AS us
  ON d.device_id = us.device_id
GROUP BY d.device_type
ORDER BY session_count DESC
LIMIT 1
