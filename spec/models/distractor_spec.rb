require 'rails_helper'

RSpec.describe Distractor, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @question = FactoryGirl.build :question
    @distractor = FactoryGirl.build :distractor
    @question.distractors << @distractor
    @question.save
  end
  it 'can be instantiated' do
    expect(@distractor).to be_a Distractor
  end
  it 'should not be valid without a body' do
    @distractor.body = nil
    expect(@distractor).to_not be_valid
  end
  it 'should not be valid without notes' do
    @distractor.notes = nil
    expect(@distractor).to_not be_valid
  end

  describe 'Associations' do
    it 'should belong to question' do
      should belong_to(:question).dependent(:destroy)
    end
    it 'should be destroyed alongside with its question' do
      expect { @question.destroy }.to change {  Distractor.count }.by(-1)
    end
  end

  describe 'Versioning' do
    with_versioning do
      it 'should be on (paper_trail)' do
        expect(PaperTrail).to be_enabled
      end
      it 'should change version' do 
        expect(@distractor.body).to eq('Distractor body text')
        versioned_distractor_length = @distractor.versions.length
        @distractor.update_attributes!(body: 'Leonard')
        expect(@distractor.body).to eq('Leonard')
        @distractor.update_attributes!(body: 'Thomas')
        expect(@distractor.body).to eq('Thomas')      
        @distractor.update_attributes!(body: 'Robert')
        expect(@distractor).to have_a_version_with body: 'Thomas'
        expect(versioned_distractor_length).to be < @distractor.versions.length
      end
    end
  end

  describe 'Validations' do
    it { should validate_presence_of :question}
    it do should validate_length_of(:body).
      is_at_least(3).
      is_at_most(254)
    end
  end
end
