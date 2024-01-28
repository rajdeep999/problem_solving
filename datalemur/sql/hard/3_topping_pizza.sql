--link: https://datalemur.com/questions/pizzas-topping-cost



--Approach 1:
WITH RECURSIVE r AS (
  SELECT
    p.topping_name,
    p.ingredient_cost,
    CAST(p.topping_name AS VARCHAR(100)) AS pizza,
    p.ingredient_cost:: DECIMAL AS total_cost,
    1 AS ingredient_count
  FROM
    pizza_toppings p
  UNION ALL
  SELECT
    p.topping_name,
    p.ingredient_cost,
    CAST(r.pizza || ',' || p.topping_name AS VARCHAR(100)) AS pizza,
    r.total_cost+p.ingredient_cost:: DECIMAL AS total_cost,
    r.ingredient_count + 1 AS ingredient_count
  FROM r
  INNER JOIN pizza_toppings p
  ON p.topping_name > r.topping_name
)

SELECT
  DISTINCT(pizza),
  total_cost
FROM
  r
WHERE
  ingredient_count = 3
ORDER BY
  total_cost DESC, pizza;

--Approach 2:
SELECT
  CONCAT(p1.topping_name,',', p2.topping_name,',', p3.topping_name) AS pizza,
  p1.ingredient_cost+p2.ingredient_cost+p3.ingredient_cost AS total_cost
FROM
  pizza_toppings AS p1, pizza_toppings AS p2, pizza_toppings AS p3
WHERE
  p1.topping_name<p2.topping_name and p2.topping_name<p3.topping_name
ORDER BY
  total_cost DESC, pizza;