class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :body
      t.text :notes
      t.timestamps
    end
  end
end
