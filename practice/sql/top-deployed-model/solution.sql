SELECT
  mdl_name,
  accuracy,
  framework
FROM ml_models
WHERE status = 'deployed'
ORDER BY accuracy DESC
LIMIT 1
