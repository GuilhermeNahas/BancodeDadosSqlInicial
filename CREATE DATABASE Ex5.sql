CREATE DATABASE Ex5

USE DbGuilhermeNahas

CREATE TABLE Estudantes3 (
    Matricula INT PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    Turma VARCHAR(20) NOT NULL
);

CREATE TABLE Pedidos (
    Numero INT PRIMARY KEY,
    DataPedido DATE NOT NULL,
    ValorTotal DECIMAL(10, 2) NOT NULL,
    Matricula_Estudante INT NOT NULL,
    FOREIGN KEY (Matricula_Estudante) REFERENCES Estudantes3(Matricula)
);

CREATE TABLE Produtos (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    Categoria VARCHAR(50) NOT NULL
);

CREATE TABLE ItensPedido (
    Numero_Pedido INT NOT NULL,
    Codigo_Produto INT NOT NULL,
    Quantidade INT NOT NULL,
    PrecoCobrado DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (Numero_Pedido, Codigo_Produto),
    FOREIGN KEY (Numero_Pedido) REFERENCES Pedidos(Numero),
    FOREIGN KEY (Codigo_Produto) REFERENCES Produtos(Codigo)
);
GO

INSERT INTO Estudantes3 (Matricula, Nome, Turma)
VALUES
(202401, 'Carlos', '3A'),
(202402, 'Diogo', '2B');

INSERT INTO Produtos (Codigo, Nome, Preco, Categoria)
VALUES
(1, 'Salgado de Frango', 7.00, 'Salgados'),
(2, 'Suco Natural', 5.50, 'Bebidas'),
(3, 'Chocolate', 3.50, 'Doces');

INSERT INTO Pedidos (Numero, DataPedido, ValorTotal, Matricula_Estudante)
VALUES
(1001, '2024-03-20', 12.50, 202401),
(1002, '2024-03-21', 9.00, 202402);

INSERT INTO ItensPedido (Numero_Pedido, Codigo_Produto, Quantidade, PrecoCobrado)
VALUES
(1001, 2, 1, 5.00),
(1002, 3, 1, 4.00);
GO

SELECT 
    p.Numero AS Numero_Pedido,
    p.DataPedido,
    e.Nome AS Estudante,
    e.Turma,
    prod.Nome AS Produto,
    prod.Categoria,
    ip.Quantidade,
    ip.PrecoCobrado AS Preco_Unitario,
    (ip.Quantidade * ip.PrecoCobrado) AS Subtotal,
    p.ValorTotal
FROM Pedidos p
INNER JOIN Estudantes3 e ON p.Matricula_Estudante = e.Matricula
INNER JOIN ItensPedido ip ON p.Numero = ip.Numero_Pedido
INNER JOIN Produtos prod ON ip.Codigo_Produto = prod.Codigo;
GO

--CONCLUIDO