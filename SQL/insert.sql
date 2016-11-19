.bail ON
.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;


/*Garante que o salário minimo requerido pela empresa seja aplicado aos funcionarios*/


CREATE TRIGGER IF NOT EXISTS Salarios AFTER INSERT ON FUNCIONARIO
	BEGIN
		UPDATE FUNCIONARIO SET salario = 500 WHERE salario < 500;
	END; 
			

/* Atualiza o desconto nos Clientes com necessidades especiais */
CREATE TRIGGER DescontosNecessidadesEspeciais  AFTER INSERT ON CLIENTE

	BEGIN
		UPDATE CLIENTE SET desconto = 80 WHERE necessidadesEspeciais = 'TRUE';
	END;
	
/*Garante que existe pelo menos um mecanico a ser disponibilizado pela empresa caso nenhum exista*/	
DROP TRIGGER IF EXISTS AdicionaMecanico;
		CREATE TRIGGER AdicionaMecanico
		AFTER INSERT ON FUNCIONARIO
WHEN (SELECT FUNCIONARIO.idFuncionario FROM FUNCIONARIO WHERE idTipoDeFuncao = 3) IS NULL
BEGIN
	INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (000,'Mecanico de Contrato','0000-00-00',69456584);
	INSERT INTO FUNCIONARIO (anoEntrada,salario,idFuncionario,idTipoDeFuncao) VALUES (2016,700,000,3);
END	;	



/*TIPODEFUNCAO*/
INSERT INTO TIPODEFUNCAO (idTipoDeFuncao,nome) VALUES (1,'Maquinista');
INSERT INTO TIPODEFUNCAO (idTipoDeFuncao,nome) VALUES (2,'Revisor');
INSERT INTO TIPODEFUNCAO (idTipoDeFuncao,nome) VALUES (3,'Mecanico');
INSERT INTO TIPODEFUNCAO (idTipoDeFuncao,nome) VALUES (4,'Seguranca');
INSERT INTO TIPODEFUNCAO (idTipoDeFuncao,nome) VALUES (5,'Maquinista');
INSERT INTO TIPODEFUNCAO (idTipoDeFuncao,nome) VALUES (6,'Administrativo');
INSERT INTO TIPODEFUNCAO (idTipoDeFuncao,nome) VALUES (7,'Empregado(a) do bar');
INSERT INTO TIPODEFUNCAO (idTipoDeFuncao,nome) VALUES (8,'Medico de Trabalho');
INSERT INTO TIPODEFUNCAO (idTipoDeFuncao,nome) VALUES (9,'Maquinista');
INSERT INTO TIPODEFUNCAO (idTipoDeFuncao,nome) VALUES (10,'Revisor');
INSERT INTO TIPODEFUNCAO (idTipoDeFuncao,nome) VALUES (11,'Limpeza');
INSERT INTO TIPODEFUNCAO (idTipoDeFuncao,nome) VALUES (12,'Seguranca');

/*CIDADE*/
INSERT INTO CIDADE (idCidade,nome) VALUES (1,'Amarante');
INSERT INTO CIDADE (idCidade,nome) VALUES (2,'Porto');
INSERT INTO CIDADE (idCidade,nome) VALUES (3,'Lisboa');
INSERT INTO CIDADE (idCidade,nome) VALUES (4,'Coimbra');
INSERT INTO CIDADE (idCidade,nome) VALUES (5,'Faro');
INSERT INTO CIDADE (idCidade,nome) VALUES (6,'Albufeira');
INSERT INTO CIDADE (idCidade,nome) VALUES (7,'Vila Nova de Gaia');
INSERT INTO CIDADE (idCidade,nome) VALUES (8,'Aveiro');
INSERT INTO CIDADE (idCidade,nome) VALUES (9,'Braga');
INSERT INTO CIDADE (idCidade,nome) VALUES (10,'Braganca');
INSERT INTO CIDADE (idCidade,nome) VALUES (11,'Chaves');
INSERT INTO CIDADE (idCidade,nome) VALUES (12,'Castelo Branco');

