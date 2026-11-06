SELECT
  search_term,
  COUNT(DISTINCT user_id) AS unique_searchers
FROM search_queries
GROUP BY search_term
ORDER BY unique_searchers DESC
