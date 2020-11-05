CREATE DATABASE bdAmbulatorio

USE bdAmbulatorio

CREATE TABLE tbDoencas (
	idDoencas INT PRIMARY KEY IDENTITY(1,1)
	,descricao VARCHAR(50)
);

CREATE TABLE tbAmbulatorio (
	idAmbulatorio INT PRIMARY KEY IDENTITY(1,1)
	,numeroAmbulatorio VARCHAR(45)
	,andarAmbulatorio INT
	,capacidadeAmbulatorio INT
);

CREATE TABLE tbPaciente (
	idPaciente INT PRIMARY KEY IDENTITY(102,1)
	,nomePaciente VARCHAR(45)
	,sexoPaciente CHAR(1)
	,idade INT
	,doenca_inicial VARCHAR(50)
);

CREATE TABLE tbEspecialidade (
	idEspecialidade INT PRIMARY KEY IDENTITY(10,10)
	,descricaoEspecialidade VARCHAR(50)
);

CREATE TABLE tbFuncionarios (
	idFuncionario INT PRIMARY KEY IDENTITY(1,1)
	,idAmbulatorio INT FOREIGN KEY REFERENCES tbAmbulatorio(idAmbulatorio)
	,nomeFuncionario VARCHAR(45)
	,idadeFuncionario INT
	,sexoFuncionario CHAR(1)
	,salarioFunc FLOAT
	,cidadeFunc VARCHAR(45)
);

CREATE TABLE tbMedico (
	idMedico INT PRIMARY KEY IDENTITY(201,1)
	,idAmbulatorio INT FOREIGN KEY REFERENCES tbAmbulatorio(idAmbulatorio)
	,idEspecialidade INT FOREIGN KEY REFERENCES tbEspecialidade(idEspecialidade)
	,nomeMedico VARCHAR(45)
	,crmMedico VARCHAR(45)
	,salarioMedico FLOAT
	,idadeMedico INT
);

CREATE TABLE tbConsulta (
	idConsulta INT PRIMARY KEY IDENTITY(1,1)
	,idAmbulatorio INT FOREIGN KEY REFERENCES tbAmbulatorio(idAmbulatorio)
	,idPaciente INT FOREIGN KEY REFERENCES tbPaciente(idPaciente)
	,idMedico INT FOREIGN KEY REFERENCES tbMedico(idMedico)
	,idDoenca INT FOREIGN KEY REFERENCES tbDoencas(idDoencas)
	,diaConsulta DATE
	,horaConsulta TIME
);



INSERT INTO tbPaciente(nomePaciente, sexoPaciente, idade, doenca_inicial)
VALUES ('Domenica Santos', 'F', 20, 'Gripe')

INSERT INTO tbPaciente(nomePaciente, sexoPaciente, idade, doenca_inicial)
VALUES ('Camila da Silva', 'M', 19, 'Covid 19')

INSERT INTO tbPaciente(nomePaciente, sexoPaciente, idade, doenca_inicial)
VALUES ('Bruna Ferreira', 'F', 25, 'Sarampo')

INSERT INTO tbPaciente(nomePaciente, sexoPaciente, idade, doenca_inicial)
VALUES ('Eduardo Gomes', 'M', 32, 'Dengue')
SELECT * FROM tbPaciente



INSERT INTO tbDoencas(descricao)
VALUES ('Acne')

INSERT INTO tbDoencas(descricao)
VALUES ('Alcoolismo Agudo')

INSERT INTO tbDoencas(descricao)
VALUES ('Asma')
SELECT * FROM tbDoencas



INSERT INTO tbAmbulatorio(numeroAmbulatorio, andarAmbulatorio, capacidadeAmbulatorio)
VALUES ('2000', 12, 400)

INSERT INTO tbAmbulatorio(numeroAmbulatorio, andarAmbulatorio, capacidadeAmbulatorio)
VALUES ('1500A', 8, 300)

INSERT INTO tbAmbulatorio(numeroAmbulatorio, andarAmbulatorio, capacidadeAmbulatorio)
VALUES ('550', 1, 200)
SELECT * FROM tbAmbulatorio



INSERT INTO tbEspecialidade(descricaoEspecialidade)
VALUES ('Pediatra')

INSERT INTO tbEspecialidade(descricaoEspecialidade)
VALUES ('Clinico geral')

INSERT INTO tbEspecialidade(descricaoEspecialidade)
VALUES ('Clinico')
SELECT * FROM tbEspecialidade



INSERT INTO tbMedico(nomeMedico, crmMedico, salarioMedico, idadeMedico, idAmbulatorio, idEspecialidade)
VALUES ('Dr. Carlos Jobim', '52-71557-3', 12000, 50, 1, 10)

INSERT INTO tbMedico(nomeMedico, crmMedico, salarioMedico, idadeMedico, idAmbulatorio, idEspecialidade)
VALUES ('Dr. André Firmino', '50-12345-6', 22000.57, 63, 1, 10)

INSERT INTO tbMedico(nomeMedico, crmMedico, salarioMedico, idadeMedico, idAmbulatorio, idEspecialidade)
VALUES ('Dra. Ana Maria', '10-20201-5', 40000.61, 42, 2, 10)

INSERT INTO tbMedico(nomeMedico, crmMedico, salarioMedico, idadeMedico, idAmbulatorio, idEspecialidade)
VALUES ('Dr. João Carlos', '22-20192-7', 38001, 56, 3, 20)
SELECT * FROM tbMedico



INSERT INTO tbFuncionarios(nomeFuncionario,idadeFuncionario,sexoFuncionario,salarioFunc,cidadeFunc,idAmbulatorio)
VALUES ('Fernanda Fernandes', 34, 'F', 2000, 'São Paulo', 1)

INSERT INTO tbFuncionarios(nomeFuncionario,idadeFuncionario,sexoFuncionario,salarioFunc,cidadeFunc,idAmbulatorio)
VALUES ('Bruna Souza', 25, 'F', 1700, 'Guarulho', 1)

INSERT INTO tbFuncionarios(nomeFuncionario,idadeFuncionario,sexoFuncionario,salarioFunc,cidadeFunc,idAmbulatorio)
VALUES ('Jessica Filho', 20, 'F', 3000, 'Sorocaba', 1)

INSERT INTO tbFuncionarios(nomeFuncionario,idadeFuncionario,sexoFuncionario,salarioFunc,cidadeFunc,idAmbulatorio)
VALUES ('Leandro Leonardo', 27, 'M', 2500, 'São Paulo', 3)
SELECT * FROM tbFuncionarios



INSERT INTO tbConsulta(diaConsulta, horaConsulta, idMedico, idPaciente, idAmbulatorio, idDoenca)
VALUES ('20200201', '12:00', 201, 102, 1, 1)

INSERT INTO tbConsulta(diaConsulta, horaConsulta, idMedico, idPaciente, idAmbulatorio, idDoenca)
VALUES ('20180325', '11:30', 202, 102, 1, 1)

INSERT INTO tbConsulta(diaConsulta, horaConsulta, idMedico, idPaciente, idAmbulatorio, idDoenca)
VALUES ('20190430', '16:25', 203, 103, 3, 2)

INSERT INTO tbConsulta(diaConsulta, horaConsulta, idMedico, idPaciente, idAmbulatorio, idDoenca)
VALUES ('20250505', '17:05', 201, 104, 2, 3)
SELECT * FROM tbConsulta