/*ITINERARIO*/
INSERT INTO ITINERARIO (idItinerario,codigo,nOcorrencias) VALUES (1,7,10);
INSERT INTO ITINERARIO (idItinerario,codigo,nOcorrencias) VALUES (2,8,13);
INSERT INTO ITINERARIO (idItinerario,codigo,nOcorrencias) VALUES (3,1,14);
INSERT INTO ITINERARIO (idItinerario,codigo,nOcorrencias) VALUES (4,2,13);
INSERT INTO ITINERARIO (idItinerario,codigo,nOcorrencias) VALUES (5,34,8);
INSERT INTO ITINERARIO (idItinerario,codigo,nOcorrencias) VALUES (6,45,9);
INSERT INTO ITINERARIO (idItinerario,codigo,nOcorrencias) VALUES (7,87,6);
INSERT INTO ITINERARIO (idItinerario,codigo,nOcorrencias) VALUES (8,33,5);
INSERT INTO ITINERARIO (idItinerario,codigo,nOcorrencias) VALUES (9,2,12);
INSERT INTO ITINERARIO (idItinerario,codigo,nOcorrencias) VALUES (10,33,17);
INSERT INTO ITINERARIO (idItinerario,codigo,nOcorrencias) VALUES (11,7,20);
INSERT INTO ITINERARIO (idItinerario,codigo,nOcorrencias) VALUES (12,1,36);
INSERT INTO ITINERARIO (idItinerario,codigo,nOcorrencias) VALUES (25,25,1);

/*COMBOIO*/
INSERT INTO COMBOIO(idComboio,id,tipo) VAlUES(1,1,'urbano');
INSERT INTO COMBOIO(idComboio,id,tipo) VAlUES(2,6,'internacional');
INSERT INTO COMBOIO(idComboio,id,tipo) VAlUES(3,3,'alfa pendular');
INSERT INTO COMBOIO(idComboio,id,tipo) VAlUES(4,7,'intercidades');
INSERT INTO COMBOIO(idComboio,id,tipo) VAlUES(5,4,'regional');
INSERT INTO COMBOIO(idComboio,id,tipo) VAlUES(6,5,'regional');
INSERT INTO COMBOIO(idComboio,id,tipo) VAlUES(7,43,'internacional');
INSERT INTO COMBOIO(idComboio,id,tipo) VAlUES(8,123,'alfa pendular');
INSERT INTO COMBOIO(idComboio,id,tipo) VAlUES(9,32,'intercidades');
INSERT INTO COMBOIO(idComboio,id,tipo) VAlUES(10,5,'urbano');
INSERT INTO COMBOIO(idComboio,id,tipo) VAlUES(11,09,'intercidades');
INSERT INTO COMBOIO(idComboio,id,tipo) VAlUES(12,44,'internacional');

/*OCORRENCIA*/
INSERT INTO OCORRENCIA(idOcorrencia,hora, dataOcorr,idComboio,idItinerario) VALUES (1,'12:30:00','2016-04-20',1,1);
INSERT INTO OCORRENCIA(idOcorrencia,hora, dataOcorr,idComboio,idItinerario) VALUES (2,'10:30:00','2016-04-20',2,1);
INSERT INTO OCORRENCIA(idOcorrencia,hora, dataOcorr,idComboio,idItinerario) VALUES (3,'19:40:00','2015-06-30',3,3);
INSERT INTO OCORRENCIA(idOcorrencia,hora, dataOcorr,idComboio,idItinerario) VALUES (4,'14:00:00','2016-01-03',4,4);
INSERT INTO OCORRENCIA(idOcorrencia,hora, dataOcorr,idComboio,idItinerario) VALUES (5,'11:10:00','2010-02-12',5,5);
INSERT INTO OCORRENCIA(idOcorrencia,hora, dataOcorr,idComboio,idItinerario) VALUES (6,'09:25:00','2016-04-20',6,1);
INSERT INTO OCORRENCIA(idOcorrencia,hora, dataOcorr,idComboio,idItinerario) VALUES (7,'17:57:00','2000-12-11',7,7);
INSERT INTO OCORRENCIA(idOcorrencia,hora, dataOcorr,idComboio,idItinerario) VALUES (8,'12:50:00','2016-04-20',8,1);
INSERT INTO OCORRENCIA(idOcorrencia,hora, dataOcorr,idComboio,idItinerario) VALUES (9,'07:10:00','2014-07-05',9,9);
INSERT INTO OCORRENCIA(idOcorrencia,hora, dataOcorr,idComboio,idItinerario) VALUES (10,'18:15:00','2016-05-30',10,10);
INSERT INTO OCORRENCIA(idOcorrencia,hora, dataOcorr,idComboio,idItinerario) VALUES (11,'22:00:00','2016-05-21',12,25);


