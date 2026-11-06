WITH CTE1 AS (
  SELECT
    user_id,
    SUM(session_duration_sec) AS session_seconds
  FROM user_sessions
  GROUP BY user_id
),
CTE2 AS (
  SELECT
    user_id,
    ROUND(CAST(SUM(dur_ms) AS DOUBLE) / 1000, 3) AS viewing_seconds
  FROM page_views
  GROUP BY user_id
)
  
SELECT
  c1.user_id,
  c1.session_seconds,
  c2.viewing_seconds
FROM CTE1 AS c1
INNER JOIN CTE2 AS c2
  ON c1.user_id = c2.user_id
