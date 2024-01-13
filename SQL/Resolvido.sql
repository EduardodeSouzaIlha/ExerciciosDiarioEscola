-- Outras explicações se encontra no Arquivo PDF

-- Usando o banco de dados Postgresql


-- Create tables --
CREATE TABLE Aluno (Id BIGSERIAL NOT NULL PRIMARY KEY, Nome VARCHAR(255));
CREATE TABLE Responsavel (Id BIGSERIAL NOT NULL PRIMARY KEY, Nome VARCHAR(255));
CREATE TABLE Parentesco (
    IdResponsavel BIGINT NOT NULL,
    IdAluno BIGINT NOT NULL,
    Parentesco VARCHAR(100) NOT NULL,
    FOREIGN KEY (IdResponsavel) REFERENCES Responsavel(Id),
    FOREIGN KEY (IdAluno) REFERENCES Aluno
);

-- Pergunta 1: Inserindo valores --

INSERT INTO Aluno (Nome) VALUES ('Lucas');
INSERT INTO Responsavel (Nome) VALUES ('Pablo');
INSERT INTO Responsavel (Nome) VALUES ('Brenda');

INSERT INTO Parentesco (IdResponsavel, IdAluno, Parentesco) VALUES
    (1, 1, 'Pai'),
    (2, 1, 'Mãe');


-- Pergunta 2: Fazendo o select que serve para todos os alunos -- 

SELECT
 Aluno.nome AS "Aluno",
 COALESCE(
    (SELECT Responsavel.nome FROM Responsavel
    INNER JOIN Parentesco ON Parentesco.idResponsavel = Responsavel.id
    WHERE Parentesco.IdAluno = Aluno.id LIMIT 1
    ), 'Sem Responsável'
 )AS "Responsável",
 COALESCE(
    (SELECT Parentesco.parentesco FROM Parentesco
    INNER JOIN Responsavel ON Responsavel.id = Parentesco.IdResponsavel
    WHERE Parentesco.idAluno = Aluno.id LIMIT 1
    ), 'Sem Responsável'
 )AS "Parentesco",
 COALESCE(
    (SELECT Responsavel.nome FROM Responsavel
    INNER JOIN Parentesco ON Parentesco.idResponsavel = Responsavel.id
    WHERE Parentesco.IdAluno = Aluno.id LIMIT 1 OFFSET 1
    ), 'Sem Responsável'
 )AS "Responsável",
 COALESCE(
    (SELECT Parentesco.parentesco FROM Parentesco
    INNER JOIN Responsavel ON Responsavel.id = parentesco.IdResponsavel
    WHERE Parentesco.idAluno = Aluno.id LIMIT 1 OFFSET 1
    ), 'Sem Responsável'
 )AS "Parentesco"

FROM Aluno;


-- Bônus: Utilizei o INNER JOIN e um alias para as tabelas --

SELECT
    A.Id AS "Id Aluno",
    A.Nome AS "Nome Aluno",
    R.Id AS "Id Responsável",
    R.Nome AS "Nome Responsável",
    P.Parentesco As "Parentesco"
FROM
    Parentesco P
INNER JOIN
    Aluno A ON P.IdAluno = A.Id
INNER JOIN
    Responsavel R ON P.IdResponsavel = R.Id;
