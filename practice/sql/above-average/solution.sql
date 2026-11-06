SELECT
  product_name,
  category,
  price,
  catalog_avg
FROM (
  SELECT
    *,
    AVG(price) OVER() AS catalog_avg
  FROM products
)
WHERE price > catalog_avg
ORDER BY price DESC
