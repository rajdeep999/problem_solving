-- link: https://datalemur.com/questions/teams-power-users

SELECT
    sender_id,
    count(message_id) as count_messages 
FROM
    messages
where
    EXTRACT(month from sent_date)=8 and EXTRACT(year from sent_date)=2022
GROUP BY
    sender_id
ORDER BY
    COUNT(message_id) DESC
LIMIT 2;