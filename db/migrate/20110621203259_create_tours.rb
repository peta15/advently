class CreateTours < ActiveRecord::Migration
  def self.up
    create_table :tours do |t|
      t.string :location
      t.text :description
      t.integer :user_limit
      t.float :price
      t.datetime :from_date
      t.datetime :to_date
      t.integer :user_id

      t.timestamps
    end
    add_index :tours, :user_id
    add_index :tours, :created_at
  end

  def self.down
    drop_table :tours
  end
end
