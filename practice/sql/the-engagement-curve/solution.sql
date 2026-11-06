WITH duration_tile AS (
  SELECT
    session_duration_sec,
    pages_viewed,
    CASE 
      WHEN session_duration_sec / 60 < 1 THEN 'under_1min'
      WHEN session_duration_sec / 60 < 5 THEN '1_to_5min'
      WHEN session_duration_sec / 60 < 15 THEN '5_to_15min'
      WHEN session_duration_sec / 60 < 30 THEN '15_to_30min'
      ELSE 'over_30min'
    END as duration_bucket
  FROM user_sessions 
)
  
SELECT
  duration_bucket,
  COUNT(*) AS session_count,
  AVG(pages_viewed) AS avg_pages
FROM duration_tile
GROUP BY duration_bucket
ORDER BY avg_pages DESC
