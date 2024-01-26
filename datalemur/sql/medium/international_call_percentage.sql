--link: https://datalemur.com/questions/international-call-percentage


WITH temp_cte AS (
    SELECT
        count(*) AS total_call,
        SUM(CASE WHEN call_info.country_id!=rec_info.country_id THEN 1.0 ELSE 0.0 END) AS international_calls
    FROM 
        phone_calls call 
    LEFT JOIN 
        phone_info call_info
    ON
        call.caller_id = call_info.caller_id
    LEFT JOIN 
        phone_info rec_info
    ON
        call.receiver_id = rec_info.caller_id
)

SELECT
  ROUND(international_calls/total_call*100,1) AS international_calls_pct
FROM
  temp_cte;