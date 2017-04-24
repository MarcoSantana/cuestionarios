require 'rails_helper'

RSpec.describe Distractor, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @distractor = FactoryGirl.build :distractor
  end
  it 'can be instantiated' do
    expect(@distractor).to be_a Distractor
  end
  it 'should not be valid without a body' do
    @distractor.body = nil
    expect(@distractor).to_not be_valid
  end
  it 'should not b e valid without notes' do
    @distractor.notes = nil
    expect(@distractor).to_not be_valid
  end

  describe 'Associations' do
    it 'should belong to question' do
      should belong_to :question
    end
  end
end
