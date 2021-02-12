-- soma dos valores 
SELECT * FROM tb_ProdutoVenda
SELECT * FROM tb_Produto


--seleçao dos dados com valores 
SELECT C.nmCliente,V.cdVenda ,P.cdProduto,P.nmProduto,PV.qtProduto,P.vlProduto , qtProduto*vlProduto AS Valortotal
FROM tb_Produto AS P INNER JOIN tb_ProdutoVenda AS PV ON P.cdProduto = PV.cdProduto
INNER JOIN tb_Venda AS V ON PV.cdVenda= V.cdVenda
INNER JOIN tb_DadosCliente AS C ON V.cdCliente= C.cdCliente


--SOMA DOS VALORES
SELECT C.nmCliente,SUM(PV.qtProduto) AS qttolta, P.nmProduto, SUM (P.vlProduto*PV.qtProduto) AS Preço_total --P.vlProduto , qtProduto*vlProduto AS Valortotal
FROM tb_Produto AS P INNER JOIN tb_ProdutoVenda AS PV ON P.cdProduto = PV.cdProduto
INNER JOIN tb_Venda AS V ON PV.cdVenda= V.cdVenda
INNER JOIN tb_DadosCliente AS C ON V.cdCliente= C.cdCliente
GROUP BY C.nmCliente, P.nmProduto

--SOMA DOS VALORES
SELECT C.nmCliente,SUM(PV.qtProduto) AS qttolta, SUM (P.vlProduto*PV.qtProduto) AS Preço_total --P.vlProduto , qtProduto*vlProduto AS Valortotal
FROM tb_Produto AS P INNER JOIN tb_ProdutoVenda AS PV ON P.cdProduto = PV.cdProduto
INNER JOIN tb_Venda AS V ON PV.cdVenda= V.cdVenda
INNER JOIN tb_DadosCliente AS C ON V.cdCliente= C.cdCliente
GROUP BY C.nmCliente
