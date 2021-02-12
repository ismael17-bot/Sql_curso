

BEGIN TRAN; UPDATE C SET
C.cdEndereco= E.cdEndereço
FROM tb_Endereco AS E
INNER JOIN tb_DadosCliente as C ON E.nmEndereco= C.nmEndereco




SELECT * FROM tb_DadosCliente

SELECT * FROM tb_Endereco
