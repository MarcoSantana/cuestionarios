# features/step_definitions/questions_page_steps.rb
Given(/^there's a question with body "([^"]*)" with "([^"]*)" notes$/) do |question_body, question_notes|
  Capybara.default_driver = :selenium
  @question = FactoryGirl.create(:question, body: question_body, notes: question_notes)
  @question.save
  5.times do
    @distractor = FactoryGirl.build(:distractor, body: Faker::Lorem::sentence)
    @question.distractors << @distractor
  end
  @question.save
end

Given(/^that question has a distractor with body "([^"]*)"$/) do |distractor_body|
  @question = FactoryGirl.create(:question)
  5.times do
    @distractor = FactoryGirl.build(:distractor, body: distractor_body)
    @question.distractors << @distractor
  end
  @question.save
end


When(/^I am on the questions index$/) do
  visit('/questions')
end

Then(/^I should see the "([^"]*)" question$/) do |question_body|
  @question = Question.find_by_body(question_body)
  expect(@question.body).to eq(question_body)
  page.has_text?(question_body)
end

When(/^I click on the 'New Question' link$/) do
  visit('/questions')
  expect(page).to have_content("Questions")
  click_link('New Question')
end

Then(/^I should see the 'New Question' title$/) do
  expect(page).to have_content("New Question")
end

Then(/^I fill the body field with "([^"]*)" question, with "([^"]*)" notes$/) do |body, notes|
  fill_in('question[body]', with: body)
  fill_in('question[notes]', with: notes)
end

Then(/^I click the 'add distractor' link$/) do
  expect(page).to have_content('Add distractor')
  click_link('Add distractor')
  expect(page.find('div.nested-fields'))
  expect(page).to have_css('.remove_fields', count: 1)
  click_link('Delete distractor')
  expect(page).to have_css('.remove_fields', count: 0)
  click_link('Add distractor')
  expect(page).to have_css('.remove_fields', count: 1)
end

Then(/^I fill the distractor field with "([^"]*)"$/) do |distractor_body|
  page.find('div.nested-fields')
  within('div.nested-fields') do
    find('.distractor_body').set(distractor_body)
  end
end

Then(/^I click the "([^"]*)" radio button$/) do |arg1|
  page.find_field(type: 'radio').set(true)
end

Then(/^I click the 'delete distractor' link$/) do
  expect(page).to have_content('Delete distractor')
  click_link('Delete distractor')
end

Then(/^I click on the 'Create Question' button$/) do
  click_button('Create Question')
end

Then(/^I should see the "([^"]*)" question, with "([^"]*)" notes$/) do |arg1, arg2|
  # TODO add the arguments to be finded in the view
  expect(page).to have_content('Question was successfully created.')
end

Then(/^I go back and should see the question with body "([^"]*)" and a distractor with body "([^"]*)"$/) do |question_body, distractor_body|
  sleep 5
  click_link('Back') 
  expect(page).to have_content(question_body)
  sleep  5
  expect(page).to have_content(distractor_body)
end

DatabaseCleaner.clean
# Then(/^I click on the "([^"]*)" link to see the new question with its distractors$/) do |question_body, distractor_body|
#   click_link('Back')
#   expect(page).to have_content(question_body)
#   expect(page).to have_content(distractor_body)
# end
