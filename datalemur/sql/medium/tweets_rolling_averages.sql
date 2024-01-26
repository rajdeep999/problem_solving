--link: https://datalemur.com/questions/rolling-average-tweets

--solution 1
WITH temp_cte AS (
  SELECT
    user_id,
    tweet_date,
    tweet_count,
    LAG(tweet_count,1) OVER(PARTITION BY user_id ORDER BY tweet_date) AS lag1,
    LAG(tweet_count,2) OVER(PARTITION BY user_id ORDER BY tweet_date) AS lag2
  FROM
    tweets
)

SELECT
  user_id,
  tweet_date,
  ROUND(CASE 
    WHEN lag1 IS NOT NULL AND lag2 IS NOT NULL THEN (tweet_count+lag1+lag2)/3.0
    WHEN lag1 IS NOT NULL THEN (tweet_count+lag1)/2.0 ELSE tweet_count/1.0
  END,2) AS rolling_avg_3d
FROM
  temp_cte;


--solution 2

SELECT
  user_id,
  tweet_date,
  ROUND(AVG(tweet_count) OVER(
    PARTITION BY user_id
    ORDER BY tweet_date
    ROWS BETWEEN 2 PRECEDING and CURRENT ROW
  ),2) AS rolling_avg_3d
FROM
  tweets;
  