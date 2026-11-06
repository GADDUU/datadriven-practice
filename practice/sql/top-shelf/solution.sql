WITH ranked_products AS (
  SELECT
    category,
    product_name,
    rating,
    ROW_NUMBER() OVER(PARTITION BY category ORDER BY rating ASC, price DESC) AS rnk
  FROM products
  WHERE rating IS NOT NULL
)
  
SELECT
  category,
  product_name,
  rating AS floor_rating
FROM ranked_products
WHERE rnk = 1
ORDER BY floor_rating DESC
LIMIT 3
