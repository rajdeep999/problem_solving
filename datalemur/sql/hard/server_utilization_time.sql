--link: https://datalemur.com/questions/total-utilization-time

WITH temp_cte AS (
  SELECT
    session_status,
    EXTRACT(
      EPOCH FROM 
        status_time - LAG(status_time,1) OVER(
          PARTITION BY server_id 
          ORDER BY server_id, status_time)
      ) AS  up_time
  FROM 
    server_utilization
)

SELECT 
  ROUND(SUM(up_time)/86400,0) AS total_uptime_days
FROM
  temp_cte
WHERE
  session_status = 'stop';