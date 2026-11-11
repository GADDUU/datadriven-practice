SELECT
  product_name,
  total_total_amount,
  ROW_NUMBER() OVER(ORDER BY total_total_amount DESC) AS rnk
FROM (
  SELECT
    p.product_name,
    SUM(t.total_amount) AS total_total_amount 
  FROM products AS p
  INNER JOIN transactions AS t
    ON p.product_id = t.product_id
  GROUP BY p.product_name
)
LIMIT 10