/*CARRUAGEM*/
INSERT INTO CARRUAGEM (idCarruagem,nLugares) VALUES (1,10);
INSERT INTO CARRUAGEM (idCarruagem,nLugares) VALUES (2,11);
INSERT INTO CARRUAGEM (idCarruagem,nLugares) VALUES (3,15);
INSERT INTO CARRUAGEM (idCarruagem,nLugares) VALUES (4,16);
INSERT INTO CARRUAGEM (idCarruagem,nLugares) VALUES (5,10);
INSERT INTO CARRUAGEM (idCarruagem,nLugares) VALUES (6,17);
INSERT INTO CARRUAGEM (idCarruagem,nLugares) VALUES (7,20);
INSERT INTO CARRUAGEM (idCarruagem,nLugares) VALUES (8,13);
INSERT INTO CARRUAGEM (idCarruagem,nLugares) VALUES (9,15);
INSERT INTO CARRUAGEM (idCarruagem,nLugares) VALUES (10,20);
INSERT INTO CARRUAGEM (idCarruagem,nLugares) VALUES (11,12);
INSERT INTO CARRUAGEM (idCarruagem,nLugares) VALUES (12,25);


/*BILHETE*/
INSERT INTO BILHETE (idBilhete,preco,dataCompra,idItinerario) VALUES (1,1.45,'2016-04-20',1);
INSERT INTO BILHETE (idBilhete,preco,dataCompra,idItinerario) VALUES (2,5.65,'2014-12-07',2);
INSERT INTO BILHETE (idBilhete,preco,dataCompra,idItinerario) VALUES (3,10,'2015-06-30',2);
INSERT INTO BILHETE (idBilhete,preco,dataCompra,idItinerario) VALUES (4,35,'2016-01-03',4);
INSERT INTO BILHETE (idBilhete,preco,dataCompra,idItinerario) VALUES (5,7.65,'2010-02-12',5);
INSERT INTO BILHETE (idBilhete,preco,dataCompra,idItinerario) VALUES (6,13.10,'2016-07-07',6);
INSERT INTO BILHETE (idBilhete,preco,dataCompra,idItinerario) VALUES (7,35,'2000-12-11',7);
INSERT INTO BILHETE (idBilhete,preco,dataCompra,idItinerario) VALUES (8,35,'2016-03-04',8);
INSERT INTO BILHETE (idBilhete,preco,dataCompra,idItinerario) VALUES (9,1.8,'2014-07-05',9);
INSERT INTO BILHETE (idBilhete,preco,dataCompra,idItinerario) VALUES (10,18.50,'2016-05-30',10);
INSERT INTO BILHETE (idBilhete,preco,dataCompra,idItinerario) VALUES (11,16.35,'2016-11-04',11);
INSERT INTO BILHETE (idBilhete,preco,dataCompra,idItinerario) VALUES (12,9.90,'2015-10-24',12);

/*ESTACAO*/
INSERT INTO ESTACAO (idEstacao,nome,idCidade) VALUES (1,'Estacao de Amarante',1);
INSERT INTO ESTACAO (idEstacao,nome,idCidade) VALUES (2,'Estacao de Porto',2);
INSERT INTO ESTACAO (idEstacao,nome,idCidade) VALUES (3,'Estacao de Lisboa',3);
INSERT INTO ESTACAO (idEstacao,nome,idCidade) VALUES (4,'Estacao de Coimbra',4);
INSERT INTO ESTACAO (idEstacao,nome,idCidade) VALUES (5,'Estacao de Faro',5);
INSERT INTO ESTACAO (idEstacao,nome,idCidade) VALUES (6,'Estacao de Porto',2);
INSERT INTO ESTACAO (idEstacao,nome,idCidade) VALUES (7,'Estacao de Vila Nova de Gaia',7);
INSERT INTO ESTACAO (idEstacao,nome,idCidade) VALUES (8,'Estacao de Aveiro',8);
INSERT INTO ESTACAO (idEstacao,nome,idCidade) VALUES (9,'Estacao de Braga',9);
INSERT INTO ESTACAO (idEstacao,nome,idCidade) VALUES (10,'Estacao de Braganca',10);
INSERT INTO ESTACAO (idEstacao,nome,idCidade) VALUES (11,'Estacao de Chaves',11);
INSERT INTO ESTACAO (idEstacao,nome,idCidade) VALUES (21,'Estacao de S.Bento',2);
INSERT INTO ESTACAO (idEstacao,nome,idCidade) VALUES (22,'Estacao de Campanha',2);
INSERT INTO ESTACAO (idEstacao,nome,idCidade) VALUES (23,'Estacao de Contumil',2);
INSERT INTO ESTACAO (idEstacao,nome,idCidade) VALUES (24,'Estacao de Rio Tinto',2);
INSERT INTO ESTACAO (idEstacao,nome,idCidade) VALUES (25,'Apeadeiro de Aguas Santas',2);
INSERT INTO ESTACAO (idEstacao,nome,idCidade) VALUES (26,'Estacao de Ermesinde',2);


