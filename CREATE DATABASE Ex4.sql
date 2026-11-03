CREATE DATABASE Ex4

USE DbGuilhermeNahas

CREATE TABLE Estudantes2 (
    Matricula INT PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    Turma VARCHAR(20) NOT NULL
);

CREATE TABLE Musicas (
    Codigo INT PRIMARY KEY,
    Titulo VARCHAR(150) NOT NULL,
    Artista VARCHAR(100) NOT NULL,
    Album VARCHAR(100),
    Duracao INT NOT NULL
);

CREATE TABLE Sugestoes (
    Id_Sugestao INT PRIMARY KEY,
    Matricula_Estudante INT NOT NULL,
    Codigo_Musica INT NOT NULL,
    DataSugestao DATE NOT NULL,
    Nota INT NOT NULL CHECK (Nota BETWEEN 1 AND 5),
    FOREIGN KEY (Matricula_Estudante) REFERENCES Estudantes2(Matricula),
    FOREIGN KEY (Codigo_Musica) REFERENCES Musicas(Codigo)
);
GO

INSERT INTO Estudantes2 (Matricula, Nome, Turma)
VALUES
(202401, 'Carlos', '3A'),
(202402, 'Diogo', '2B'),
(202403, 'Ana', '1C');

INSERT INTO Musicas (Codigo, Titulo, Artista, Album, Duracao)
VALUES
(1, 'Without me', 'Eminem', 'The Eminem Show', 290),
(2, 'Billie Jean', 'Michael Jackson', 'Thriller', 294),
(3, 'Amor dos Deuses', 'Fundo de Quintal', 'Doce Refúgio', 212);

INSERT INTO Sugestoes (Id_Sugestao, Matricula_Estudante, Codigo_Musica, DataSugestao, Nota)
VALUES
(1, 202401, 1, '2024-03-20', 5),
(2, 202402, 2, '2024-03-21', 4),
(3, 202403, 3, '2024-03-22', 5);
GO

SELECT 
    s.Id_Sugestao,
    e.Nome AS Estudante,
    e.Turma,
    m.Titulo AS Musica,
    m.Artista,
    m.Album,
    m.Duracao AS Duracao_Segundos,
    s.DataSugestao,
    s.Nota
FROM Sugestoes s
INNER JOIN Estudantes2 e ON s.Matricula_Estudante = e.Matricula
INNER JOIN Musicas m ON s.Codigo_Musica = m.Codigo;
GO

--CONCLUIDO