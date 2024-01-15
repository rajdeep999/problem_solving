--link: https://datalemur.com/questions/duplicate-job-listings

SELECT
    count(*) AS duplicate_companies
FROM (
    SELECT
        company_id,
        title, 
        description,
        count(*)
    FROM
        job_listings
    GROUP BY
        company_id,
        title,
        description
    HAVING
        count(*) > 1
) AS duplcate_job_posting;