SELECT c.company_name
FROM customers c
WHERE c.customer_id NOT IN (
  SELECT DISTINCT o.customer_id
  FROM orders o
  JOIN order_details od ON od.order_id = o.order_id
  JOIN products p ON p.product_id = od.product_id
  JOIN categories cat ON p.category_id = cat.category_id
  WHERE cat.category_name = 'Beverages'
);
