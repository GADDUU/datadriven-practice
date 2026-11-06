SELECT
  svc_name,
  COUNT(err_id) AS error_count
FROM err_tracks
WHERE EXTRACT(MONTH FROM first_at) = 8
GROUP BY svc_name
ORDER BY error_count DESC
