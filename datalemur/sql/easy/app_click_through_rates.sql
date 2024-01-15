--link: https://datalemur.com/questions/click-through-rate

WITH temp_table AS (
    SELECT
        app_id,
        CASE (WHEN event_type = 'impression' THEN 1 ELSE 0 END ) AS impr_cnt,
        CASE (WHEN event_type = 'click' THEN 1 ELSE 0 END ) AS clck_cnt
FROM
    events
WHERE
    EXTRACT(YEAR FROM timestamp) = 2022
)

SELECT
    app_id,
    ROUND( (100.0 * SUM(clck_cnt) ) / SUM(impr_cnt) ,2) AS ctr
FROM
    temp_table
GROUP BY
    app_id;