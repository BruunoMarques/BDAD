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
	INSERT INTO FUNCIONARIO (anoEntrada,salario,idFuncionario,idTipoDeFuncao) VALUES (2016,550,000,3);
END	;	
/*Garante que existe pelo menos capacidade de carruagens para suportar 200 utilizadores*/
/*
DROP TRIGGER IF EXISTS AdicionaCarruagens;
		CREATE TRIGGER AdicionaCarruagens
		AFTER INSERT ON CARRUAGEM
WHEN (SELECT SUM(CARRUAGEM.nLugares) FROM CARRUAGEM) <= 200
BEGIN
	INSERT INTO CARRUAGEM (idCarruagem,nLugares) VALUES (NEW.idCarruagem + 1, 50);
END	;
*/