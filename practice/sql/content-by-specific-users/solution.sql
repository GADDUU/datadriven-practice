SELECT
  c.content_id,
  c.title,
  c.content_type,
  c.creator_id
FROM content_items AS c
INNER JOIN users AS u
  ON c.creator_id = u.user_id
WHERE u.username IN ('alice', 'aaron42', 'amelia')
ORDER BY c.content_id
