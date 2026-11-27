SELECT
  feat_name,
  LOWER(dtype) AS dtype,
  ROUND(AVG(avg_val), 2) AS avg_val,
  ROUND(AVG(null_pct), 2) AS null_pct
FROM ml_features
WHERE source = 'transactions'
  AND (feat_name, LOWER(dtype)) NOT IN (
    SELECT
      feat_name,
      LOWER(dtype)
    FROM ml_features
    WHERE source IN ('page_views', 'ad_impressions')
  )
GROUP BY feat_name, LOWER(dtype)
