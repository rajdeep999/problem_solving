--link: https://datalemur.com/questions/sql-average-post-hiatus-1

SELECT
    user_id,
    EXTRACT('day' from MAX(post_date)-MIN(post_date)) as days_between
FROM
    posts
WHERE
    EXTRACT('year'FROM post_date) = 2021
GROUP BY
    user_id
HAVING
    count(post_id) > 1
ORDER BY
    user_id;
