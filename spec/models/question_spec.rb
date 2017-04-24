require 'rails_helper'

RSpec.describe Question, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @question = FactoryGirl.build :question
  end
  
  it 'can be instantiated' do
    expect(@question).to be_a Question  
  end

  it 'can be assigned a body' do
    expect(@question.body).to eq('Question body text')
  end

  describe 'Associations' do
  it { should have_many :distractors}
  end
end