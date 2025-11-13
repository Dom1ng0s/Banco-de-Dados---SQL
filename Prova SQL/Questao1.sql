SELECT
  CONCAT(e.first_name, ' ', e.last_name) AS nome_funcionario,
  SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_vendas
FROM 
  employees e
  JOIN orders o ON o.employee_id = e.employee_id
  JOIN order_details od ON od.order_id = o.order_id
GROUP BY
  e.employee_id, e.first_name, e.last_name
ORDER BY
  total_vendas DESC;
