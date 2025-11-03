/*
================================================================================
SCRIPT DE CRIAÇÃO DO BANCO DE DADOS - GESTÃO DE GADO
================================================================================
*/

-- Para garantir um ambiente limpo, apagamos as tabelas na ordem inversa de dependência.
DROP TABLE IF EXISTS ITEM_MANUTENCAO;
DROP TABLE IF EXISTS MANUTENCAO;
DROP TABLE IF EXISTS APLICACAO_VACINA;
DROP TABLE IF EXISTS PESAGEM;
DROP TABLE IF EXISTS BOI;
DROP TABLE IF EXISTS VENDEDOR;
DROP TABLE IF EXISTS COMPRADOR;
DROP TABLE IF EXISTS FUNCIONARIO;
DROP TABLE IF EXISTS PESSOA;
DROP TABLE IF EXISTS PRODUTO;
DROP TABLE IF EXISTS PASTO;
DROP TABLE IF EXISTS LOTE;


/*
================================================================================
1. TABELAS BASE (SUPERCLASSE E ENTIDADES FORTES)
================================================================================
*/

CREATE TABLE PESSOA (
    CPF_CNPJ VARCHAR(18) NOT NULL COMMENT 'PK. Pode ser CPF (14) ou CNPJ (18)',
    Nome VARCHAR(150) NOT NULL,
    Cidade VARCHAR(100),
    PRIMARY KEY (CPF_CNPJ)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE LOTE (
    ID_Lote INT NOT NULL AUTO_INCREMENT,
    Descricao VARCHAR(255),
    Data_Criacao DATE,
    PRIMARY KEY (ID_Lote)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE PASTO (
    ID_Pasto INT NOT NULL AUTO_INCREMENT,
    Nome_Pasto VARCHAR(100) NOT NULL,
    Tamanho DECIMAL(10, 2) COMMENT 'Ex: em hectares',
    Situacao_Cerca VARCHAR(50) COMMENT 'Ex: "Boa", "Requer Manutenção"',
    PRIMARY KEY (ID_Pasto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE PRODUTO (
    ID_Produto INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Funcao VARCHAR(100) COMMENT 'Ex: "Vacina", "Ração", "Material de Cerca"',
    Preco DECIMAL(10, 2),
    Quantidade_Estoque INT DEFAULT 0,
    PRIMARY KEY (ID_Produto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/*
================================================================================
2. TABELAS DE SUBCLASSE (IMPLEMENTAÇÃO DA HERANÇA)
================================================================================
*/

CREATE TABLE FUNCIONARIO (
    CPF_CNPJ VARCHAR(18) NOT NULL,
    Funcao VARCHAR(100),
    Salario DECIMAL(10, 2),
    CPF_Supervisor VARCHAR(18) NULL COMMENT 'FK para o supervisor (auto-relacionamento)',
    PRIMARY KEY (CPF_CNPJ),
    FOREIGN KEY (CPF_CNPJ) REFERENCES PESSOA(CPF_CNPJ)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (CPF_Supervisor) REFERENCES FUNCIONARIO(CPF_CNPJ)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE COMPRADOR (
    CPF_CNPJ VARCHAR(18) NOT NULL,
    PRIMARY KEY (CPF_CNPJ),
    FOREIGN KEY (CPF_CNPJ) REFERENCES PESSOA(CPF_CNPJ)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE VENDEDOR (
    CPF_CNPJ VARCHAR(18) NOT NULL,
    PRIMARY KEY (CPF_CNPJ),
    FOREIGN KEY (CPF_CNPJ) REFERENCES PESSOA(CPF_CNPJ)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/*
================================================================================
3. TABELA CENTRAL (HUB)
================================================================================
*/

CREATE TABLE BOI (
    Brinco VARCHAR(20) NOT NULL COMMENT 'PK. Identificador único do animal.',
    Status VARCHAR(50) COMMENT 'Ex: "Ativo", "Vendido", "Abatido"',
    Valor_Compra DECIMAL(10, 2),
    Valor_Venda DECIMAL(10, 2) NULL,
    ID_Pasto INT NULL,
    ID_Lote INT NULL,
    CPF_CNPJ_Vendedor VARCHAR(18) NOT NULL,
    CPF_CNPJ_Comprador VARCHAR(18) NULL,
    PRIMARY KEY (Brinco),
    FOREIGN KEY (ID_Pasto) REFERENCES PASTO(ID_Pasto)
        ON DELETE SET NULL, -- Se o pasto for removido, o boi fica "sem pasto"
    FOREIGN KEY (ID_Lote) REFERENCES LOTE(ID_Lote)
        ON DELETE SET NULL, -- Se o lote for removido, o boi fica "sem lote"
    FOREIGN KEY (CPF_CNPJ_Vendedor) REFERENCES VENDEDOR(CPF_CNPJ)
        ON DELETE RESTRICT -- Não permite deletar um vendedor que já vendeu gado
        ON UPDATE CASCADE,
    FOREIGN KEY (CPF_CNPJ_Comprador) REFERENCES COMPRADOR(CPF_CNPJ)
        ON DELETE SET NULL -- Se o comprador for removido, a venda é "anulada"
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/*
================================================================================
4. TABELAS DE ENTIDADE FRACA (IMPLEMENTAÇÃO DA COMPOSIÇÃO)
================================================================================
*/

CREATE TABLE PESAGEM (
    Brinco_Boi VARCHAR(20) NOT NULL,
    Data_Pesagem DATETIME NOT NULL COMMENT 'Usar DATETIME para permitir várias pesagens no mesmo dia',
    Peso_Kg DECIMAL(7, 2) NOT NULL COMMENT 'Permite pesos de até 99999.99 kg',
    PRIMARY KEY (Brinco_Boi, Data_Pesagem),
    FOREIGN KEY (Brinco_Boi) REFERENCES BOI(Brinco)
        ON DELETE CASCADE -- Se o boi for deletado, suas pesagens são deletadas
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE APLICACAO_VACINA (
    Brinco_Boi VARCHAR(20) NOT NULL,
    Data_Aplicacao DATETIME NOT NULL,
    ID_Produto INT NOT NULL COMMENT 'FK. O produto deve ter a função "Vacina" ou similar',
    CPF_Funcionario VARCHAR(18) NULL,
    PRIMARY KEY (Brinco_Boi, Data_Aplicacao, ID_Produto), -- Chave composta robusta
    FOREIGN KEY (Brinco_Boi) REFERENCES BOI(Brinco)
        ON DELETE CASCADE -- Se o boi for deletado, suas aplicações são deletadas
        ON UPDATE CASCADE,
    FOREIGN KEY (ID_Produto) REFERENCES PRODUTO(ID_Produto)
        ON DELETE RESTRICT, -- Não deletar um produto que já foi usado
    FOREIGN KEY (CPF_Funcionario) REFERENCES FUNCIONARIO(CPF_CNPJ)
        ON DELETE SET NULL -- Se o funcionário for demitido, mantém o registro da aplicação
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/*
================================================================================
5. TABELAS DA AGREGAÇÃO
================================================================================
*/

CREATE TABLE MANUTENCAO (
    ID_Manutencao INT NOT NULL AUTO_INCREMENT,
    Data_Manutencao DATETIME NOT NULL,
    Descricao_Servico TEXT,
    ID_Pasto INT NOT NULL,
    CPF_Funcionario VARCHAR(18) NULL,
    PRIMARY KEY (ID_Manutencao),
    FOREIGN KEY (ID_Pasto) REFERENCES PASTO(ID_Pasto)
        ON DELETE CASCADE, -- Se o pasto for deletado, seu histórico de manutenção vai junto
    FOREIGN KEY (CPF_Funcionario) REFERENCES FUNCIONARIO(CPF_CNPJ)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE ITEM_MANUTENCAO (
    ID_Manutencao INT NOT NULL,
    ID_Produto INT NOT NULL,
    Quantidade_Usada INT NOT NULL DEFAULT 1,
    PRIMARY KEY (ID_Manutencao, ID_Produto),
    FOREIGN KEY (ID_Manutencao) REFERENCES MANUTENCAO(ID_Manutencao)
        ON DELETE CASCADE, -- Itens somem junto com a ordem de manutenção
    FOREIGN KEY (ID_Produto) REFERENCES PRODUTO(ID_Produto)
        ON DELETE RESTRICT -- Não deletar um produto que já foi usado em manutenção
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
