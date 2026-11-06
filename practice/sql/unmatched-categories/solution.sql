SELECT DISTINCT
  category  
FROM products
GROUP BY category
HAVING COUNT(*) FILTER(WHERE in_stock = 0) >= 3
