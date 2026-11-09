SELECT
  category,
  MIN(price) AS floor_price,
  MAX(price) AS ceiling_price,
  MAX(price) - MIN(price) AS price_spread
FROM products
WHERE rating IS NOT NULL
  AND in_stock = 0
GROUP BY category
ORDER BY category ASC
