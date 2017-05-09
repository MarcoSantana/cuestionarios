# features/questions_page.feature
Feature:

  Scenario: Viewing questions list
    Given there's a question with body "Question body text" with "Notes for the question" notes
    When I am on the questions index
    Then I should see the "Question body text" question