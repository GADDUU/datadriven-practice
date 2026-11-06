SELECT
  COUNT(*) AS repeat_searcher_count
FROM (
  SELECT
    user_id,
    COUNT(*) AS cnt
  FROM search_queries
  WHERE EXTRACT(YEAR FROM query_time) = 2026
  GROUP BY user_id
)
WHERE cnt > 1
