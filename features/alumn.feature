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
      When I press "Responsavel: Nome do Parent" button
      Then I see parent information

    Scenario: Alumn can see notification
      Given I am logged in as alumn
      Then I logged as alumn
      When i press "Avisos" button
      Then I see notifications
      When i press "Notification name" button
      Then i see nofications information