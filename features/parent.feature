
	Feature: Parent

		To better manage your children,
		the parent must be able,
		to accompany them.

		Scenario: Parent can see your children
			Given I am logged in as parent
			Then I logged as parent

		Scenario: Parent can see notifications
			Given I am logged in as parent
			Then I logged as parent
			When I press "Avisos" button
			And I press "Melhor Notificação" button
			Then I see notification


