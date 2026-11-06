SELECT
  p.product_name AS product_name,
  SUM(
    CASE 
      WHEN p.category = 'Electronics' THEN COALESCE(t.total_amount, 0)
      ELSE 0
    END
  ) AS electronics_total
FROM products AS p
LEFT JOIN transactions AS t
  ON p.product_id = t.product_id
GROUP BY p.product_name, p.product_id
ORDER BY electronics_total DESC, p.product_name
