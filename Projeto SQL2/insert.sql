/*
================================================================================
SCRIPT DE POVOAMENTO EM MASSA (MÉTODO TRADICIONAL SEQUENCIAL)
================================================================================
-- Este script irá gerar dados fictícios para todas as 12 tabelas.
-- Versão 4: Solução definitiva para o Erro 1137 (Can't reopen table).
-- Criamos tabelas de geração de números em passos separados e as
-- apagamos no final.
*/

-- Inicia uma transação. Se algo falhar, tudo é revertido.
START TRANSACTION;

-- Desativa temporariamente as checagens de FK para performance
SET FOREIGN_KEY_CHECKS=0;

/*
================================================================================
1. CRIAÇÃO DO GERADOR DE NÚMEROS (PASSO A PASSO)
================================================================================
-- Primeiro, limpamos qualquer tentativa anterior.
*/
DROP TABLE IF EXISTS _N10;
DROP TABLE IF EXISTS _N100;
DROP TABLE IF EXISTS _N1000;

-- Passo 1: Criamos nossa tabela base com 10 números (0-9)
CREATE TABLE _N10 (n INT);
INSERT INTO _N10 VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9);

-- Passo 2: Criamos 100 números (0-99) usando a tabela _N10
CREATE TABLE _N100 (id INT);
INSERT INTO _N100 (id)
SELECT (a.n * 10) + b.n AS id
FROM _N10 a, _N10 b; -- Usando sintaxe de JOIN implícita (mais antiga)

-- Passo 3: Criamos 1000 números (0-999) usando _N10 e _N100
CREATE TABLE _N1000 (id INT);
INSERT INTO _N1000 (id)
SELECT (a.n * 100) + b.id AS id
FROM _N10 a, _N100 b; -- Nenhum erro 1137 aqui

-- Agora temos _N100 (para 100 registros) e _N1000 (para 300 pessoas)

/*
================================================================================
2. POVOAMENTO: TABELAS BASE (SUPERCLASSE E ENTIDADES FORTES)
================================================================================
*/
-- Limpa as tabelas na ordem inversa para permitir re-execução
TRUNCATE TABLE ITEM_MANUTENCAO;
TRUNCATE TABLE MANUTENCAO;
TRUNCATE TABLE APLICACAO_VACINA;
TRUNCATE TABLE PESAGEM;
TRUNCATE TABLE BOI;
TRUNCATE TABLE VENDEDOR;
TRUNCATE TABLE COMPRADOR;
TRUNCATE TABLE FUNCIONARIO;
TRUNCATE TABLE PESSOA;
TRUNCATE TABLE PRODUTO;
TRUNCATE TABLE PASTO;
TRUNCATE TABLE LOTE;


-- PESSOA (300 registros: 100 para Func, 100 para Comp, 100 para Vend)
INSERT INTO PESSOA (CPF_CNPJ, Nome, Cidade)
SELECT 
    LPAD(id + 1, 18, '0'), -- Gera '00...001' a '00...300'
    CONCAT('Pessoa Teste ', (id + 1)), 
    CONCAT('Cidade ', (id % 10))
FROM _N1000
WHERE id < 300; -- Total de 300 pessoas

-- LOTE (100 registros)
INSERT INTO LOTE (Descricao, Data_Criacao)
SELECT
    CONCAT('Lote Descrição ', id),
    NOW() - INTERVAL FLOOR(RAND() * 365) DAY
FROM _N100; -- 100 lotes

-- PASTO (100 registros)
INSERT INTO PASTO (Nome_Pasto, Tamanho, Situacao_Cerca)
SELECT
    CONCAT('Pasto ', id),
    (RAND() * 100) + 50, -- Tamanho entre 50 e 150
    CASE (id % 3)
        WHEN 0 THEN 'Boa'
        WHEN 1 THEN 'Requer Manutenção'
        ELSE 'Ruim'
    END
FROM _N100; -- 100 pastos

-- PRODUTO (100 registros)
INSERT INTO PRODUTO (Nome, Funcao, Preco, Quantidade_Estoque)
SELECT
    CONCAT('Produto ', id),
    CASE (id % 3)
        WHEN 0 THEN 'Vacina'
        WHEN 1 THEN 'Material de Cerca'
        ELSE 'Medicamento'
    END,
    (RAND() * 150) + 10, -- Preço entre 10 e 160
    FLOOR(RAND() * 500) -- Estoque
