SELECT
  LOWER(framework) AS framework,
  AVG(accuracy) AS avg_accuracy
FROM ml_models
WHERE EXTRACT(YEAR FROM train_at) = 2026
  OR train_at IS NULL
GROUP BY LOWER(framework) 
ORDER BY avg_accuracy DESC
