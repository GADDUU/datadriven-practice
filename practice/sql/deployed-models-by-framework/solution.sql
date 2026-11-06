SELECT
  mdl_name,
  COUNT(status) AS live_registrations
FROM ml_models
WHERE status = 'deployed'
GROUP BY mdl_name
