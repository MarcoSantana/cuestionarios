# features/step_definitions/questions_page_steps.rb
Given(/^there's a question with body "([^"]*)" with "([^"]*)" notes$/) do |body, notes|
  # pending # Write code here that turns the phrase above into concrete actions
  @question = FactoryGirl.create(:question, body: body, notes: notes)
end

When(/^I am on the questions index$/) do
  # pending # Write code here that turns the phrase above into concrete actions
  visit('/questions')
end

Then(/^I should see the "([^"]*)" question$/) do |body|
  # pending # Write code here that turns the phrase above into concrete actions
  @question = Question.find_by_body(body)
  page should have_content(@question.body)
  page should have_content(@question.notes)
end
