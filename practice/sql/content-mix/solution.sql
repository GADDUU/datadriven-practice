SELECT
  content_type,
  COUNT(*) AS item_count,
  AVG(duration_seconds) AS avg_duration,
  CAST(
    COUNT(*) FILTER(WHERE duration_seconds IS NULL OR creator_id IS NULL) * 100 / COUNT(*) AS DECIMAL
  ) AS incomplete_pct
FROM content_items
GROUP BY content_type
ORDER BY avg_duration DESC
