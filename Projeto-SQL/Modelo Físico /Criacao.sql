USE projetofsj;
-- Configuração para garantir o suporte a FKs e transações
SET default_storage_engine=InnoDB; 

-- DROP TABLEs (para garantir que o script pode ser executado várias vezes)
DROP TABLE IF EXISTS TRATAMENTO;
DROP TABLE IF EXISTS MOVIMENTO_LOTE;
DROP TABLE IF EXISTS LOTE;
DROP TABLE IF EXISTS PASTO;
DROP TABLE IF EXISTS BOVINO;
DROP TABLE IF EXISTS FUNCIONARIO;
DROP TABLE IF EXISTS FORNECEDOR;
DROP TABLE IF EXISTS FUNCAO;

-- Tabela 1: FUNCAO
CREATE TABLE FUNCAO (
    id_funcao INT AUTO_INCREMENT PRIMARY KEY, -- PK, Uso do AUTO_INCREMENT do MySQL
    nome_funcao VARCHAR(50) NOT NULL UNIQUE, -- Integridade de Domínio: Não pode ser nulo e deve ser único
    descricao TEXT,
    nivel_hierarquico INT NOT NULL
);

-- Tabela 2: FORNECEDOR
CREATE TABLE FORNECEDOR (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_fantasia VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) UNIQUE,
    tipo_insumo VARCHAR(50)
);

-- Tabela 3: FUNCIONARIO (Implementa Auto Relacionamento)
CREATE TABLE FUNCIONARIO (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_contratacao DATE,
    funcao_id INT NOT NULL,
    chefe_id INT, -- Auto Relacionamento: Opcional (NULL) para o chefe máximo
    
    -- Chaves Estrangeiras (Integridade Referencial)
    CONSTRAINT fk_func_funcao FOREIGN KEY (funcao_id) REFERENCES FUNCAO(id_funcao),
    CONSTRAINT fk_func_chefe FOREIGN KEY (chefe_id) REFERENCES FUNCIONARIO(id_funcionario)
);

-- Tabela 4: BOVINO (Implementa Auto Relacionamento e Herança)
CREATE TABLE BOVINO (
    brinco VARCHAR(20) PRIMARY KEY, -- PK, escolhida para ser o identificador único
    nome VARCHAR(50),
    sexo CHAR(1) NOT NULL CHECK (sexo IN ('M', 'F')), -- Integridade de Domínio: Apenas M ou F
    data_nascimento DATE,
    peso_kg DECIMAL(7, 2), -- Mapeamento para tipo numérico
    status VARCHAR(50) NOT NULL, 
    tipo_bovino VARCHAR(20) NOT NULL, -- Generalização/Herança
    pai_brinco VARCHAR(20),
    mae_brinco VARCHAR(20),
    
    -- Auto Relacionamento (Genealogia)
    CONSTRAINT fk_bovino_pai FOREIGN KEY (pai_brinco) REFERENCES BOVINO(brinco),
    CONSTRAINT fk_bovino_mae FOREIGN KEY (mae_brinco) REFERENCES BOVINO(brinco)
);

-- Tabela 5: PASTO (Implementa Agregação)
CREATE TABLE PASTO (
    id_pasto INT AUTO_INCREMENT PRIMARY KEY,
    nome_pasto VARCHAR(50) NOT NULL UNIQUE,
    area_hectares DECIMAL(10, 2) NOT NULL,
    capacidade_max_cabecas INT NOT NULL,
    responsavel_id INT,
    
    CONSTRAINT fk_pasto_responsavel FOREIGN KEY (responsavel_id) REFERENCES FUNCIONARIO(id_funcionario)
);

-- Tabela 6: LOTE (Implementa Composição)
CREATE TABLE LOTE (
    id_lote INT AUTO_INCREMENT PRIMARY KEY,
    nome_lote VARCHAR(50) NOT NULL,
    data_entrada DATE NOT NULL,
    objetivo VARCHAR(50),
    pasto_id INT NOT NULL,
    lider_lote_brinco VARCHAR(20) NOT NULL,
    
    -- Relações com Pasto e Bovino (Líder)
    CONSTRAINT fk_lote_pasto FOREIGN KEY (pasto_id) REFERENCES PASTO(id_pasto),
    CONSTRAINT fk_lote_lider FOREIGN KEY (lider_lote_brinco) REFERENCES BOVINO(brinco)
);

-- Tabela 7: MOVIMENTO_LOTE (Relação N:N)
CREATE TABLE MOVIMENTO_LOTE (
    bovino_brinco VARCHAR(20),
    lote_id INT,
    data_movimento DATE,
    tipo_movimento VARCHAR(20) NOT NULL CHECK (tipo_movimento IN ('Entrada', 'Saída')),
    
    -- PK Composta
    PRIMARY KEY (bovino_brinco, lote_id, data_movimento), 
    
    -- Chaves Estrangeiras
    CONSTRAINT fk_mov_bovino FOREIGN KEY (bovino_brinco) REFERENCES BOVINO(brinco),
    CONSTRAINT fk_mov_lote FOREIGN KEY (lote_id) REFERENCES LOTE(id_lote)
);

-- Tabela 8: TRATAMENTO
CREATE TABLE TRATAMENTO (
    id_tratamento INT AUTO_INCREMENT PRIMARY KEY,
    nome_tratamento VARCHAR(100) NOT NULL,
    data_aplicacao DATE NOT NULL,
    dosagem VARCHAR(50),
    bovino_brinco VARCHAR(20) NOT NULL,
    aplicador_id INT NOT NULL,
    fornecedor_id INT,
    
    -- Chaves Estrangeiras
    CONSTRAINT fk_trat_bovino FOREIGN KEY (bovino_brinco) REFERENCES BOVINO(brinco),
    CONSTRAINT fk_trat_aplicador FOREIGN KEY (aplicador_id) REFERENCES FUNCIONARIO(id_funcionario),
    CONSTRAINT fk_trat_fornecedor FOREIGN KEY (fornecedor_id) REFERENCES FORNECEDOR(id_fornecedor)
);
