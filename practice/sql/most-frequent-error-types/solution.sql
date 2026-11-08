SELECT
  err_type,
  COUNT(err_id) AS report_count,
  SUM(count) AS total_occurrences
FROM err_tracks
GROUP BY err_type
ORDER BY total_occurrences DESC
LIMIT 5
