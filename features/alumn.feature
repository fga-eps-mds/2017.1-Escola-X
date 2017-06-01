
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

    Scenario: Alumn can see notification
      Given I am logged in as alumn
      Then I logged as alumn
      When I press "Avisos" button
      And I press "Notificação" button
      Then I see nofications information
