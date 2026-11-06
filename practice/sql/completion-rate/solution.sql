SELECT
  region,
  ROUND(
    CAST(
      SUM(
        CASE
          WHEN status = 'Completed' THEN 1
          ELSE 0
        END
      ) * 100
      AS DOUBLE
    ) / COUNT(*),
    2
  ) AS completion_pct
FROM orders
WHERE region IS NOT NULL
GROUP BY region
ORDER BY region
