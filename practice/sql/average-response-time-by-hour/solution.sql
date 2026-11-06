WITH log_hours AS (
  SELECT
    *,
    EXTRACT(HOUR FROM log_timestamp) AS hour_of_day
  FROM server_logs
)
  
SELECT
  hour_of_day,
  AVG(response_time_ms) AS avg_response_time
FROM log_hours
GROUP BY hour_of_day
ORDER BY hour_of_day
