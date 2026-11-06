WITH CTE AS (
  SELECT
    *,
    CASE
      WHEN LOWER(err_type) LIKE '%timeout%' THEN 'timeout'
      WHEN LOWER(err_type) LIKE '%memory%' THEN 'memory'
      ELSE 'other'
    END AS error_category
  FROM err_tracks
)

SELECT
  error_category,
  COUNT(*) AS track_count
FROM CTE
GROUP BY error_category
