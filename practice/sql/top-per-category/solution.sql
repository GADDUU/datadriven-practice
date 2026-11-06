WITH product_rank AS (
  SELECT
    product_name,
    category,
    rating,
    RANK() OVER(PARTITION BY category ORDER BY rating DESC) AS rk
  FROM products 
  WHERE rating IS NOT NULL
)
  
  SELECT
    product_name,
    category,
    rating
  FROM product_rank
  WHERE rk = 1
