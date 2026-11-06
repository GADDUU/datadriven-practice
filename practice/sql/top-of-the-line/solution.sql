SELECT
  product_name,
  category,
  price,
  in_stock
FROM products
WHERE price IS NOT NULL
ORDER BY price DESC, product_name
LIMIT 5
