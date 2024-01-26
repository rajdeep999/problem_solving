--link: https://datalemur.com/questions/alibaba-compressed-mode

WITH temp_cte AS (
  SELECT 
    item_count,
    order_occurrences,
    DENSE_RANK() OVER(ORDER BY order_occurrences DESC) AS order_rank
  FROM 
    items_per_order
)

SELECT
  item_count AS mode
FROM
  temp_cte
WHERE
  order_rank = 1
ORDER BY
  item_count;