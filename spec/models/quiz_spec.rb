require 'rails_helper'

RSpec.describe Quiz, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @quiz = FactoryGirl.build :quiz
  end

  it 'can be instantiated' do
    expect(@quiz).to be_a Quiz
  end

  it 'can be asigned a description' do
    expect(@quiz.description).to eq('MyString')
  end

  it 'can be assigned a note' do
    expect(@quiz.notes).to eq('MyText')
  end

  it 'can be assigned a passing grade' do
    expect(@quiz.passing_grade).to eq(99.99)
  end

  it 'should validate passing grade' do
    expect validate_numericality_of(:passing_grade).
      is_greater_than(0.0).
      is_less_than(100.01)
  end

  describe 'Associations' do
    it { should have_and_belong_to_many :slots }
    pending "should have authors"
    pending 'should have venues'
  end
end
