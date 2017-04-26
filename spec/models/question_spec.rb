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
    it { should have_and_belong_to_many :slot }
  end

  describe 'Validations' do
    it "should have notes" do
      should validate_presence_of :notes
    end
    it "sould have a body" do
      should validate_presence_of :body
    end
    it 'should have a valid body' do
      should validate_length_of(:body).
      is_at_least(6).
      is_at_most(254)
    end
    
  end
end
