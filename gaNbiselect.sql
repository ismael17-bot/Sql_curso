
/* VOU UTILIZAR UNION ALL*/
--GANBIARRA


USE dblojaJailson
--seleçao dos dados com valores 
SELECT V.cdVenda ,C.nmCliente,P.cdProduto,P.nmProduto,PV.qtProduto,P.vlProduto , qtProduto*vlProduto AS Valortotal
FROM tb_Produto AS P INNER JOIN tb_ProdutoVenda AS PV ON P.cdProduto = PV.cdProduto
INNER JOIN tb_Venda AS V ON PV.cdVenda= V.cdVenda
INNER JOIN tb_DadosCliente AS C ON V.cdCliente= C.cdCliente

UNION ALL


SELECT V.cdVenda ,C.nmCliente,SUM(PV.qtProduto) AS qttolta, 'so pra ocupar',SUM (P.vlProduto*PV.qtProduto) AS Preço_total,0000,0000 --P.vlProduto , qtProduto*vlProduto AS Valortotal
FROM tb_Produto AS P INNER JOIN tb_ProdutoVenda AS PV ON P.cdProduto = PV.cdProduto
INNER JOIN tb_Venda AS V ON PV.cdVenda= V.cdVenda
INNER JOIN tb_DadosCliente AS C ON V.cdCliente= C.cdCliente
GROUP BY V.cdVenda,C.nmCliente
