SELECT
  event_type
FROM (
  SELECT
    event_type,
    COUNT(DISTINCT TO_CHAR(event_timestamp, 'YYYY-MM')) AS cnt
  FROM event_data
  GROUP BY event_type
) AS event_cnt
WHERE cnt >= 12
