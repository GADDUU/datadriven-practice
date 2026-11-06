SELECT
  svc_name,
  MAX(count) AS max_error_count
FROM err_tracks
WHERE TO_CHAR(first_at, 'YYYY-MM') <= '2026-06'
GROUP BY svc_name
ORDER BY max_error_count DESC