/*COMBOIOCARRUAGEM*/
INSERT INTO COMBOIOCARRUAGEM (idComboio,idCarruagem) VALUES (1,1);
INSERT INTO COMBOIOCARRUAGEM (idComboio,idCarruagem) VALUES (1,2);
INSERT INTO COMBOIOCARRUAGEM (idComboio,idCarruagem) VALUES (1,3);
INSERT INTO COMBOIOCARRUAGEM (idComboio,idCarruagem) VALUES (1,4);
INSERT INTO COMBOIOCARRUAGEM (idComboio,idCarruagem) VALUES (1,5);
INSERT INTO COMBOIOCARRUAGEM (idComboio,idCarruagem) VALUES (6,6);
INSERT INTO COMBOIOCARRUAGEM (idComboio,idCarruagem) VALUES (7,7);
INSERT INTO COMBOIOCARRUAGEM (idComboio,idCarruagem) VALUES (8,8);
INSERT INTO COMBOIOCARRUAGEM (idComboio,idCarruagem) VALUES (9,9);
INSERT INTO COMBOIOCARRUAGEM (idComboio,idCarruagem) VALUES (10,10);
INSERT INTO COMBOIOCARRUAGEM (idComboio,idCarruagem) VALUES (11,11);
INSERT INTO COMBOIOCARRUAGEM (idComboio,idCarruagem) VALUES (12,12);



/*ITINERARIOESTACAO*/

INSERT INTO ITINERARIOESTACAO (ordem,idEstacao,idItinerario) VALUES (1,21,25);
INSERT INTO ITINERARIOESTACAO (ordem,idEstacao,idItinerario) VALUES (2,22,25);
INSERT INTO ITINERARIOESTACAO (ordem,idEstacao,idItinerario) VALUES (3,23,25);
INSERT INTO ITINERARIOESTACAO (ordem,idEstacao,idItinerario) VALUES (4,24,25);
INSERT INTO ITINERARIOESTACAO (ordem,idEstacao,idItinerario) VALUES (5,25,25);
INSERT INTO ITINERARIOESTACAO (ordem,idEstacao,idItinerario) VALUES (6,26,25);
INSERT INTO ITINERARIOESTACAO (ordem,idEstacao,idItinerario) VALUES (8,1,8);
INSERT INTO ITINERARIOESTACAO (ordem,idEstacao,idItinerario) VALUES (9,9,9);
INSERT INTO ITINERARIOESTACAO (ordem,idEstacao,idItinerario) VALUES (10,1,1);
INSERT INTO ITINERARIOESTACAO (ordem,idEstacao,idItinerario) VALUES (11,11,11);

/*PESSOA*/
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (1,'Catarina Correia','1996-03-24',123456789);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (2,'Marta Torgal','1978-09-17',101010333);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (3,'Bruno Marques','1982-10-05',343465756);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (4,'Manuel Torres','1990-01-01',987543100);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (5,'Cristiana Ribeiro','1989-03-09',456123789);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (6,'Jonas Loureiro','1972-11-23',789654123);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (7,'Daniela Sa','1965-05-30',523698741);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (8,'Jorge Alves da Silva','1996-03-26',695847321);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (9,'Francisco Barbosa','1974-04-25',468723789);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (10,'Diogo Campos','1982-11-15',789654893);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (11,'Francisco Queiros','1965-07-31',523698741);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (12,'Mario Fernandes','1990-01-20',69456321);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (13,'Ana Reis','2000-07-24',100000555);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (14,'Maria Lira','1978-12-30',197812304);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (15,'Benedita Martins','2010-10-05',201065756);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (16,'Xavier Alves','1995-01-31',987541995);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (17,'Alvarim Sousa','1989-12-09',456198989);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (18,'Carlos Alberto','1972-06-23',719724123);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (19,'Lara Rodrigues','1965-05-30',523619651);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (20,'Juliana Dias','1996-03-26',199647321);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (21,'Hugo Nunes','1974-04-25',468720425);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (22,'Nuno Coelho','1982-11-15',789111593);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (23,'Raquel Barros','1979-03-31',313098741);
INSERT INTO PESSOA (idPessoa,nome,dataNascimento,nif) VALUES (24,'Fabio Fernandes','1957-11-27',69451127);

