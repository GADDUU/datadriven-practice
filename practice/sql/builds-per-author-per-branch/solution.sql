SELECT
  trigger AS author,
  branch,
  COUNT(*) AS build_count
FROM ci_builds
GROUP BY branch, trigger
ORDER BY trigger, branch, build_count DESC
