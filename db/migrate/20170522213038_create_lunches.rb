class CreateLunches < ActiveRecord::Migration[5.0]
  def change
    create_table :lunches do |t|
      t.string :name, null: false
      t.integer :restaurant_id, null: false
      t.timestamps
    end

    add_index :lunches, :name, unique: true
    add_index :lunches, :restaurant_id
  end
end
