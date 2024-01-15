--link: https://datalemur.com/questions/completed-trades

SELECT 
    u.city,
    SUM( CASE WHEN t.status = 'Completed' THEN 1 ELSE 0 END) as total_orders
FROM
    users u LEFT JOIN trades t
ON
    u.user_id = t.user_id
GROUP BY
    u.city
ORDER BY
    total_orders DESC
LIMIT 3;