--link: https://datalemur.com/questions/prime-warehouse-storage

WITH temp_cte AS (
    SELECT
        item_type,
        COUNT(item_id) AS item_count,
        SUM(square_footage) AS tf
    FROM
        inventory
    GROUP BY
        item_type
)

SELECT 
  item_type,
  FLOOR(500000/tf)*item_count AS item_count
FROM temp_cte WHERE item_type = 'prime_eligible'
UNION
SELECT 
  item_type,
  FLOOR((500000-(SELECT FLOOR(500000/tf)*tf FROM temp_cte WHERE item_type = 'prime_eligible'))/tf)*item_count AS item_count
FROM temp_cte WHERE item_type = 'not_prime'
ORDER BY item_type DESC;

