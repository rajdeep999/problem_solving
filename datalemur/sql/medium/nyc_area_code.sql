--link: https://datalemur.com/questions/nyc-area-code

WITH temp_cte AS (
  SELECT
    caller_id
  FROM 
    phone_info
  WHERE
    SUBSTRING(phone_number,4,3) = '212'
)

SELECT 
  COUNT(*)
FROM
  phone_calls
WHERE
  caller_id in (SELECT caller_id FROM temp_cte) OR
  receiver_id in (SELECT caller_id FROM temp_cte);
    