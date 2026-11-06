SELECT DISTINCT
  region
FROM (
  SELECT
    *
  FROM orders
  WHERE profit > 1200
    AND status IN ('Completed', 'Shipped')
    AND region IS NOT NULL
)
