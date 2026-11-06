SELECT
  region,
  COUNT(DISTINCT hostname) AS unique_hostnames
FROM infra_nodes
WHERE LOWER(node_type) IN ('compute', 'storage', 'network', 'gpu')
GROUP BY region
HAVING COUNT(DISTINCT hostname) > 2
