
CREATE PROCEDURE sp_total(@cdCliente INT)
AS
SELECT V.cdVenda ,C.nmCliente,P.cdProduto,P.nmProduto,PV.qtProduto,P.vlProduto , qtProduto*vlProduto AS Valortotal, TOTAL_VENDAS.Preço_total 
FROM tb_Produto AS P INNER JOIN tb_ProdutoVenda AS PV ON P.cdProduto = PV.cdProduto
INNER JOIN tb_Venda AS V ON PV.cdVenda= V.cdVenda
INNER JOIN tb_DadosCliente AS C ON V.cdCliente= C.cdCliente
INNER JOIN(
	SELECT V.cdVenda ,SUM(PV.qtProduto) AS qttolta,SUM (P.vlProduto*PV.qtProduto) AS Preço_total 
	FROM tb_Produto AS P INNER JOIN tb_ProdutoVenda AS PV ON P.cdProduto = PV.cdProduto
	INNER JOIN tb_Venda AS V ON PV.cdVenda= V.cdVenda
	GROUP BY V.cdVenda
) AS TOTAL_VENDAS ON V.cdVenda= TOTAL_VENDAS.cdVenda
WHERE V.cdCliente=1

 
 sp_total 1