WITH ranked_views AS (
  SELECT
    pv.*,
    ROW_NUMBER() OVER (
      ORDER BY view_id
    ) AS position,
    COUNT(*) OVER () AS total_rows
  FROM page_views AS pv
)

SELECT
  view_id,
  page_url,
  user_id,
  referrer,
  dur_ms,
  device,
  viewed_at,
  position
FROM ranked_views
WHERE position <= total_rows / 2
ORDER BY view_id
