FactoryGirl.define do
  factory :distractor do
    body 'Distractor body text'
    notes {Faker::Lorem.sentence}
  end
end
