create database IC;

use IC;
CREATE TABLE Alunos (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(150) UNIQUE
);

CREATE TABLE Curso (
    id_curso INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    descricao TEXT
);
 
CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- inserir dados dos alunos
INSERT INTO Alunos (id_aluno, nome, data_nascimento, email) VALUES
(1, 'Ana Silva', '2000-05-12', 'ana.silva@email.com'),
(2, 'Bruno Souza', '1999-08-23', 'bruno.souza@email.com'),
(3, 'Carla Pereira', '2001-02-17', 'carla.pereira@email.com'),
(4, 'Diego Santos', '1998-11-30', 'diego.santos@email.com'),
(5, 'Fernanda Lima', '2000-07-05', 'fernanda.lima@email.com');

-- inserir dados do curso
INSERT INTO Curso (id_curso, nome, carga_horaria, descricao) VALUES
(101, 'Introdução à Programação', 60, 'Curso básico de lógica e programação em Python.'),
(102, 'Banco de Dados', 80, 'Modelagem, SQL e administração de bancos de dados relacionais.'),
(103, 'Engenharia de Software', 90, 'Princípios, metodologias ágeis e boas práticas de desenvolvimento.'),
(104, 'Redes de Computadores', 70, 'Conceitos de redes, protocolos e segurança.'),
(105, 'Inteligência Artificial', 100, 'Fundamentos de IA e aplicações práticas.');

-- inserir dados matricula
INSERT INTO Matricula (id_matricula, id_aluno, id_curso) VALUES
(1001, 1, 101),
(1002, 2, 102),
(1003, 3, 103),
(1004, 4, 101),
(1005, 5, 105);


alter table Matriculas rename to Matricula;


SELECT * FROM Alunos;
SELECT * FROM Curso;
SELECT * from Matriculas;


