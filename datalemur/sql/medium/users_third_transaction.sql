--link: https://datalemur.com/questions/sql-third-transaction

WITH temp_cte AS (
  SELECT 
    user_id,
    spend,
    transaction_date,
    DENSE_RANK() OVER(PARTITION BY user_id ORDER BY transaction_date) AS transaction_seq
  FROM
    transactions
)

SELECT
  user_id,
  spend,
  transaction_date
FROM
  temp_cte
WHERE
  transaction_seq = 3;