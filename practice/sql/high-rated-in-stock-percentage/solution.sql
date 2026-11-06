SELECT
  ROUND(
    CAST(
      100 * SUM(
        CASE
          WHEN in_stock <> 0
            AND rating >= 4 THEN 1
          ELSE 0
        END
      )
      AS DOUBLE
    ) / COUNT(*),
    3
  ) AS pct_in_stock_high_rated
FROM products
