-- Criar o banco
CREATE DATABASE db_Biblioteca ON PRIMARY
(NAME = db_Biblioteca,
FILENAME = 'C:\SQL\db_Biblioteca.mdf',
SIZE = 6MB,
MAXSIZE = 15MB,
FILEGROWTH = 10%)
LOG ON (
NAME = db_Biblioteca_log,
FILENAME = 'C:\SQL\db_Biblioteca.ldf',
SIZE = 1MB, FILEGROWTH = 1MB)
GO

-- Criar Tabelas
USE db_Biblioteca;
CREATE TABLE tbl_autores (
ID_Autor SMALLINT PRIMARY KEY IDENTITY,
Nome_Autor VARCHAR(50),
Sobrenome_Autor VARCHAR(60)
)
GO
CREATE TABLE tbl_editoras
(ID_Editora SMALLINT PRIMARY KEY IDENTITY,
Nome_Editora VARCHAR(50)
)
GO
CREATE TABLE tbl_livros (
ID_Livro SMALLINT IDENTITY(100,1),
Nome_Livro VARCHAR (50) NOT NULL,
ISBN VARCHAR(30) NOT NULL UNIQUE,
ID_Autor SMALLINT NOT NULL,
Data_Pub DATE NOT NULL,
Preco_Livro MONEY NOT NULL,
ID_Editora SMALLINT NOT NULL
CONSTRAINT pk_id_livro PRIMARY KEY (ID_Livro),
CONSTRAINT fk_ID_Autor FOREIGN KEY (ID_Autor)
REFERENCES tbl_autores (ID_Autor) ON DELETE CASCADE,
CONSTRAINT fk_ID_Editora FOREIGN KEY (ID_Editora)
REFERENCES tbl_editoras (ID_Editora) ON DELETE CASCADE
)
GO

--Inserir dados na tabela de Autores
INSERT INTO tbl_Autores (Nome_Autor, SobreNome_Autor)
VALUES
('Daniel', 'Barret'),
('Gerald', 'Carter'),
('Mark', 'Sobell'),
('William', 'Stanek'),
('Richard', 'Blum')
GO
--Inserir dados na tabela de Editoras
INSERT INTO tbl_Editoras (Nome_Editora)
VALUES
('Prentice Hall'),
('O´Reilly'),
('Microsoft Press'),
('Wiley')
GO
--Inserir dados na tabela de Livros
INSERT INTO tbl_Livros (Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_editora)
VALUES
('Linux Command Line and Shell Scripting',143856969,'20091221', 68.35, 5, 4),
('SSH, the Secure Shell',127658789,'20091221', 58.30, 1, 2),
('Using Samba',123856789,'20001221', 61.45, 2, 2),
('Fedora and Red Hat Linux', 123346789, '20101101', 62.24, 3, 1),
('Windows Server 2012 Inside Out',123356789,'20040517', 66.80, 4, 3),
('Microsoft Exchange Server 2010',123366789,'20001221', 45.30, 4, 3)
GO

-- Verificar se registros foram inseridos
SELECT * FROM tbl_livros;