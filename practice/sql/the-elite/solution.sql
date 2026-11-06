SELECT
  AVG(accuracy) AS avc_accuracy
FROM ml_models
WHERE accuracy * 100 BETWEEN 91 AND 100
