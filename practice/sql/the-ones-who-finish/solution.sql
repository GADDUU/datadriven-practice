SELECT
  i.content_type AS content_format,
  ROUND(
    AVG(
      CAST(v.watch_seconds AS DOUBLE) / i.duration_seconds
    ),
    3
  ) AS avg_completion_rate,
  COUNT(*) AS view_count
FROM content_views AS v
JOIN content_items AS i
  ON v.content_id = i.content_id
WHERE i.duration_seconds IS NOT NULL
   AND EXTRACT(YEAR FROM v.viewed_at) = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY i.content_type
ORDER BY avg_completion_rate DESC
