SELECT
  svc_name
FROM (
  SELECT
    LOWER(TRIM(svc_name)) AS svc_name,
    SUM(
      CASE 
        WHEN LOWER(status) = 'in_progress' OR (LOWER(status) = 'success' AND dur_secs IS NULL) THEN 1
        ELSE 0
      END
    ) AS flag
  FROM deploy_logs
  GROUP BY LOWER(TRIM(svc_name)) 
)
WHERE flag <> 0
