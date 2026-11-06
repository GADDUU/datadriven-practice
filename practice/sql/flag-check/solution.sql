SELECT
  owner,
  COUNT(*) AS unconfigured_flags,
  SUM(enabled) AS enabled_count
FROM feat_flags
WHERE rollout IS NULL
GROUP BY owner
