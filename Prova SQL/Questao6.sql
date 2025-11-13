SELECT c.company_name
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_details od ON od.order_id = o.order_id
JOIN products p ON p.product_id = od.product_id
GROUP BY c.customer_id, c.company_name
HAVING COUNT(DISTINCT p.supplier_id) >= 3;
