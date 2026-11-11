SELECT DISTINCT
  user_id
FROM search_queries
WHERE REGEXP_LIKE(
    LOWER(search_term),
    '(^|[^a-z])(desk|monitor|cable|mouse)($|[^a-z])'
  )
  AND NOT REGEXP_LIKE(
    LOWER(search_term),
    'desk[ -]+mat|monitor[ -]+arm|cable[ -]+management'
  )
