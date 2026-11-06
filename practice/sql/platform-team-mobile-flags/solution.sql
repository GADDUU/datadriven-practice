SELECT
  owner,
  flag_name
FROM feat_flags
WHERE owner = 'platform'
  AND flag_name LIKE '%mobile%'
