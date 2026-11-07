SELECT
  product_name,
  rating
FROM products
WHERE rating IS NOT NULL
ORDER BY rating ASC, product_name ASC
LIMIT 10
