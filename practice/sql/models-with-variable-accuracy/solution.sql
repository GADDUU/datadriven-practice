SELECT
  mdl_name,
  MIN(accuracy) AS min_accuracy,
  MAX(accuracy) AS max_accuracy
FROM ml_models
WHERE accuracy IS NOT NULL
GROUP BY mdl_name
ORDER BY mdl_name
