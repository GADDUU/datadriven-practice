WITH session_filter AS (
    SELECT
        user_id,
        session_start,
        session_duration_sec
    FROM user_sessions
    WHERE session_start >= '2024-09-13'
      AND session_start < '2026-09-13'
),
monthly_stats AS (
    SELECT
        SUBSTR(session_start, 1, 7) AS month,
        COUNT(DISTINCT user_id) AS active_users,
        AVG(session_duration_sec) AS avg_duration_sec,
        COUNT(*) AS total_sessions
    FROM session_filter
    GROUP BY SUBSTR(session_start, 1, 7)
)
SELECT
    month,
    active_users,
    avg_duration_sec
FROM monthly_stats
WHERE total_sessions > active_users
ORDER BY month;
