
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

		Scenario: Parent can view your exactly child
			Given I am logged in as parent
			Then I logged as parent
			When I press "Visualizar" button
			Then I see information

		Scenario: Parent can see view your exactly child report
			Given I am logged in as parent
			Then I logged as parent
			When I press "Visualizar" button
			And I press "Ver Relatório" button
			Then I see your report
			
