CREATE DATABASE bdAtividade;
USE bdAtividade;
CREATE TABLE tbContratante(
CodContratante INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Nome VARCHAR(50),
Endereco VARCHAR(40),
Cidade VARCHAR(30),
Estado VARCHAR(2),
Telefone NUMERIC(11,0),
Email VARCHAR(40)
);
CREATE TABLE tbProjeto(
CodProjeto INT NOT NULL PRIMARY KEY IDENTITY(1,1),
DataInicio DATE,
DataTermino DATE,
Valor DECIMAL(9,2),
CodContratante INT NOT NULL FOREIGN KEY REFERENCES tbContratante(CodContratante)
);
CREATE TABLE tbConsultor(
CodConsultor INT NOT NULL PRIMARY KEY IDENTITY(1,1),
NomeConsultor VARCHAR(50),
CPF VARCHAR(11),
Especializacao VARCHAR(11)
);
CREATE TABLE tbProjetoConsultor(
CodProjetoConsultor INT NOT NULL PRIMARY KEY IDENTITY(1,1),
CodProjeto INT NOT NULL FOREIGN KEY REFERENCES tbProjeto(CodProjeto),
CodConsultor INT NOT NULL FOREIGN KEY REFERENCES tbConsultor(CodConsultor),
HorasTrabalhadas NUMERIC(5,0),
FuncaoExercida VARCHAR(30)
);

ALTER TABLE tbConsultor ADD EmailConsultor VARCHAR(40);
ALTER TABLE tbContratante ADD Pais VARCHAR(2);
ALTER TABLE tbConsultor ADD TelefoneConsultor NUMERIC(11,0);

EXEC sp_rename 'tbContratante.Nome', 'NomeContratante';
EXEC sp_rename 'tbContratante.Telefone', 'TelefoneContratante';
EXEC sp_rename 'tbContratante.Email', 'EmailContratante'; 

ALTER TABLE tbConsultor ALTER COLUMN Especializacao VARCHAR(40);

ALTER TABLE tbContratante DROP COLUMN Pais;

INSERT INTO tbContratante VALUES ('nome1', 'endereco1', 'cidade1', 'ET', 99999999999, 'email1');
INSERT INTO tbContratante VALUES ('nome2', 'endereco2', 'cidade2', 'ET', 11111111111, 'email2');
INSERT INTO tbContratante VALUES ('nome3', 'endereco3', 'cidade3', 'ET', 22222222222, 'email3');

INSERT INTO tbProjeto VALUES ('01/01/1001', '02/02/2002', 10, 1);
INSERT INTO tbProjeto VALUES ('03/03/3003', '04/04/4004', 20, 2);
INSERT INTO tbProjeto VALUES ('05/05/5005', '06/06/6006', 30, 3);

INSERT INTO tbConsultor VALUES ('nome4', 000000000, 'terra', 'email4', 55555555555);
INSERT INTO tbConsultor VALUES ('nome5', 333333333, 'ar', 'email5', 66666666666);
INSERT INTO tbConsultor VALUES ('nome6', 444444444, 'fogo', 'email6', 77777777777);

INSERT INTO tbProjetoConsultor VALUES (1, 1, 1, 'motoboy');
INSERT INTO tbProjetoConsultor VALUES (2, 2, 2, 'motogirl');
INSERT INTO tbProjetoConsultor VALUES (3, 3, 3, 'girlboy');

SELECT * FROM tbContratante;
SELECT * FROM tbProjeto;
SELECT * FROM tbConsultor;
SELECT * FROM tbProjetoConsultor;