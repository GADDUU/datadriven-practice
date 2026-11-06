WITH target_users AS (
  SELECT
    t.user_id,
    p.category
  FROM transactions AS t
  INNER JOIN products AS p
    ON t.product_id = p.product_id
  ORDER BY p.category ASC, t.user_id ASC
)
    
SELECT
  tu1.category,
  tu1.user_id,
  tu2.user_id,
  COUNT(*) AS shared_categories
FROM target_users AS tu1
INNER JOIN target_users AS tu2
  ON tu1.category = tu2.category
  AND tu1.user_id < tu2.user_id
GROUP BY tu1.category, tu1.user_id, tu2.user_id
ORDER BY tu1.category
