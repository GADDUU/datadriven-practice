SELECT
  event_type,
  SUM(
    CASE 
      WHEN date_col IN (0, 6) THEN 1
      ELSE 0
    END
  ) AS weekend_count,
  SUM(
    CASE
      WHEN date_col BETWEEN 1 AND 5 THEN 1
      ELSE 0
    END
  ) AS weekday_count
FROM (
  SELECT
    event_type, 
    EXTRACT(DOW FROM event_timestamp) AS date_col
  FROM event_data
)
GROUP BY event_type
ORDER BY weekend_count DESC
