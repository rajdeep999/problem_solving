--link: https://datalemur.com/questions/signup-confirmation-rate

SELECT 
  ROUND(SUM(CASE WHEN signup_action = 'Confirmed' THEN 1.0 ELSE 0.0 END) /
  SUM(CASE WHEN signup_action IS NOT NULL THEN 1.0 ELSE 0.0 END),2) AS confirm_rate
FROM
  emails e LEFT JOIN texts t
ON
  e.email_id = t.email_id;
  