--link: https://datalemur.com/questions/sql-average-deal-size

SELECT
  ROUND(SUM(num_seats*yearly_seat_cost)::DECIMAL/COUNT(*),2)
FROM
  contracts;