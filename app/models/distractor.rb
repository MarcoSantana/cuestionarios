class Distractor < ApplicationRecord
  belongs_to :question, dependent: :destroy
  has_paper_trail
  validates_presence_of :question, on: :create
  validates_presence_of :body
  validates_length_of :body, within: 3..254, on: :create
  validates_presence_of :notes

end