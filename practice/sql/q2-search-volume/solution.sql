SELECT
  COUNT(*) AS q2_colume
FROM search_queries
WHERE CAST(query_time AS DATE) BETWEEN '2026-04-01' AND '2026-06-30'
