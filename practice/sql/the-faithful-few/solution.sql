WITH user_device_types AS (
    SELECT
        us.user_id,
        d.device_type
    FROM user_sessions AS us
    JOIN devices AS d
        ON us.device_id = d.device_id
    GROUP BY us.user_id, d.device_type
),
loyal_users AS (
    SELECT
        user_id,
        MIN(device_type) AS device_type
    FROM user_device_types
    GROUP BY user_id
    HAVING COUNT(*) = 1
)
SELECT
    device_type,
    COUNT(*) AS loyal_users
FROM loyal_users
GROUP BY device_type
ORDER BY loyal_users DESC, device_type;
