SELECT s.company_name, AVG(p.unit_price) AS media_preco
FROM suppliers s
JOIN products p ON p.supplier_id = s.supplier_id
GROUP BY s.supplier_id, s.company_name
ORDER BY media_preco DESC
LIMIT 1;
