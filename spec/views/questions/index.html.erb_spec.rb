require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
        FactoryGirl.create(:question),
        FactoryGirl.create(:question)
    ])
  end

  it "renders a list of questions" do
    render
  end


end
