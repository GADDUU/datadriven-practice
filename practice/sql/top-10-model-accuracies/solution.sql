SELECT
  model_id,
  mdl_name,
  ROUND(accuracy, 3)
FROM ml_models
ORDER BY accuracy DESC, model_id
LIMIT 10
