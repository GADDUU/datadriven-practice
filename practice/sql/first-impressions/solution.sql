SELECT
  product_id,
  SUBSTR(product_name, 1, 3) AS name_prefix
FROM products
ORDER BY product_id
