SELECT
  product_name,
  price
FROM products
WHERE in_stock <> 0 AND rating >= 4
  AND LOWER(category) = 'electronics'
