###LISTA 6
#QUESTAO 1
CREATE DATABASE lista6;
USE lista6;
#QUESTAO 2
CREATE TABLE montadora(
idmontadora INT,
nome VARCHAR(30),
PRIMARY KEY(idmontadora)
);
#QUESTAO 3
CREATE TABLE carro(
idcarro INT,
idmontadoraExtrangeira INT,
modelo VARCHAR(30),
versao VARCHAR(30),
cilindrada INT,
combustivel VARCHAR(30),
PRIMARY KEY (idcarro),
FOREIGN KEY (idmontadoraExtrangeira) REFERENCES montadora(idmontadora)
);
#QUESTAO 4
INSERT INTO montadora(idmontadora, nome)
VALUE (1, "Fiat");
 
INSERT INTO carro(idcarro, idmontadoraExtrangeira, modelo, versao, cilindrada, combustivel)
VALUE (1, 1, "Palio", "Fire", 1000, "flex");
INSERT INTO carro(idcarro, idmontadoraExtrangeira, modelo, versao, cilindrada, combustivel)
VALUE (2, 1, "Palio", '1.8R', 1800, "flex");

#QUESTAO 5
INSERT INTO montadora(idmontadora, nome)
VALUE (2, "Volkswagen");

INSERT INTO carro(idcarro, idmontadoraExtrangeira, modelo, versao, cilindrada, combustivel)
VALUE (3, 2, "Gol", "Trend", 1000, "flex");
INSERT INTO carro(idcarro, idmontadoraExtrangeira, modelo, versao, cilindrada, combustivel)
VALUE (4, 2, "Gol", "Power", 1600, "flex");

#QUESTAO 6
INSERT INTO montadora(idmontadora, nome)
VALUE (3, "Chevrolet");

INSERT INTO carro(idcarro, idmontadoraExtrangeira, modelo, versao, cilindrada, combustivel)
VALUE (5, 3, "Vectra", "Elegance", 2000, "flex");
INSERT INTO carro(idcarro, idmontadoraExtrangeira, modelo, versao, cilindrada, combustivel)
VALUE (6, 3, "Vectra", "Elite", 2000, "flex");

#QUESTAO 7
INSERT INTO montadora(idmontadora, nome)
VALUE (4, "Ford");

INSERT INTO carro(idcarro, idmontadoraExtrangeira, modelo, versao, cilindrada, combustivel)
VALUE (7, 4, "Fusion", "SEL2.5", 2500, "gasolina");
INSERT INTO carro(idcarro, idmontadoraExtrangeira, modelo, versao, cilindrada, combustivel)
VALUE (8, 4, "Fusion", "SELV6", 3000, "gasolina");

#QUESTAO 8
INSERT INTO carro(idcarro, idmontadoraExtrangeira, modelo, versao, cilindrada, combustivel)
VALUE (9, 1, "Punto", "Sporting", 1800, "flex");
INSERT INTO carro(idcarro, idmontadoraExtrangeira, modelo, versao, cilindrada, combustivel)
VALUE (10, 1, "Punto", "T-JET", 1400, "gasolina");

#QUESTAO 9
INSERT INTO carro(idcarro, idmontadoraExtrangeira, modelo, versao, cilindrada, combustivel)
VALUE (11, 2, "Polo", "Confortline", 1600, "flex");
INSERT INTO carro(idcarro, idmontadoraExtrangeira, modelo, versao, cilindrada, combustivel)
VALUE (12, 2, "Polo", "GT", 2000, "flex");

#QUESTAO 10
SELECT * 
FROM carro;

#QUESTAO 11
SELECT *
FROM carro, montadora
WHERE idmontadoraExtrangeira = idmontadora;

#QUESTAO 12
SELECT * 
FROM carro
WHERE idmontadoraExtrangeira = 1;

#QUESTAO 13
SELECT modelo, versao, cilindrada
FROM carro
WHERE cilindrada BETWEEN 1000 AND 2000
ORDER BY cilindrada DESC, versao ASC;

#QUESTAO 14
SELECT modelo, versao, cilindrada
FROM carro
WHERE combustivel = "gasolina";

#QUESTAO 15
SELECT DISTINCT modelo
FROM carro
WHERE cilindrada >= 2000;

#QUESTAO 16
UPDATE carro
SET cilindrada = 2400
WHERE modelo = "Vectra" AND versao = "Elite";

#QUESTAO 17
SELECT modelo
FROM carro
WHERE modelo LIKE "p%"
ORDER BY versao ASC;

#QUESTAO 18
SELECT modelo, versao, cilindrada*2
FROM carro
WHERE cilindrada = 1000 AND combustivel = "flex";

#QUESTAO 19
DELETE 
FROM carro
WHERE idmontadoraExtrangeira = 2;

SELECT *
FROM montadora;

#QUESTAO 20
DELETE 
FROM carro;

SELECT *
FROM carro;

###LISTA 7
#QUESTAO 1 A
ALTER TABLE carro ADD numerodevalvulas INT NOT NULL
DEFAULT 8;
UPDATE carro
SET numerodevalvulas = 16
WHERE modelo = "Punto" AND versao = "T-JET";
UPDATE carro
SET numerodevalvulas = 16
WHERE modelo = "Fusion" AND versao = "SEL2.5";
UPDATE carro
SET numerodevalvulas = 24
WHERE modelo = "Fusion" AND versao = "SELV6";

#QUESTAO 1 B
SELECT DISTINCT modelo
FROM carro
WHERE numerodevalvulas >= 16;

#QUESTAO 1 C
UPDATE carro
SET numerodevalvulas = 16
WHERE modelo = "Vectra" AND versao = "Elite";
UPDATE carro
SET cilindrada = 2400
WHERE modelo = "Vectra" AND versao = "Elite";

#QUESTAO 1 D
ALTER TABLE montadora CHANGE COLUMN nome nomemontadora VARCHAR(30);

#QUESTAO 1 E
DROP TABLE carro;

#QUESTAO 1 F
DROP DATABASE lista6;



