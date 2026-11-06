WITH running_nodes AS (
  SELECT DISTINCT
    node_id,
    hostname,
    region
  FROM infra_nodes
  WHERE LOWER(status) = 'running'
)
  
SELECT DISTINCT
  rn1.region,
  rn1.hostname AS host_1,
  rn2.hostname AS host_2
FROM running_nodes AS rn1
INNER JOIN running_nodes AS rn2
  ON rn1.region = rn2.region
  AND rn1.hostname < rn2.hostname
ORDER BY rn1.region ASC, host_1 ASC, host_2 DESC
