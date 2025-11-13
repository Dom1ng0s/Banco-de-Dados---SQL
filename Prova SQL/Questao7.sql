SELECT
  CONCAT(e.first_name, ' ', e.last_name) AS funcionario,
  COUNT(DISTINCT o.customer_id) AS clientes_atendidos,
  (SELECT COUNT(*)
    FROM orders o2
    WHERE o2.customer_id IN (
        SELECT o3.customer_id FROM orders o3 WHERE o3.employee_id = e.employee_id
    )
  ) AS total_pedidos_clientes
FROM employees e
JOIN orders o ON o.employee_id = e.employee_id
GROUP BY e.employee_id;
