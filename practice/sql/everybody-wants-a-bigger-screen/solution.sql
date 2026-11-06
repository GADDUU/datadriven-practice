SELECT
  user_id,
  COUNT(*) AS keyboard_searches
FROM search_queries 
WHERE LOWER(search_term) LIKE '%keyboard%'
GROUP BY user_id
HAVING COUNT(*) <> 0
