SELECT
  trigger,
  COUNT(*) AS total_builds,
  ROUND(
    CAST(COUNT(*) FILTER(WHERE LOWER(status) = 'success') AS DOUBLE) / COUNT(*),
    3
  ) AS success_rate
FROM ci_builds
GROUP BY trigger
