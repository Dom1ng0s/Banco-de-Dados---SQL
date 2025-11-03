CREATE VIEW V_ANALISE_FINANCEIRA_BOI AS
SELECT
    b.Brinco,
    b.Status,
    b.Valor_Compra,
    -- Soma o preço de todos os produtos aplicados (vacinas)
    COALESCE(SUM(p.Preco), 0) AS Custo_Total_Vacinas,
    -- Custo total de aquisição + manutenção do boi
    (b.Valor_Compra + COALESCE(SUM(p.Preco), 0)) AS Custo_Acumulado,
    b.Valor_Venda,
    -- Calcula o lucro apenas se o status for 'Vendido' e houver valor de venda
    CASE
        WHEN b.Status = 'Vendido' AND b.Valor_Venda IS NOT NULL
        THEN (b.Valor_Venda - (b.Valor_Compra + COALESCE(SUM(p.Preco), 0)))
        ELSE NULL
    END AS Lucro_Realizado
FROM BOI b
LEFT JOIN APLICACAO_VACINA av ON b.Brinco = av.Brinco_Boi
LEFT JOIN PRODUTO p ON av.ID_Produto = p.ID_Produto
GROUP BY
    b.Brinco,
    b.Status,
    b.Valor_Compra,
    b.Valor_Venda;
