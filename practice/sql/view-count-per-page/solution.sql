SELECT
  LOWER(page_url) AS page_url,
  COUNT(view_id) AS view_count
FROM page_views
GROUP BY LOWER(page_url)
ORDER BY view_count DESC
