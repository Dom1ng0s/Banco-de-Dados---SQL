use projetobanco;
CREATE VIEW V_GANHO_DE_PESO_DIARIO AS
WITH PesagensOrdenadas AS (
    -- 1. Enumera todas as pesagens de cada boi, da mais antiga para a mais nova
    SELECT
        Brinco_Boi,
        Data_Pesagem,
        Peso_Kg,
        ROW_NUMBER() OVER(PARTITION BY Brinco_Boi ORDER BY Data_Pesagem ASC) as rn_asc,
        ROW_NUMBER() OVER(PARTITION BY Brinco_Boi ORDER BY Data_Pesagem DESC) as rn_desc
    FROM PESAGEM
),
PrimeiraUltima AS (
    -- 2. Agrupa os resultados para pegar apenas a primeira (rn_asc = 1) e a última (rn_desc = 1)
    SELECT
        Brinco_Boi,
        MAX(CASE WHEN rn_asc = 1 THEN Data_Pesagem END) AS Data_Inicial,
        MAX(CASE WHEN rn_asc = 1 THEN Peso_Kg END) AS Peso_Inicial,
        MAX(CASE WHEN rn_desc = 1 THEN Data_Pesagem END) AS Data_Final,
        MAX(CASE WHEN rn_desc = 1 THEN Peso_Kg END) AS Peso_Final
    FROM PesagensOrdenadas
    GROUP BY Brinco_Boi
)
-- 3. Calcula o resultado final
SELECT
    p.Brinco_Boi,
    b.Status,
    p.Data_Inicial,
    p.Peso_Inicial,
    p.Data_Final,
    p.Peso_Final,
    (p.Peso_Final - p.Peso_Inicial) AS Ganho_Total_Kg,
    DATEDIFF(p.Data_Final, p.Data_Inicial) AS Dias_No_Periodo,
    -- Calcula o Ganho Médio Diário (GMD)
    CASE
        WHEN DATEDIFF(p.Data_Final, p.Data_Inicial) > 0
        THEN (p.Peso_Final - p.Peso_Inicial) / DATEDIFF(p.Data_Final, p.Data_Inicial)
        ELSE NULL -- Evita divisão por zero se houver apenas uma pesagem
    END AS GMD_Kg_Dia
FROM PrimeiraUltima p
JOIN BOI b ON p.Brinco_Boi = b.Brinco
WHERE p.Data_Inicial <> p.Data_Final; -- Garante que há pelo menos 2 pesagens
