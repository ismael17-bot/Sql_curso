----TRANSIÇAO DE UMA TABELA PARA OUTRA

BEGIN TRAN;


CREATE TABLE tb_Endereco(
	cdEndereço INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	nmEndereco VARCHAR (50) NOT NULL,
	nmCEP VARCHAR (9),
	cdCidade INT NOT NULL
)

CREATE TABLE tb_Cidade(
	cdCidade INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	nmCidade VARCHAR (50) NOT NULL,
	cdEstado INT NOT NULL
)

CREATE TABLE tb_Estado(
	cdEstado INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	nmEstado VARCHAR (30) NOT NULL,
	nmSigla VARCHAR (2) NOT NULL
)


ALTER TABLE tb_Endereco
ADD CONSTRAINT FK_Endereco_Cidade
FOREIGN KEY (cdCidade)
REFERENCES tb_Cidade(cdCidade);

ALTER TABLE tb_Cidade
ADD CONSTRAINT FK_Cidade_Estado
FOREIGN KEY (cdEstado)
REFERENCES tb_Estado(cdEstado); 


CREATE TABLE #tmp_Estado(
	cdEstado INT IDENTITY (1,1),
	nmEstado VARCHAR (30),
	nmSigla VARCHAR (2)
)

--inserir os estados na tabela temporaria 
INSERT INTO #tmp_Estado(nmEstado)
SELECT DISTINCT nmEstado FROM tb_DadosCliente;

UPDATE #tmp_Estado SET nmSigla='SP' WHERE nmEstado='São Paulo';UPDATE #tmp_Estado SET nmSigla='SC' WHERE nmEstado='Santa Catarina';

SET IDENTITY_INSERT tb_Estado ON;
INSERT INTO tb_Estado (cdEstado,nmEstado,nmSigla)
SELECT cdEstado , nmEstado, nmSigla FROM #tmp_Estado
 
SELECT *FROM #tmp_Estado;


SELECT *FROM tb_Estado;



DROP TABLE #tmp_Estado;


SET IDENTITY_INSERT tb_Estado OFF;

ROLLBACK TRAN;

-- COMMIT TRAN;
