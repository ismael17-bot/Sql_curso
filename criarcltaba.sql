

BEGIN TRAN;




ALTER TABLE tb_DadosCliente
ADD cdEndereco INT  NULL 

ALTER TABLE tb_DadosCliente
ADD CONSTRAINT FK_Cliente_Endereco
FOREIGN KEY (cdEndereco)
REFERENCES tb_Endereco (cdEndereço)



ROLLBACK TRAN;
COMMIT TRAN
SELECT *FROM tb_DadosCliente
