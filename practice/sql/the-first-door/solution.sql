WITH ranked_time AS (
  SELECT
    user_id,
    event_name,
    event_ts,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY event_ts ASC) AS rnk
  FROM app_event_deliveries
  WHERE user_id IS NOT NULL
)
  
SELECT
  user_id,
  event_name AS first_event
FROM ranked_time
WHERE rnk = 1
