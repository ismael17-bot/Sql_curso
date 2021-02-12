
--LISTA 1
----LETRA A
CREATE TABLE tb_Product_Request(
	cdRequest INT NOT NULL,
	cdProduct INT NOT NULL,
	qtAmount INT NOT NULL,
	vlUnitary MONEY NOT NULL
);


CREATE TABLE tb_Request(
	cdRequest INT NOT NULL,
	cdCustomer INT NOT NULL,
	dtRequest  DATE NOT NULL,
	
	vlTotal MONEY NOT NULL
);

ALTER TABLE tb_Request ADD dtDeliver DATE NOT NULL ;


CREATE TABLE tb_Customer (
	cdCustomer INT NOT NULL,
	nmCustomer VARCHAR (50) NOT NULL,
	nrFone VARCHAR (15) NOT NULL,
	dsAdress VARCHAR (50) NOT NULL
);

CREATE TABLE tb_Product(
	cdProduct INT NOT NULL,
	nmProduct VARCHAR (50) NOT NULL,
	cdSupplier INT NOT NULL,
	vlPrice MONEY NOT NULL,
	qtStock INT NOT NULL
);

CREATE TABLE tb_Supplier(
	cdSupplier INT NOT NULL,
	nmSupplier VARCHAR (70) NOT NULL,
	nrFone VARCHAR (15) NOT NULL
);
--FIM LETRA A

--Apenas para conferir 
SELECT *FROM tb_Product_Request
SELECT *FROM tb_Customer
SELECT *FROM tb_Supplier
SELECT *FROM tb_Product
SELECT *FROM tb_Request
--.

--LETRA B
ALTER TABLE tb_Product_Request
ADD CONSTRAINT PK_ProductRequest
PRIMARY KEY (cdRequest, cdProduct);

ALTER TABLE tb_Request
ADD CONSTRAINT PK_Request
PRIMARY KEY (cdRequest);

ALTER TABLE tb_Customer
ADD CONSTRAINT PK_Customer
PRIMARY KEY (cdCustomer);

ALTER TABLE tb_Product
ADD CONSTRAINT PK_Product
PRIMARY KEY (cdProduct);

ALTER TABLE tb_Supplier
ADD CONSTRAINT PK_Supplier
PRIMARY KEY (cdSupplier);
--FIM LETRA B
/*
DROP TABLE tb_Product_Request
DROP TABLE tb_Customer
DROP TABLE tb_Supplier
DROP TABLE tb_Product
DROP TABLE tb_Request
*/


---LETRA C 
ALTER TABLE  tb_Product_Request
ADD CONSTRAINT FK1_Request
FOREIGN KEY (cdRequest) REFERENCES tb_Request (cdRequest);

ALTER TABLE  tb_Product_Request
ADD CONSTRAINT FK1_Product
FOREIGN KEY (cdProduct) REFERENCES tb_Product (cdProduct);

ALTER TABLE  tb_Request
ADD CONSTRAINT FK_Request_Customer
FOREIGN KEY (cdCustomer) REFERENCES tb_Customer (cdCustomer);

ALTER TABLE  tb_Product
ADD CONSTRAINT FK_Product_Supplier
FOREIGN KEY (cdSupplier) REFERENCES tb_Supplier (cdSupplier);
--FIM LETRA C

--LETRA D
CREATE INDEX idx_cdSupplier
ON tb_Product (cdSupplier);
--FIM LETRA D

--LETRA E
CREATE INDEX idx_cdCustomer
ON tb_Request (cdCustomer);
--FIM LETRA E

--LETRA F
ALTER TABLE tb_Supplier ADD dsAdress VARCHAR (50) NULL;
--FIM LETRA F

--LETRA G
INSERT INTO tb_Customer
VALUES (1,'Fabiano','99879375',' Rua Tijucas, 110, Centro, Joinville-SC');
--FIM LETRA G

--LETRA H
INSERT INTO tb_Request
VALUES (1,1,'2008/01/31',54.00,'2008/02/05');
--FIM LETRA H

--LETRA I
UPDATE tb_Customer
SET nrFone='99012567'
WHERE cdCustomer=1;
--TESTE
SELECT *FROM tb_Customer
--FIM LETRA I

--LETRA J
-- NESSA AQUI FIQUEI EM DUVIDA SE USAR DROP OU NOCHECK
GO
ALTER TABLE tb_Request
NOCHECK CONSTRAINT FK_Request_Customer
DELETE FROM tb_Customer
WHERE cdCustomer= 1

DELETE FROM tb_Request
WHERE cdRequest=1
--TESTE
SELECT *FROM tb_Customer
SELECT *FROM tb_Request
--FIM LETRA J

--LETRA K


GO
ALTER TABLE tb_Product_Request
DROP CONSTRAINT FK1_Product
DROP TABLE tb_Product_Request

GO
ALTER TABLE tb_Request
DROP CONSTRAINT FK_Request_Customer
DROP TABLE tb_Request

GO
ALTER TABLE tb_Product
DROP CONSTRAINT FK_Product_Supplier
DROP TABLE tb_Product

DROP TABLE tb_Supplier
DROP TABLE tb_Customer
--FIM LETRA K