USE dblojaJailson;
--------------------------------------------------------
CREATE TABLE tb_Produto(
	cdProduto INT PRIMARY KEY IDENTITY(1,1), 
	nmProduto VARCHAR(50) NOT NULL,
	vlProduto DECIMAL (6,2) NOT NULL
);
--------------------------------------------------------
CREATE TABLE tb_DadosCliente(
	cdCliente INT PRIMARY KEY IDENTITY (1,1),
	nmCliente VARCHAR (50) NOT NULL,
	dtNascimento DATE,
	idSexo VARCHAR (1) NOT NULL,
	nmEndereco VARCHAR(50),
	nmCidade  VARCHAR (50),
	nmEstado  VARCHAR (30),
	Telefone1 VARCHAR (15),
	Telefone2 VARCHAR (15),
);
---------------------------------------------------------
CREATE TABLE tb_Venda(
	cdVenda INT PRIMARY KEY IDENTITY (1,1),
	cdCliente INT NOT NULL FOREIGN KEY REFERENCES tb_DadosCliente ,
	dtVenda DATETIME NOT NULL,
);
---------------------------------------------------------
CREATE TABLE tb_ProdutoVenda(
	cdProdutoVenda INT PRIMARY KEY IDENTITY (1,1),
	cdVenda INT FOREIGN KEY REFERENCES tb_Venda(cdVenda)NOT NULL,
	cdProduto INT FOREIGN KEY REFERENCES  tb_Produto (cdProduto) NOT NULL,
	qtProduto INT NOT NULL
);
------------------------**
--- CONSTRAINT
ALTER TABLE tb_Venda
ADD CONSTRAINT FK_Produto_Venda
FOREIGN KEY (cdProduto)
REFERENCES tb_Produto(cdProduto)
--------------------------------
-- remover a tabela de vendas 
DROP TABLE tb_Venda
DROP TABLE tb_Produto
--------------------------------