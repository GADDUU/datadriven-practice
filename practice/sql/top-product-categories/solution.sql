WITH ranked_category AS (
  SELECT
    category,
    txn_count,
    DENSE_RANK() OVER (
      ORDER BY txn_count DESC
    ) AS rnk
  FROM (
    SELECT
      p.category,
      COUNT(t.transaction_id) AS txn_count
    FROM products AS p
    INNER JOIN transactions AS t
      ON p.product_id = t.product_id
    WHERE p.rating >= 3.0
    GROUP BY p.category
  )
)

SELECT
  *
FROM ranked_category
WHERE rnk <= 3
