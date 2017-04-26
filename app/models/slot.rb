class Slot < ApplicationRecord
    has_and_belongs_to_many :questions, join_table: :question_slots_quiz
    has_and_belongs_to_many :quiz, join_table: :question_slots_quiz
end
