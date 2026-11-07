SELECT
  exp_name,
  COUNT(DISTINCT 
    CASE
      WHEN variant = 'control' THEN user_id
    END
  ) AS control_users,
  COUNT(DISTINCT 
    CASE
      WHEN variant <> 'control' THEN user_id
    END
  ) AS treatment_users,
  CASE
    WHEN COUNT(DISTINCT 
      CASE
        WHEN variant = 'control' THEN user_id
      END
    ) = COUNT(DISTINCT 
      CASE
        WHEN variant = 'holdout' THEN user_id
      END
    ) THEN NULL
    ELSE ROUND(
      1.0 * COUNT(DISTINCT 
        CASE
          WHEN variant <> 'control' THEN user_id
        END
      ) / NULLIF(
        COUNT(DISTINCT 
          CASE
            WHEN variant = 'control' THEN user_id
          END
        ),
        0
      ),
      3
    )
  END AS treatment_to_control_ratio
FROM experiments
GROUP BY exp_name
