SELECT DISTINCT
  a.user_id AS user_id1,
  b.user_id AS user_id2
FROM experiments AS a
JOIN experiments AS b
  ON a.user_id < b.user_id
WHERE a.variant <> b.variant
  AND a.platform = b.platform
ORDER BY user_id1, user_id2
