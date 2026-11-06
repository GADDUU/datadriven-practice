SELECT DISTINCT
  owner_id
FROM api_tokens
WHERE TO_CHAR(issued, 'YYYY-MM-DD') <= '2025-07-01'
  AND (TO_CHAR(expires, 'YYYY-MM-DD') >= '2025-07-01' OR expires IS NULL)
ORDER BY owner_id
