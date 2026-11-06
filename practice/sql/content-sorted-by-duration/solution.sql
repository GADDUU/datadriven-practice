SELECT
  *,
  CAST(duration_seconds AS DECIMAL) AS duration_decimal,
  ROUND(MAX(duration_seconds) OVER() - duration_seconds, 1) AS diff_from_longest
FROM content_items
ORDER BY duration_decimal DESC
