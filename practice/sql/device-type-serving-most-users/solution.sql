WITH find_users AS (
  SELECT
    d.device_type,
    COUNT(DISTINCT us.user_id) AS unique_users
  FROM user_sessions AS us
  INNER JOIN devices AS d
    ON us.device_id = d.device_id
  GROUP BY d.device_type
),
find_leader AS (
  SELECT
    MAX(unique_users) AS leader_users
  FROM find_users  
)
  
SELECT
  u.device_type,
  u.unique_users
FROM find_users AS u
CROSS JOIN find_leader AS l
WHERE 1.0 * u.unique_users / l.leader_users >= 0.9
