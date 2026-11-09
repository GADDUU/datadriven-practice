SELECT
  us.user_id,
  d.device_type,
  d.os_name,
  us.session_duration_sec
FROM user_sessions AS us
INNER JOIN devices AS d
  ON us.device_id = d.device_id
WHERE us.session_duration_sec >= 1000
ORDER BY user_id
