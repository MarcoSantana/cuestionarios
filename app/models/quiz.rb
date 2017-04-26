class Quiz < ApplicationRecord
    has_and_belongs_to_many :slots, join_table: :question_slots_quiz
    validates_numericality_of :passing_grade, on: :create, greater_than: 0.0, less_than: 100.01
end
