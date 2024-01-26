--link: https://datalemur.com/questions/card-launch-success



-- Approach 1:
WITH temp_cte AS (
  SELECT
    card_name,
    issued_amount,
    DENSE_RANK() OVER(PARTITION BY card_name ORDER BY issue_year,issue_month) AS issue_seq
  FROM
    monthly_cards_issued
)

SELECT
  card_name,
  issued_amount
FROM
  temp_cte
WHERE
  issue_seq = 1
ORDER BY
  issued_amount DESC;



-- Approach 2:
SELECT
  DISTINCT card_name,
  FIRST_VALUE(issued_amount) OVER(PARTITION BY card_name ORDER BY issue_year,issue_month) AS issued_amount
FROM
  monthly_cards_issued
ORDER BY
  issued_amount DESC;