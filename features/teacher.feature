
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
    