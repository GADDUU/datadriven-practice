SELECT
  CAST(COUNT(*) AS DECIMAL) AS after_hours_count
FROM api_calls
WHERE EXTRACT(YEAR FROM call_time) = 2025
  AND (
    EXTRACT(DOW FROM call_time) IN (0, 6)
    OR (
      EXTRACT(DOW FROM call_time) BETWEEN 1 AND 5
      AND EXTRACT(HOUR FROM call_time) NOT BETWEEN 9 AND 15
    )
  )
