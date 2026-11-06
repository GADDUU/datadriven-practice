SELECT
  svc_name || ':' || version || ' (deploy' || ' #' || log_id || ')' AS full_identifier,
  dur_secs
FROM deploy_logs
WHERE dur_secs >= (
  SELECT
    MAX(dur_secs) - 10
  FROM deploy_logs
)
ORDER BY dur_secs DESC
