SELECT
  c1.call_id AS call_id_1,
  c1.latency AS latency_1,
  c2.call_id AS call_id_2,
  c2.latency AS latency_2,
  MAX(c1.latency, c2.latency) AS max_latency
FROM api_calls AS c1
CROSS JOIN api_calls AS c2
WHERE c1.latency IS NOT NULL
  AND c2.latency IS NOT NULL
ORDER BY latency_1, latency_2, max_latency
LIMIT 100
