class Distractor < ApplicationRecord
  belongs_to :question

  validates_presence_of :question, on: :create
  validates_length_of :body, within: 3..254, on: :create

end