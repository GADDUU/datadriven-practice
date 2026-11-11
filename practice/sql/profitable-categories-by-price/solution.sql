SELECT
  category,
  MIN(price) AS min_price,
  AVG(rating) AS avg_rating
FROM products
  WHERE in_stock <> 0
GROUP BY category
HAVING AVG(rating) >= 3.0
