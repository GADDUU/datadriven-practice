SELECT
  svc_name,
  CAST(REPLACE(REPLACE(version, 'v', ''), '.', '') AS INTEGER) AS version_number
FROM deploy_logs
WHERE env_name = 'staging'
