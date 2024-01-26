--link: https://datalemur.com/questions/top-fans-rank

WITH temp_cte AS (
  SELECT
    a.artist_name,
    DENSE_RANK() OVER(  
      ORDER BY COUNT(g.song_id) DESC
    ) AS artist_rank
  FROM
    global_song_rank g LEFT JOIN songs s
  ON
    s.song_id = g.song_id
  LEFT JOIN artists a
  ON
    s.artist_id = a.artist_id
  WHERE
    g.rank<=10 and a.artist_id IS NOT NULL
  GROUP BY
    a.artist_name
)


SELECT
  artist_name,
  artist_rank
FROM
  temp_cte
WHERE
  artist_rank<=5;