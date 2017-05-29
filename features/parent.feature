
	Feature: Parent

		To spy your children,
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

		Scenario: Parent can view your exactly your child
			Given I am logged in as parent
			Then I logged as parent
			When I press "Vizualizar" button
			Then I see information
