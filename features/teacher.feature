
Feature: Teacher

	To better manage the college, 
	the principal must be able 
	to register a teacher.

	Scenario: Teacher can see your home page
    Given I am logged in as teacher
    Then I logged as teacher

  Scenario: Teacher can see your classrooms
    Given I am logged in as teacher
    Then I logged as teacher
    When I press "Visualizar Minhas Turmas" button
    Then I see my classrooms

  Scenario: Teacher can see your subjects
    Given I am logged in as teacher
    Then I logged as teacher
    When I press "Matérias" button
    Then I see my subjects

  Scenario: Teacher can see your subjects page
    Given I am logged in as teacher
    Then I logged as teacher
    When I press "Notas dos Alunos" button
    Then I see grades of my students

  Scenario: Teacher can see a new page a notification
    Given I am logged in as teacher
    Then I logged as teacher
    When I press "Criar" button
    And I click "Criar Notificação"
    Then I see new page notification

  Scenario: Teacher can create a notification
    Given I am logged in as teacher
    Then I logged as teacher
    When I press "Criar" button
    And I click "Criar Notificação"
    Then I see new page notification
    And I fill in "Title" with "Descubra"
    And I fill in "Motivo" with "#Descubra"
    And I fill in "Contéudo da notificação" with "To bem cansado"
    And I click in "Salvar" button
    Then I create a notification

  Scenario: Teacher can see a notification page
    Given I am logged in as teacher
    Then I logged as teacher
    When I press "Avisos" button
    Then I see notification page

  Scenario: Teacher can edit a notification
    Given I am logged in as teacher
    Then I logged as teacher
    When I choose "Descubra" notification
    And I press "Editar" button
    Then I see edit page notification
    And I fill in "Title" with "SOU UM FRACASSO"
    And I fill in "Motivo" with "POR FAVOR"
    And I fill in "Contéudo da notificação" with "NÃO É COISA DE MOMENTO, RAIVA PASSAGEIRA."
    And I click in "Salvar" button in edit page
    Then I edit a notification    