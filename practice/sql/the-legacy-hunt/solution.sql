SELECT DISTINCT
  CAST(start_at AS DATE) AS run_date
FROM data_pipes
WHERE TO_CHAR(start_at, 'YYYY-MM-DD') <= '2026-05-01'
