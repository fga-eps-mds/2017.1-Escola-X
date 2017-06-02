
  Feature: Alumn

    To see your academic life,
    the alumn must be able,
    to defeat your nightmare.

    Scenario: Alumn can see your home page
      Given I am logged in as alumn
      Then I logged as alumn

    Scenario: Alumn can see your strikes
      Given I am logged in as alumn
      Then I logged as alumn
      When I press "Advertencias" button
      Then I see strikes

    Scenario: Alumn can see your parent information
      Given I am logged in as alumn
      Then I logged as alumn
      When I press "Responsável" button
      Then I see parent information

    Scenario: Alumn can back
      Given I am logged in as alumn
      Then I logged as alumn
      When I press "Voltar" button
      Then I back to users

    Scenario: Alumn can see absence
      Given I am logged in as alumn
      Then I logged as alumn
      And I press "Faltas" button
      Then I see "faltas"

    Scenario: Alumn can see grade
      Given I am logged in as alumn
      Then I logged as alumn
      And I press "Boletim" button
      Then I see "boletim"

    Scenario: Alumn can see notification
      Given I am logged in as alumn
      Then I logged as alumn
      And I press "Notificacoes" button
      Then I see "notificacoes"

    Scenario: Alumn can log off
      Given I am logged in as alumn
      Then I logged as alumn
      When I press "Sair" button
      Then I logged out
      
