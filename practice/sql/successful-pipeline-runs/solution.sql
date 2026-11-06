SELECT
  pipe_name,
  COUNT(status) FILTER(WHERE status = 'success') AS success_count
FROM data_pipes
GROUP BY pipe_name
ORDER BY success_count DESC
