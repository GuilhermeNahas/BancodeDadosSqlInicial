CREATE DATABASE Ex6

USE DbGuilhermeNahas

CREATE TABLE Estudantes4 (
    Matricula INT PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    Turma VARCHAR(20) NOT NULL
);

CREATE TABLE Livros (
    ISBN VARCHAR(20) PRIMARY KEY,
    Titulo VARCHAR(150) NOT NULL,
    Autor VARCHAR(100) NOT NULL,
    Ano SMALLINT NOT NULL,
    Editora VARCHAR(100) NOT NULL
);

CREATE TABLE Exemplares (
    NumeroTombo INT PRIMARY KEY,
    EstadoConservacao VARCHAR(50) NOT NULL,
    ISBN_Livro VARCHAR(20) NOT NULL,
    FOREIGN KEY (ISBN_Livro) REFERENCES Livros(ISBN)
);

CREATE TABLE Emprestimos (
    Id_Emprestimo INT PRIMARY KEY,
    Matricula_Estudante INT NOT NULL,
    Tombo_Exemplar INT NOT NULL,
    DataRetirada DATE NOT NULL,
    DataPrevistaDevolucao DATE NOT NULL,
    DataEfetivaDevolucao DATE NULL,
    FOREIGN KEY (Matricula_Estudante) REFERENCES Estudantes4(Matricula),
    FOREIGN KEY (Tombo_Exemplar) REFERENCES Exemplares(NumeroTombo)
);
GO

INSERT INTO Estudantes4 (Matricula, Nome, Turma)
VALUES
(202401, 'Carlos', '3A'),
(202402, 'Diogo', '2B');

INSERT INTO Livros (ISBN, Titulo, Autor, Ano, Editora)
VALUES
('978-85-359-0277-7', 'Dom Casmurro', 'Machado de Assis', 1899, 'Garnier'),
('978-85-359-1484-8', '1984', 'George Orwell', 1949, 'Companhia das Letras');

INSERT INTO Exemplares (NumeroTombo, EstadoConservacao, ISBN_Livro)
VALUES
(10001, 'Excelente', '978-85-359-0277-7'),
(10002, 'Bom', '978-85-359-0277-7'),
(20001, 'Novo', '978-85-359-1484-8');

INSERT INTO Emprestimos (Id_Emprestimo, Matricula_Estudante, Tombo_Exemplar, DataRetirada, DataPrevistaDevolucao, DataEfetivaDevolucao)
VALUES
(1, 202401, 10001, '2024-03-01', '2024-03-15', '2024-03-10'),
(2, 202402, 20001, '2024-03-05', '2024-03-19', NULL);
GO

SELECT 
    emp.Id_Emprestimo,
    e.Nome AS Estudante,
    e.Turma,
    l.Titulo AS Livro,
    ex.NumeroTombo,
    ex.EstadoConservacao,
    emp.DataRetirada,
    emp.DataPrevistaDevolucao,
    emp.DataEfetivaDevolucao
FROM Emprestimos emp
INNER JOIN Estudantes4 e ON emp.Matricula_Estudante = e.Matricula
INNER JOIN Exemplares ex ON emp.Tombo_Exemplar = ex.NumeroTombo
INNER JOIN Livros l ON ex.ISBN_Livro = l.ISBN;
GO

--CONCLUIDO