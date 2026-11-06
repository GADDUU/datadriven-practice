SELECT
  svc_name,
  MIN(first_at) AS earliest_timeout,
  MAX(first_at) AS latest_timeout
FROM err_tracks
WHERE LOWER(message) LIKE '%timed out%'
GROUP BY svc_name
ORDER BY svc_name
