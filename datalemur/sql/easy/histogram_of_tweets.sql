-- link: https://datalemur.com/questions/sql-histogram-tweets


WITH temp_cte AS (
    SELECT
        COUNT(tweet_id) AS tweet_bucket,
        user_id
    FROM
        tweets
    WHERE
        extract(year from tweet_date) = 2022
    GROUP BY
        user_id
)


SELECT
    tweet_bucket,
    COUNT(user_id) AS users_num 
FROM
    temp_cte
GROUP BY
    tweet_bucket
ORDER BY
    tweet_bucket;