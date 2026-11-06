SELECT
  cr.author,
  AVG(cr.comments) AS avg_comments,
  MIN(rc.commit_at) AS earliest_commit
FROM code_reviews AS cr
INNER JOIN repo_commits AS rc
  ON cr.author = rc.author
GROUP BY cr.author
