CREATE DATABASE Ex2

USE DbGuilhermeNahas

CREATE TABLE Estudantes (
    Matricula INT PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    Turma VARCHAR(20) NOT NULL,
    Apelido VARCHAR(50)
);

CREATE TABLE Videos (
    Codigo INT PRIMARY KEY,
    Titulo VARCHAR(150) NOT NULL,
    Descricao VARCHAR(500),
    DataPublicacao DATE NOT NULL,
    Duracao INT NOT NULL,
    Matricula_Estudante INT NOT NULL,
    FOREIGN KEY (Matricula_Estudante) REFERENCES Estudantes(Matricula)
);
GO

INSERT INTO Estudantes (Matricula, Nome, Turma, Apelido)
VALUES
(202401, 'Diogo', '3A', 'Cheroso'),
(202402, 'Juliano', '2B', 'Dança'),
(202403, 'Natan', '3A', 'Maça');

INSERT INTO Videos (Codigo, Titulo, Descricao, DataPublicacao, Duracao, Matricula_Estudante)
VALUES
(1, 'Review do Campeonato', 'Análise das melhores jogadas.', '2024-03-10', 12, 202401),
(2, 'Tutorial de SQL', 'Como criar tabelas e relacionamentos.', '2024-03-15', 25, 202401),
(3, 'Bastidores da Escola', 'Mostrando a rotina dos alunos.', '2024-03-18', 8, 202402);
GO

SELECT 
    v.Codigo,
    v.Titulo,
    v.Descricao,
    v.DataPublicacao,
    v.Duracao AS Duracao_Minutos,
    e.Nome AS Autor,
    e.Apelido,
    e.Turma
FROM Videos v
INNER JOIN Estudantes e ON v.Matricula_Estudante = e.Matricula;

SELECT * FROM Estudantes
SELECT * FROM Videos
GO

--CONCLUIDO