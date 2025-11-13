SELECT
  p.product_name,
  s.company_name AS nome_fornecedor
FROM
  products p
  JOIN suppliers s ON p.supplier_id = s.supplier_id
LEFT JOIN order_details od ON p.product_id = od.product_id
WHERE
  od.product_id IS NULL;
