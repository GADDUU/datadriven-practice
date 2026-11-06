SELECT
  category,
  product_name,
  price
FROM (
  SELECT
    category,
    product_name,
    price,
    RANK() OVER(PARTITION BY category ORDER BY price DESC) AS rnk
  FROM products
)
WHERE rnk = 1
ORDER BY category, product_name
