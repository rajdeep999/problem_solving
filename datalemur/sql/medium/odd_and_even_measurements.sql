--link: https://datalemur.com/questions/odd-even-measurements

WITH temp_cte AS (
  SELECT
    measurement_value,
    measurement_time,
    DENSE_RANK() OVER(PARTITION BY DATE(measurement_time) ORDER BY measurement_time )
  FROM
    measurements
)

SELECT
  DATE_TRUNC('day',measurement_time) AS measurement_day,
  SUM(CASE WHEN DENSE_RANK%2!=0 THEN measurement_value ELSE 0 END) AS odd_sum,
  SUM(CASE WHEN DENSE_RANK%2=0 THEN measurement_value ELSE 0 END) AS even_sum
FROM
  temp_cte
GROUP BY
  measurement_day
ORDER BY
  measurement_day;