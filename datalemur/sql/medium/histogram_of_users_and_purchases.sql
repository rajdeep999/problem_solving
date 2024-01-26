--link: https://datalemur.com/questions/histogram-users-purchases


WITH temp_cte AS (
  SELECT
    transaction_date,
    user_id,
    COUNT(product_id) AS purchase_count,
    DENSE_RANK() OVER(PARTITION BY user_id ORDER BY transaction_date DESC) AS transact_seq
  FROM
    user_transactions
  GROUP BY
    transaction_date,user_id
  ORDER BY transaction_date DESC, user_id
)

SELECT
  transaction_date,
  user_id,
  purchase_count
FROM
  temp_cte
WHERE
  transact_seq = 1
ORDER BY
  transaction_date;