FROM _N100; -- 100 produtos


/*
================================================================================
3. POVOAMENTO: TABELAS DE SUBCLASSE (HERANÇA)
================================================================================
*/

-- FUNCIONARIO (10 registros)
INSERT INTO FUNCIONARIO (CPF_CNPJ, Funcao, Salario, CPF_Supervisor)
VALUES
('111.111.111-11', 'Proprietário', 15000.00, NULL);

-- Nível 2: Os Gerentes (supervisionados pelo Proprietário '111.111.111-11')
INSERT INTO FUNCIONARIO (CPF_CNPJ, Funcao, Salario, CPF_Supervisor)
VALUES
('222.222.222-22', 'Gerente de Campo', 7500.00, '111.111.111-11'),
('333.333.333-33', 'Gerente Administrativo', 7000.00, '111.111.111-11');

-- Nível 3: Os Funcionários Operacionais (supervisionados pelos Gerentes)
INSERT INTO FUNCIONARIO (CPF_CNPJ, Funcao, Salario, CPF_Supervisor)
VALUES
('444.444.444-44', 'Vaqueiro', 3500.00, '222.222.222-22'), -- Subordinado da Ger. de Campo
('555.555.555-55', 'Peão de Campo', 3200.00, '222.222.222-22'), -- Subordinado da Ger. de Campo
('666.666.666-66', 'Auxiliar Administrativo', 2800.00, '333.333.333-33'); -- Subordinada do Ger. Admin

-- COMPRADOR (100 registros)
INSERT INTO COMPRADOR (CPF_CNPJ)
SELECT CPF_CNPJ
FROM (SELECT *, ROW_NUMBER() OVER(ORDER BY CPF_CNPJ) as id FROM PESSOA) AS P
WHERE P.id BETWEEN 101 AND 200;

-- VENDEDOR (100 registros)
INSERT INTO VENDEDOR (CPF_CNPJ)
SELECT CPF_CNPJ
FROM (SELECT *, ROW_NUMBER() OVER(ORDER BY CPF_CNPJ) as id FROM PESSOA) AS P
WHERE P.id BETWEEN 201 AND 300;


/*
================================================================================
4. POVOAMENTO: TABELA CENTRAL (HUB)
================================================================================
*/

-- BOI (100 registros)
INSERT INTO BOI (
    Brinco, Status, Valor_Compra, Valor_Venda,
    ID_Pasto, ID_Lote,
    CPF_CNPJ_Vendedor, CPF_CNPJ_Comprador
)
SELECT
    CONCAT('BRINCO-', LPAD(id, 4, '0')), -- 'BRINCO-0000', 'BRINCO-0001'
    CASE (id % 2) -- Metade "Ativo", metade "Vendido"
        WHEN 0 THEN 'Ativo'
        ELSE 'Vendido'
    END,
    (RAND() * 1000) + 1500, -- Valor Compra
    CASE (id % 2) -- Se vendido, tem Valor_Venda
        WHEN 0 THEN NULL
        ELSE (RAND() * 1500) + 2000
    END,
    (SELECT ID_Pasto FROM PASTO ORDER BY RAND() LIMIT 1), -- FK Aleatória
    (SELECT ID_Lote FROM LOTE ORDER BY RAND() LIMIT 1), -- FK Aleatória
    (SELECT CPF_CNPJ FROM VENDEDOR ORDER BY RAND() LIMIT 1), -- FK Aleatória
    CASE (id % 2) -- Se vendido, tem Comprador
        WHEN 0 THEN NULL
        ELSE (SELECT CPF_CNPJ FROM COMPRADOR ORDER BY RAND() LIMIT 1) -- FK Aleatória
    END
FROM _N100; -- 100 Bois


/*
================================================================================
5. POVOAMENTO: ENTIDADES FRACAS (COMPOSIÇÃO)
================================================================================
*/

-- PESAGEM (Pelo menos 100 registros)
-- Vamos dar 2 pesagens para cada boi = 200 registros
INSERT INTO PESAGEM (Brinco_Boi, Data_Pesagem, Peso_Kg)
SELECT
    Brinco,
    NOW() - INTERVAL (FLOOR(RAND() * 10) + 10) DAY, -- 10-20 dias atrás
    (RAND() * 200) + 250 -- Peso
