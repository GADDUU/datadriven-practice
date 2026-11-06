SELECT
  repo_name,
  SUM(added) - SUM(removed) AS net_lines
FROM repo_commits
GROUP BY repo_name
