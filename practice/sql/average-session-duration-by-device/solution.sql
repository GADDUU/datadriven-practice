SELECT
  d.device_type,
  AVG(s.session_duration_sec) / 60 AS avg_session_minutes
FROM devices AS d
INNER JOIN user_sessions AS s
  ON d.device_id = s.device_id
GROUP BY d.device_type
ORDER BY d.device_type
