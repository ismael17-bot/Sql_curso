USE dblojaJailson;

--- inserções da tabela 
--- INSERT INTO [nome da tabela] VALUES ()

INSERT INTO tb_Produto VALUES ('Suco de Laranja',4.5);
INSERT INTO tb_Produto VALUES ('Suco de Manga',5.5);
INSERT INTO tb_Produto VALUES ('Suco de Uva',5.5);

INSERT INTO tb_Venda VALUES (1,4.5);
INSERT INTO tb_Venda VALUES (1,4.5);

----- SELECT [COLUNAS] FROM [tabela]
SELECT * FROM tb_Produto
SELECT * FROM tb_Venda
SELECT * FROM tb_ProdutoVenda

---------------------------------------------------------
--CRIAR UM CLIENTE
INSERT INTO tb_DadosCliente VALUES ('Ismael toledo','2001-03-17','M','Rua Montezuma de Carvalho, 11','Joinville','Santa Catarina','47 3434-3536','47 99710-0868');
SELECT * FROM tb_DadosCliente

INSERT INTO tb_Venda VALUES (1,GETDATE())
INSERT INTO tb_ProdutoVenda VALUES (2,1,3)
INSERT INTO tb_ProdutoVenda VALUES (2,2,1)
INSERT INTO tb_ProdutoVenda VALUES (2,3,4)
