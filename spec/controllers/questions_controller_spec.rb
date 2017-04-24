require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  describe "#GET #index" do
    it "should return success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
