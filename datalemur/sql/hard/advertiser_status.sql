--link: https://datalemur.com/questions/updated-status

SELECT
  COALESCE(a.user_id,p.user_id) AS user_id,
  CASE
    WHEN a.status is NULL THEN 'NEW'
    WHEN p.paid is NULL THEN 'CHURN' 
    WHEN a.status = 'CHURN' THEN 'RESURRECT' ELSE 'EXISTING'
  END AS new_status
FROM 
  advertiser a FULL OUTER JOIN daily_pay p
ON
  a.user_id = p.user_id
ORDER BY
  user_id;