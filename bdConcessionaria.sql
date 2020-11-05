CREATE DATABASE bdConcessionaria

USE bdConcessionaria

CREATE TABLE tbFabricante (
	codFabricante INT PRIMARY KEY IDENTITY(1,1)
	,nomeFabricante NVARCHAR(100)
	,lograFabricante NVARCHAR(100)
	,numFabricante INT
	,cidadeFabricante NVARCHAR(30)
	,ufFabricante VARCHAR(2)
);

CREATE TABLE tbVenda (
	codVenda INT PRIMARY KEY IDENTITY(1,1)
	,dataVenda DATE
	,totalVenda MONEY
);

CREATE TABLE tbSubVenda (
	codSubVenda INT PRIMARY KEY IDENTITY(1,1)
	,codVenda INT FOREIGN KEY REFERENCES tbVenda(codVenda)
	,subTotal MONEY
);

CREATE TABLE tbTelFabri (
	codTelFabri INT PRIMARY KEY IDENTITY(1,1)
	,numTelFabri INT
	,contatoFabri NVARCHAR(50)
	,codFabricante INT FOREIGN KEY REFERENCES tbFabricante(codFabricante)
);

CREATE TABLE tbModelo(
	codModelo INT PRIMARY KEY IDENTITY(1,1)
	,nomeModelo NVARCHAR(90)
	,valorFabrica MONEY
	,anoFabricacao INT
	,codFabricante INT FOREIGN KEY REFERENCES tbFabricante(codFabricante)
);

CREATE TABLE tbVeiculo (
	codVeiculo INT PRIMARY KEY IDENTITY(1,1)
	,descVeiculo NVARCHAR(250)
	,valorVeiculo MONEY
	,anoFabricacao DATE
	,codModelo INT FOREIGN KEY REFERENCES tbModelo(codModelo)
	,codSubVenda INT FOREIGN KEY REFERENCES tbSubVenda(codSubVenda)
);