Feature: Teacher

	To better manage the college, 
	the principal must be able 
	to register a teacher.

	Scenario: Only principal can register teacher valid
		Given I am on the log in page
		And I fill in "Login" with "123456"
		And I fill in "Senha" with "12345678"
		When I press "Entrar" button
		Then I login
		Given I am on the user in page
		When I press "Criar Professor" field
		And I fill in "Nome" with "Victor Hugo"
		And I fill in "Matricula" with "153456"
		And I fill in "CPF" with "02951294174"
		And I fill in "Senha" with "bgatahkei42"
		And I fill in "Turno" with "Matutino"
		And I fill in "Endereço" with "QR 602 Conjunto 06 Casa 05"
		And I fill in "Telefone" with "61983104981"
		And I fill in "Data de Nascimento" with "09071995"
		And I fill in "Sexo" with "Masculino"
		When I press "Salvar" button
		Then I register the teacher and I go to page users

