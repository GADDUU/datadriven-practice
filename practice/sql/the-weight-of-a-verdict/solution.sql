SELECT
  pipe_id,
  pipe_name,
  status,
  rows_in,
  rows_out,
  start_at,
  dur_secs,
  SUM(rows_in) OVER(PARTITION BY status) AS status_total_rows_in
FROM data_pipes
