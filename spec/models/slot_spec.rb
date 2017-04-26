require 'rails_helper'

RSpec.describe Slot, type: :model do
  
  before(:each) do
    @slot = FactoryGirl.build :slot
  end

  it 'can be instantiated' do
    expect(@slot).to be_a Slot
  end

  describe 'Associations' do
    it { should have_and_belong_to_many :questions}
  end
end
