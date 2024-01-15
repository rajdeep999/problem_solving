-- link: https://datalemur.com/questions/matching-skills

SELECT
    candidate_id FROM candidates
where
    skill in ('Python','Tableau','PostgreSQL')
GROUP BY
    candidate_id
having
    count(skill)=3
ORDER BY
    candidate_id;