/*CLIENTE*/
INSERT INTO CLIENTE(desconto, necessidadesEspeciais,idCliente,idBilhete) VALUES (0,'FALSE',1,1);
INSERT INTO CLIENTE(desconto, necessidadesEspeciais,idCliente,idBilhete) VALUES (20,'FALSE',2,2);
INSERT INTO CLIENTE(desconto, necessidadesEspeciais,idCliente,idBilhete) VALUES (0,'TRUE',3,3);
INSERT INTO CLIENTE(desconto, necessidadesEspeciais,idCliente,idBilhete) VALUES (0,'FALSE',4,4);
INSERT INTO CLIENTE(desconto, necessidadesEspeciais,idCliente,idBilhete) VALUES (0,'FALSE',5,5);
INSERT INTO CLIENTE(desconto, necessidadesEspeciais,idCliente,idBilhete) VALUES (25,'FALSE',6,6);
INSERT INTO CLIENTE(desconto, necessidadesEspeciais,idCliente,idBilhete) VALUES (0,'FALSE',7,7);
INSERT INTO CLIENTE(desconto, necessidadesEspeciais,idCliente,idBilhete) VALUES (20,'TRUE',8,8);
INSERT INTO CLIENTE(desconto, necessidadesEspeciais,idCliente,idBilhete) VALUES (0,'FALSE',9,9);
INSERT INTO CLIENTE(desconto, necessidadesEspeciais,idCliente,idBilhete) VALUES (25,'FALSE',10,10);
INSERT INTO CLIENTE(desconto, necessidadesEspeciais,idCliente,idBilhete) VALUES (0,'TRUE',11,11);
INSERT INTO CLIENTE(desconto, necessidadesEspeciais,idCliente,idBilhete) VALUES (0,'FALSE',12,12);

/*FUNCIONARIO*/
INSERT INTO FUNCIONARIO(anoEntrada,salario,idFuncionario,idTipoDeFuncao) VALUES(1996,1000,13,1);
INSERT INTO FUNCIONARIO(anoEntrada,salario,idFuncionario,idTipoDeFuncao) VALUES(2000,713,14,2);
INSERT INTO FUNCIONARIO(anoEntrada,salario,idFuncionario,idTipoDeFuncao) VALUES(2001,850,15,3);
INSERT INTO FUNCIONARIO(anoEntrada,salario,idFuncionario,idTipoDeFuncao) VALUES(2005,470,16,4);
INSERT INTO FUNCIONARIO(anoEntrada,salario,idFuncionario,idTipoDeFuncao) VALUES(2007,900,1,5);
INSERT INTO FUNCIONARIO(anoEntrada,salario,idFuncionario,idTipoDeFuncao) VALUES(2008,1200,18,6);
INSERT INTO FUNCIONARIO(anoEntrada,salario,idFuncionario,idTipoDeFuncao) VALUES(2016,668,19,7);
INSERT INTO FUNCIONARIO(anoEntrada,salario,idFuncionario,idTipoDeFuncao) VALUES(1995,730,20,8);
INSERT INTO FUNCIONARIO(anoEntrada,salario,idFuncionario,idTipoDeFuncao) VALUES(1989,1000,5,9);
INSERT INTO FUNCIONARIO(anoEntrada,salario,idFuncionario,idTipoDeFuncao) VALUES(2013,713,22,10);
INSERT INTO FUNCIONARIO(anoEntrada,salario,idFuncionario,idTipoDeFuncao) VALUES(2016,50,23,11);
INSERT INTO FUNCIONARIO(anoEntrada,salario,idFuncionario,idTipoDeFuncao) VALUES(2011,700,24,12);


/*FUNCIONARIOESTACAO*/
INSERT INTO FUNCIONARIOESTACAO(idFuncionario,idEstacao) VALUES (13,1);
INSERT INTO FUNCIONARIOESTACAO(idFuncionario,idEstacao) VALUES (14,2);
INSERT INTO FUNCIONARIOESTACAO(idFuncionario,idEstacao) VALUES (15,3);
INSERT INTO FUNCIONARIOESTACAO(idFuncionario,idEstacao) VALUES (16,1);
INSERT INTO FUNCIONARIOESTACAO(idFuncionario,idEstacao) VALUES (1,5);
INSERT INTO FUNCIONARIOESTACAO(idFuncionario,idEstacao) VALUES (18,6);
INSERT INTO FUNCIONARIOESTACAO(idFuncionario,idEstacao) VALUES (19,1);
INSERT INTO FUNCIONARIOESTACAO(idFuncionario,idEstacao) VALUES (20,8);
INSERT INTO FUNCIONARIOESTACAO(idFuncionario,idEstacao) VALUES (5,1);
INSERT INTO FUNCIONARIOESTACAO(idFuncionario,idEstacao) VALUES (22,10);
INSERT INTO FUNCIONARIOESTACAO(idFuncionario,idEstacao) VALUES (23,11);
INSERT INTO FUNCIONARIOESTACAO(idFuncionario,idEstacao) VALUES (24,1);














