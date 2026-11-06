SELECT
  trigger,
  COUNT(build_id) As build_count,
  AVG(dur_secs) AS avg_duration
FROM ci_builds
GROUP BY trigger
ORDER BY trigger
