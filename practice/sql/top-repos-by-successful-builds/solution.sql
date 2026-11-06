SELECT
  repo_name,
  COUNT(*) AS success_count
FROM ci_builds
WHERE status = 'success'
GROUP BY repo_name
ORDER BY success_count DESC
