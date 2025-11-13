SELECT
  c.category_name,
  SUM(od.quantity) AS total_unidades,
  SUM(od.unit_price * od.quantity * (1 - od.discount)) AS receita_total
FROM
  categories c
  JOIN products p ON p.category_id = c.category_id
  JOIN order_details od ON od.product_id = p.product_id
GROUP BY
  c.category_id, c.category_name;
