SELECT o.order_id, o.order_date, c.company_name, CONCAT(e.first_name, ' ', e.last_name) AS funcionario
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN employees e ON o.employee_id = e.employee_id
WHERE o.shipped_date > o.required_date;
