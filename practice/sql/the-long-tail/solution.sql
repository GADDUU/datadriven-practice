WITH top5 AS (
  SELECT
    endpoint,
    UPPER(method) AS method,
    latency,
    ROW_NUMBER() OVER (
      PARTITION BY UPPER(method)
      ORDER BY latency
    ) AS rn
  FROM api_calls
  WHERE latency IS NOT NULL
)

SELECT
  method,
  ROUND(AVG(latency), 2) AS fastest_five_avg
FROM top5
WHERE rn <= 5
GROUP BY method
