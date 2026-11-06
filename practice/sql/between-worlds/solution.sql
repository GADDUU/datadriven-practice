SELECT
  u.user_id,
  d.os_name,
  d.device_type,
  u.session_start
FROM user_sessions AS u
INNER JOIN devices AS d
  ON u.device_id = d.device_id
WHERE u.user_id IN (
  SELECT
    u.user_id
  FROM user_sessions AS u
  INNER JOIN devices AS d
    ON u.device_id = d.device_id
  GROUP BY u.user_id
  HAVING COUNT(DISTINCT d.device_type) > 1
)
