require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  describe '#POST create' do
      it 'should create a question with distractors' do
      expect{
        post :create, params: {question: { body: "Question body", notes: "No notes" } }
      }.to change(Question, :count).by(1)
      end
  end
end
