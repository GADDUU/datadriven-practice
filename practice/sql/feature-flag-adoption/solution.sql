SELECT
  flag_name,
  enabled,
  COUNT(flag_id) AS flag_count
FROM feat_flags
GROUP BY flag_name, enabled
