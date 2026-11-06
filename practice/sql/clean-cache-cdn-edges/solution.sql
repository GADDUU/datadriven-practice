SELECT DISTINCT
  req_path
FROM cdn_logs
WHERE status >= 400
