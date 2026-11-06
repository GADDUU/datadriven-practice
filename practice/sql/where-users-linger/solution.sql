SELECT
  d.os_name,
  AVG(COALESCE(u.session_duration_sec, 0)) AS avg_duration
FROM devices AS d
INNER JOIN user_sessions AS u
  ON d.device_id = u.device_id
WHERE device_type = 'mobile'
GROUP BY d.os_name
ORDER BY avg_duration DESC
LIMIT 1
