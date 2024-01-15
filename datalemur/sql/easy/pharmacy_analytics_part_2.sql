--link: https://datalemur.com/questions/non-profitable-drugs

SELECT
    manufacturer,
    COUNT(drug) AS drug_count,
    SUM(cogs)-SUM(total_sales) AS total_loss
FROM
    pharmacy_sales
WHERE
    cogs>total_sales
GROUP BY
    manufacturer
ORDER BY
    total_loss DESC;