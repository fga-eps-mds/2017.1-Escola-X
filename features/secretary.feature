Feature: Secretary

	To better manage the college,
	the Secretary must be able
	to register grades for alumns.

Feature: Secretary

	Scenario: Secretary can create notification
		Given I am logged in as secretary
		Then I logged as secretary
		When I press "Avisos" button
		And I press "Nova Notificação" button
		And I fill in "Título" with "Super Gincana Beneficiente"
		And I fill in "Motivo" with "Arrecadar fundos pra formatura do pessoal de Softy"
		And I fill in "Conteúdo da Notificação" with "Muitos jogos, gincanas e aventuras"
		When I press "Salvar" button
		Then I see notification created

	Scenario: Secretary can see all notifications
		Given I am logged in as secretary
		Then I logged as secretary
		When I press "Avisos" button
		Then I see all notifications

	Scenario: Secretary can see specific notification
		Given I am logged in as secretary
		Then I logged as secretary
		When I press "Avisos" button
		And I press "Uma Notificação" button
		Then I see a nofication

	Scenario: Secretary can edit a notification
		Given I am logged in as secretary
		Then I logged as secretary
		When I press "Avisos" button
		And I press "Uma Notificação" button
		When I press "Edit Notification Secretary" button
		And I fill in "Título" with "Super Gincana Beneficiente - Parte 2"
		And I fill in "Motivo" with "Arrecadar fundos pra formatura do pessoal de Softy e de Aero"
		And I fill in "Conteúdo da Notificação" with "Muitos jogos, gincanas, aventuras e divertimentos."
		When I press "Salvar" button
		Then I see a notification edited

	Scenario: Secretary can see all secretaries
		Given I am logged in as secretary
		Then I logged as secretary
		When I press "Visualizar Secretários" button
		Then I see all secretaries

	Scenario: Secretary can see all classrooms
		Given I am logged in as secretary
		Then I logged as secretary
		When I press "Visualizar Turmas" button
		Then I see all classrooms

	Scenario: Secretary can see all alumns
		Given I am logged in as secretary
		Then I logged as secretary
		When I press "Visualizar Alunos" button
		Then I see all alumns

	Scenario: Secretary can exit the system
		Given I am logged in as secretary
		Then I logged as secretary
		When I press "Logout" button
    Then I logged out

	Scenario: Secretary can give a grade for an alumn
		Given I am logged in as secretary
		Then I logged as secretary
		When I press "Visualizar Turmas" button
		And I press "Matérias da Turma" button
		And I press "Dar Notas" button
		And I fill in "1º" with "10.0"
		And I fill in "2º" with "10.0"
		And I fill in "3º" with "10.0"
		And I fill in "4º" with "10.0"
		And I click in "Salvar Notas" button
		Then I see saved grades
