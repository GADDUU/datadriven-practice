WITH target_repo AS (
  SELECT DISTINCT
    repo_name
  FROM ci_builds
),
filtered_builds AS (
  SELECT
    *
  FROM ci_builds
  WHERE TO_CHAR(built_at, 'YYYY-MM') = '2026-01'
    AND status = 'success'
)

SELECT
  tr.repo_name,
  COALESCE(SUM(fb.dur_secs), 0) AS total_dur_secs
FROM target_repo AS tr
LEFT JOIN filtered_builds AS fb
  ON tr.repo_name = fb.repo_name
GROUP BY tr.repo_name
ORDER BY tr.repo_name
