CREATE DATABASE Ex1

USE DbGuilhermeNahas;
GO

CREATE TABLE Jogadores1 (
    Id_Jogador INT PRIMARY KEY,
    Apelido VARCHAR(50) NOT NULL,
    NomeCompleto VARCHAR(150) NOT NULL,
    Turma VARCHAR(20) NOT NULL,
    DataNascimento DATE NOT NULL,
    Idade INT NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE Telefones_Jogadores1 (
    Id_Telefone INT PRIMARY KEY,
    Id_Jogador INT NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    FOREIGN KEY (Id_Jogador) REFERENCES Jogadores1(Id_Jogador)
);

INSERT INTO Jogadores1 (Id_Jogador, Apelido, NomeCompleto, Turma, DataNascimento, Idade, Email)
VALUES
(1, 'Jogador 1', 'Carlos Adalberto', '1A', '2007-05-15', 19, 'carlos.adalberto@email.com'),
(2, 'Jogador 2', 'Ana Beatriz',      '2B', '2008-11-20', 18, 'ana.beatriz@email.com'),
(3, 'Jogador 3', 'Lucas Silva Souza', '3C', '2006-02-10', 20, 'lucas.souza@email.com');

INSERT INTO Telefones_Jogadores1 (Id_Telefone, Id_Jogador, Telefone)
VALUES
(1, 1, '(11) 98341-4321'),
(2, 1, '(11) 94321-5678'), 
(3, 2, '(11) 97979-8888'),
(4, 3, '(11) 95951-4444');
GO

SELECT * FROM Jogadores1;
SELECT * FROM Telefones_Jogadores1;
GO

--CONCLUIDO