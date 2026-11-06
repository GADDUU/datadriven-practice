SELECT
  repo_name,
  EXTRACT(YEAR FROM built_at) AS build_year,
  AVG(dur_secs) AS avg_duration
FROM ci_builds
GROUP BY repo_name, EXTRACT(YEAR FROM built_at)
ORDER BY avg_duration DESC
