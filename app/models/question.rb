class Question < ApplicationRecord
  has_many :distractors, dependent: :destroy, class_name: "Distractor", inverse_of: :question
  accepts_nested_attributes_for :distractors, reject_if: proc { |attributes| attributes['body'].blank? }, allow_destroy: true

  has_and_belongs_to_many :slot, join_table: "question_slots_quiz", foreign_key: "slot_id"
  has_paper_trail

  validates :body, presence: true, length: { in: 6..254}
  validates :notes, presence: true, length: {in: 6..254}
  # validates_associated :distractors_attributes
end
