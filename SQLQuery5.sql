



CREATE TABLE tb_Telefone(
	cdTelefone INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	cdCliente INT NOT NULL,
	nmTelefone VARCHAR (15) NOT NULL,
	inAtivoSN VARCHAR (1) NOT NULL DEFAULT 'S'
);

ALTER TABLE tb_Telefone
ADD CONSTRAINT FK_Telefone
FOREIGN KEY (cdCliente) REFERENCES tb_DadosCliente (cdCliente)