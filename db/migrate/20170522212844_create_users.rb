class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name
      t.string :team
      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :name
    add_index :users, :team
  end
end
