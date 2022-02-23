-- 1 (configuracao inicial)

CREATE SCHEMA IF NOT EXISTS lista8ex1;

USE lista8ex1;

CREATE TABLE IF NOT EXISTS convenio
(
    cod_convenio VARCHAR(2) NOT NULL,
    desc_convenio VARCHAR(200) NOT NULL,
    PRIMARY KEY(cod_convenio)
);

CREATE TABLE IF NOT EXISTS paciente
(
    cd_pac INT NOT NULL,
    nm_pac VARCHAR(200) NOT NULL,
    dt_nasc DATE NOT NULL,
    conv_pac VARCHAR(2) NOT NULL,
    PRIMARY KEY(cd_pac),
    FOREIGN KEY(conv_pac) REFERENCES convenio(cod_convenio)
);

CREATE TABLE IF NOT EXISTS atendimento
(
    cd_pac INT NOT NULL,
    dia_atend DATE NOT NULL,
    diag TEXT NOT NULL,
    PRIMARY KEY(cd_pac, dia_atend),
    FOREIGN KEY(cd_pac) REFERENCES paciente(cd_pac)
);


INSERT INTO convenio (cod_convenio, desc_convenio)
VALUES	('01', 'Unimed - código 11347'),
	('02', 'FUNBEP - código 7141-2'),
	('03', 'BAMERINDUS'),
	('04', 'GRALHA – AZUL'),
	('05', 'CASSI - código – 21.447-7'),
	('06', 'FUNCEF'),
	('07', 'TELEPAR - código 00335'),
	('08', 'PETROBRAS'),
	('09', 'BANCO CENTRAL'),
	('10', 'Particular'),
	('11', 'AMBEP');


INSERT INTO paciente (cd_pac, nm_pac, dt_nasc, conv_pac)
VALUES	(1, 'Maureen Annelise Molinari Chaves', '1980-08-19', '01'),
	(2, 'David Lessa Chaves', '1979-02-02', '01'),
	(3, 'Marlene C. Florêncio', '1949-01-02', '03'),
	(4, 'Rita de Fátima S. Costa', '1955-10-07', '04'),
	(5, 'Solange A. Andrade', '1969-08-10', '05'),
	(6, 'Valéria do Rocio Pinheiro Schelle', '1974-11-29', '11'),
	(7, 'Sara Carmelina O.Viana', '1973-01-25', '10'),
	(8, 'José Lucchesi', '1916-12-06', '10'),
	(9, 'Arielton da Silva Pinto', '1965-05-20', '05'),
	(10, 'Maria Aparecida Azeredo Obrecht', '1939-08-27', '01');


INSERT INTO atendimento (cd_pac, dia_atend, diag)
VALUES	(5, '1996-04-09', 'Lombalgia crônica. Ativ. com esforço - coziinheira. limitação de mobilização. Fez tratº.
medicamentoso com melhora temporária. Sequelka de entorse de tornozelo E.
Ao ex.dor lombo sacra E. Retração IT, limitação de FE. Edema de tronozelo e dor.
Cond. RX de col. lombar AP+P'),
	(2, '1996-04-09', 'RX Acentuada degeneração com osteofitos laterais Diminuição de espaços artic. L4-L5 - desvio
escoliótico.Cond. Fisioterapia'),
	(2, '1996-05-07', 'Terminou fisioterapia. Melhora Subjativa. Manter mais 1 série.'),
	(4, '1996-06-25', 'Terminou 20ª sessão de fisioterapia. S/ queixas. Cont. exerc. dom. DO'),
	(1, '1997-06-26', 'Dor lombar há 3 dias após esforço em má postura. Dor em ombroE. com irradiação para
extremidade de MSE. Dor edema em tornozelo D.
Ao exame:Tendinite supinadores antebrço E., lombalgia pós esforço, sinovite tornozelo D.
Cond. Crioterapia cotovelo E+CT tornozelo D. + CUL lombar (Rec. Catadolon (AG)'),
	(10, '1997-07-03', 'Sesamoidite pé E há 04 dias com acentuado edema MF hallux e dificuldade para apoio
Cond. CUL+CT+Sintalgim'),
	(3, '1997-07-08', 'Melhora subjetiva- manter CUL rever 1 sem. se nec fisioterapia'),
	(6, '1997-04-03', 'Ombro doloroso a D. com queda do mesmo . Má postura para ativ. domésticas.Dor em face medial
de joelhos maior a dir.
Cond. CT parajoelhos e fisioterapia para correção postural. rever após.'),
	(7, '1997-07-10', 'Epicondilite cotovelo Dir. com 01 mes evolução.Ativ. sedentária limitação de PPS e Extensão do
puinho.
Cond. RX do cotovelo D + Criort. Flogene'),
	(2, '1997-07-10', 'Tendinite dos extensores de 2º e 3º pododactilos do pé E. fez tratº. com AINE por o3 dias sem
melhora
Ao ex. dor, edema dorso do pé E. e dific. para marcha.');


-- fim da configuracao inicial do exercicio 1

#QUESTAO 1 A
SELECT DISTINCT nm_pac
FROM paciente p JOIN atendimento a ON p.cd_pac = a.cd_pac
WHERE diag LIKE '%Melhora%';

#QUESTAO 1 B
SELECT nm_pac
FROM paciente JOIN convenio ON conv_pac = cod_convenio 
WHERE desc_convenio = 'Unimed - código 11347'
GROUP BY nm_pac
HAVING MIN(dt_nasc)
LIMIT 1;

#QUESTAO 1 C
SELECT *
FROM paciente p
WHERE cd_pac NOT IN(SELECT p.cd_pac FROM paciente p JOIN atendimento a ON p.cd_pac = a.cd_pac);

#QUESTAO 1 D
-- SUBCONSULTA
SELECT desc_convenio
FROM convenio JOIN paciente ON conv_pac = cod_convenio
GROUP BY desc_convenio
HAVING COUNT(*) >=1;

-- JUNÇÃO
SELECT DISTINCT desc_convenio
FROM convenio
JOIN paciente ON cod_convenio=conv_pac;

#QUESTAO 1 E
SELECT cod_convenio, desc_convenio
FROM convenio 
WHERE cod_convenio NOT IN (SELECT conv_pac FROM paciente);

#QUESTAO 1 F
SELECT cd_pac, nm_pac, dt_nasc, desc_convenio 
FROM paciente JOIN convenio ON conv_pac = cod_convenio 
union
SELECT cd_pac, nm_pac, dt_nasc, desc_convenio 
FROM convenio LEFT JOIN paciente ON cod_convenio = conv_pac
WHERE cod_convenio NOT IN( SELECT cod_convenio FROM paciente JOIN convenio ON conv_pac = cod_convenio )
ORDER BY nm_pac IS NULL, nm_pac, desc_convenio;