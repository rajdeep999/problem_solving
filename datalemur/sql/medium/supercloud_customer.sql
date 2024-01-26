--link: https://datalemur.com/questions/supercloud-customer


SELECT
  c.customer_id
FROM
  customer_contracts c LEFT JOIN products p
ON
  c.product_id = p.product_id
GROUP BY
  c.customer_id
HAVING
  COUNT(DISTINCT p.product_category) = (
    SELECT 
      COUNT(DISTINCT product_category)
    FROM
      products
  );