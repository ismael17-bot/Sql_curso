


CREATE TABLE tb_CLiente_Hist(
	cdCliente_Hist INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	cdCliente INT NOT NULL,
	nmCliente VARCHAR (50),
	dtNascimento DATE NULL,
	idSexo VARCHAR(1) NULL,
	cdEndereco INT NULL,
	dtInclusao DATETIME
);



CREATE TRIGGER tr_backup_Cliente
ON tb_DadosCliente
FOR UPDATE 
AS 
	INSERT INTO tb_CLiente_Hist (cdCliente, nmCliente, dtNascimento, idSexo, cdEndereco, dtInclusao)
	SELECT cdCliente, nmCliente, dtNascimento, idSexo, cdEndereco, GETDATE() FROM deleted;

SELECT * FROM tb_DadosCliente
SELECT * FROM tb_CLiente_Hist

BEGIN TRAN; UPDATE tb_DadosCliente SET nmCliente = 'Fernanda' WHERE cdCliente=2;