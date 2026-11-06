WITH normalize AS (
  SELECT
    call_id,
    CASE 
      WHEN RIGHT(endpoint, 1) = '/' THEN SUBSTR(TRIM(endpoint), 1, LENGTH(TRIM(endpoint)) - 1)
      ELSE TRIM(endpoint)
    END AS endpoint,
    latency,
    user_id,
    call_time
  FROM api_calls   
),
ranked_call_time AS (
  SELECT
    endpoint,
    user_id,
    CAST(latency AS INT) AS latency,
    call_time,
    ROW_NUMBER() OVER(PARTITION BY user_id, endpoint ORDER BY call_time) AS rnk
  FROM normalize
)
  
SELECT
  endpoint,
  AVG(latency) AS avg_initial_call_latency
FROM ranked_call_time
WHERE rnk = 1
GROUP BY endpoint
ORDER BY avg_initial_call_latency DESC
