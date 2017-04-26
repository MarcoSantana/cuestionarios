class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.string :description
      t.text :notes
      t.float :passing_grade, precision: 5, scale: 2
      t.timestamps
    end
  end
end
