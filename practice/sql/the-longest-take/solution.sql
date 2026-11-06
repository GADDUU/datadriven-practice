WITH ranked AS (
  SELECT
    content_id,
    title,
    publish_date,
    DENSE_RANK() OVER(PARTITION BY content_type ORDER BY duration_seconds DESC) AS rn
  FROM content_items
  WHERE duration_seconds IS NOT NULL
)

SELECT DISTINCT
  content_id,
  title
FROM ranked
WHERE rn = 1
  AND EXTRACT(YEAR FROM publish_date) >= 2026
