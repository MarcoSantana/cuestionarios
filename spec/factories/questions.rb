FactoryGirl.define do
  factory :question do
    body "Question body text"
    notes {Faker::Lorem.sentence}
  end
end
