
Feature: Principal

	To better manage the college, 
	the principal must be able 
	to register a suspension.

	Scenario: Only principal can register parent and alumn
		Given I am logged in as principal
		Then I logged as principal
		Given I am on the users in page
		When I press "Criar" field
		And I click in "Responsável e Aluno" I had register one parent and one alumn
		And I fill in field parent "Nome" with "Naiara Camelo"
		And I fill in field parent "CPF" with "02951294174"
		And I fill in field parent "Senha" with "111111"
		And I fill in field parent "Endereço" with "QR 612 Conjunto 12 Casa 21"
		And I fill in field parent "Telefone" with "6133456382"
		And I fill in field parent "Data de Nascimento" with "12121912"
		And I fill in field parent "Sexo" with "Feminino"
		When I press "Salvar" button
		Then I register alumn now, I had stay in page alumn new
		And I fill in field alumn "Nome" with "Leo Arthur"
		And I fill in field alumn "Matricula" with "456789"
		And I fill in field alumn "Senha" with "222222"
		And I fill in field alumn "Turno" with "Matutino"
		And I fill in field alumn "Endereço" with "QR 602 Conjunto 06 Casa 05"
		And I fill in field alumn "Telefone" with "61983104981"
		And I fill in field alumn "Data de Nascimento" with "09071995"
		And I fill in field alumn "Sexo" with "Masculino"
		When I press "Salvar" button
		Then I register the alumn and I go to page users


	Scenario: Only principal can register suspension
		Given I am logged in as principal
		Then I logged as principal
		When I press field "Dar Suspensão" button
		And I fill in field "Motivo da Suspensão" with "Bater na Professora"
		And I fill in field "Quantidade de Dias" with "10"
		And I fill in field "Descrição da Suspensão" with "Chutou o bebe da professora"
		And I fill in field "Data da Suspensão" with "12121912"
		When I press "Salvar" button
		Then I had register a suspension

	Scenario: Only principal can register subject
		Given I am logged in as principal
		Then I logged as principal
		When I press "Matéria" button
		And I press "Nova Matéria" button
		And I fill in fiend subject "Nome" with "Geografia"
		And I fill in fiend subject "Série" with "3"
		And I fill in fiend subject "Matrícula do Professor" with "123456"
		When I press "Salvar" button
		Then I register the subject

	Scenario: Only principal can register teacher valid
		Given I am logged in as principal
		Then I logged as principal
		When I press "Criar Professor" button
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

	Scenario: Only principal can register secretary valid
		Given I am logged in as principal
		Then I logged as principal
		When I press "Criar Secretário" button
		And I fill in "Nome" with "Juca Balla"
		And I fill in "CPF" with "46804811372"
		And I fill in "Matricula" with "147258"
		And I fill in "Senha" with "555555555"
		And I fill in "Data de Admissão" with "09071995"
		And I fill in "Turno" with "Integral"
		And I fill in "Endereço" with "Super República do Gama - Gama Sul"
		And I fill in "Telefone" with "61983104999"
		And I fill in "Data de Nascimento" with "01011800"
		And I fill in secretary "Sexo" with "Masculino"
		When I press "Salvar" button
		Then I register the secretary and I go to page secretaries

	Scenario: Principal can create notification
		Given I am logged in as principal
		Then I logged as principal
		When I press "Avisos" button
		And I press "Nova Notificação" button
		And I fill in "Título" with "Super Gincana Beneficiente"
		And I fill in "Motivo" with "Arrecadar fundos pra formatura do pessoal de Softy"
		And I fill in "Conteúdo da Notificação" with "Muitos jogos, gincanas e aventuras"
		When I press "Salvar" button
		Then I see notification created

	Scenario: Only principal can create classroom
		Given I am logged in as principal
		Then I logged as principal
		When I press "Criar Turma" button
		And I fill in "Nome da Turma" with "3D"
		And I fill in "Turno da Turma" with "Vespertino"
		When I press "Salvar" button
		Then I see classroom created
