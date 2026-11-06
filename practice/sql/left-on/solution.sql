SELECT
  flag_name,
  owner,
  CASE 
    WHEN updated IS NULL THEN 'Yes'
    WHEN enabled = 1 THEN 'Yes'
    ELSE 'No'
  END AS still_enabled,
  FLOOR((DATE '2026-05-01' - created::DATE) / 365) AS years_since_creation
FROM feat_flags
WHERE created::DATE < DATE '2026-05-01' - INTERVAL '730 days'
ORDER BY 
  flag_name ASC,
  owner ASC,
  years_since_creation DESC,
  CASE
    WHEN updated IS NULL OR enabled = 1 THEN 2
    ELSE 1
  END ASC
