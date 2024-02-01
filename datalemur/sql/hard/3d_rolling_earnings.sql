--link: https://datalemur.com/questions/3d-rolling-earnings

SELECT
  user_id,
  transaction_date,
  SUM(SUM(amount)) OVER(
    PARTITION BY user_id
    ORDER BY transaction_date RANGE BETWEEN INTERVAL '2 days' PRECEDING AND  CURRENT ROW
  )
FROM 
  user_transactions
GROUP BY
  user_id,transaction_date;