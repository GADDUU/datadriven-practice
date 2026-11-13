SELECT
  repo_name,
  ROUND(100.0 * fail_build / total_build, 2) AS failure_pct
FROM (
  SELECT
    repo_name,
    COUNT(*) FILTER (
      WHERE status LIKE 'failed'
    ) AS fail_build,
    COUNT(*) AS total_build
  FROM ci_builds
  GROUP BY repo_name
)
GROUP BY repo_name
