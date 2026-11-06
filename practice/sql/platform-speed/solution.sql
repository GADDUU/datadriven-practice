SELECT
  d.device_type,
  AVG(u.session_duration_sec) AS avg_duration,
  MAX(u.session_duration_sec) AS max_duration,
  COUNT(u.session_id) AS session_count
FROM user_sessions AS u
INNER JOIN devices AS d
  ON u.device_id = d.device_id
GROUP BY d.device_type
HAVING COUNT(u.session_id) >= 35
