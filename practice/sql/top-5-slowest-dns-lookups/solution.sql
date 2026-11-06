WITH ranked_latency AS (
  SELECT DISTINCT
    domain,
    rec_type,
    latency,
    DENSE_RANK() OVER(ORDER BY latency DESC) AS rnk
  FROM dns_lookups
)

SELECT
  domain,
  rec_type,
  latency AS max_latency
FROM ranked_latency
WHERE rnk <= 5
