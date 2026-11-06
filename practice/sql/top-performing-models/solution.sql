SELECT
  *
FROM ml_models
WHERE accuracy >= 0.90
ORDER BY accuracy DESC
