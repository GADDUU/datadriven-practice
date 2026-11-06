SELECT
  product_name,
  category,
  rating,
  DENSE_RANK() OVER(PARTITION BY category ORDER BY CAST(rating AS INTEGER) DESC) AS position
FROM products
WHERE rating IS NOT NULL
