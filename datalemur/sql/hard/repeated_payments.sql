--link: https://datalemur.com/questions/repeated-payments

WITH temp_cte AS (
  SELECT 
    transaction_id, 
    EXTRACT(
      EPOCH FROM 
        transaction_timestamp - LAG(transaction_timestamp, 1) OVER(
          PARTITION BY merchant_id, credit_card_id, amount 
          ORDER BY transaction_timestamp
        )
    ) AS time 
  FROM 
    transactions
)

SELECT
  COUNT(*) AS payment_count
FROM
  temp_cte
WHERE
  time<=600;