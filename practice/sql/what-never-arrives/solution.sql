SELECT
  pipe_name,
  SUM(rows_in - rows_out) AS records_dropped
FROM data_pipes
WHERE LOWER(status) = 'success'
GROUP BY pipe_name
ORDER BY records_dropped DESC
