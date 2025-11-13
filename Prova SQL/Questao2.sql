SELECT
  c.company_name,
  COUNT(o.order_id) AS total_pedidos
FROM
  customers c
  JOIN orders o ON o.customer_id = c.customer_id
WHERE
  o.order_date BETWEEN '1996-01-01' AND '1997-12-31'
GROUP BY
  c.customer_id, c.company_name
HAVING
  COUNT(o.order_id) > 10;
