SELECT
  user_id,
  COUNT(*) AS total_views
FROM page_views
WHERE TO_CHAR(viewed_at, 'YYYY-MM-DD') <= '2025-12-28'
  AND EXTRACT(YEAR FROM viewed_at) >= 2025
GROUP BY user_id
