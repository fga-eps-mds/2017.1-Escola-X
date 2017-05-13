
Feature: Suspension

	To better manage the college, 
	the principal must be able 
	to register a suspension.

	Scenario: Only principal can register suspension 
		Given I am on the login page
		And I fill in field "Login" with "123456"
		And I fill in field "Senha" with "12345678"
		When I click in "Entrar" button
		Then I logon
		Given I am on the users in page
		When I press "Criar" field And I click in "Responsável e Aluno, I had register one parent and one alumn
		And I fill in field parent "Nome" with "Victor Hugo"
		And I fill in field parent "CPF" with "02951294174"
		And I fill in field parent "Senha" with "123456"
		And I fill in field parent "Endereço" with "QR 612 Conjunto 12 Casa 21"
		And I fill in field parent "Telefone" with "6133456382"
		And I fill in field parent "Data de Nascimento" with "12121912"
		And I fill in field parent "Sexo" with "Masculino"
		When I press "Salvar" I had register one alumn
		Then I register alumn now, I had stay in page alumn new
		And I fill in field alumn "Nome" with "Trolando"
		And I fill in field alumn "Matricula" with "153456"
		And I fill in field alumn "Senha" with "bgatahkei42"
		And I fill in field alumn "Turno" with "Matutino"
		And I fill in field alumn "Endereço" with "QR 602 Conjunto 06 Casa 05"
		And I fill in field alumn "Telefone" with "61983104981"
		And I fill in field alumn "Data de Nascimento" with "09071995"
		And I fill in field alumn "Sexo" with "Masculino"
		When I press field alumn "Salvar" button
		Then I register the alumn and I go to page users
		When I press field "Dar Suspensão" button
		And I fill in field "Motivo da Suspensão" with "Não interessa"
		And I fill in field "Quantidade de Dias" with "42"
		And I fill in field "Descrição da Suspensão" with "MEU CORAÇÃO É TÃO RESPLANDECENTE"
		And I fill in field "Data da Suspensão" with "12121912"
		When I press field "Salvar" button