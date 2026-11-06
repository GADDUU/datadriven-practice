SELECT
  CAST(u.session_start AS DATE) AS session_date,
  COUNT(DISTINCT u.user_id)
FROM user_sessions AS u
INNER JOIN devices AS d
  ON u.device_id = d.device_id
WHERE d.device_type IN ('desktop', 'tablet', 'smart_tv')
GROUP BY session_date
ORDER BY session_date
