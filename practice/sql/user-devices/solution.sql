SELECT DISTINCT
    u.username AS username,
    d.device_type AS device_type
  FROM users AS u
  INNER JOIN user_sessions AS s
    ON u.user_id = s.user_id
  INNER JOIN devices AS d
    ON s.device_id = d.device_id
