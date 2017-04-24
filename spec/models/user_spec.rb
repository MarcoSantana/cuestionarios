 require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @user = FactoryGirl.build :user
  end
  
  it "can be instantiated" do
    #user = FactoryGirl.build(:user)
    expect(@user).to be_a User
  end

  it "can be assigned a name" do
    expect(@user.name).to eq('Ozzy')
  end

  it 'can be asigned a last name' do
    expect(@user.last_name).to eq("Kampu Santana")
  end


end
