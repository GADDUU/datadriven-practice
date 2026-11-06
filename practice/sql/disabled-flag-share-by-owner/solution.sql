SELECT
  owner,
  ROUND(
    CAST(COUNT(*) FILTER (WHERE EXTRACT(YEAR FROM created) < 2026) AS DOUBLE) / COUNT(*),
    3
  ) AS stale_ratio
FROM feat_flags
GROUP BY owner
