--migrar cidades para a tabela tb_cidades

BEGIN TRAN; --INICIA A TRANSAÇÃO

CREATE TABLE #tmp_Cidade(
	cdCidade INT IDENTITY (1,1),
	nmCidade VARCHAR (50),
	nmEstado VARCHAR (30),
	cdEstado INT
)

INSERT INTO #tmp_Cidade (nmCidade, nmEstado)
SELECT DISTINCT nmCidade, nmEstado FROM tb_DadosCliente ORDER BY nmCidade;


-------------MAIS DIFICIL update join
/*UPDATE TC
SET TC.cdEstado = E.cdEstado
FROM #tmp_Cidade AS TC
INNER JOIN tb_DadosCliente AS T ON TC.nmCidade = T.nmCidade
INNER JOIN tb_Estado AS E ON T.nmEstado = E.nmEstado*/

--MAIS FACIL
UPDATE TC SET
TC.cdEstado = E.cdEstado
FROM #tmp_Cidade AS TC INNER JOIN tb_Estado AS E 
ON TC.nmEstado =E.nmEstado

--tratamento de dados
 SET IDENTITY_INSERT tb_Cidade ON

INSERT INTO tb_Cidade (cdCidade,nmCidade,cdEstado)
SELECT cdCidade, nmCidade, cdEstado FROM #tmp_Cidade


SELECT DISTINCT E.cdEstado, C.nmCidade FROM tb_Estado AS E
INNER JOIN tb_DadosCliente AS C ON E.nmEstado = C.nmEstado

SELECT * FROM #tmp_Cidade
DROP TABLE #tmp_Cidade

 SET IDENTITY_INSERT tb_Cidade OFF

ROLLBACK TRAN;

COMMIT TRAN;