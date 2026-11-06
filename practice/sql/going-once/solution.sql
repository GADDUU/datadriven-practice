WITH ranked_transactions AS (
  SELECT
    p.product_id,
    p.product_name,
    t.user_id,
    t.total_amount,
    ROW_NUMBER() OVER(PARTITION BY p.product_id ORDER BY t.total_amount DESC) AS rnk,
    COUNT(*) OVER(PARTITION BY p.product_id) AS bid_count
  FROM products AS p
  LEFT JOIN transactions AS t
    ON p.product_id = t.product_id
  WHERE p.in_stock <> 0
  ORDER BY p.product_id
)
    
SELECT
  product_id,
  product_name,
  CASE
    WHEN user_id IS NOT NULL THEN bid_count
    ELSE 0
  END AS bid_count,
  total_amount AS highest_bid,
  user_id AS winner
FROM ranked_transactions
WHERE rnk = 1
