--link: https://datalemur.com/questions/sql-highest-grossing

WITH temp_cte AS (
SELECT
  category,
  product,
  SUM(spend) AS total_spend,
  DENSE_RANK() OVER(
    PARTITION BY category
    ORDER BY SUM(spend) DESC
  ) AS category_rank
FROM 
  product_spend
WHERE
  EXTRACT(YEAR FROM transaction_date)=2022
GROUP BY
  category,product
)

SELECT
  category,
  product,
  total_spend
FROM
  temp_cte
WHERE
  category_rank in (1,2);
