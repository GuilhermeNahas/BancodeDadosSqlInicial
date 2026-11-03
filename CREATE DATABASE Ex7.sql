CREATE DATABASE Ex7

USE DbGuilhermeNahas

CREATE TABLE Usuarios (
    Id_Usuario INT PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    Apelido VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    DataNascimento DATE NOT NULL
);

CREATE TABLE Posts (
    Codigo INT PRIMARY KEY,
    Texto VARCHAR(500) NOT NULL,
    DataHoraPublicacao DATETIME NOT NULL,
    Id_Autor INT NOT NULL,
    FOREIGN KEY (Id_Autor) REFERENCES Usuarios(Id_Usuario)
);

CREATE TABLE Seguidores (
    Id_Seguidor INT NOT NULL,
    Id_Seguido INT NOT NULL,
    PRIMARY KEY (Id_Seguidor, Id_Seguido),
    FOREIGN KEY (Id_Seguidor) REFERENCES Usuarios(Id_Usuario),
    FOREIGN KEY (Id_Seguido) REFERENCES Usuarios(Id_Usuario)
);
GO

INSERT INTO Usuarios (Id_Usuario, Nome, Apelido, Email, DataNascimento)
VALUES
(1, 'Carlos Silva', 'carlinhos', 'carlos@email.com', '2007-05-15'),
(2, 'Maria Antonieta', 'Mari', 'antonieta@email.com', '2008-11-20'),
(3, 'Cal Mendes', 'Cal', 'calmendes@email.com', '2006-02-10');

INSERT INTO Posts (Codigo, Texto, DataHoraPublicacao, Id_Autor)
VALUES
(101, 'Primeiro post na rede social!', '2024-03-20 08:30:00', 1),
(102, 'Alguém tem o resumo da aula de SQL?', '2024-03-20 09:15:00', 1),
(103, 'Estudando para a prova de amanhã.', '2024-03-20 10:00:00', 2);

INSERT INTO Seguidores (Id_Seguidor, Id_Seguido)
VALUES
(1, 2),
(1, 3),
(2, 1);
GO

SELECT 
    p.Codigo AS Codigo_Post,
    p.Texto,
    p.DataHoraPublicacao,
    u.Nome AS Autor,
    u.Apelido
FROM Posts p
INNER JOIN Usuarios u ON p.Id_Autor = u.Id_Usuario;

SELECT 
    u1.Nome AS Seguidor,
    u1.Apelido AS Apelido_Seguidor,
    u2.Nome AS Seguido,
    u2.Apelido AS Apelido_Seguido
FROM Seguidores s
INNER JOIN Usuarios u1 ON s.Id_Seguidor = u1.Id_Usuario
INNER JOIN Usuarios u2 ON s.Id_Seguido = u2.Id_Usuario;
GO

SELECT * FROM Seguidores
SELECT * FROM Posts
SELECT * FROM Usuarios

--CONCLUIDO
