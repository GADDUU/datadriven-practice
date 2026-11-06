WITH api_filter AS (
  SELECT
    call_id,
    status,
    CASE 
      WHEN EXTRACT (HOUR FROM call_time) < 12 THEN 'Morning'
      WHEN EXTRACT (HOUR FROM call_time) BETWEEN 12 AND 15 THEN 'Early Afternoon'
      ELSE 'Late Afternoon'
    END AS time_segment
  FROM api_calls
  WHERE err_msg IS NOT NULL
),
err_ranked AS (
  SELECT
    status,
    time_segment,
    COUNT(*) AS call_count,
    DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS rnk
  FROM api_filter
  GROUP BY status, time_segment  
)
  
SELECT
  status,
  time_segment,
  call_count
FROM err_ranked
WHERE rnk <= 3
