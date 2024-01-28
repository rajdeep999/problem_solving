--link: https://datalemur.com/questions/yoy-growth-rate


WITH temp_cte AS (
  SELECT
    EXTRACT(YEAR FROM transaction_date) AS year,
    product_id,
    SUM(spend) AS curr_year_spend,
    LAG(SUM(spend),1) 
      OVER(
        PARTITION BY product_id 
        order by EXTRACT(YEAR FROM transaction_date)
      ) AS prev_year_spend
  FROM 
    user_transactions
  GROUP BY
    year,product_id
)

SELECT
  year,
  product_id,
  curr_year_spend,
  prev_year_spend,
  ROUND(((curr_year_spend-prev_year_spend)/prev_year_spend)*100.0,2) AS yoy_rate
FROM
  temp_cte;
  