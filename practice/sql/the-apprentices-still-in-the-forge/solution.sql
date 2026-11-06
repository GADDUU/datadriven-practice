SELECT
  COUNT(DISTINCT mdl_name) FILTER(WHERE accuracy >= 0.9 AND LOWER(status) = 'deployed') AS high_accuracy_deployed_models
FROM ml_models
