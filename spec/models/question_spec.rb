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
    #pending 'should not be deleted along with slots'
  end

  describe 'Versioning' do
    with_versioning do
      it 'should be on (paper_trail)' do
        expect(PaperTrail).to be_enabled
      end
      it 'should change version' do 
        expect(@question.body).to eq('Question body text')
        versioned_question_length = @question.versions.length
        @question.update_attributes!(body: 'Leonard')
        expect(@question.body).to eq('Leonard')
        @question.update_attributes!(body: 'Thomas')
        expect(@question.body).to eq('Thomas')      
        @question.update_attributes!(body: 'Robert')
        expect(@question).to have_a_version_with body: 'Thomas'
        expect(versioned_question_length).to be < @question.versions.length
      end
    end
  end

  describe 'Validations' do
    it 'should have notes' do
      should validate_presence_of :notes
    end
    it 'sould have a body' do
      should validate_presence_of :body
    end
    it 'should have a valid body' do
      should validate_length_of(:body).
      is_at_least(6).
      is_at_most(254)
    end
    
  end
end
