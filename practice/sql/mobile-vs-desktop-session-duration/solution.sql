SELECT
    u.user_id,
    MAX(CASE
        WHEN d.device_type = 'mobile'
        THEN u.session_duration_sec
    END) AS longest_mobile,
    MAX(CASE
        WHEN d.device_type = 'desktop'
        THEN u.session_duration_sec
    END) AS longest_desktop
FROM user_sessions AS u
INNER JOIN devices AS d
    ON u.device_id = d.device_id
WHERE EXTRACT(YEAR FROM u.session_start) = 2025
GROUP BY u.user_id;
