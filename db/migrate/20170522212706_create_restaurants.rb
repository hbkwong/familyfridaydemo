class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :logo
      t.string :yelp_link
      t.timestamps
    end

    add_index :restaurants, :name, unique: true
    add_index :restaurants, :logo
    add_index :restaurants, :yelp_link
  end
end
