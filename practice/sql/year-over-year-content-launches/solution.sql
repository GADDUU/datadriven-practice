WITH published_per_year AS (
  SELECT
    creator_id,
    COUNT(*) FILTER (
      WHERE EXTRACT(YEAR FROM publish_date) = 2025
    ) AS publish_2025,
    COUNT(*) FILTER (
      WHERE EXTRACT(YEAR FROM publish_date) = 2026
    ) AS publish_2026
  FROM content_items
  WHERE LOWER(content_type) IN ('video', 'short', 'livestream')
  GROUP BY creator_id
)

SELECT
  creator_id,
  publish_2026 - publish_2025 AS ner_difference
FROM published_per_year