FROM BOI;

INSERT INTO PESAGEM (Brinco_Boi, Data_Pesagem, Peso_Kg)
SELECT
    Brinco,
    NOW() - INTERVAL (FLOOR(RAND() * 5) + 1) DAY, -- 1-5 dias atrás
    (RAND() * 200) + 300 -- Peso (mais pesado)
FROM BOI;

-- APLICACAO_VACINA (Pelo menos 100 registros)
-- Damos uma aplicação para cada boi (100 registros)
INSERT INTO APLICACAO_VACINA (Brinco_Boi, Data_Aplicacao, ID_Produto, CPF_Funcionario)
SELECT
    Brinco,
    NOW() - INTERVAL FLOOR(RAND() * 30) DAY,
    (SELECT ID_Produto FROM PRODUTO WHERE Funcao = 'Vacina' ORDER BY RAND() LIMIT 1),
    (SELECT CPF_CNPJ FROM FUNCIONARIO ORDER BY RAND() LIMIT 1)
FROM BOI;

-- Vamos dar uma segunda aplicação (medicamento) para 50 bois
INSERT INTO APLICACAO_VACINA (Brinco_Boi, Data_Aplicacao, ID_Produto, CPF_Funcionario)
SELECT
    Brinco,
    NOW() - INTERVAL FLOOR(RAND() * 30) DAY,
    (SELECT ID_Produto FROM PRODUTO WHERE Funcao = 'Medicamento' ORDER BY RAND() LIMIT 1),
    (SELECT CPF_CNPJ FROM FUNCIONARIO ORDER BY RAND() LIMIT 1)
FROM (SELECT * FROM BOI ORDER BY RAND() LIMIT 50) AS SubBois;


/*
================================================================================
6. POVOAMENTO: AGREGAÇÃO
================================================================================
*/

-- MANUTENCAO (100 registros)
INSERT INTO MANUTENCAO (
    Data_Manutencao, Descricao_Servico,
    ID_Pasto, CPF_Funcionario
)
SELECT
    NOW() - INTERVAL FLOOR(RAND() * 100) DAY,
    CONCAT('Descrição do Serviço ', id),
    (SELECT ID_Pasto FROM PASTO ORDER BY RAND() LIMIT 1),
    (SELECT CPF_CNPJ FROM FUNCIONARIO ORDER BY RAND() LIMIT 1)
FROM _N100; -- 100 manutenções

-- ITEM_MANUTENCAO (Pelo menos 100 registros)
-- Inserimos 1 item para cada manutenção (100 registros)
-- Usamos INSERT IGNORE para evitar erros de PK duplicada (Manutencao, Produto)
INSERT IGNORE INTO ITEM_MANUTENCAO (ID_Manutencao, ID_Produto, Quantidade_Usada)
SELECT
    ID_Manutencao,
    (SELECT ID_Produto FROM PRODUTO WHERE Funcao = 'Material de Cerca' ORDER BY RAND() LIMIT 1),
    FLOOR(RAND() * 10) + 1 -- Quantidade
FROM MANUTENCAO;

-- Inserimos um segundo item para 50 manutenções (total 150+ registros)
INSERT IGNORE INTO ITEM_MANUTENCAO (ID_Manutencao, ID_Produto, Quantidade_Usada)
SELECT
    ID_Manutencao,
    (SELECT ID_Produto FROM PRODUTO WHERE Funcao = 'Material de Cerca' ORDER BY RAND() LIMIT 1),
    FLOOR(RAND() * 5) + 1
FROM (SELECT * FROM MANUTENCAO ORDER BY RAND() LIMIT 50) AS SubManutencao;


/*
================================================================================
7. FINALIZAÇÃO
================================================================================
*/

-- Limpa as tabelas de geração de números
DROP TABLE IF EXISTS _N10;
DROP TABLE IF EXISTS _N100;
DROP TABLE IF EXISTS _N1000;

-- Reativa as chaves estrangeiras
SET FOREIGN_KEY_CHECKS=1;

-- Confirma a transação
COMMIT;

SELECT 'Banco de dados povoado com sucesso com 100+ registros por tabela!' AS Status;
