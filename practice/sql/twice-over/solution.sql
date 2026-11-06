SELECT
  mdl_name,
  COUNT(*) AS run_count
FROM ml_models
WHERE LOWER(status) <> 'failed'
GROUP BY mdl_name
HAVING COUNT(*) > 20
