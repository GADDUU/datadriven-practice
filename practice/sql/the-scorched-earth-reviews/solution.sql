SELECT
  product_name,
  rating
FROM products
GROUP BY product_name
HAVING MIN(rating) = 1
ORDER BY product_name
