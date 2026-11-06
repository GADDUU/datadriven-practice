SELECT
  product_name,
  price
FROM products
WHERE price > 200 
  AND in_stock > 0 
  AND LOWER(category) = 'electronics'
ORDER BY price DESC
LIMIT 5
