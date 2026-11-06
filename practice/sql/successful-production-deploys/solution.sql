SELECT
  *
FROM deploy_logs
WHERE LOWER(status) = 'success'
  AND dur_secs IS NOT NULL
ORDER BY dur_secs DESC, deploy_at DESC
