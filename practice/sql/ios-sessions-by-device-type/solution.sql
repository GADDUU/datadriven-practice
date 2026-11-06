SELECT
  d.os_name,
  COUNT(us.session_id) AS session_count
FROM devices AS d
INNER JOIN user_sessions AS us
  ON d.device_id = us.device_id
WHERE d.device_type = 'mobile'
GROUP BY d.os_name
