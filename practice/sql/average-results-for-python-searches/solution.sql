SELECT
  AVG(results_count) AS avg_results
FROM search_queries
WHERE LOWER(search_term) LIKE '%keyboard%'
  AND query_time >= CURRENT_DATE - INTERVAL '90 days'
