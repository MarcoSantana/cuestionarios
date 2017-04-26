class CreateSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :slots do |t|
      t.integer :order, limit: 3
      t.timestamps
    end
  end
end
