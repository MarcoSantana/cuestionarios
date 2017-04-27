class Question < ApplicationRecord
  has_many :distractors, autosave: true, dependent: :destroy
  has_and_belongs_to_many :slot, join_table: "question_slots_quiz", foreign_key: "slot_id"
  has_paper_trail

  validates :body, presence: true, length: { in: 6..254}
  validates :notes, presence: true, length: {in: 6..254}
end
