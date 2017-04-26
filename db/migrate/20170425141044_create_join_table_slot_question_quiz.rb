class CreateJoinTableSlotQuestionQuiz < ActiveRecord::Migration[5.0]
  def change
    create_table :question_slots_quiz do |t|
      t.references :slot
      t.references :question
      t.references :quiz
    end
    add_index(:question_slots_quiz, [:slot_id, :question_id], :unique => true)
    add_index(:question_slots_quiz, [:slot_id, :quiz_id], :unique => true)
  end
end
