class CreateDistractors < ActiveRecord::Migration[5.0]
  def change
    create_table :distractors do |t|
      t.belongs_to :question, index: true
      t.text    :body
      t.text    :notes
      t.boolean :correct
      t.timestamps
    end
  end
end
