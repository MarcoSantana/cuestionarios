    # features/questions_page.feature
Feature: List existing questions

  Scenario: Viewing questions list
    Given there's a question with body "Question body text" with "Notes for the question" notes
    Given that question has a distractor with body "Distractor body text"
    When I am on the questions index
    Then I should see the "Question body text" question

  Scenario: Creating a new question
    When I click on the 'New Question' link
    Then I should see the 'New Question' title
    Then I fill the body field with "New question body text" question, with "New question notes" notes
    Then I click the 'add distractor' link
    Then I fill the distractor field with "Option A)"
    Then I click the "correct" radio button
    Then I click the 'delete distractor' link
    Then I click on the 'Create Question' button
    Then I should see the "New question body text" question, with "New question notes" notes
    Then I click on the "back" link to see the new question with its distractors
