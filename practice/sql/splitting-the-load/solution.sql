WITH ranked_charges AS (
  SELECT
    team_name,
    svc_name || ' - ' || region AS entry_label,
    amount,
    ROW_NUMBER() OVER (
      PARTITION BY team_name
      ORDER BY amount DESC
    ) AS rnk
  FROM cost_allocs
)

SELECT
  team_name,
  entry_label,
  amount
FROM ranked_charges
WHERE rnk <= 3
ORDER BY team_name, amount DESC
