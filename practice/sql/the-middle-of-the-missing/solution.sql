SELECT
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY null_pct) AS median_null_pct
FROM ml_features
WHERE LOWER(dtype) IN ('float32', 'float64')
  AND null_pct IS NOT NULL
