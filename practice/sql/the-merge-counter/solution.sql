WITH target_branches AS (
  SELECT
    'develop' AS branch

  UNION ALL

  SELECT
    'main'

  UNION ALL

  SELECT
    'release'
),
filtered_builds AS (
  SELECT
    *
  FROM ci_builds
  WHERE EXTRACT(YEAR FROM built_at) = 2026
    AND trigger <> 'manual'
    AND branch IN ('develop', 'main', 'release')
)

SELECT
  tb.branch,
  COALESCE(COUNT(fb.build_id), 0) AS build_count,
  COALESCE(CAST(COUNT(fb.build_id) AS DECIMAL), 0) AS build_count_decimal,
  AVG(fb.dur_secs) AS avg_duration
FROM target_branches AS tb
LEFT JOIN filtered_builds AS fb
  ON tb.branch = fb.branch
GROUP BY tb.branch
