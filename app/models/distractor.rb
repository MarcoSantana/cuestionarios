class Distractor < ApplicationRecord
  belongs_to :question, optional: true, dependent: :destroy, inverse_of: :distractors
  has_paper_trail
  validates_presence_of :question, on: :create
  validates_presence_of :body
  #validates_presence_of :notes
  validates_length_of :body, within: 3..254, on: :create

end
