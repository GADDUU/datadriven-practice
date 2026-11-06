SELECT
  MIN(train_at) AS first_date,
  MAX(train_at) AS last_date
FROM ml_models
WHERE accuracy IN (
  SELECT
    MAX(accuracy)
  FROM ml_models
)
