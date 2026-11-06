SELECT
  query_id,
  LTRIM(search_term)
FROM search_queries
ORDER BY query_id
