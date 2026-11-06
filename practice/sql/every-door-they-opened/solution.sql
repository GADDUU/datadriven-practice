WITH all_users AS (
    -- Build a master spine of every identified user across both logs
    SELECT user_id 
    FROM user_sessions 
    WHERE user_id IS NOT NULL
    
    UNION
    
    SELECT user_id 
    FROM page_views 
    WHERE user_id IS NOT NULL
),

session_metrics AS (
    -- Pre-aggregate session duration for 2026 activity
    SELECT 
        user_id,
        ROUND(SUM(session_duration_sec) / 60.0) AS session_time_minutes
    FROM user_sessions
    WHERE user_id IS NOT NULL
      AND session_start >= '2026-01-01'
    GROUP BY user_id
),

page_metrics AS (
    -- Pre-aggregate case-insensitive distinct pages viewed in 2026
    SELECT 
        user_id,
        COUNT(DISTINCT LOWER(page_url)) AS distinct_pages
    FROM page_views
    WHERE user_id IS NOT NULL
      AND viewed_at >= '2026-01-01'
    GROUP BY user_id
)

SELECT 
    u.user_id,
    COALESCE(s.session_time_minutes, 0) AS session_time_minutes,
    COALESCE(p.distinct_pages, 0) AS distinct_pages
FROM all_users u
LEFT JOIN session_metrics s 
    ON u.user_id = s.user_id
LEFT JOIN page_metrics p 
    ON u.user_id = p.user_id;
