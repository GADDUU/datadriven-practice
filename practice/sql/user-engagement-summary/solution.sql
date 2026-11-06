WITH session_counts AS (
  SELECT 
    user_id,
    COUNT(session_id) AS total_session
  FROM user_sessions
  GROUP BY user_id
),
query_counts AS (
  SELECT
    user_id,
    COUNT(query_id) AS total_queries
  FROM search_queries
  GROUP BY user_id  
),
cumulated_dates AS (
  SELECT
    user_id,
    MAX(last_active_date) AS last_active_date
  FROM user_activity_cumulated
  GROUP BY user_id  
),
master_users AS (
    SELECT user_id FROM session_counts
    UNION
    SELECT user_id FROM query_counts
    UNION
    SELECT user_id FROM cumulated_dates
)
  
SELECT
  u.user_id,
  COALESCE(s.total_session, 0) AS total_sessions,
  COALESCE(q.total_queries, 0) AS total_queries,
  c.last_active_date
FROM master_users AS u
LEFT JOIN session_counts AS s
  ON u.user_id = s.user_id
LEFT JOIN query_counts AS q
  ON u.user_id = q.user_id
LEFT JOIN cumulated_dates AS c
  ON u.user_id = c.user_id
WHERE u.user_id IS NOT NULL
