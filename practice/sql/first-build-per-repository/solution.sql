SELECT
  repo_name,
  MIN(built_at) AS first_build_date
FROM ci_builds
GROUP BY repo_name
