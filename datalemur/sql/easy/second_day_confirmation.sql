--link: https://datalemur.com/questions/second-day-confirmation

SELECT
    e.user_id 
FROM
    emails e LEFT JOIN texts t
ON
    e.email_id = t.email_id
WHERE
    t.signup_action = 'Confirmed' AND EXTRACT( DAY FROM t.action_date - e.signup_date ) = 1;