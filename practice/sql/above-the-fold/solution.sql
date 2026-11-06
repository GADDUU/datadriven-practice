SELECT
  query_id,
  CASE 
    WHEN clicked_result = 0 THEN 1
    WHEN clicked_result <= 3 THEN 3
    WHEN clicked_result > 3 THEN 2
  END AS rating
FROM search_queries
