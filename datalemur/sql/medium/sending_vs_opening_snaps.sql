-- link: https://datalemur.com/questions/time-spent-snaps

WITH temp_cte AS (
  SELECT 
    age.age_bucket,
    act.time_spent,
    CASE WHEN act.activity_type = 'send' THEN act.time_spent ELSE 0 END AS sent_time,
    CASE WHEN act.activity_type = 'open' THEN act.time_spent ELSE 0 END AS open_time
  FROM 
    activities act LEFT JOIN age_breakdown age
  ON
    act.user_id = age.user_id
  WHERE
    act.activity_type in ('send','open')
)

SELECT
  age_bucket,
  ROUND(100.0 * (SUM(sent_time)/SUM(time_spent)),2) AS send_perc,
  ROUND(100.0 * (SUM(open_time)/SUM(time_spent)),2) AS open_perc
FROM
  temp_cte
GROUP BY
  age_bucket;