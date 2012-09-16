class AddMeetuplocToTour < ActiveRecord::Migration
  def self.up
    add_column :tours, :meetup_location, :string
  end

  def self.down
    remove_column :tours, :meetup_location
  end
end
