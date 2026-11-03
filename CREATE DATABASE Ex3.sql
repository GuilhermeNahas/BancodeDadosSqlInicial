CREATE DATABASE Ex3

USE DbGuilhermeNahas

CREATE TABLE Categorias (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Filmes (
    Codigo INT PRIMARY KEY,
    Titulo VARCHAR(150) NOT NULL,
    AnoLancamento SMALLINT NOT NULL,
    Duracao INT NOT NULL,
    ClassificacaoIndicativa VARCHAR(10) NOT NULL,
    Sinopse VARCHAR(500),
    CodigoCategoria INT NOT NULL,
    FOREIGN KEY (CodigoCategoria) REFERENCES Categorias(Codigo)
);
GO

INSERT INTO Categorias (Codigo, Nome)
VALUES
(1, 'Ação'),
(2, 'Comédia'),
(3, 'Terror'),
(4, 'Animação');

INSERT INTO Filmes (Codigo, Titulo, AnoLancamento, Duracao, ClassificacaoIndicativa, Sinopse, CodigoCategoria)
VALUES
(1, 'Matrix', 1999, 136, '14', 'Um programador descobre que a realidade é uma simulação.', 1),
(2, 'Se Beber, Não Case!', 2009, 100, '16', 'Três amigos tentam lembrar o que aconteceu na despedida de solteiro.', 2),
(3, 'Toy Story', 1995, 81, 'L', 'Brinquedos ganham vida quando ninguém está olhando.', 4);
GO

SELECT 
    f.Codigo,
    f.Titulo,
    f.AnoLancamento,
    f.Duracao AS Duracao_Minutos,
    f.ClassificacaoIndicativa,
    f.Sinopse,
    c.Nome AS Categoria
FROM Filmes f
INNER JOIN Categorias c ON f.CodigoCategoria = c.Codigo;
GO