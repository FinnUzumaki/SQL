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