class AddTitleToTour < ActiveRecord::Migration
  def self.up
    add_column :tours, :title, :string
  end

  def self.down
    remove_column :tours, :title
  end
end
