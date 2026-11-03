CREATE TABLE Teste(
    Id_Teste INT PRIMARY KEY,
    descricao VARCHAR(50)
);

INSERT INTO Teste (Id_Teste, descricao)
VALUES (1, 'Primeiro registro');

SELECT * FROM Teste;

ALTER TABLE Teste 
ADD Observacao VARCHAR(100) NOT NULL DEFAULT 'Sem observação';

SELECT * FROM Teste;

INSERT INTO Teste (Id_Teste, descricao, Observacao)
VALUES (2, 'REGISTRO CRIADO DEPOIS', 'PRIMEIRA OBSERVACAO');

SELECT * FROM Teste;