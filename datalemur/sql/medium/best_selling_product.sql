--link: https://datalemur.com/questions/best-selling-products

with temp_cte AS (
    SELECT 
        p.product_name,
        p.category_name,
        DENSE_RANK() OVER( 
            PARTITION BY p.category_name 
            ORDER BY s.sales_quantity DESC,s.rating DESC
        ) AS product_rank
    FROM 
        products p LEFT JOIN product_sales s
    ON
        p.product_id = s.product_id
)

SELECT
  product_name,
  category_name
FROM
  temp_cte
WHERE
  product_rank=1
ORDER BY
  category_name;