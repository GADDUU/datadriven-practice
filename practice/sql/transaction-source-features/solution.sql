SELECT
  feat_name
FROM ml_features
WHERE avg_val IS NULL
  AND source = 'user_sessions'
GROUP BY feat_name
ORDER BY feat_name
