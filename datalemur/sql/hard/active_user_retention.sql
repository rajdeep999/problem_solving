--link: https://datalemur.com/questions/user-retention

SELECT
  7 AS month,
  COUNT(user_id)
FROM (
  SELECT
    user_id
  FROM 
    user_actions
  WHERE
    EXTRACT(YEAR FROM event_date) = 2022 AND 
      (EXTRACT(MONTH FROM event_date) = 6 OR EXTRACT(MONTH FROM event_date) = 7)
  GROUP BY
    user_id
  HAVING
    COUNT(DISTINCT EXTRACT(MONTH FROM event_date)) = 2
) AS user_activity
