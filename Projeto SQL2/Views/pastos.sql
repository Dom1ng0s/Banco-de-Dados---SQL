CREATE VIEW V_RESUMO_PASTOS AS
SELECT
    p.ID_Pasto,
    p.Nome_Pasto,
    p.Tamanho,
    p.Situacao_Cerca,
    -- Conta apenas os bovinos com status 'Ativo' naquele pasto
    COUNT(b.Brinco) AS Quantidade_Bovinos_Ativos,
    -- Subquery para buscar a data da última manutenção daquele pasto
    (
        SELECT MAX(m.Data_Manutencao)
        FROM MANUTENCAO m
        WHERE m.ID_Pasto = p.ID_Pasto
    ) AS Data_Ultima_Manutencao
FROM PASTO p
LEFT JOIN BOI b ON p.ID_Pasto = b.ID_Pasto AND b.Status = 'Ativo'
GROUP BY
    p.ID_Pasto,
    p.Nome_Pasto,
    p.Tamanho,
    p.Situacao_Cerca;
